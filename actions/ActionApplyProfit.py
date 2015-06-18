#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid

def Action(app=None, data=None):
    profitId = request.args.get("profitId")
    objectProfit = t_profit.query.filter_by(id=profitId).first()
    if objectProfit != None:
        if objectProfit.operatorId != session["userid"]:
            return "你不能提交该毛利表", None
        objectProfit.status = 1
        db.session.add(objectProfit)
        db.session.commit()
    return "", None
