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
    relateObj["flowTypeId"] = t_account_flow_type.query.all()
    if request.method == "POST":
        relateObj["result"] = db.session.execute(GenerateSql()).fetchall()
        relateObj["totalResult"] = db.session.execute("SELECT SUM(money) as money FROM (" + GenerateSql() + ") t").fetchall()
    return relateObj

def GenerateSql():
    sCondition = ""

    createBeginTime = request.form.get("createBeginTime")
    createEndTime = request.form.get("createEndTime")

    if (createBeginTime is not None and len(createBeginTime)>0):
        sCondition += " AND (createTime is NULL OR createTime>='" + createBeginTime + " 00:00:00')\n"
    if (createEndTime is not None and len(createEndTime)>0):
        sCondition += " AND (createTime is NULL OR createTime<='" + createEndTime + " 23:59:59')\n"

    status = request.form.get("status")
    if status is not None and len(status) > 0:
        sCondition += " AND (status=" + status + ")"

    for condition in request.form:
        if condition.startswith("flowTypeId_") and request.form.get(condition) == "1":
            sCondition += " AND flowTypeId IN ("

            sCondition += "'" + condition[11:] + "',"
    if sCondition.endswith(","):
        sCondition = sCondition.strip(',')
        sCondition += ")\n"
	    
    sSql = 'SELECT * FROM v_account_flow WHERE money<0 %s' % (sCondition)
			
    return sSql;
                    
