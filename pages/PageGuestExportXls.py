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

def Page():
    keyTitleMap = []
    keyTitleMap.append({"column": "name", "title": "姓名"})
    keyTitleMap.append({"column": "engName", "title": "英文名"})
    keyTitleMap.append({"column": "sex", "title": "性别", "options": {"1": "男", "0":"女"}})
    keyTitleMap.append({"column": "birth", "title": "生日"})
    keyTitleMap.append({"column": "idCardNo", "title": "证件号"})
    keyTitleMap.append({"column": "visaHk", "title": "港签", "options": {"1": "是", "0": "否"}})
    keyTitleMap.append({"column": "visaMc", "title": "澳签", "options": {"1": "是", "0": "否"}})

    keyTitleMap.append({"column": "memo", "title": "签注"})
    return "客人列表", keyTitleMap, None
