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
    model = getattr(models, "t_" + dataKey)
    if (model != None):
        objectDelete = model.query.filter_by(id=dataId).first()
        db.session.delete(objectDelete)
        db.session.commit()

        if objectDelete.profitItemId is not None:
            objectProfitItem = t_profit_item.query.filter_by(id=objectDelete.profitItemId).first()
            if objectProfitItem is not None:
                totalMoney = db.session.execute("SELECT SUM(price*num) as money FROM t_profit_check_item WHERE profitItemId='" + objectDelete.profitItemId + "'").fetchall()
                if len(totalMoney) > 0:
                    app.logger.debug("ActionDelDataCheckItem %r" % totalMoney[0]["money"])
                    objectProfitItem.totalMoney = totalMoney[0]["money"]
                    db.session.add(objectProfitItem)
        db.session.commit()
    return "", None
