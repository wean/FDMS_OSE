#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid
from datetime import *
import sqlalchemy

def Action(app=None, data=None):
    dataKey = request.args.get("dataKey")
    dataId = request.args.get("dataId")
    actionName = "ActionSetData" + dataKey[:1].upper() + dataKey[1:]
    if (actionName in app.Actions):
        return app.Actions[actionName](app, None)
    else:
        pass
    json = request.get_json(force=True, silent=True)
    model = getattr(models, "t_" + dataKey)
    if (model != None):
        try:
            if dataId == "new":
                objectEdit = model()
                objectEdit.id = uuid.uuid1().hex
                if (hasattr(objectEdit, "createTime")):
                    setattr(objectEdit, "createTime", datetime.now())
                if (hasattr(objectEdit, "operatorId")):
                    setattr(objectEdit, "operatorId", session["userid"])
            else:
                objectEdit = model.query.filter_by(id=dataId).first()
            for col in json:
                if hasattr(objectEdit, col):
                    setattr(objectEdit, col, json[col])
                elif (json[col] != None):
                    if hasattr(models, col):
                        subModel = getattr(models, col)
                        foreignIdCol = None
                        for propertyInfo in subModel.__dict__:
                            modelProperty = subModel.__dict__[propertyInfo]
                            if (isinstance(modelProperty, sqlalchemy.orm.attributes.InstrumentedAttribute)):
                                if (len(modelProperty.property.columns[0].foreign_keys) > 0):
                                    foreignKey = modelProperty.property.columns[0].foreign_keys.copy().pop()
                                    if (foreignKey and foreignKey.column.table.name == ("t_" + dataKey)):
                                        foreignIdCol = propertyInfo
                        for subModelId in json[col]:
                            subObject = None
                            if (subModelId.startswith("newnew")):
                                subObject = subModel()
                                subObject.id = uuid.uuid1().hex
                                if (hasattr(subObject, "createTime")):
                                    setattr(subObject, "createTime", datetime.now())
                                if (hasattr(subObject, "operatorId")):
                                    setattr(subObject, "operatorId", session["userid"])
                            else:
                                subObject = subModel.query.filter_by(id=subModelId).first()
                            if (subObject == None):
                                continue

                            for subModelCol in json[col][subModelId]:
                                if hasattr(subObject, subModelCol):
                                    setattr(subObject, subModelCol, json[col][subModelId][subModelCol])
                            if foreignIdCol != None:
                                if hasattr(subObject, foreignIdCol):
                                    setattr(subObject, foreignIdCol, objectEdit.id)
                            if (subObject != None):
                                db.session.add(subObject)
                        
            db.session.add(objectEdit)
            
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            return "SetData %r" % e, None
    return "", None
