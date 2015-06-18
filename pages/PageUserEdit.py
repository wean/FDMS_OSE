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
from menu import mainMenu

def Page(id):
    relateObj = {}
    relateObj["mainMenu"] = mainMenu
    relateObj["userPrivilege"] = t_user_privilege.query.filter_by(userId=id).all()
    return relateObj
