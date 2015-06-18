#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys,os
import importlib
from flask import Flask
from flask import render_template
from flask import abort, redirect, url_for, request, session
from flask.ext.sqlalchemy import SQLAlchemy
import hashlib

import sqlalchemy
import datetime
from sqlalchemy import desc

import uuid
from xlwt import *

import json

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:123456@localhost/fdms_bestholiday?charset=utf8'
Actions = {}
Pages = {}
db = SQLAlchemy(app)
app.Actions = Actions
app.Pages = Pages
from models import *
import models

from menu import *

def getUserMenu():
    userMenu = []
    if (isLogin() == False):
        return userMenu
    privileges = t_user_privilege.query.filter_by(userId=session["userid"]).all()
    for m in mainMenu:
        for p in privileges:
            if p.privilegeKey == m["key"] and p.status==1:
                menu = {"key": m["key"], "title": m["title"], "link": ""}
                if "submenu" in m and m["submenu"] is not None:
                    menu["submenu"] = []
                    for mm in m["submenu"]:
                        for pp in privileges:
                            if pp.privilegeKey == mm["key"] and pp.status==1:
                                if menu["link"] == "":
                                    menu["link"] = mm["link"]
                                subMenu = {"key": mm["key"], "title": mm["title"], "link": mm["link"]}
                                if subMenu["link"] is not None and len(subMenu["link"]) > 0:
                                    menu["submenu"].append(subMenu)
                else:
                    menu["link"] = m["link"]
                if menu["link"] is not None and len(menu["link"]) > 0:
                    userMenu.append(menu)
                else:
                    app.logger.debug("%r link is None" % menu)
    return userMenu

@app.template_filter('privilege')
def privilegeCheck(disableValue, privilege, ticket):
    if (disableValue == None):
        return ""
    if (isLogin() == False):
        return disableValue
    userPrivilege = t_user_privilege.query.filter_by(userId=session["userid"], privilegeKey=privilege).first()
    if userPrivilege == None:
        return disableValue
    if userPrivilege.status == 1:
        return ""
    return disableValue

@app.template_filter('datetime')
def dateformat(value, format="%Y-%m"):
    if (value == None):
        return ""
    return value.strftime(format)

@app.route('/index')
@app.route('/')
def index(name=None):
    if (isLogin() == False):
        return redirect("/login")
    else:
        userMenu = getUserMenu()
        if userMenu is None or len(userMenu) == 0:
            return redirect("/login")
        else:
            return redirect(userMenu[0]["link"])
        #return render_template("index.html", name=name, mainMenu=getUserMenu(), currentTime=datetime.datetime.now())

def isLogin():
    return not (session.get("username") == None or len(session["username"]) == 0)

@app.route('/page/<name>/list/<int:pageIndex>')
def pageList(name=None, pageIndex=1):
    if (isLogin() == False):
        return redirect("/login")
    else:
        pageName = "Page" + name[:1].upper() + name[1:] + "List"
        if (pageName in Pages):
            ret = Pages[pageName](pageIndex)
            if ret != None:
                return ret

        if True:
            model = None
            if (("v_" + name) in dir(models)): 
                model = getattr(models, "v_" + name)
            if (model == None):
                model = getattr(models, "t_" + name)
            if (model != None):
                filters = {}
                likeFilters = []
                for args in request.args:
                    if args.startswith('_'):
                        likeProperty = getattr(model, args[1:])
                        if likeProperty is None:
                            continue
                        likeCallable = getattr(likeProperty, "like")
                        if likeCallable is None:
                            continue
                        if callable(likeCallable) == False:
                            continue
                        likeFilters.append(likeCallable("%" + request.args[args] + "%"))
                    else:
                        filters[args] = request.args[args]

                if hasattr(model, "createTime"):
                    paginate = model.query.order_by(desc(model.createTime)).filter_by(**filters).filter(*likeFilters).paginate(pageIndex, 20, False)
                else:
                    paginate = model.query.filter_by(**filters).filter(*likeFilters).paginate(pageIndex, 20, False) 
                objectList = paginate.items
                objectForeignList = {}
                for propertyInfo in model.__dict__:
                    modelProperty = model.__dict__[propertyInfo]
                    if (isinstance(modelProperty, sqlalchemy.orm.attributes.InstrumentedAttribute)):
                        if (len(modelProperty.property.columns[0].foreign_keys) > 0):
                            foreignKey = modelProperty.property.columns[0].foreign_keys.copy().pop()
                            if (foreignKey):
                                foreignModel = getattr(models, foreignKey.column.table.name)
                                objectForeignList[propertyInfo] = foreignModel.query.all()
                return render_template(name + 'List.html', itemName=name, paginate=paginate, objectList=objectList, mainMenu=getUserMenu(), objectForeignList=objectForeignList, currentTime=datetime.datetime.now())
            else:
                return pageName;

