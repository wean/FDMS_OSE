#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid

def Action(app=None, data=None):
    flowIds = request.form.get("flowIds")
    objectFlow = t_account_flow.query.filter(t_account_flow.id.in_(flowIds.split(","))).all()
    if objectFlow != None:
        for flow in objectFlow:
            if flow.status != 0:
                continue
            flow.status = 1
            db.session.add(flow)
        db.session.commit()
    return "", None
