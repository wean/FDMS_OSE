#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid

def Action(app=None, data=None):
    if (session["userid"] is None or len(session["userid"]) == 0):
        return "", None
    profitCheckPrivilege = t_user_privilege.query.filter_by(userId=session["userid"], privilegeKey="jitiao_profit_check").first()
    operatorIdCondition = ""
    operatorIdCondition = " AND operatorId='" + session["userid"] + "'"
    unApplyProfitCount = db.session.execute("SELECT count(*) as unApplyProfitCount FROM t_profit WHERE status=0" + operatorIdCondition).first()["unApplyProfitCount"]
    if profitCheckPrivilege is not None and profitCheckPrivilege.status == 1:
        unCheckProfitCount = db.session.execute("SELECT count(*) as unCheckProfitCount FROM t_profit WHERE status=1").first()["unCheckProfitCount"]
    else:
        unCheckProfitCount = 0
    rsp = {"UnApplyProfitCount": unApplyProfitCount, "UnCheckProfitCount": unCheckProfitCount}
    return "", json.dumps(rsp)
