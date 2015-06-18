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

def Page(id):
    relateObj = {}
    relateObj["profitItem"] = v_profit_item.query.filter_by(id=request.args.get("profitItemId"), type=1).first()
    relateObj["profit"] = v_profit.query.filter_by(id=request.args.get("profitId")).first()
    relateObj["companyList"] = t_company.query.all()
    return relateObj