@app.route('/page/<name>/print/<id>')
def pagePrint(name=None, id=None):
    if (isLogin() == False):
        return redirect("/login")
    else:
        pageName = "Page" + name[:1].upper() + name[1:] + "Print"
        pageRelateObject = None
        if (pageName in Pages):
            pageRelateObject = Pages[pageName](id)
        model = None
        if (("v_" + name) in dir(models)):
            model = getattr(models, "v_" + name)
        if (model == None):
            model = getattr(models, "t_" + name)
        if (model != None):
            objectPrint = model.query.filter_by(id=id).first()
            return render_template(name + 'Print.html', objectPrint=objectPrint, mainMenu=getUserMenu(), dataKey=name, dataId=id, pageRelateObject=pageRelateObject, currentTime=datetime.datetime.now())
        else:
            return pageName

@app.route('/page/<name>/export_xls', methods=['GET', 'POST'])
def pageExportXls(name=None):
    if (isLogin() == False):
        return redirect("/login")
    else:
        #font = Font(name="宋体", color="FF000000")
        wb = Workbook(encoding='utf-8')
        
        
        pageName = "Page" + name[:1].upper() + name[1:] + "ExportXls"
        if (pageName in Pages):
            exportName, exportColumns, exportList = Pages[pageName]()

            if exportList == None:
                model = None
                if (("v_" + name) in dir(models)): 
                    model = getattr(models, "v_" + name)
                if (model == None):
                    model = getattr(models, "t_" + name)
                if (model != None):
                    filters = {}
                    for args in request.args:
                        filters[args] = request.args[args]
                    if hasattr(model, "createTime"):
                        exportList = model.query.order_by(desc(model.createTime)).filter_by(**filters).all()
                    else:
                        exportList = model.query.filter_by(**filters).all() 
            
            colIndex = 0
            ws = wb.add_sheet(exportName)
            for column in exportColumns:
                ws.write(0, colIndex, column["title"])
                #ws.cell(row=1, column=colIndex).font = font

                rowIndex = 1
                for row in exportList:
                    if hasattr(row, column["column"]):
                        cellValue = getattr(row, column["column"])
                        if "options" in column and column["options"] is not None:
                            if str(cellValue) in column["options"]:
                                cellValue = column["options"][str(cellValue)]
                        ws.write(rowIndex, colIndex, cellValue)
                    #ws.cell(row=rowIndex, column=colIndex).font = font
                    rowIndex = rowIndex + 1
                colIndex = colIndex + 1
            
            xlsFileName = "static/export/" + uuid.uuid1().hex + ".xls"
            xlsFilePath = os.path.join(app.root_path, xlsFileName)
            wb.save(xlsFilePath)
            
            return redirect('/' + xlsFileName)
        else:
            return pageName

@app.route('/page/<name>/statistical', methods=['GET', 'POST'])
def pageStatistical(name=None, id=None):
    if (isLogin() == False):
        return redirect("/login")
    else:
        pageName = "Page" + name[:1].upper() + name[1:] + "Statistical"
        objectStatistical = None
        if (pageName in Pages):
            objectStatistical = Pages[pageName]()
            return render_template(name + 'Statistical.html', mainMenu=getUserMenu(), dataKey=name, objectStatistical=objectStatistical, currentTime=datetime.datetime.now())
        else:
            return pageName
        
@app.route('/page/<name>/detail/<id>')
def pageDetail(name=None, id=None):
    if (isLogin() == False):
        return redirect("/login")
    else:
        pageName = "Page" + name[:1].upper() + name[1:] + "Detail"
        pageRelateObject = None
        if (pageName in Pages):
            pageRelateObject = Pages[pageName]()
        model = None
        if (("v_" + name) in dir(models)):
            model = getattr(models, "v_" + name)
        if (model == None):
            model = getattr(models, "t_" + name)
        if (model != None):
            objectDetail = model.query.filter_by(id=id).first()
            return render_template(name + 'Detail.html', objectDetail=objectDetail, mainMenu=getUserMenu(), dataKey=name, dataId=id, pageRelateObject=pageRelateObject, currentTime=datetime.datetime.now())
        else:
            return pageName
            
