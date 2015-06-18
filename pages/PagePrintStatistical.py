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
    relateObj = {}
    if request.method == "POST":
        sql = GenerateSql()
        relateObj["result"] = db.session.execute(sql).fetchall()

    return relateObj

def GenerateSql():        
    sSql = "SELECT "
    sSql += "c.id, c.ConcileID, \n"
    sSql += "c.peopleNum,\n"
    sSql += "c.totalMoney,\n"
    sSql += "d.id AS profitId,\n"
    sSql += "d.departTime,\n"
    sSql += "d.createTime AS proftCreateTime,\n"
    sSql += "l.name AS lineName,\n"
    sSql += "com.name AS companyName,\n"
    sSql += "dep.name AS departmentName,\n"
    sSql += "con.name AS contactName,\n"
    sSql += "con.phone AS contactInfo,\n"
    sSql += "IFNULL(co.checkedMoney, 0) AS checkedMoney,"
    sSql += "(c.totalMoney - IFNULL(co.checkedMoney, 0)) AS leftMoney \n"
    sSql += "FROM t_profit_item c\n"
    sSql += "LEFT JOIN t_profit d\n"
    sSql += "ON d.ID=c.profitId\n"
    sSql += "LEFT JOIN t_line l\n"
    sSql += "ON l.id=d.lineId\n"
    sSql += "LEFT JOIN t_company com\n"
    sSql += "ON com.id=c.companyId\n"
    sSql += "LEFT JOIN t_department dep\n"
    sSql += "ON dep.id=c.departmentId\n"
    sSql += "LEFT JOIN t_contact con\n"
    sSql += "ON con.id=c.contactId\n"
    sSql += """LEFT JOIN
               (
                 SELECT profitItemId AS ID, SUM(money) AS checkedMoney FROM t_account_flow GROUP BY profitItemId
               ) co
               ON co.ID=c.ID  """

    companyName = request.form.get("companyName")
    sSql += "WHERE (com.Name LIKE '%" + companyName + "%'"
    if (companyName is None or len(companyName) == 0):
        sSql += " OR com.Name is NULL"
    sSql += ")\n"

    departmentName = request.form.get("departmentName")
    sSql += "AND (dep.Name LIKE '%" + departmentName + "%'"
    if (departmentName is None or len(departmentName) == 0):
        sSql += " OR dep.Name is NULL"
    sSql += ")\n"

    type = request.form.get("type")
    sSql += "AND c.type=" + type + "\n";

    lineName = request.form.get("lineName")
    if (lineName is not None and len(lineName)>0):
        sSql += "AND l.name LIKE '%" + lineName + "%'\n"

    departBeginTime = request.form.get("departBeginTime")
    if (departBeginTime is not None and len(departBeginTime)>0):
        sSql += " AND (d.departTime is NULL OR d.departTime>='" + departBeginTime + " 00:00:00')\n"

    departEndTime = request.form.get("departEndTime")
    if (departEndTime is not None and len(departEndTime)>0):
        sSql += " AND (d.departTime is NULL OR d.departTime>='" + departEndTime + " 23:59:59')\n"

    profitCreateBeginTime = request.form.get("profitCreateBeginTime")
    if (profitCreateBeginTime is not None and len(profitCreateBeginTime)>0):
        sSql += " AND (d.createTime is NULL OR d.createTime>='" + profitCreateBeginTime + " 00:00:00')\n"

    profitCreateEndTime = request.form.get("profitCreateEndTime")
    if (profitCreateEndTime is not None and len(profitCreateEndTime)>0):
        sSql += " AND (d.createTime is NULL OR d.createTime>='" + profitCreateEndTime + " 23:59:59')\n"
        
    profitItemCreateBeginTime = request.form.get("profitItemCreateBeginTime")
    if (profitItemCreateBeginTime is not None and len(profitItemCreateBeginTime)>0):
        sSql += " AND (c.createTime is NULL OR c.createTime>='" + profitItemCreateBeginTime + " 00:00:00')\n"

    profitItemCreateEndTime = request.form.get("profitItemCreateEndTime")
    if (profitItemCreateEndTime is not None and len(profitItemCreateEndTime)>0):
        sSql += " AND (c.createTime is NULL OR c.createTime>='" + profitItemCreateEndTime + " 23:59:59')\n"

    teamNo = request.form.get("teamNo")
    if (teamNo is not None and len(teamNo)>0):
        sSql += " AND d.teamNo='" + teamNo + "')\n"

    billNo = request.form.get("billNo")
    if (billNo is not None and len(billNo)>0):
        sSql += " AND (c.billNo='" + billNo + "')\n"

    checkStatus = request.form.get("checkStatus")
    if (checkStatus is not None and len(checkStatus)>0 and checkStatus != "-1"):
        if (checkStatus == "0"):
            sSql += "AND (c.totalMoney - IFNULL(co.checkedMoney, 0))<>0\n"
        elif (checkStatus == "1"):
            sSql += "AND (c.totalMoney - IFNULL(co.checkedMoney, 0))=0\n"

    remainMoney = request.form.get("remainMoney")
    if (remainMoney is not None and len(remainMoney)>0):
        sSql += "AND (c.totalMoney - IFNULL(co.checkedMoney, 0))=" + remainMoney + "\n"
    sSql += "ORDER BY d.departTime"
    return sSql
