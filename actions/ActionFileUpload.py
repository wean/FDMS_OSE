#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from flask import abort, redirect, url_for, request, session
from models import *
import models
from app import db
import uuid
import os
import base64
import re

def Action(app=None, data=None):

    result = {}
    if "relateId" in request.form:
        result["relateId"] = request.form["relateId"]
    result["message"] = "上传失败！"
    oldValue = None
    if "oldValue" in request.form:
        oldValue = request.form["oldValue"]
    saveDir = None
    if "saveDir" in request.form:
        saveDir = request.form["saveDir"]
    if (saveDir == None or len(saveDir) == 0):
        saveDir = "static/upload"
    if (request.files is not None and len(request.files) > 0):
        file = request.files["file"]
        f, ext = os.path.splitext(file.filename)
        try:
            strSaveDir = os.path.join(app.root_path, saveDir)
            filename = uuid.uuid1().hex + ext;
            if (oldValue != None and len(oldValue) > 0):
                oldFilePath = os.path.join(app.root_path, oldValue)
                if (os.path.exists(oldFilePath)):
                    os.remove(oldFilePath);
            file.save(os.path.join(strSaveDir, filename))

            result["message"] = "上传成功!"
            result["value"] = os.path.join(saveDir, filename)
            result["url"] = "/" + result["value"]
        except:
            pass
    else:
        
        try:
            base64data = request.form["payload"]
            #base64data = base64data.replace("%2f", "/").replace("%3d", "=")
            base64head, base64payload = base64data.split(",")
            pattern = re.compile("data:image/(.*);base64", re.IGNORECASE)
            match = pattern.match(base64head)
            strSaveDir = os.path.join(app.root_path, saveDir)
            filename = uuid.uuid1().hex + "." + match.group(1);
            if (oldValue != None and len(oldValue) > 0):
                oldFilePath = os.path.join(app.root_path, oldValue)
                if (os.path.exists(oldFilePath)):
                    os.remove(oldFilePath);
            fileSave = open(os.path.join(strSaveDir, filename), 'wb')
            payloadBytes = base64.b64decode(base64payload)
            fileSave.write(payloadBytes)
            fileSave.close()

            result["message"] = "上传成功!"
            result["value"] = os.path.join(saveDir, filename)
            result["url"] = "/" + result["value"]
        except Exception as e:
            result["message"] = ("%r"%e)
    return "", json.dumps(result)
