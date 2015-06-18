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
from menu import mainMenu

def Page(index):
    if request.args.get("operatorId") == session["userid"]:
        return None
    userPrivilege = t_user_privilege.query.filter_by(userId=session["userid"], privilegeKey="jitiao_profit_check").first()
    if userPrivilege is None or userPrivilege.status != 1:
        return redirect("/page/profit/list/1?operatorId=%s" % session["userid"])
    return None
