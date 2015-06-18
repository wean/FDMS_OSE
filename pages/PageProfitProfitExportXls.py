#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from app import app
from models import *
import models
from app import db
import uuid
from datetime import *

def Page():
    keyTitleMap = []
    keyTitleMap.append({"column": "line", "title": "线路"})
    keyTitleMap.append({"column": "departTime", "title": "时间"})
    keyTitleMap.append({"column": "peopleNum", "title": "人数"})
    keyTitleMap.append({"column": "createTime", "title": "录入时间"})
    keyTitleMap.append({"column": "leader", "title": "领队"})
    keyTitleMap.append({"column": "income", "title": "收入"})
    keyTitleMap.append({"column": "export", "title": "支出"})
    keyTitleMap.append({"column": "profit", "title": "利润"})
    
    return "利润", keyTitleMap, db.session.execute(GenerateSql()).fetchall()

def GenerateSql():        
    sSql = "SELECT \n"
    sSql += "p.id AS no,\n"
    sSql += "l.name AS line, \n"
    sSql += "p.leader AS leader, \n"
    sSql += "p.peopleNum AS peopleNum,\n"
    sSql += "p.departTime AS departTime,\n"
    sSql += "p.createTime AS createTime,\n"
    sSql += "IFNULL(ppi.ALLM, 0) AS income, \n"
    sSql += "IFNULL(ppo.ALLM, 0) AS export, \n"
    sSql += "u.name AS operatorName, \n"
    sSql += "(IFNULL(ppi.ALLM, 0)-IFNULL(ppo.ALLM, 0)) AS profit \n"
    sSql += "FROM t_profit p\n"
    sSql += "LEFT JOIN \n"
    sSql += "(SELECT profitID, SUM(totalMoney) AS ALLM FROM t_profit_item WHERE type=0 GROUP BY profitId) ppi\n";
    sSql += "ON ppi.profitId=p.id\n"
    sSql += "Left JOIN \n"
    sSql += "(SELECT profitID, SUM(totalMoney) AS ALLM FROM t_profit_item WHERE type=1 GROUP BY profitId) ppo\n";
    sSql += "ON ppo.profitId=p.id\n"
    sSql += "LEFT JOIN t_line l\n"
    sSql += "ON l.id=p.lineId\n"
    sSql += "LEFT JOIN t_user u\n"
    sSql += "ON u.ID=p.operatorId\n"
    	
    listCondition = []
    departBeginTime = request.form.get("departBeginTime")
    departEndTime = request.form.get("departEndTime")
    if (departBeginTime is not None and len(departBeginTime)>0):
        listCondition.append("(departTime>=\'%s 00:00:00\' OR departTime is NULL)"%departBeginTime)
    if (departEndTime is not None and len(departEndTime)>0):
        listCondition.append("(departTime<=\'%s 23:59:59\' OR departTime is NULL)"%departEndTime)

    createBeginTime = request.form.get("createBeginTime")
    createEndTime = request.form.get("createEndTime")
    
    if (createBeginTime is not None and len(createBeginTime)>0):
        listCondition.append("(p.createTime>=\'%s 00:00:00\' OR p.createTime is NULL)"%createBeginTime)
    if (createEndTime is not None and len(createEndTime)>0):
        listCondition.append("(p.createTime<=\'%s 23:59:59\' OR p.createTime is NULL)"%createEndTime)

    leader = request.form.get("leader")
    if (leader is not None and len(leader)>0):
        listCondition.append("(leader LIKE \'%" + leader + "%\')")

    lineName = request.form.get("lineName")
    if (lineName is not None and len(lineName)>0):
        listCondition.append("(l.name LIKE \'%" + lineName + "%\')")

    status = request.form.get("status")
    if (status is not None and len(status)>0 and status != "-1"):
        listCondition.append("(p.status =%s)" % status)

	    
    if (len(listCondition) > 0):
        sSql += " WHERE "
        for c in listCondition:
            sSql += c + " AND "
        sSql += "1=1 "

    return sSql
