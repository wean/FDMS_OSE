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
            objectEdit = t_income_check()
            objectEdit.id = uuid.uuid1().hex
            if (hasattr(objectEdit, "createTime")):
                setattr(objectEdit, "createTime", datetime.now())
            if (hasattr(objectEdit, "operatorId")):
                setattr(objectEdit, "operatorId", session["userid"])
        else:
            objectEdit = t_income_check.query.filter_by(id=dataId).first()
        for col in json:
            if hasattr(objectEdit, col):
                setattr(objectEdit, col, json[col])
                    
        db.session.add(objectEdit)

        if objectEdit.status == '2':
            objectFlow = t_account_flow()
            objectFlow.id = uuid.uuid1().hex
            objectFlow.accountId = objectEdit.incomeAccountId
            objectFlow.money = objectEdit.money
            objectFlow.memo = objectEdit.requestMemo
            objectFlow.flowTypeId = objectEdit.flowTypeId
            objectFlow.createTime = datetime.now()
        
            objectFlow.profitItemId = objectEdit.profitItemId
            db.session.add(objectFlow)

            objectBill = t_bill()
            objectBill.id = uuid.uuid1().hex
            objectBill.createTime = datetime.now()
            objectBill.money = objectEdit.money
            objectBill.profitItemId = objectEdit.profitItemId
            objectBill.billPic = objectEdit.payPic
            objectBill.billNo = ""
            objectBill.typeId = None
            objectBill.memo = objectEdit.requestMemo
            db.session.add(objectBill)
            
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        app.logger.debug("ActionSetDataIncome_check Exception %r" % e )
        return "SetData %r" % e, None
    return "", None
