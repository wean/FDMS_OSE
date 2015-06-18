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
    keyTitleMap.append({"column": "companyName", "title": "单位"})
    keyTitleMap.append({"column": "peopleNum", "title": "人数"})
    
    return "单位客人人数", keyTitleMap, db.session.execute(GenerateSql()).fetchall()

def GenerateSql():        
    sSql = "select SUM(c.peopleNum) AS peopleNum, d.name AS companyName\n"
    sSql += "FROM t_profit_item c\n"
    sSql += "LEFT JOIN t_company d\n"
    sSql += "ON d.id = c.companyId\n"
    sSql += "LEFT JOIN t_profit p\n"
    sSql += "ON p.id = c.profitId\n"	

    companyName = request.form.get("companyName")
    sSql += "WHERE (d.name LIKE '%" + companyName + "%'"
    if (companyName is None or len(companyName)==0):
        sSql += " OR d.name is NULL"
    sSql += ")\n"
    sSql += "AND c.type=0\n"

    beginTime = request.form.get("beginTime")
    endTime = request.form.get("endTime")
    if (beginTime is not None and len(beginTime)>0):
        sSql += "AND p.departTime>='" + beginTime + " 00:00:00'\n"

    if (endTime is not None and len(endTime)>0):
        sSql += "AND p.departTime<='" + endTime + " 23:59:59'\n"
                                
    sSql += "GROUP BY d.name"

    return sSql
