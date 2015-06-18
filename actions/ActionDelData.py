#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid

def Action(app=None, data=None):
    dataKey = request.args.get("dataKey")
    dataId = request.args.get("dataId")
    actionName = "ActionDelData" + dataKey[:1].upper() + dataKey[1:]
    if (actionName in app.Actions):
        return app.Actions[actionName](app, None)
    else:
        pass
    model = getattr(models, "t_" + dataKey)
    if (model != None):
        objectDelete = model.query.filter_by(id=dataId).first()
        db.session.delete(objectDelete)
        db.session.commit()
    return "", None
