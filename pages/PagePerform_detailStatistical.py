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
    relateObj["profitType"] = t_profit_type.query.all()
    relateObj["userList"] = t_user.query.all()
    if request.method == "POST":
        relateObj["result"] = db.session.execute(GenerateSql()).fetchall()
    return relateObj

def GenerateSql():
    sCondition = ""
    sConditionIn = ""
    sConditionUsers = ""
    sConditionProfitType = ""

    departBeginTime = request.form.get("departBeginTime")
    departEndTime = request.form.get("departEndTime")
    
    if (departBeginTime is not None and len(departBeginTime) > 0):
        sCondition += " HAVING (departTime is NULL OR departTime>='" + departBeginTime + " 00:00:00')\n"
    if (departEndTime is not None and len(departEndTime) > 0):
        if (len(sCondition) == 0):
            sCondition += " HAVING "
        else:
            sCondition += " AND "
        sCondition += "(departTime is NULL OR departTime<='" + departEndTime + " 23:59:59')\n"

    checkBeginTime = request.form.get("checkBeginTime")
    checkEndTime = request.form.get("checkEndTime")

    if (checkBeginTime is not None and len(checkBeginTime)>0):
        sConditionIn += " WHERE (createTime is NULL OR createTime>='" + checkBeginTime + " 00:00:00')\n"
    if (checkEndTime is not None and len(checkEndTime)>0):
        if (len(sConditionIn) == 0):
            sConditionIn += " WHERE "
        else:
            sConditionIn += " AND "
        sConditionIn += "(createTime is NULL OR createTime<='" + checkEndTime + " 23:59:59')\n"

    

    operatorId = request.form.get("operatorId")
    sellerId = request.form.get("sellerId")
    if operatorId is not None and len(operatorId) > 0:
        if (len(sCondition) == 0):
            sConditionUsers += " HAVING "
        else:
            sConditionUsers += " AND "
        sConditionUsers += "(u.id='" + operatorId + "')"
    if sellerId is not None and len(sellerId) > 0:
        if (len(sConditionUsers) == 0):
            if (len(sCondition) == 0):
                sConditionUsers += " HAVING "
            else:
                sConditionUsers += " AND "
        else:
            sConditionUsers += " AND "
        sConditionUsers += "(su.id='" + sellerId + "')"

    for condition in request.form:
        if condition.startswith("profitType_") and request.form.get(condition) == "1":
            if (len(sConditionProfitType) == 0):
                if (len(sConditionUsers) == 0):
                    if (len(sCondition) == 0):
                        sConditionProfitType += " HAVING "
                    else:
                        sConditionProfitType += " AND "
                else:
                    sConditionProfitType += " AND "
                sConditionProfitType += "p.profitTypeId IN ("

            sConditionProfitType += "'" + condition[11:] + "',"
    sConditionProfitType = sConditionProfitType.strip(',')
    if len(sConditionProfitType) > 0:
        sConditionProfitType += ")\n"
	    
    sSql = '''
    SELECT 
        p.id AS profitId,
        p.departTime,
        p.leader,
        p.peopleNum,
        p.operatorID,
        l.name AS lineName,
        u.name as operatorName,
        su.name as sellerName,
        IFNULL(SUM(co.money), 0) AS totalGotMoney,
        IFNULL(SUM(i.totalMoney), 0) AS totalMoney,
        CASE 
            WHEN SUM(i.totalMoney) * 100 <> 0 THEN (SUM(co.money)/SUM(i.totalMoney) * 100)
            ELSE 0
        END AS gotPercent,
        IFNULL((SELECT SUM(totalMoney) totalOutMoney FROM t_profit_item WHERE profitId=p.id AND 'type' = 1), 0) AS totalOutMoney,
        (IFNULL(SUM(i.totalMoney), 0) - IFNULL((SELECT SUM(totalMoney) totalOutMoney FROM t_profit_item WHERE profitId=p.id AND 'type' = 1), 0)) AS totalProfit
    FROM t_profit p 
    LEFT JOIN t_profit_item i
    ON p.id = i.profitId AND i.type = 0
    LEFT JOIN t_line l
    ON p.lineId = l.id
    LEFT JOIN t_user u
    ON p.operatorId = u.id
    LEFT JOIN t_user su
    ON p.sellerId = su.id
    LEFT JOIN 
    (
        SELECT profitItemId AS Id, SUM(money) AS money FROM (SELECT * FROM t_account_flow %s) lfco GROUP BY profitItemId
    ) co
    ON co.id = i.id
    GROUP BY p.id, p.departTime, p.operatorID, p.leader, l.name, u.name, p.peopleNum, p.profitTypeId, u.id, su.id
    %s %s''' % (sConditionIn, sCondition, sConditionUsers + sConditionProfitType)
			
    return sSql;
                    
