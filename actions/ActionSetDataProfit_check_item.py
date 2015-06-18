#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid
import hashlib
from datetime import datetime

def Action(app=None, data=None):
    dataKey = request.args.get("dataKey")
    dataId = request.args.get("dataId")
    json = request.get_json(force=True, silent=True)
    try:
        if dataId == "new":
            objectEdit = t_profit_check_item()
            objectEdit.id = uuid.uuid1().hex
            if (hasattr(objectEdit, "createTime")):
                setattr(objectEdit, "createTime", datetime.now())
            if (hasattr(objectEdit, "operatorId")):
                setattr(objectEdit, "operatorId", session["userid"])
        else:
            objectEdit = t_profit_check_item.query.filter_by(id=dataId).first()
        for col in json:
            if hasattr(objectEdit, col):
                setattr(objectEdit, col, json[col])
                    
        db.session.add(objectEdit)
            
        db.session.commit()

        if objectEdit.profitItemId is not None:
            objectProfitItem = t_profit_item.query.filter_by(id=objectEdit.profitItemId).first()
            if objectProfitItem is not None:
                totalMoney = db.session.execute("SELECT SUM(price*num) as money FROM t_profit_check_item WHERE profitItemId='" + objectEdit.profitItemId + "'").fetchall()
                if len(totalMoney) > 0:
                    app.logger.debug("ActionSetDataCheckItem %r" % totalMoney[0]["money"])
                    objectProfitItem.totalMoney = totalMoney[0]["money"]
                    db.session.add(objectProfitItem)
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        app.logger.debug("ActionSetDataCheckItem Exception %r" % e )
        return "SetData %r" % e, None
    return "", None
