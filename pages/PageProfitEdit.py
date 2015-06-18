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
    relateObj["itemIn"] = v_profit_item.query.filter_by(profitId=id, type=0)
    relateObj["itemOut"] = v_profit_item.query.filter_by(profitId=id, type=1)
    relateObj["profitItemTypeList"] = t_profit_item_type.query.all()
    relateObj["companyList"] = t_company.query.all()
    relateObj["departmentList"] = t_department.query.all()
    relateObj["contactList"] = t_contact.query.all()
    relateObj["billList"] = v_bill.query.filter_by(profitId=id).all()
    return relateObj
