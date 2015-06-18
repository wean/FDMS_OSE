#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid
import hashlib
from datetime import *

def Action(app=None, data=None):
    dataKey = request.args.get("dataKey")
    dataId = request.args.get("dataId")
    json = request.get_json(force=True, silent=True)
    try:
        if dataId == "new":
            objectEdit = t_user()
            objectEdit.id = uuid.uuid1().hex
        else:
            objectEdit = t_user.query.filter_by(id=dataId).first()
        objectEdit.name = json["name"]
        if (objectEdit.salt == None or len(objectEdit.salt) == 0):
            objectEdit.salt = uuid.uuid1().hex[3:8]
        if ("password" in json):
            objectEdit.password = hashlib.md5((json["password"] + objectEdit.salt).encode("utf-8")).hexdigest()
        db.session.add(objectEdit)

        for p in json["privilege"]:
            op = t_user_privilege.query.filter_by(userId=objectEdit.id, privilegeKey=p).first()
            if op is None:
                op = t_user_privilege()
                op.id = uuid.uuid1().hex
                op.userId = objectEdit.id
                op.privilegeKey = p
                op.createTime = datetime.now()
            op.status = json["privilege"][p]["checked"]
            db.session.add(op)    
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        app.logger.debug("SetData %r" % e)
        "SetData %r"%e, None
    return "", None
