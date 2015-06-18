#!/usr/bin/env python3
# -*- coding: utf-8 -*-

mainMenu = [
    {
        "title" : "主页",
        "link" : "/index",
        "key" : "index"
    },
    {
        "title" : "计调",
        "link" : "/page/profit/list/1",
        "key" : "jitiao",
        "submenu" : [
            {
                "title" : "毛利表",
                "link" : "/page/profit/list/1",
                "key" : "jitiao_profit",
            },
            {
                "title" : "毛利表审核",
                "link" : "",
                "key" : "jitiao_profit_check",
            },
            {
                "title" : "线路类型",
                "link" : "/page/profit_type/list/1",
                "key" : "jitiao_profit_type"
            },
            {
                "title" : "委托方类型",
                "link" : "/page/profit_source_type/list/1",
                "key" : "jitiao_profit_source_type"
            },
            {
                "title" : "收/付款项目",
                "link" : "/page/profit_item_type/list/1",
                "key" : "jitiao_profit_item_type"
            },
        ]
    },
    {
        "title" : "财务",
        "link" : "/page/account_flow/list/1",
        "key" : "caiwu",
        "submenu" : [
            {
                "title" : "帐务流水",
                "link" : "/page/account_flow/list/1",
                "key" : "caiwu_account_flow",
            },
            {
                "title" : "请款管理",
                "link" : "/page/pay_request/list/1",
                "key" : "caiwu_pay_request",
            },
            {
                "title" : "请款",
                "link" : "/page/pay_request/edit/new",
                "key" : "caiwu_pay_request_new",
            },
            {
                "title" : "凭证管理",
                "link" : "/page/bill/list/1",
                "key" : "caiwu_bill",
            },
            {
                "title" : "凭证类型",
                "link" : "/page/bill_type/list/1",
                "key" : "caiwu_bill_type",
            },
            {
                "title" : "入账管理",
                "link" : "/page/income_check/list/1",
                "key" : "caiwu_income_check",
            },
            {
                "title" : "入账",
                "link" : "/page/income_check/edit/new",
                "key" : "caiwu_income_check_new",
            },
        ]
    },
    {
        "title" : "统计",
        "link" : "#",
        "key" : "tongji",
        "submenu" : [
            {
                "title":"统计打印",
                "key" : "tongji_dayin",
                "link" : "/page/print/statistical"
            },
            {
                "title":"绩效统计",
                "key" : "tongji_jixiao",
                "link" : "/page/perform/statistical"
            },
            {
                "title":"销售绩效统计",
                "key" : "tongji_jixiao_seller",
                "link" : "/page/perform_seller/statistical"
            },
            {
                "title":"绩效明细",
                "key" : "tongji_jixiao_mingxi",
                "link" : "/page/perform_detail/statistical"
            },
            {
                "title":"利润统计",
                "key" : "tongji_lirun",
                "link" : "/page/profit/statistical"
            },
            {
                "title":"客人统计",
                "key" : "tongji_company_guest",
                "link" : "/page/company_guest/statistical"
            },
            {
                "title":"成本统计",
                "key" : "tongji_cost",
                "link" : "/page/cost/statistical"
            },
        ]
    },
    {
        "title" : "基础数据",
        "link" : "/page/line/list/1",
        "key" : "jichushuju",
        "submenu" : [
            {
                "title" : "线路",
                "link" : "/page/line/list/1",
                "key" : "jichushuju_line"
            },
            {
                "title" : "账户",
                "link" : "/page/account/list/1",
                "key" : "jichushuju_account"
            },
            {
                "title" : "帐务类型",
                "link" : "/page/account_flow_type/list/1",
                "key" : "jichushuju_account_flow_type"
            },
            {
                "title" : "区域",
                "link" : "/page/area/list/1",
                "key" : "jichushuju_area"
            },
            {
                "title" : "公司",
                "link" : "/page/company/list/1",
                "key" : "jichushuju_company"
            },
            {
                "title" : "部门",
                "link" : "/page/department/list/1",
                "key" : "jichushuju_department"
            },
            {
                "title" : "联系人",
                "link" : "/page/contact/list/1",
                "key" : "jichushuju_contact"
            },
            {
                "title" : "外部账户",
                "link" : "/page/ext_account/list/1",
                "key" : "jichushuju_ext_account"
            }
        ]
    },
    {
        "title" : "系统设置",
        "link" : "/page/user/list/1",
        "key" : "xitongshuju",
        "submenu" : [
            {
                "title" : "用户",
                "link" : "/page/user/list/1",
                "key" : "xitongshuju_user"
            }
        ]
    }
]