@app.route('/page/<name>/edit/<id>')
def pageEdit(name=None, id=None):
    if (isLogin() == False):
        return redirect("/login")
    else:
        pageName = "Page" + name[:1].upper() + name[1:] + "Edit"
        pageRelateObject = None
        if (pageName in Pages):
            pageRelateObject = Pages[pageName](id)
        model = getattr(models, "t_" + name)
        if (model != None):
            objectEdit = model.query.filter_by(id=id).first()
            if (objectEdit == None):
                objectEdit = model()
            objectForeignList = {}
            for propertyInfo in model.__dict__:
                modelProperty = model.__dict__[propertyInfo]
                if (isinstance(modelProperty, sqlalchemy.orm.attributes.InstrumentedAttribute)):
                    if (len(modelProperty.property.columns[0].foreign_keys) > 0):
                        foreignKey = modelProperty.property.columns[0].foreign_keys.copy().pop()
                        if (foreignKey):
                            foreignModel = getattr(models, foreignKey.column.table.name)
                            objectForeignList[propertyInfo] = foreignModel.query.all()
            return render_template(name + 'Edit.html', objectEdit=objectEdit, mainMenu=getUserMenu(), dataKey=name, dataId=id, objectForeignList=objectForeignList, pageRelateObject=pageRelateObject, currentTime=datetime.datetime.now())
        else:
            return pageName


@app.route('/action/<name>', methods=['GET', 'POST'])
def action(name=None):
    actionName = "Action" + name[:1].upper() + name[1:]
    if (actionName in Actions):
        ret, rsp = Actions[actionName](app, None)
        if rsp is None:
            rsp = {"code": "ok", "msg": ""}
            if (ret is not None and len(ret) > 0):
                rsp["msg"] = ret
            return json.dumps(rsp)
        return rsp
    else:
        return actionName

@app.route('/login', methods=['GET', 'POST'])
def login(name=None):
    if (request.method == "GET"):
        return render_template("login.html", name=name, mainMenu=getUserMenu(), currentTime=datetime.datetime.now())
    elif (request.method == "POST"):
        user = t_user.query.filter_by(name=request.form["username"]).first()
        if user == None or user.password != hashlib.md5((request.form["password"] + user.salt).encode("utf-8")).hexdigest():
            app.logger.debug("login err ! error password")
            return render_template("login.html", name=name, msg="用户名或密码错误！", mainMenu=getUserMenu(), currentTime=datetime.datetime.now())
        app.logger.debug("login ok! set session and redirect!")
        session["username"] = request.form["username"]
        session["userid"] = user.id
        return redirect(url_for('index'))
 
@app.route('/logout')
def logout():
    session["username"] = None
    return redirect(url_for('login'))

def loadModules(path, attrName):
    modulePath = os.path.join(sys.path[0], path)
    if (os.path.isdir(modulePath)):
        fileList = os.listdir(modulePath)
        for fileItem in fileList:
            if (fileItem[-3:] == ".py"):
                moduleName = fileItem[:-3]
                m = None
                try:
                    m = __import__(path + "." + moduleName)
                except Exception as e:
                    app.logger.debug("load module err %s %r" %(moduleName, e))
                    pass
                if (m == None):
                    continue
                if (moduleName not in dir(m)):
                    continue
                cls = getattr(m, moduleName)
                if (cls == None):
                    continue
                cls = getattr(cls, attrName)
                if (cls == None):
                    continue
                if (not callable(cls)):
                    continue
                yield cls, moduleName

def loadActions():
    for m, n in loadModules('actions', 'Action'):
        Actions[n] = m

def loadPages():
    for m, n in loadModules('pages', 'Page'):
        Pages[n] = m

db.init_app(app)
app.debug = True
app.secret_key = "AJFNSJK(*#JJDSLKFFJDSIJUQWQ"
loadPages()
loadActions()

if __name__ == '__main__':
    app.run(host='0.0.0.0')
