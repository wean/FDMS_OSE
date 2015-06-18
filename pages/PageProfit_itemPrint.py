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
import os
import codecs

def Page(id):
    relateObj = {}
    relateObj["guestList"] = v_guest.query.filter_by(profitItemId=id).all()
    relateObj["printTime"] = datetime.now()
    relateObj["checkItemList"] = t_profit_check_item.query.filter_by(profitItemId=id).all()
    return relateObj
