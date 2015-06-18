#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy

from app import db

class t_account(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    account = db.Column(db.String(50))
    money = db.Column(db.Float)
    type = db.Column(db.Integer)
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", account="", money=0, type=0, createTime=None):
        self.name = name
        self.account = account
        self.money = money
        self.type = type
        self.createTime = createTime

    def __repr__(self):
        return '<t_account %r>' % self.name

class t_account_flow_type(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_account_flow_type %r>' % self.name

class t_account_flow(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    accountId = db.Column(db.String(32), db.ForeignKey("t_account.id"))
    money = db.Column(db.Float)
    type = db.Column(db.Integer)
    memo = db.Column(db.Text)
    flowTypeId = db.Column(db.String(32), db.ForeignKey("t_account_flow_type.id"))
    createTime = db.Column(db.DateTime)
    profitItemId = db.Column(db.String(32), db.ForeignKey("t_profit_item.id"))
    status = db.Column(db.Integer)
    
    def __init__(self, accountId = "", money = 0, type = 0, memo = "", flowTypeId="", createTime=None, profitItemId=None, status=0):
        self.accountId = accountId
        self.money = money
        self.type = type
        self.memo = memo
        self.flowTypeId = flowTypeId
        self.createTime = createTime
        self.profitIteId = profitItemId
        self.status = status

    def __repr__(self):
        return '<t_account_flow %r>' % self.money

class v_account_flow(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    accountId = db.Column(db.String(32))
    money = db.Column(db.Float)
    type = db.Column(db.Integer)
    memo = db.Column(db.Text)
    flowTypeId = db.Column(db.String(32))
    accountName = db.Column(db.String(50))
    accountAccount = db.Column(db.String(50))
    flowTypeName = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    profitItemId = db.Column(db.String(32), db.ForeignKey("t_profit_item.id"))
    status = db.Column(db.Integer)
    
    def __init__(self, accountId = "", money = 0, type = 0, memo = "", flowTypeId="", accountName = "", accountAccount = "", flowTypeName = "", createTime=None, profitItemId=None, status=0):
        self.accountId = accountId
        self.money = money
        self.type = type
        self.memo = memo
        self.flowTypeId = flowTypeId
        self.accountName = accountName
        self.accountAccount = accountAccount
        self.flowTypeName = flowTypeName
        self.createTime = createTime
        self.profitIteId = profitItemId
        self.status = status
        
    def __repr__(self):
        return '<v_account_flow %r>' % self.money

class t_user_privilege(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    userId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    privilegeKey = db.Column(db.String(50))
    status = db.Column(db.Integer)
    createTime = db.Column(db.DateTime)

    def __init__(self, userId=None, privilegeKey="", status=0, createTime=None):
        self.userId = userId
        self.privilegeKey = privilegeKey
        self.status = status
        self.createTime = createTime

    def __repr__(self):
        return '<t_user_privilege %r>' % self.privilegeKey

class t_user(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50), unique=True)
    salt = db.Column(db.String(5))
    password = db.Column(db.String(32))
    createTime = db.Column(db.DateTime)

    def __init__(self, name="", salt="", password="", createTime=None):
        self.name = name
        self.salt = salt
        self.password = password
        self.createTime = createTime
        
    def __repr__(self):
        return '<t_user %r>' % self.name

class t_line(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_line %r>' % self.name

class t_area(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_area %r>' % self.name

class t_company(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_company %r>' % self.name

class t_department(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    companyId = db.Column(db.String(32), db.ForeignKey("t_company.id"))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", companyId="", createTime=None):
        self.name = name
        self.companyId = companyId
        self.createTime = createTime

    def __repr__(self):
        return '<t_department %r>' % self.name

class t_contact(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    companyId = db.Column(db.String(32), db.ForeignKey("t_company.id"))
    departmentId = db.Column(db.String(32), db.ForeignKey("t_department.id"))
    createTime = db.Column(db.DateTime)
    phone = db.Column(db.String(50))
    qq = db.Column(db.String(50))
    email = db.Column(db.String(50))
    
    def __init__(self, name="", companyId="", departmentId="", createTime=None, phone="", qq="", email=""):
        self.name = name
        self.companyId = companyId
        self.departmentId = departmentId
        self.createTime = createTime
        self.phone = phone
        self.qq = qq
        self.email = email

    def __repr__(self):
        return '<t_contact %r>' % self.name

class t_pay_request(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    money = db.Column(db.Float)
    createTime = db.Column(db.DateTime)
    status = db.Column(db.Integer)
    requestUserId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    requestMemo = db.Column(db.Text)
    confirmUserId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    confirmTime = db.Column(db.DateTime)
    cancelUserId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    cancelMemo = db.Column(db.Text)
    cancelTime = db.Column(db.DateTime)
    payUserId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    payAccountId = db.Column(db.String(32), db.ForeignKey("t_account.id"))
    payTime = db.Column(db.DateTime)
    payMemo = db.Column(db.Text)
    relateType = db.Column(db.Integer)
    relateId = db.Column(db.String(32))
    payPic = db.Column(db.String(350))
    flowTypeId = db.Column(db.String(32), db.ForeignKey("t_account_flow_type.id"))
    extAccountId = db.Column(db.String(32), db.ForeignKey("t_ext_account.id"))

    STATUS_NONE=0
    STATUS_UNHANDLE=1
    STATUS_CONFIRMED=2
    STATUS_CANCEL=3
    STATUS_PAIED=4

    def __init__(self, money=0, createTime=None, status=0, requestUserId=None, requestMemo="", confirmUserId=None, confirmTime=None, cancelUserId=None, cancelMemo="", cancelTime=None, payUserId=None, payAccountId=None, payTime=None, payMemo="", relateType=0, relateId="", payPic="", flowTypeId=None, extAccountId=None):
        self.money = money
        self.createTime = createTime
        self.status = status
        self.requestUserId = requestUserId
        self.requestMemo = requestMemo
        self.confirmUserId = confirmUserId
        self.confirmTime = confirmTime
        self.cancelUserId = cancelUserId
        self.cancelMemo = cancelMemo
        self.cancelTime = cancelTime
        self.payUserId = payUserId
        self.payAccountId = payAccountId
        self.payTime = payTime
        self.payMemo = payMemo
        self.relateType = relateType
        self.relateId = relateId
        self.payPic = payPic
        self.flowTypeId = flowTypeId
        self.extAccountId = extAccountId
        
    def __repr__(self):
        return '<t_pay_request %r>' % self.money

class v_pay_request(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    money = db.Column(db.Float)
    createTime = db.Column(db.DateTime)
    status = db.Column(db.Integer)
    requestUserId = db.Column(db.String(32))
    requestMemo = db.Column(db.Text)
    confirmUserId = db.Column(db.String(32))
    confirmTime = db.Column(db.DateTime)
    cancelUserId = db.Column(db.String(32))
    cancelMemo = db.Column(db.Text)
    cancelTime = db.Column(db.DateTime)
    payUserId = db.Column(db.String(32))
    payAccountId = db.Column(db.String(32))
    payTime = db.Column(db.DateTime)
    payMemo = db.Column(db.Text)
    relateType = db.Column(db.Integer)
    relateId = db.Column(db.String(32))
    requestUserName = db.Column(db.String(50))
    confirmUserName = db.Column(db.String(50))
    cancelUserName = db.Column(db.String(50))
    payUserName = db.Column(db.String(50))
    payAccountName = db.Column(db.String(50))
    flowTypeName = db.Column(db.String(50))
    extAccountId = db.Column(db.String(32))
    extAccountName = db.Column(db.String(50))
    extAccountAccount = db.Column(db.String(50))
    extAccountCompanyName = db.Column(db.String(50))
    
    def __init__(self, money=0, createTime=None, status=0, requestUserId=None, requestMemo="", confirmUserId=None, confirmTime=None, cancelUserId=None, cancelMemo="", cancelTime=None, payUserId=None, payAccountId=None, payTime=None, payMemo="", relateType=0, relateId="", requestUserName="", confirmUserName="", cancelUserName="", payUserName="", payAccountName="", flowTypeName="", extAccountId=None, extAccountName="", extAccountAccount="", extAccountCompanyName=""):
        self.money = money
        self.createTime = createTime
        self.status = status
        self.requestUserId = requestUserId
        self.requestMemo = requestMemo
        self.confirmUserId = confirmUserId
        self.confirmTime = confirmTime
        self.cancelUserId = cancelUserId
        self.cancelMemo = cancelMemo
        self.cancelTime = cancelTime
        self.payUserId = payUserId
        self.payAccountId = payAccountId
        self.payTime = payTime
        self.payMemo = payMemo
        self.relateType = relateType
        self.relateId = relateId
        self.requestUserName = requestUserName
        self.confirmUserName = confirmUserName
        self.cancelUserName = cancelUserName
        self.payUserName = payUserName
        self.payAccountName = payAccountName
        self.flowTypeName = flowTypeName
        self.extAccountId = extAccountId
        self.extAccountName = extAccountName
        self.extAccountAccount = extAccountAccount
        self.extAccountCompanyName = extAccountCompanyName

    def __repr__(self):
        return '<v_pay_request %r>' % self.money

class t_profit_source_type(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_profit_source_type %r>' % self.name

class t_profit_type(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_profit_type %r>' % self.name
    
class t_profit(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    departTime = db.Column(db.DateTime)
    peopleNum = db.Column(db.Integer)
    createTime = db.Column(db.DateTime)
    leader = db.Column(db.String(50))
    lineId = db.Column(db.String(32), db.ForeignKey("t_line.id"))
    operatorId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    teamNo = db.Column(db.String(200))
    leaderNum = db.Column(db.Integer)
    sourceTypeId = db.Column(db.String(32), db.ForeignKey("t_profit_source_type.id"))
    profitTypeId = db.Column(db.String(32), db.ForeignKey("t_profit_type.id"))
    status = db.Column(db.Integer)
    sellerId = db.Column(db.String(32), db.ForeignKey("t_user.id"))

    def __init__(self, departTime=None, peopleNum=0, createTime=None, leader="", lineId=None, operatorId=None, teamNo="", leaderNum=0, sourceTypeId=None, profitTypeId=None, status=0, sellerId=None):
        self.departTime = departTime
        self.peopleNum = peopleNum
        self.createTime = createTime
        self.leader = leader
        self.lineId = lineId
        self.operatorId = operatorId
        self.teamNo = teamNo
        self.leaderNum = leaderNum
        self.sourceTypeId = sourceTypeId
        self.profitTypeId = profitTypeId
        self.status = status
        self.sellerId = sellerId

    def __repr__(self):
        return '<t_profit %r>' % self.teamNo
    
class v_profit(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    departTime = db.Column(db.DateTime)
    peopleNum = db.Column(db.Integer)
    createTime = db.Column(db.DateTime)
    leader = db.Column(db.String(50))
    lineId = db.Column(db.String(32))
    operatorId = db.Column(db.String(32))
    teamNo = db.Column(db.String(200))
    leaderNum = db.Column(db.Integer)
    sourceTypeId = db.Column(db.String(32))
    profitTypeId = db.Column(db.String(32))
    lineName = db.Column(db.String(50))
    sourceTypeName = db.Column(db.String(50))
    profitTypeName = db.Column(db.String(50))
    status = db.Column(db.Integer)
    operatorName = db.Column(db.String(50))
    sellerId = db.Column(db.String(32))
    sellerName = db.Column(db.String(50))
    
    def __init__(self, departTime=None, peopleNum=None, createTime=None, leader="", lineId=None, operatorId=None, teamNo="", leaderNum=None, sourceTypeId=None, profitTypeId=None, lineName=None, sourceTypeName=None, profitTypeName=None, status=0, operatorName="", sellerId=None, sellerName=""):
        self.departTime = departTime
        self.peopleNum = peopleNum
        self.createTime = createTime
        self.leader = leader
        self.lineId = lineId
        self.operatorId = operatorId
        self.teamNo = teamNo
        self.leaderNum = leaderNum
        self.sourceTypeId = sourceTypeId
        self.profitTypeId = profitTypeId
        self.lineName = lineName
        self.sourceTypeName = sourceTypeName
        self.profitTypeName = profitTypeName
        self.status = status
        self.operatorName = operatorName
        self.sellerId = sellerId
        self.sellerName = sellerName
        
    def __repr__(self):
        return '<v_profit %r>' % self.teamNo

class t_profit_item(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    type = db.Column(db.Integer)
    profitItemTypeId = db.Column(db.String(32), db.ForeignKey("t_profit_item_type.id"))
    contactId = db.Column(db.String(32), db.ForeignKey("t_contact.id"))
    peopleNum = db.Column(db.Integer)
    totalMoney = db.Column(db.Float)
    profitId = db.Column(db.String(32), db.ForeignKey("t_profit.id"))
    operatorId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    departmentId = db.Column(db.String(32), db.ForeignKey("t_department.id"))
    companyId = db.Column(db.String(32), db.ForeignKey("t_company.id"))
    billNo = db.Column(db.String(200))
    guestContact = db.Column(db.String(200))

    def __init__(self, type=0, profitItemTypeId=None, contactId=None, peopleNum=0, totalMoney=0, profitId=None, operatorId=None, departmentId=None, companyId=None, billNo="", guestContact=""):
        self.type = type;
        self.profitItemTypeId = profitItemTypeId
        self.contactId = contactId
        self.peopleNum = peopleNum
        self.totalMoney = totalMoney
        self.profitId = profitId
        self.operatorId = operatorId
        self.departmentId = departmentId
        self.companyId = companyId
        self.billNo = billNo
        self.guestContact = guestContact

    def __repr__(self):
        return '<t_profit_item %r>' % self.billNo

class v_profit_item(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    type = db.Column(db.Integer)
    profitItemTypeId = db.Column(db.String(32))
    contactId = db.Column(db.String(32))
    peopleNum = db.Column(db.Integer)
    totalMoney = db.Column(db.Float)
    profitId = db.Column(db.String(32))
    operatorId = db.Column(db.String(32))
    departmentId = db.Column(db.String(32))
    companyId = db.Column(db.String(32))
    billNo = db.Column(db.String(200))
    guestContact = db.Column(db.String(200))
    profitItemTypeName = db.Column(db.String(50))
    companyName = db.Column(db.String(50))
    departmentName = db.Column(db.String(50))
    contactName = db.Column(db.String(50))
    checkedMoney = db.Column(db.Float)
    remainMoney = db.Column(db.Float)
    incomeMoney = db.Column(db.Float)
    requestedMoney = db.Column(db.Float)

    departTime = db.Column(db.DateTime)
    profitPeopleNum = db.Column(db.Integer)
    leader = db.Column(db.String(50))
    lineId = db.Column(db.String(32))
    profitOperatorId = db.Column(db.String(32))
    teamNo = db.Column(db.String(200))
    leaderNum = db.Column(db.Integer)
    sourceTypeId = db.Column(db.String(32))
    profitTypeId = db.Column(db.String(32))
    lineName = db.Column(db.String(50))
    sourceTypeName = db.Column(db.String(50))
    profitTypeName = db.Column(db.String(50))
    profitStatus = db.Column(db.Integer)
    profitOperatorName = db.Column(db.String(50))
    sellerId = db.Column(db.String(32))
    sellerName = db.Column(db.String(50))

    def __init__(self, type=0, profitItemTypeId=None, contactId=None, peopleNum=0, totalMoney=0, profitId=None, operatorId=None, departmentId=None, companyId=None, billNo="", guestContact="", profitItemTypeName="", companyName="", departmentName="", contactName="", checkedMoney=0, remainMoney=0, departTime=None, profitPeopleNum=None, leader="", lineId=None, profitOperatorId=None, teamNo="", leaderNum=None, sourceTypeId=None, profitTypeId=None, lineName=None, sourceTypeName=None, profitTypeName=None, profitStatus=0, profitOperatorName="", sellerId=None, sellerName="", incomeMoney=0, requestedMoney=0):
        self.type = type;
        self.profitItemTypeId = profitItemTypeId
        self.contactId = contactId
        self.peopleNum = peopleNum
        self.totalMoney = totalMoney
        self.profitId = profitId
        self.operatorId = operatorId
        self.departmentId = departmentId
        self.companyId = companyId
        self.billNo = billNo
        self.guestContact = guestContact
        self.profitItemTypeName = profitItemTypeName
        self.companyName = companyName
        self.departmentName = departmentName
        self.contactName = contactName
        self.checkedMoney = checkedMoney
        self.remainMoney = remainMoney
        self.requestedMoney = requestedMoney
        self.incomeMoney = incomeMoney

        self.departTime = departTime
        self.profitPeopleNum = peopleNum
        self.leader = leader
        self.lineId = lineId
        self.profitOperatorId = operatorId
        self.teamNo = teamNo
        self.leaderNum = leaderNum
        self.sourceTypeId = sourceTypeId
        self.profitTypeId = profitTypeId
        self.lineName = lineName
        self.sourceTypeName = sourceTypeName
        self.profitTypeName = profitTypeName
        self.profitStatus = status
        self.profitOperatorName = operatorName
        self.sellerId = sellerId
        self.sellerName = sellerName
        
    def __repr__(self):
        return '<v_profit_item %r>' % self.billNo

    
class t_profit_item_type(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    
    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_profit_item_type %r>' % self.name

class t_guest(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    engName = db.Column(db.String(50))
    sex = db.Column(db.Integer)
    birth = db.Column(db.String(50))
    idCardNo = db.Column(db.String(100))
    visaHk = db.Column(db.Integer)
    visaMc = db.Column(db.Integer)
    memo = db.Column(db.String(500))
    profitItemId = db.Column(db.String(32), db.ForeignKey("t_profit_item.id"))

    def __init__(self, name="", engName="", sex=0, birth="", idCardNo="", visaHk=0, visaMc=0, memo="", profitItemId=None):
        self.name = name
        self.engName = engName
        self.sex = sex
        self.birth = birth
        self.idCardNo = idCardNo
        self.visaHk = visaHk
        self.visaMc = visaMc
        self.memo = memo
        self.profitItemId = profitItemId

    def __repr__(self):
        return '<t_guest %r>' % self.name

    
class v_guest(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    engName = db.Column(db.String(50))
    sex = db.Column(db.Integer)
    birth = db.Column(db.String(50))
    idCardNo = db.Column(db.String(100))
    visaHk = db.Column(db.Integer)
    visaMc = db.Column(db.Integer)
    memo = db.Column(db.String(500))
    profitItemId = db.Column(db.String(32))
    profitId = db.Column(db.String(32))

    def __init__(self, name="", engName="", sex=0, birth="", idCardNo="", visaHk=0, visaMc=0, memo="", profitItemId=None, profitId=None):
        self.name = name
        self.engName = engName
        self.sex = sex
        self.birth = birth
        self.idCardNo = idCardNo
        self.visaHk = visaHk
        self.visaMc = visaMc
        self.memo = memo
        self.profitItemId = profitItemId
        self.profitId = profitId
        
    def __repr__(self):
        return '<v_guest %r>' % self.name

class t_bill_type(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    name = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)

    def __init__(self, name="", createTime=None):
        self.name = name
        self.createTime = createTime

    def __repr__(self):
        return '<t_bill_type %r>' % self.name

class t_bill(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    billNo = db.Column(db.String(100))
    createTime = db.Column(db.DateTime)
    money = db.Column(db.Float)
    profitItemId = db.Column(db.String(32), db.ForeignKey("t_profit_item.id"))
    billPic = db.Column(db.String(350))
    typeId = db.Column(db.String(32), db.ForeignKey("t_bill_type.id"))
    memo = db.Column(db.Text)

    def __init__(self, billNo="", createTime=None, money=0, profitItemId=None, billPic="", typeId=None, memo=""):
        self.billNo = billNo
        self.createTime = createTime
        self.money = money
        self.profitItemId = profitItemId
        self.billPic = billPic
        self.typeId = typeId
        self.memo = memo

    def __repr__(self):
        return '<t_bill %r>' % self.billNo

class v_bill(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    billNo = db.Column(db.String(100))
    createTime = db.Column(db.DateTime)
    money = db.Column(db.Float)
    profitItemId = db.Column(db.String(32))
    billPic = db.Column(db.String(350))
    typeId = db.Column(db.String(32))
    typeName = db.Column(db.String(50))
    memo = db.Column(db.Text)
    profitId = db.Column(db.String(32))

    def __init__(self, billNo="", createTime=None, money=0, profitItemId=None, billPic="", typeId=None, typeName="", memo="", profitId=None):
        self.billNo = billNo
        self.createTime = createTime
        self.money = money
        self.profitItemId = profitItemId
        self.billPic = billPic
        self.typeId = typeId
        self.typeName = typeName
        self.memo = memo
        self.profitId = profitId

    def __repr__(self):
        return '<v_bill %r>' % self.billNo


class t_income_check(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    createTime = db.Column(db.DateTime)
    money = db.Column(db.Float)
    status = db.Column(db.Integer)
    profitItemId = db.Column(db.String(32), db.ForeignKey("t_profit_item.id"))
    requestUserId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    requestMemo = db.Column(db.Text)
    confirmUserId = db.Column(db.Integer)
    confirmTime = db.Column(db.DateTime)
    cancelUserId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    cancelTime = db.Column(db.DateTime)
    cancelMemo = db.Column(db.Text)
    incomeAccountId = db.Column(db.String(32), db.ForeignKey("t_account.id"))
    payPic = db.Column(db.String(350))
    flowTypeId = db.Column(db.String(32), db.ForeignKey("t_account_flow_type.id"))

    def __init__(self, createTime=None, money=0, status=0, profitItemId=None, requestUserId=None, requestMemo="", confirmUserId=None, confirmTime=None, cancelUserId=None, cancelTime=None, cancelMemo="", incomeAccountId=None, payPic="", flowTypeId=None):
        self.createTime = createTime
        self.money = money
        self.status = status
        self.profitItemId = profitItemId
        self.requestUserId = requestUserId
        self.requestMemo = requestMemo
        self.confirmUserId = confirmUserId
        self.confirmTime = confirmTime
        self.cancelUserId = cancelUserId
        self.cancelTime = cancelTime
        self.cancelMemo = cancelMemo
        self.incomeAccountId = incomeAccountId
        self.payPic = payPic
        self.flowTypeId = flowTypeId

    def __repr__(self):
        return '<t_income_check %r>' % self.money

class v_income_check(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    createTime = db.Column(db.DateTime)
    money = db.Column(db.Float)
    status = db.Column(db.Integer)
    profitItemId = db.Column(db.String(32))
    requestUserId = db.Column(db.String(32))
    requestMemo = db.Column(db.Text)
    confirmUserId = db.Column(db.Integer)
    confirmTime = db.Column(db.DateTime)
    cancelUserId = db.Column(db.String(32))
    cancelTime = db.Column(db.DateTime)
    cancelMemo = db.Column(db.Text)
    incomeAccountId = db.Column(db.String(32))
    requestUserName = db.Column(db.String(50))
    confirmUserName = db.Column(db.String(50))
    cancelUserName = db.Column(db.String(50))
    incomeAccountName = db.Column(db.String(50))
    flowTypeName = db.Column(db.String(50))

    def __init__(self, createTime=None, money=0, status=0, profitItemId=None, requestUserId=None, requestMemo="", confirmUserId=None, confirmTime=None, cancelUserId=None, cancelTime=None, cancelMemo="", incomeAccountId=None, requestUserName="", confirmUserName="", cancelUserName="", incomeAccountName="", flowTypeName=""):
        self.createTime = createTime
        self.money = money
        self.status = status
        self.profitItemId = profitItemId
        self.requestUserId = requestUserId
        self.requestMemo = requestMemo
        self.confirmUserId = confirmUserId
        self.confirmTime = confirmTime
        self.cancelUserId = cancelUserId
        self.cancelTime = cancelTime
        self.cancelMemo = cancelMemo
        self.incomeAccountId = incomeAccountId
        self.requestUserName = requestUserName
        self.confirmUserName = confirmUserName
        self.cancelUserName = cancelUserName
        self.incomeAccountName = incomeAccountName
        self.flowTypeName = flowTypeName

    def __repr__(self):
        return '<v_income_check %r>' % self.money

class t_profit_check_item(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    typeName = db.Column(db.String(50))
    price = db.Column(db.Float)
    num = db.Column(db.Integer)
    memo = db.Column(db.Text)
    operatorId = db.Column(db.String(32), db.ForeignKey("t_user.id"))
    createTime = db.Column(db.DateTime)
    profitItemId = db.Column(db.String(32), db.ForeignKey("t_profit_item.id"))

    def __init__(self, typeName="", price=0, num=0, memo="", operatorId=None, createTime=None, profitItemId=None):
        self.typeName = typeName
        self.price = price
        self.num = num
        self.memo = memo
        self.operatorId = operatorId
        self.createTime = createTime
        self.profitItemId = profitItemId
    def __repr__(self):
        return '<t_profit_check_item %r>' % self.typeName


class t_ext_account(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    companyId = db.Column(db.String(32), db.ForeignKey("t_company.id"))
    name = db.Column(db.String(50))
    account = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)

    def __init__(self, companyId=None, name="", account="", createTime=None):
        self.companyId = companyId
        self.name = name
        self.account = account
        self.createTime = createTime

    def __repr__(self):
        return '<t_ext_account %r>' % self.name

class v_ext_account(db.Model):
    id = db.Column(db.String(32), primary_key=True)
    companyId = db.Column(db.String(32))
    name = db.Column(db.String(50))
    account = db.Column(db.String(50))
    createTime = db.Column(db.DateTime)
    companyName = db.Column(db.String(50))

    def __init__(self, companyId=None, name="", account="", createTime=None, companyName=""):
        self.companyId = companyId
        self.name = name
        self.account = account
        self.createTime = createTime
        self.companyName = companyName

    def __repr__(self):
        return '<v_ext_account %r>' % self.name

