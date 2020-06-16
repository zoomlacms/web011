<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Default, App_Web_hwcrmowh" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE html>
<html>
<head runat="server">
<title><%:Call.SiteName%>_后台管理</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/ICMS/V3.css?version=<%:ConfigurationManager.AppSettings["Version"].ToString() %>" />
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/JS/jquery-ui.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/FrameTab.js"></script>
</head>
<body style="overflow-y:hidden;">
<form id="form1" runat="server">
<asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
<div class="m_top">
<table class="main_table" cellpadding="0" cellspacing="0">
<tr>
<td class="main_table_l">
<div class="padding0">
<a href="../I/Default.aspx"><img src="<%= Call.Logo %>" alt="逐浪CMS_后台管理系统" title="重新加载后台" class="logoAdmin" /></a>
</div>
</td>
<td>
<div class="margin-15 padding0 m_top_right">
<div class="col-lg-9 col-md-10 col-sm-9 col-xs-12 hidden-xs">
	<div style="height: 42px;" class="m_top_menu row">
		<ul class="list-unstyled ">
			<li class="menu1 active" onclick="openmenu('menu1')"><a onclick="showleft('menu1_1');" data-toggle="tooltip" data-placement="top" title="我的工作台"><span class="visible-sm">工作</span><span class="hidden-sm"><%:lang.LF("我的工作台") %></span></a></li>
			<li class="menu2" onclick="openmenu('menu2')"><a onclick="ShowMain('NodeTree.ascx','');" title="内容管理"><span class="visible-sm">内容</span><span class="hidden-sm"><%:lang.LF("内容管理") %></span></a></li>
			<li class="menu3" onclick="openmenu('menu3')"><a onclick="ShowMain('ShopNodeTree.ascx','');" title="商城管理"><span class="visible-sm">商城</span><span class="hidden-sm"><%:lang.LF("商城管理") %></span></a></li>
			<li class="menu4" onclick="openmenu('menu4')"><a onclick="showleft('menu4_1');" title="企业黄页"><span class="visible-sm">黄页</span><span class="hidden-sm"><%:lang.LF("企业黄页") %></span></a></li>
			<li class="menu5" onclick="openmenu('menu5')"><a onclick="showleft('menu5_1');" title="教育模块"><span class="visible-sm">教育</span><span class="hidden-sm"><%:lang.LF("教育模块") %></span></a></li>
			<li class="menu6" onclick="openmenu('menu6')"><a onclick="ShowMain('UserGuide.ascx','');"  title="用户管理"><span class="visible-sm">用户</span><span class="hidden-sm"><%:lang.LF("用户管理") %></span></a></li>
			<li class="menu7" onclick="openmenu('menu7')"><a onclick="showleft('menu7_1');" title="扩展功能"><span class="visible-sm">扩展</span><span class="hidden-sm"><%:lang.LF("扩展功能") %></span></a></li>
			<li class="menu8" onclick="openmenu('menu8')"><a onclick="showleft('menu8_1');" title="系统设置"><span class="visible-sm">系统</span><span class="hidden-sm"><%:lang.LF("系统设置") %></span></a></li>
			<li class="menu9" onclick="openmenu('menu9')"><a onclick="showleft('menu9_1');" title="企业办公"><span class="visible-sm">办公</span><span class="hidden-sm"><%:lang.LF("企业办公") %></span></a></li>
		</ul>
	</div>
</div>
    <div class="col-lg-3 col-md-2 col-sm-3 col-xs-12 padding0 m_top_rl">
        <div id="Announce">
            <div class=" pull-right hidden-md hidden-sm  hidden-xs">
                <a target="_blank" href="/Admin/Site/SiteConfig.aspx">站群模式</a>
                <a href="/" target="_blank" title="返回首页"><span class="glyphicon glyphicon-home"></span></a>
                <a href="/user/" target="_target" title="ALT+U进入会员中心"><span class="glyphicon glyphicon-user"></span></a>
                <a href="javascript:void(0)" style="cursor: pointer;" title='Alt+Q锁定屏幕' onclick="showWindow('Lockin.aspx',900,460);"><span class="glyphicon glyphicon-lock"></span>
				<a href="<%= CustomerPageAction.customPath2 %>SignOut.aspx" title="退出"><span class="glyphicon glyphicon-off"><span></a>
            </div>
            <div class="dropdown pull-right">
			<a data-toggle="dropdown" href="javascript:;">
				<label runat="server" id="nameL"></label>
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				<li><a href="<%=CustomerPageAction.customPath2 %>Default.aspx"><%:lang.LF("经典后台") %></a></li>
				<li><a href="<%= CustomerPageAction.customPath2 %>Site/SiteConfig.aspx"><%:lang.LF("站群模式") %></a></li>
				<li><a href="javascript:ShowAD();" title="场景切换"><%:lang.LF("场景切换") %></a></li>
				<li><a href="javascript:modalDialog('/Common/calc.html', 'calculator', 400, 300);"><%:lang.LF("计算器") %></a></li>
				<li><a href="/help.html" target="_blank"><%:lang.LF("快速帮助") %></a></li>
				<li><a href="http://help.zoomla.cn/" target="_blank"><%:lang.LF("线上支持") %></a></li>
			</ul>
		</div>
	</div>
	<div class="pull-right">
		<button type="button" class="btn btn-default m_modal" data-toggle="modal" data-target="#myModal">
			<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button>
	</div>
    <div class="pull-right hidden-lg search_btn">
        <span class="glyphicon glyphicon-search" onclick="showsearch()"></span>
    </div>
    <div class="pull-right hidden-lg hidden_group" id="search_div">
        <div class="input-group input-group-sm" style="width: 140px;">
            <asp:TextBox runat="server" ID="keyText" Width="110" class="form-control input-control" placeholder="快速搜索" onkeydown="return IsEnter(this);" />
            <span class="input-group-btn">
                <button class="btn btn-default" type="button" onclick="SearchPage();"><span class="glyphicon glyphicon-search"></span></button>
            </span>
        </div>
    </div>
    </div>
</div>
</td>
</tr>
</table>
<div class="clearfix"></div>
<div class="m_top_bottom hidden-xs">
<ul class="menu1 open">
    <li class="menu1_1 active"><a onclick="showleft('menu1_1','{$path}Profile/Worktable.aspx')"><%:lang.LF("版本信息") %></a></li>
	<li class="menu1_2 "><a onclick="showleft('menu1_1','Main.aspx')"><%:lang.LF("从此开始") %></a></li>
	<li class="menu1_3"><a onclick="showleft('menu1_2','Config/SearchFunc.aspx')"><%:lang.LF("快速导航") %></a></li>
	<li class="menu1_4"><a onclick="showleft('menu1_3','../Profile/ModifyPassword.aspx')"><%:lang.LF("修改密码") %></a></li>
	<%--<li class="menu1_5"><a onclick="showleft('menu1_4','../SignOut.aspx')"><%:lang.LF("安全退出") %></a></li>--%>
</ul>
<ul class="menu2">
	<li class="menu2_1 active"><a onclick="ShowMain('NodeTree.ascx','Content/ContentManage.aspx');"><%:lang.LF("按栏目管理") %></a></li>
	<li class="menu2_2"><a onclick="ShowMain('SpecialTree.ascx','Content/SpecContent.aspx')"><%:lang.LF("按专题管理") %></a></li>
	<li class="menu2_3"><a onclick="showleft('menu2_3','Content/CommentManage.aspx')"><%:lang.LF("评论管理") %></a></li>
    <li class="menu2_4">
        <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu2_4','Pub/PubManage.aspx')" class="btn btn-primary  btn-sm">互动模块</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubManage.aspx')">互动模块</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/FormManage.aspx')">互动表单</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubManage.aspx')">互动信息</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Content/ModelManage.aspx?ModelType=7')">互动模型</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubRecycler.aspx')">互动存档</a></li>
                <li><a href="javascript:;" onclick="showleft('menu2_4','Pub/PubExcel.aspx')">Excel导出</a></li>
            </ul>
        </div>
    </li>
    <li class="menu2_7"><a onclick="showleft('menu2_7','Content/CreateHtmlContent.aspx')"><%:lang.LF("生成发布") %></a></li>
	<li class="menu2_6"><a onclick="showleft('menu2_6','Content/Print_Type.aspx')"><%:lang.LF("文件工厂") %></a></li>
    <li class="menu2_5">
        <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu2_5','Content/CollectionManage.aspx')" class="btn btn-primary  btn-sm ">采集检索</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="javascript:;" data-url="Content/CollectionStep1.aspx">添加采集</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionManage.aspx">采集项目</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionStart.aspx">开始采集</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionStatus.aspx">采集进度</a></li>
                <li><a href="javascript:;" data-url="Content/CollectionList.aspx">采集记录</a></li>
                <li><a href="javascript:;" data-url="Content/CollSite.aspx">统一检索</a></li>
                <li><a href="javascript:;" data-url="Content/InfoLog.aspx">检索动态</a></li>
            </ul>
        </div>
    </li>
	<li class="menu2_8"><a onclick="ShowMain('RecycleNodeTree.ascx','Content/ContentRecycle.aspx');"><%:lang.LF("回收站") %></a></li>
	<li class="menu2_9"><a onclick="showleft('menu2_9','Guest/GuestCateMana.aspx')"><%:lang.LF("百科问答贴吧") %></a></li>
	<li class="menu2_10"><a onclick="showleft('menu2_10','AddOn/SourceManage.aspx')"><%:lang.LF("内容参数") %></a></li>
	<li class="menu2_11"><a onclick="showleft('menu2_11','Content/HitsList.aspx')"><%:lang.LF("访问评价") %></a></li>
</ul>
<ul class="menu3">
	<li class="menu3_1 active"><a onclick="ShowMain('ShopNodeTree.ascx','Shop/ProductManage.aspx');"><%:lang.LF("商品管理") %></a></li>
	<li class="menu3_2"><a onclick="showleft('menu3_2','Shop/StockManage.aspx')"><%:lang.LF("库存管理") %></a></li>
	<li class="menu3_3"><a onclick="showleft('menu3_3','Shop/OrderList.aspx')"><%:lang.LF("订单管理") %></a></li>
	<li class="menu3_4"><a onclick="showleft('menu3_4','Shop/BankRollList.aspx')"><%:lang.LF("明细记录") %></a></li>
	<li class="menu3_5"><a onclick="showleft('menu3_5','Shop/ProductSale.aspx')"><%:lang.LF("销售统计") %></a></li>
	<li class="menu3_6"><a onclick="showleft('menu3_6','Shop/PresentProject.aspx')"><%:lang.LF("促销优惠") %></a></li>
	<li class="menu3_7"><a onclick="showleft('menu3_7','Shop/DeliverType.aspx')"><%:lang.LF("商城配置") %></a></li>
	<li class="menu3_8"><a onclick="showleft('menu3_8','Boss/Bosstree.aspx')"><%:lang.LF("加盟商管理") %></a></li>
	<li class="menu3_9"><a onclick="ShowMain('ShopRecycle.ascx','Shop/ShopRecycler.aspx');"><%:lang.LF("商品回收站") %></a></li>
	<li class="menu3_10"><a onclick="showleft('menu3_10','Flex/FlexTemplate.aspx')"><%:lang.LF("礼品管理") %></a></li>
	<li class="menu3_11"><a onclick="showleft('menu3_11','Shop/BidManage/BuyPaiBao.aspx')"><%:lang.LF("竞拍管理") %></a></li>
	<li class="menu3_12"><a onclick="showleft('menu3_12','Shop/profile/StatisticsBriefing.aspx')"><%:lang.LF("推广返利") %></a></li>
	<li class="menu3_13">
        <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu3_13','Content/ModelManage.aspx?ModelType=6')" class="btn btn-primary  btn-sm ">店铺管理</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li class="active"><a href="javascript:;" data-url="UserShopManage/StoreManage.aspx">店铺审核</a></li>
                <li><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=6">申请模型</a></li>
                <li><a href="javascript:;" data-url="UserShopManage/StoreStyleManage.aspx">店铺模板</a></li>
                <li><a href="javascript:ShowMain('UserShopNodeTree.ascx','UserShopManage/ProductManage.aspx',this);">商品管理</a></li>
                <li><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=5">店铺模型</a></li>
                <li><a href="javascript:;" data-url="UserShopManage/ShopinfoManage.aspx">店铺配置</a></li>
            </ul>
        </div>
	</li>
	<li class="menu3_14"><a onclick="showleft('menu3_14','/3D/3DManage.aspx')"><%:"3D"+lang.LF("店铺管理") %></a></li>
</ul>
<ul class="menu4">
	<li class="menu4_1 active"><a onclick="showleft('menu4_1','Page/UserModelManage.aspx')"><%:lang.LF("黄页申请设置") %></a></li>
	<li class="menu4_2"><a onclick="showleft('menu4_2','Page/PageManage.aspx')"><%:lang.LF("黄页审核") %></a></li>
    <li class="menu4_3"><a onclick="showleft('menu4_3','Page/PageAudit.aspx')"><%:lang.LF("栏目设定") %></a></li>
	<li class="menu4_4"><a onclick="ShowMain('PageTree.ascx','Page/PageContent.aspx')"><%:lang.LF("内容管理") %></a></li>
	<li class="menu4_5"><a onclick="showleft('menu4_5','Content/ModelManage.aspx?ModelType=4')"><%:lang.LF("黄页模型") %></a></li>
	<li class="menu4_6"><a onclick="showleft('menu4_6','Page/PageStyle.aspx')"><%:lang.LF("黄页样式") %></a></li>
</ul>
<ul class="menu5">
	<li class="menu5_1 active"><a onclick="showleft('menu5_1','Exam/Papers_System_Manage.aspx')"><%:lang.LF("考试管理") %></a></li>
	<li class="menu5_2"><a onclick="showleft('menu5_2','Exam/ToScore.aspx')"><%:lang.LF("阅卷中心") %></a></li>
	<li class="menu5_3"><a onclick="showleft('menu5_3','Exam/ClassManage.aspx')"><%:lang.LF("班级管理") %></a></li>
	<li class="menu5_4"><a onclick="showleft('menu5_4','Exam/Audit.aspx')"><%:lang.LF("学员管理") %></a></li>
	<li class="menu5_5"><a onclick="showleft('menu5_5','Exam/ExTeacherManage.aspx')"><%:lang.LF("培训资源库") %></a></li>
	<li class="menu5_6"><a onclick="showleft('menu5_6','Shop/OrderList.aspx')"><%:lang.LF("财务管理") %></a></li>
	<li class="menu5_7"><a onclick="showleft('menu5_7','Exam/Papers_System_Manage.aspx')"><%:lang.LF("组卷管理") %></a></li>
    <li class="menu5_8"><a onclick="showleft('menu5_8','Exam/News.aspx')">数字出版</a></li>
</ul>
<ul class="menu6">
	<li class="menu6_1 active"><a  onclick="ShowMain('UserGuide.ascx','User/UserManage.aspx');"><%:lang.LF("会员管理") %></a></li>
	<li class="menu6_2"><a onclick="showleft('menu6_2','User/AdminManage.aspx')"><%:lang.LF("管理员管理") %></a></li>
	<li class="menu6_3"><a onclick="ShowMain('StructTree.ascx','AddOn/StructList.aspx')"><%:lang.LF("用户角色") %></a></li>
	<li class="menu6_4"><a onclick="showleft('menu6_4','User/SendMailList.aspx')"><%:lang.LF("信息发送") %></a></li>
	<li class="menu6_5">      
          <div class="btn-group topdrop">
            <button type="button" onclick="showleft('menu6_5','User/SubscriptListManage.aspx?menu=audit')" class="btn btn-primary  btn-sm ">订阅中心</button>
            <button type="button" class="btn btn-primary  btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <span class="caret"></span><span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li class="active"><a href="javascript:;" data-url="User/EidtMailModel.aspx">邮件模板</a></li>
                <li><a href="javascript:;" data-url="User/RegValidateMail.aspx">邮件内容</a></li>
                <li><a href="javascript:;" data-url="User/SendMailList.aspx">发送邮件</a></li>
                <li><a href="javascript:;" data-url="User/SendMailList.aspx">邮件列表</a></li>
                <li><a href="javascript:;" data-url="User/SubscriptListManage.aspx?menu=all">订阅管理</a></li>
                <li><a href="javascript:;" data-url="User/SendMailList.aspx">邮件发送</a></li>
                <li><a href="javascript:;" data-url="User/MailIdiographList.aspx">签名管理</a></li>
            </ul>
        </div>
	</li>
	<li class="menu6_6"><a onclick="showleft('menu6_6','User/Jobsconfig.aspx')"><%:lang.LF("人才招聘") %></a></li>
	<li class="menu6_7"><a onclick="showleft('menu6_7','Zone/ZoneConfig.aspx')"><%:lang.LF("SNS社区模块") %></a></li>
</ul>
<ul class="menu7">
	<li class="menu7_1 active"><a onclick="showleft('menu7_1','Config/DatalistProfile.aspx')"><%:lang.LF("开发中心") %></a></li>
	<li class="menu7_2"><a onclick="showleft('menu7_2','Plus/ADManage.aspx')"><%:lang.LF("广告管理") %></a></li>
	<li class="menu7_3"><a onclick="showleft('menu7_3','Counter/Counter.aspx')"><%:lang.LF("访问统计") %></a></li>
	<li class="menu7_4"><a onclick="showleft('menu7_4','Plus/SurveyManage.aspx')"><%:lang.LF("问卷调查") %></a></li>
	<li class="menu7_5"><a onclick="showleft('menu7_5','File/UploadFile.aspx')"><%:lang.LF("文件管理") %></a></li>
	<li class="menu7_6"><a onclick="showleft('menu7_6','Addon/DictionaryManage.aspx')"><%:lang.LF("数据字典") %></a></li>
	<li class="menu7_7"><a onclick="showleft('menu7_7','File/Addlinkhttp.aspx')"><%:lang.LF("站内链接") %></a></li>
	<li class="menu7_8"><a onclick="showleft('menu7_8','AddOn/Download.aspx')"><%:lang.LF("客户端") %></a></li>
	<li class="menu7_9"><a onclick="showleft('menu7_9','WeiXin/Default.aspx')"><%:lang.LF("移动与微信") %></a></li>
	<li class="menu7_10"><a onclick="showleft('menu7_10','Iplook/IPManage.aspx')"><%:lang.LF("其他功能") %></a></li>
</ul>
<ul class="menu8">
	<li class="menu8_1 active"><a onclick="showleft('menu8_1','Config/SiteInfo.aspx')"><%:lang.LF("网站配置") %></a></li>
	<li class="menu8_2"><a onclick="showleft('menu8_2','Content/ModelManage.aspx?ModelType=1')"><%:lang.LF("模型管理") %></a></li>
	<li class="menu8_3"><a onclick="showleft('menu8_3','Content/NodeManage.aspx')"><%:lang.LF("节点管理") %></a></li>
	<li class="menu8_4"><a onclick="showleft('menu8_4','Content/FlowManager.aspx')"><%:lang.LF("流程管理") %></a></li>
	<li class="menu8_5"><a onclick="showleft('menu8_5','Content/SpecialManage.aspx')"><%:lang.LF("专题管理") %></a></li>
	<li class="menu8_6"><a onclick="ShowMain('LabelGuide.ascx','Template/TemplateSet.aspx')"><%:lang.LF("模板风格") %></a></li>
	<li class="menu8_7"><a onclick="ShowMain('LabelGuide.ascx','Template/LabelManage.aspx')"><%:lang.LF("标签管理") %></a></li>
	<li class="menu8_8"><a onclick="showleft('menu8_8','Pay/PayPlatManage.aspx')"><%:lang.LF("在线支付平台") %></a></li>
</ul>
<ul class="menu9">
	<li class="menu9_1 active"><a onclick="showleft('menu9_1','WorkFlow/OAConfig.aspx')"><%:lang.LF("OA配置") %></a></li>
    <li class="menu9_9"><a onclick="showleft('menu9_9','Plat/PlatInfoManage.aspx')"><%:lang.LF("能力中心") %></a></li>
	<li class="menu9_2"><a onclick="ShowMain('StructTree.ascx','AddOn/StructList.aspx')"><%:lang.LF("组织结构") %></a></li>
	<li class="menu9_3"><a onclick="showleft('menu9_3','AddOn/Projects.aspx')"><%:lang.LF("项目管理") %></a></li>
	<li class="menu9_4"><a onclick="showleft('menu9_4','AddCRM/CustomerList.aspx?usertype=0')"><%:lang.LF("CRM管理") %></a></li>
	<li class="menu9_5"><a onclick="showleft('menu9_5','iServer/BiServer.aspx?num=-3')"><%:lang.LF("有问必答") %></a></li>
	<li class="menu9_6"><a onclick="showleft('menu9_6','User/ServiceSeat.aspx')"><%:lang.LF("客服通") %></a></li>
	<li class="menu9_7"><a onclick="showleft('menu9_7','Workload/Subject.aspx?Type=subject')"><%:lang.LF("工作统计") %></a></li>
	<li class="menu9_8"><a onclick="showleft('menu9_8','Plus/LogManage.aspx?Cate=4')"><%:lang.LF("日志管理") %></a></li>
</ul>
</div>
</div>
<div class="modal fade modal_row" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
	<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 padding0 back_black" style="height: 100%; overflow-y: auto;">
		<h1><span><a href="/" target="_blank" class="m_home"><%:lang.LF("逐浪CMS") %></a></span></h1>
		<ul class="list-unstyled modal_ul">
			<li><a href="/" target="_blank"><span class="glyphicon glyphicon-home"></span><%:lang.LF("网站首页") %></a></li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-cloud"></span><%:lang.LF("工作云台") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="showleft('menu1_1','Main.aspx');" href="javascript:;"><%:lang.LF("工作云台") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu1_2','Config/SearchFunc.aspx');" href="javascript:;"> <%:lang.LF("快速导航") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu1_3','Profile/ModifyPassword.aspx');" href="javascript:;"><%:lang.LF("修改密码") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu1_4','../SignOut.aspx');" href="javascript:;"><%:lang.LF("安全退出") %> </a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-comment"></span><%:lang.LF("内容管理") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="ShowMain('NodeTree.ascx','Content/ContentManage.aspx');" href="javascript:;"><%:lang.LF("按栏目管理") %></a></li>
					<li><a data-dismiss="modal" onclick="ShowMain('SpecialTree.ascx','Content/SpecContent.aspx');" href="javascript:;"><%:lang.LF("按专题管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu2_3','Content/CommentManage.aspx');" href="javascript:;"><%:lang.LF("评论管理") %></a></li>
                    <li><a data-dismiss="modal" onclick="showleft('menu2_4','Pub/PubManage.aspx');" href="javascript:;"><%:lang.LF("互动模块") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu2_5','Content/CollectionManage.aspx');" href="javascript:;"><%:lang.LF("采集检索") %></a> </li>
					<li><a data-dismiss="modal" onclick="showleft('menu2_6','Content/Print_Type.aspx');" href="javascript:;"><%:lang.LF("文件工厂") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu2_7','Content/CreateHtmlContent.aspx');" href="javascript:;"><%:lang.LF("生成发布") %></a></li>
					<li><a data-dismiss="modal" onclick="ShowMain('RecycleNodeTree.ascx','Content/ContentRecycle.aspx');" href="javascript:;"><%:lang.LF("回收站") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu2_9','Guest/GuestCateMana.aspx');" href="javascript:;"><%:lang.LF("百科问答贴吧") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu2_10','AddOn/SourceManage.aspx');" href="javascript:;"><%:lang.LF("内容参数") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu2_11','Content/HitsList.aspx');" href="javascript:;"><%:lang.LF("访问评价") %></a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-shopping-cart"></span><%:lang.LF("商城管理") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="ShowMain('ShopNodeTree.ascx','Shop/ProductManage.aspx')" href="javascript:;"><%:lang.LF("商品管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_2','Shop/StockManage.aspx');" href="javascript:;"><%:lang.LF("库存管理") %></a> </li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_3','Shop/OrderList.aspx');" href="javascript:;"><%:lang.LF("订单管理") %></a> </li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_4','Shop/BankRollList.aspx');" href="javascript:;"><%:lang.LF("明细记录") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_5','Shop/ProductSale.aspx');" href="javascript:;"><%:lang.LF("销售统计") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_6','Shop/PresentProject.aspx')" href="javascript:;"><%:lang.LF("促销优惠") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_7','Shop/DeliverType.aspx')" href="javascript:;"><%:lang.LF("商城配置") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_8','Boss/Bosstree.aspx')" href="javascript:;"><%:lang.LF("加盟商管理") %></a></li>
					<li><a data-dismiss="modal" onclick="ShowMain('ShopRecycle','Shop/ShopRecycler.aspx')" href="javascript:;"><%:lang.LF("商品回收站") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_10','Flex/FlexTemplate.aspx')" href="javascript:;"><%:lang.LF("礼品管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_11','Shop/BidManage/BuyPaiBao.aspx')" href="javascript:;"><%:lang.LF("竞拍管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_12','Shop/profile/StatisticsBriefing.aspx')" href="javascript:;"><%:lang.LF("推广返利") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu3_13','Content/ModelManage.aspx?ModelType=6')" href="javascript:;"><%:lang.LF("店铺管理") %></a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-tower"></span><%:lang.LF("企业黄页") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="showleft('menu4_1','Page/UserModelManage.aspx')" href="javascript:;"><%:lang.LF("黄页申请设置") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu4_2','Page/PageManage.aspx')" href="javascript:;"><%:lang.LF("黄页审核") %></a> </li>
					<li><a data-dismiss="modal" onclick="showleft('menu4_3','Page/PageAudit.aspx')" href="javascript:;"><%:lang.LF("黄页用户栏目管理") %></a> </li>
					<li><a data-dismiss="modal" onclick="showleft('menu4_4','Page/PageContent.aspx')" href="javascript:;"><%:lang.LF("黄页内容管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu4_5','Content/ModelManage.aspx?ModelType=4')" href="javascript:;"><%:lang.LF("黄页模型管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu4_6','Page/PageStyle.aspx')" href="javascript:;"><%:lang.LF("黄页样式管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu4_8','Page/SheetStyleManage.aspx')" href="javascript:;"><%:lang.LF("黄页标签管理") %></a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-book"></span><%:lang.LF("教育模块") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="showleft('menu5_1','Exam/Papers_System_Manage.aspx')" href="javascript:;"><%:lang.LF("考试管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu5_2','Exam/ToScore.aspx')" href="javascript:;"><%:lang.LF("阅卷中心") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu5_3','Exam/ClassManage.aspx')" href="javascript:;"><%:lang.LF("班级管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu5_4','Exam/Audit.aspx')" href="javascript:;"><%:lang.LF("学员管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu5_5','Exam/ExTeacherManage.aspx')" href="javascript:;"><%:lang.LF("培训资源库") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu5_6','Shop/OrderList.aspx')" href="javascript:;"><%:lang.LF("财务管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu5_7','Exam/Papers_System_Manage.aspx')" href="javascript:;"><%:lang.LF("组卷管理") %></a></li>
                    <li class="menu5_8"><a onclick="showleft('menu5_8','Exam/News.aspx')">数字出版</a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-user"></span><%:lang.LF("用户管理") %>
				</a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="ShowMain('UserGuide.ascx','User/UserManage.aspx')" href="javascript:;"><%:lang.LF("会员管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu6_2','User/AdminManage.aspx')" href="javascript:;"><%:lang.LF("管理员管理") %></a></li>
					<li><a data-dismiss="modal" onclick="ShowMain('StructTree.ascx','AddOn/StructList.aspx')" href="javascript:;"><%:lang.LF("用户角色") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu6_4','User/SendMailList.aspx')" href="javascript:;"><%:lang.LF("信息发送") %></a> </li>
					<li><a data-dismiss="modal" onclick="showleft('menu6_5','User/SubscriptListManage.aspx?menu=audit')" href="javascript:;"><%:lang.LF("订阅中心") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu6_6','User/Jobsconfig.aspx')" href="javascript:;"><%:lang.LF("人才招聘") %></a> </li>
					<li><a data-dismiss="modal" onclick="showleft('menu6_7','Zone/ZoneConfig.aspx')" href="javascript:;"><%:lang.LF("SNS社区模块") %></a> </li>
<%--                                    <li><a href="javascript:;"><%:lang.LF("微博管理") %></a> </li>--%>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-fullscreen"></span><%:lang.LF("扩展功能") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="showleft('menu7_1','Config/DatalistProfile.aspx')" href="javascript:;"><%:lang.LF("开发中心") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_2','Plus/ADManage.aspx')" href="javascript:;"><%:lang.LF("广告管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_3','Counter/Counter.aspx')" href="javascript:;"><%:lang.LF("访问统计") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_4','Plus/SurveyManage.aspx')" href="javascript:;"><%:lang.LF("问卷调查") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_5','File/UploadFile.aspx')" href="javascript:;"><%:lang.LF("文件管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_6','Addon/DictionaryManage.aspx')" href="javascript:;"><%:lang.LF("数据字典") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_7','File/Addlinkhttp.aspx')" href="javascript:;"><%:lang.LF("站内链接") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_8','AddOn/Download.aspx')" href="javascript:;"><%:lang.LF("客户端") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_9','WeiXin/Default.aspx')" href="javascript:;"><%:lang.LF("移动与微信") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu7_10','Iplook/IPManage.aspx')" href="javascript:;"><%:lang.LF("其他功能") %></a> </li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-cog"></span><%:lang.LF("系统配置") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="showleft('menu8_1','Config/SiteInfo.aspx')" href="javascript:;"><%:lang.LF("网站配置") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu8_2','Content/ModelManage.aspx?ModelType=1')" href="javascript:;"><%:lang.LF("模型管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu8_3','Content/NodeManage.aspx')" href="javascript:;"><%:lang.LF("节点管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu8_4','Content/FlowManager.aspx')" href="javascript:;"><%:lang.LF("流程管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu8_5','Content/SpecialManage.aspx')" href="javascript:;"><%:lang.LF("专题管理") %></a></li>
					<li><a data-dismiss="modal" onclick="ShowMain('LabelGuide.ascx','Template/TemplateManage.aspx')" href="javascript:;"><%:lang.LF("模板风格") %></a></li>
					<li><a data-dismiss="modal" onclick="ShowMain('LabelGuide.ascx','Template/LabelManage.aspx')" href="javascript:;"><%:lang.LF("标签管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu8_8','Pay/PayPlatManage.aspx')" href="javascript:;"><%:lang.LF("在线支付平台") %></a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="modal_a"><span class="glyphicon glyphicon-folder-close"></span><%:lang.LF("企业办公") %></a>
				<ul style="position: relative; display: none;">
					<li><a data-dismiss="modal" onclick="showleft('menu9_1','WorkFlow/OAConfig.aspx')" href="javascript:;"><%:lang.LF("OA配置") %></a></li>
					<li><a data-dismiss="modal" onclick="ShowMain('StructTree.ascx','AddOn/StructMenber.aspx')" href="javascript:;"><%:lang.LF("组织结构") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu9_3','AddOn/Projects.aspx')" href="javascript:;"><%:lang.LF("项目管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu9_4','AddCRM/CustomerList.aspx?usertype=0')" href="javascript:;"><%:lang.LF("CRM管理") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu9_5','iServer/BiServer.aspx?num=-3')" href="javascript:;"><%:lang.LF("有问必答") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu9_6','User/ServiceSeat.aspx')" href="javascript:;"><%:lang.LF("客服通") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu9_7','Workload/Subject.aspx?Type=subject')" href="javascript:;"><%:lang.LF("工作统计") %></a></li>
					<li><a data-dismiss="modal" onclick="showleft('menu9_8','Plus/LogManage.aspx?Cate=4')" href="javascript:;"><%:lang.LF("日志管理") %></a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 padding0 back_white">
		<div style="height:100%;" data-dismiss="modal"></div>
		<button type="button" class="btn popover-dismiss" onclick="ShowTradition();" data-placement="top" data-toggle="popover" <%= GetTips() %> style="position:absolute;bottom:160px;left:20%;margin-left:-25px; padding: 15px 21px ;"><span style="color:#fff;"><%:lang.LF("经典后台") %></span></button>
		<div class="modal_close text-center" data-dismiss="modal" style="bottom: 90px; width: 100px; border-radius: 5px;"
			onclick="location='<%:CustomerPageAction.customPath2+"Site/SiteConfig.aspx" %>';"><%:lang.LF("站群模式") %>
		</div>
		<div class="modal_close text-center" data-dismiss="modal" style="bottom: 20px; width: 100px; border-radius: 5px;">关闭</div>
		<div class="clearfix"></div>
	</div>
</div>
</div>
</div>
<div class="m_main">
<div class="padding0 col-lg-2 col-md-2 col-sm-2 col-xs-2 main_left border_right hidden-xs" style="height:100%;" id="left">
<div id="left_ul_div">
	<div id="menu1" class="unstyled m_left_ul open">
        <ul id="menu1_1" class="m_left_ulin open">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>工作台 </li>
            <li id="menu1_1_0"><a href="javascript:;" data-url="Content/ContentManage.aspx"><%:lang.LF("内容管理") %></a></li>
            <li id="menu1_1_1"><a href="javascript:;" data-url="Shop/ProductManage.aspx"><%:lang.LF("商品管理") %></a></li>
            <li id="menu1_1_2"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%:lang.LF("订单管理")%></a></li>
            <li id="menu1_1_3"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=1"><%:lang.LF("模型管理") %></a></li>
            <li id="menu1_1_4"><a href="javascript:;" data-url="Content/NodeManage.aspx"><%:lang.LF("节点管理") %></a></li>
            <li id="menu1_1_5"><a href="javascript:;" data-url="Template/TemplateManage.aspx"><%:lang.LF("模版管理") %></a></li>
            <li id="menu1_1_6"><a href="javascript:;" data-url="Template/LabelManage.aspx"><%:lang.LF("标签管理") %></a></li>
            <li id="menu1_1_7"><a href="javascript:;" data-url="User/UserManage.aspx"><%:lang.LF("会员管理") %></a></li>
            <li id="menu1_1_8"><a href="javascript:;" data-url="Content/CreateHtmlContent.aspx"><%:lang.LF("生成发布") %></a></li>
            <li id="menu1_1_9"><a href="javascript:;" data-url="Config/SiteOption.aspx"><%:lang.LF("网站配置") %></a></li>
        </ul>
		<ul id="menu1_2" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span> 便捷导航 </li>
			<li id="menu1_2_1"><a href="javascript:;" data-url="Config/SearchFunc.aspx"><%:lang.LF("便捷导航") %></a></li>
			<li id="menu1_2_2"><a href="javascript:;" data-url="Config/AddSearch.aspx"><%:lang.LF("添加导航") %></a></li>
		</ul>
		<ul id="menu1_3" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span> 修改密码 </li>
			<li id="menu1_3_1"><a href="javascript:;" data-url="../Profile/ModifyPassword.aspx"><%:lang.LF("修改密码") %></a></li>
		</ul>
		<ul id="menu1_4" class="m_left_ulin">
			<li id="menu1_4_1"><a href="{$path}/SignOut.aspx"><%:lang.LF("安全退出") %></a></li>
		</ul>
	</div>
	<div id="menu2" class="m_left_ul">
			<ul class="list-unstyled m_left_ulin open" id="menu2_1"></ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_2">
			<li id="menu2_2_1"><a href="javascript:ShowMain('','Content/SpecContent.aspx');"><%:lang.LF("网站专题") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span> 评论管理 </li>
			<li id="menu2_3_1"><a href="javascript:;" data-url="Content/CommentManage.aspx" ><%:lang.LF("评论管理") %></a></li>
			<li id="menu2_3_2"><a href="javascript:;" data-url="Content/SohuChatManage.aspx" ><%:lang.LF("畅言评论管理") %></a></li>
			<li id="menu2_3_3"><a href="javascript:;" data-url="Content/SohuChatManage.aspx?show=2" ><%:lang.LF("畅言评论配置") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_4">
				<li class="menu_tit"> <span class="glyphicon glyphicon-globe"></span>互动模块</li>
			<li id="menu2_4_2"><a href="javascript:;" data-url="Pub/PubManage.aspx" ><%:lang.LF("互动模块管理") %></a></li>
            <li id="menu2_4_1"><a href="javascript:;" data-url="Pub/FormManage.aspx">互动表单管理</a></li>
			<li id="menu2_4_3"><a href="javascript:;" data-url="Pub/PubManage.aspx" ><%:lang.LF("互动信息管理") %></a></li>
			<li id="menu2_4_4"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=7"><%:lang.LF("互动模型管理") %></a></li>
			<li id="menu2_4_5"><a href="javascript:;" data-url="Pub/PubRecycler.aspx"><%:lang.LF("互动存档管理") %></a></li>
            <li id="menu2_4_6"><a href="javascript:;" data-url="Pub/PubExcel.aspx">Excel导出管理</a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>采集检索</li>
			<li id="menu2_5_1"><a href="javascript:;" data-url="Content/CollectionManage.aspx"><%:lang.LF("采集项目") %></a></li>
			<li id="menu2_5_3"><a href="javascript:;" data-url="Content/CollectionStart.aspx"><%:lang.LF("开始采集") %></a></li>
			<li id="menu2_5_4"><a href="javascript:;" data-url="Content/CollectionStatus.aspx"><%:lang.LF("采集进度") %></a></li>
			<li id="menu2_5_5"><a href="javascript:;" data-url="Content/CollectionList.aspx"><%:lang.LF("采集记录") %></a></li>
            <li id="menu2_5_6"><a href="javascript:;" data-url="Content/CollSite.aspx"><%:lang.LF("统一检索") %></a></li>
            <li id="menu2_5_7"><a href="javascript:;" data-url="Content/InfoLog.aspx"><%:lang.LF("检索动态") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>文件工厂</li>
			<li id="menu2_6_2"><a href="javascript:;"  data-url="Content/Print_Type.aspx"><%:lang.LF("类型设置") %></a></li>
			<li id="menu2_6_3"><a href="javascript:;"  data-url="Content/PrintMaskList.aspx"><%:lang.LF("遮罩库") %></a></li>
			<li id="menu2_6_4"><a href="javascript:;"  data-url="Content/Print_Photo.aspx"><%:lang.LF("图片输出") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_7">
			<li class="menu_tit"> <span class="glyphicon glyphicon-globe"></span>生成发布</li>
			<li id="menu2_7_1"><a href="javascript:;" data-url="Content/CreateHtmlContent.aspx"><%:lang.LF("生成发布") %></a></li>
			<li id="menu2_7_2"><a href="javascript:;" data-url="Content/CreateHtmlByNode.aspx"><%:lang.LF("按节点发布") %></a></li>
			<li id="menu2_7_3"><a href="javascript:;" data-url="Content/ListHtmlContent.aspx"><%:lang.LF("生成管理") %></a></li>
			<li id="menu2_7_4"><a href="javascript:;" data-url="Content/SiteMap.aspx"><%:lang.LF("站点地图") %></a></li>
			<li id="menu2_7_5"><a href="javascript:;" data-url="Content/ManageJsContent.aspx"><%:lang.LF("JS生成管理") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_8">
			<li id="menu2_8_1"><a href="javascript:;" data-url="Content/ContentRecycle.aspx"><%:lang.LF("节点栏目导航") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_9">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>百科问答</li>
            <li>
                <div class="input-group">
                    <input type="text" id="tiekeyword" class="form-control" onkeydown="return ASCX.OnEnterSearch('Guest/AllSearch.aspx?keyWord=',this);" placeholder="贴吧,百科,留言标题" />
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="ASCX.Search('Guest/AllSearch.aspx?keyWord=','tiekeyword');"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </li>
			<li id="menu2_9_1"><a href="javascript:;" data-url="Guest/GuestCateMana.aspx"><%:lang.LF("留言分类") %></a></li>
            <li id="menu2_9_6"><a href="javascript:;" data-url="Guest/GuestCateMana.aspx?Type=1"><%:lang.LF("贴吧版面") %></a></li>
			<li id="menu2_9_2"><a href="javascript:;" data-url="Guest/BkCheck.aspx"><%:lang.LF("百科词条") %></a></li>
			<li id="menu2_9_3"><a href="javascript:;" data-url="AddOn/GradeOption.aspx?CateID=3"><%:lang.LF("百科分类") %></a></li>
			<li id="menu2_9_4"><a href="javascript:;" data-url="Guest/WdCheck.aspx"><%:lang.LF("问答管理") %></a></li>
			<li id="menu2_9_5"><a href="javascript:;" data-url="AddOn/GradeOption.aspx?CateID=2"><%:lang.LF("问答分类") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_10">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>内容参数</li>
			<li id="menu2_10_1"><a href="javascript:;" data-url="AddOn/SourceManage.aspx"><%:lang.LF("来源管理") %></a></li>
			<li id="menu2_10_2"><a href="javascript:;" data-url="AddOn/AuthorManage.aspx"><%:lang.LF("作者管理") %></a></li>
			<li id="menu2_10_3"><a href="javascript:;" data-url="AddOn/KeyWordManage.aspx"><%:lang.LF("关键字集") %></a></li>
			<li id="menu2_10_4"><a href="javascript:;" data-url="AddOn/CorrectManage.aspx"><%:lang.LF("纠错管理") %></a></li>
		</ul>
		<ul class="list-unstyled m_left_ulin" id="menu2_11">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>访问评价</li>
			<li id="menu2_11_1"><a href="javascript:;" data-url="Content/HitsList.aspx"><%:lang.LF("评价列表") %></a></li>
		</ul>
	</div>
	<div id="menu3" class="m_left_ul">
		<ul class="list-unstyled m_left_ulin open" id="menu3_1">
		</ul>
		<ul id="menu3_2" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>库存管理</li>
			<li id="menu3_2_1"><a href="javascript:;" data-url="Shop/StockManage.aspx"><%:lang.LF("库存管理") %></a></li>
			<li id="menu3_2_2"><a href="javascript:;" data-url="Shop/Stock.aspx"><%:lang.LF("入库出库") %></a></li>
		</ul>
		<ul id="menu3_3" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>订单管理</li>
			<li id="menu3_3_1"><a href="javascript:;" data-url="Shop/CartManage.aspx"><%:lang.LF("购物车记录") %></a></li>
			<li id="menu3_3_2"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%:lang.LF("商城订单") %></a></li>
			<li id="menu3_3_3"><a href="javascript:;" data-url="Shop/UserOrderlist.aspx?type=0"><%:lang.LF("店铺订单") %></a></li>
			<li id="menu3_3_4"><a href="javascript:;" data-url="User/Shopfee/OrderList.aspx"><%:lang.LF("代购订单") %></a></li>
			<li id="menu3_3_5"><a href="javascript:;" data-url="Shop/OrderSql.aspx"><%:lang.LF("账单管理") %></a></li>
			<li id="menu3_3_6"><a href="javascript:;" data-url="Shop/OtherOrder/Hotel_Order_Manager.aspx"><%:lang.LF("酒店订单管理") %></a></li>
			<li id="menu3_3_7"><a href="javascript:;" data-url="Shop/OtherOrder/Flight_Order_Management.aspx"><%:lang.LF("机票订单管理") %></a></li>
			<li id="menu3_3_8"><a href="javascript:;" data-url="Shop/OtherOrder/TravelOrder_Manager.aspx"><%:lang.LF("旅游订单管理") %></a></li>
			<li id="menu3_3_9"><a href="javascript:;" data-url="Shop/OtherOrder/DomainOrder.aspx?OrderType=5"><%:lang.LF("域名订单管理") %></a></li>
			<li id="menu3_3_10"><a href="javascript:;" data-url="Shop/OtherOrder/IDCOrder.aspx?OrderType=7"><%:lang.LF("IDC服务订单") %></a></li>
			<li id="menu3_3_11"><a href="javascript:;" data-url="Shop/FillOrder.aspx"><%:lang.LF("补订单") %></a></li>
			<li id="menu3_3_12"><a href="javascript:;" data-url="Shop/LocationReport.aspx"><%:lang.LF("省市报表") %></a></li>
			<li id="menu3_3_13"><a href="javascript:;" data-url="Shop/MonthlyReport.aspx"><%:lang.LF("月报表") %></a></li>
			<li id="menu3_3_14"><a href="javascript:;" data-url="Shop/OrderConfi.aspx"><%:lang.LF("订单信息配置") %></a></li>
			<li id="menu3_3_15"><a href="javascript:;" data-url="Shop/SystemOrderModel.aspx?Type=site"><%:lang.LF("网站订单参数") %></a></li>
			<li id="menu3_3_16"><a href="javascript:;" data-url="Shop/SystemOrderModel.aspx?Type=shop"><%:lang.LF("店铺订单参数") %></a></li>
		</ul>
		<ul id="menu3_4" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>明细记录</li>
			<li id="menu3_4_1"><a href="javascript:;" data-url="Shop/BankRollList.aspx"><%:lang.LF("资金明细") %></a></li>
			<li id="menu3_4_2"><a href="javascript:;" data-url="Shop/SaleList.aspx"><%:lang.LF("销售明细") %></a></li>
			<li id="menu3_4_3"><a href="javascript:;" data-url="Shop/PayList.aspx"><%:lang.LF("支付明细") %></a></li>
			<li id="menu3_4_4"><a href="javascript:;" data-url="Shop/InvoiceList.aspx"><%:lang.LF("发票明细") %></a></li>
			<li id="menu3_4_5"><a href="javascript:;" data-url="Shop/DeliverList.aspx"><%:lang.LF("退货明细") %></a></li>
		</ul>
		<ul id="menu3_5" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>销售统计</li>
			<li id="menu3_5_1"><a href="javascript:;" data-url="Shop/TotalSale.aspx"><%:lang.LF("总体销售统计") %></a></li>
			<li id="menu3_5_2"><a href="javascript:;" data-url="Shop/ProductSale.aspx"><%:lang.LF("商品销售排名") %></a></li>
			<li id="menu3_5_3"><a href="javascript:;" data-url="Shop/CategotySale.aspx"><%:lang.LF("商品类别销售排名") %></a></li>
			<li id="menu3_5_4"><a href="javascript:;" data-url="Shop/UserOrders.aspx"><%:lang.LF("会员订单排名") %></a></li>
			<li id="menu3_5_5"><a href="javascript:;" data-url="Shop/UserExpenditure.aspx"><%:lang.LF("会员购物排名") %></a></li>
		</ul>
		<ul id="menu3_6" class="m_left_ulin">
			<li class="menu_tit"> <span class="glyphicon glyphicon-globe"></span>促销优惠</li>
			<li id="menu3_6_1"><a href="javascript:;" data-url="Shop/PresentProject.aspx"><%:lang.LF("促销方案管理") %></a></li>
			<li id="menu3_6_2"><a href="javascript:;" data-url="Shop/AddPresentProject.aspx"><%:lang.LF("添加促销方案") %></a></li>
			<li id="menu3_6_3"><a href="javascript:;" data-url="Shop/AgioProject.aspx"><%:lang.LF("打折方案管理") %></a></li>
			<li id="menu3_6_4"><a href="javascript:;" data-url="Shop/GoodsBid.aspx"><%:lang.LF("竞拍商品出价") %></a></li>
			<li id="menu3_6_5"><a href="javascript:;" data-url="Shop/Arrive/ArriveManage.aspx"><%:lang.LF("优惠券管理") %></a></li>
			<li id="menu3_6_6"><a href="javascript:;" data-url="Shop/Arrive/AddArrive.aspx?menu=add"><%:lang.LF("新增优惠券") %></a></li>
		</ul>
		<ul id="menu3_7" class="m_left_ulin">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>商城配置</li>
			<li id="menu3_7_1"><a href="javascript:;" data-url="Shop/DeliverType.aspx"><%:lang.LF("送货方式") %></a></li>
			<li id="menu3_7_2"><a href="javascript:;" data-url="Shop/FreePost.aspx"><%:lang.LF("免邮设置") %></a></li>
			<li id="menu3_7_3"><a href="javascript:;" data-url="Shop/ProducerManage.aspx"><%:lang.LF("厂商管理") %></a></li>
			<li id="menu3_7_4"><a href="javascript:;" data-url="Shop/TrademarkManage.aspx"><%:lang.LF("品牌管理") %></a></li>
			<li id="menu3_7_5"><a href="javascript:;" data-url="Shop/CardManage.aspx"><%:lang.LF("VIP卡管理") %></a></li>
			<li id="menu3_7_6"><a href="javascript:;" data-url="Shop/CashManage.aspx"><%:lang.LF("VIP卡提现") %></a></li>
			<li id="menu3_7_7"><a href="javascript:;" data-url="Shop/ProductCashManage.aspx"><%:lang.LF("厂商提现") %></a></li>
			<li id="menu3_7_8"><a href="javascript:;" data-url="Shop/BossSite.aspx"><%:lang.LF("提成比例") %></a></li>
			<li id="menu3_7_9"><a href="javascript:;" data-url="Shop/MoneyManage.aspx"><%:lang.LF("货币管理") %></a></li>
			<li id="menu3_7_10"><a href="javascript:;" data-url="Shop/InvtoManage.aspx"><%:lang.LF("发票计算") %></a></li>
		</ul>
		<ul id="menu3_8" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>加盟商管理</li>
			<li id="menu3_8_1"><a href="javascript:;" data-url="boss/Bosstree.aspx"><%:lang.LF("添加加盟商") %></a></li>
		</ul>
		<ul id="menu3_9" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>商品回收站</li>
			<li id="menu3_9_1"><a href="javascript:;" data-url="Shop/ShopRecycler.aspx"><%:lang.LF("商品回收站") %></a></li>
		</ul>
		<ul id="menu3_10" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>礼品管理</li>
			<li id="menu3_10_1"><a href="javascript:;" data-url="Flex/productManage.aspx"><%:lang.LF("产品管理") %></a></li>
			<li id="menu3_10_2"><a href="javascript:;" data-url="Flex/Addproduct.aspx"><%:lang.LF("添加产品") %></a></li>
			<li id="menu3_10_3"><a href="javascript:;" data-url="Flex/ClassManage.aspx"><%:lang.LF("模板分类管理") %></a></li>
			<li id="menu3_10_4"><a href="javascript:;" data-url="Flex/Addclass.aspx"><%:lang.LF("添加模板分类") %></a></li>
			<li id="menu3_10_5"><a href="javascript:;" data-url="Flex/FlexTemplate.aspx"><%:lang.LF("Flex礼品管理") %></a></li>
			<li id="menu3_10_6"><a href="javascript:;" data-url="Flex/AddTemplate.aspx"><%:lang.LF("添加Flex礼品") %></a></li>
			<li id="menu3_10_7"><a href="javascript:;" data-url="Flex/FlexItemManage.aspx"><%:lang.LF("礼品页面管理") %></a></li>
			<li id="menu3_10_8"><a href="javascript:;" data-url="Flex/AddItempage.aspx"><%:lang.LF("添加礼品页面") %></a></li>
		</ul>
		<ul id="menu3_11" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>竞拍管理</li>
			<li id="menu3_11_1"><a href="javascript:;" data-url="Shop/BidManage/Interference.aspx"><%:lang.LF("用户干扰设置") %></a></li>
			<li id="menu3_11_2"><a href="javascript:;" data-url="Shop/BidManage/BuyPaiBao.aspx"><%:lang.LF("拍宝套餐管理") %></a></li>
			<li id="menu3_11_4"><a href="javascript:;" data-url="Shop/BidManage/BidConfige.aspx"><%:lang.LF("竞拍信息配置") %></a></li>
			<li id="menu3_11_5"><a href="javascript:;" data-url="Shop/BidManage/History.aspx"><%:lang.LF("竞拍历史记录") %></a></li>
		</ul>
		<ul id="menu3_12" class="m_left_ulin">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>推广返利</li>
			<li id="menu3_12_1"><a href="javascript:;" data-url="Shop/profile/StatisticsBriefing.aspx"><%:lang.LF("统计简报") %></a></li>
			<li id="menu3_12_2"><a href="javascript:;" data-url="Shop/profile/config.aspx"><%:lang.LF("推广设置") %></a></li>
			<li id="menu3_12_3"><a href="javascript:;" data-url="Shop/profile/LmUserManage.aspx"><%:lang.LF("联盟会员") %></a></li>
			<li id="menu3_12_4"><a href="javascript:;" data-url="Shop/profile/LmUserListTree.aspx"><%:lang.LF("联盟会员树状图") %></a></li>
		</ul>
		<ul id="menu3_13" class="m_left_ulin">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>店铺管理</li>
			<li id="menu3_13_1"><a href="javascript:;" data-url="UserShopManage/StoreManage.aspx">店铺审核</a></li>
			<li id="menu3_13_2"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=6"><%:lang.LF("申请模型管理") %></a></li>
			<li id="menu3_13_3"><a href="javascript:;" data-url="UserShopManage/StoreStyleManage.aspx"><%:lang.LF("商家店铺模板管理") %></a></li>
			<li id="menu3_13_4"><a href="javascript:ShowMain('UserShopNodeTree.ascx','UserShopManage/ProductManage.aspx',this);"><%:lang.LF("商家商品管理") %></a></li>
			<li id="menu3_13_5"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=5"><%:lang.LF("店铺模型管理") %></a></li>
			<li id="menu3_13_6"><a href="javascript:;" data-url="UserShopManage/ShopinfoManage.aspx"><%:lang.LF("信息配置") %></a></li>
			<li id="menu3_13_7"><a href="javascript:;" data-url="UserShopManage/Shoplabelsclass.aspx"><%:lang.LF("标签管理") %></a></li>
			<li id="menu3_13_8"><a href="javascript:;" data-url="UserShopManage/ShopSearchKey.aspx"><%:lang.LF("搜索管理") %></a></li>
			<li id="menu3_13_9"><a href="javascript:;" data-url="UserShopManage/ShopRemark.aspx"><%:lang.LF("评论管理") %></a></li>
			<li id="menu3_13_10"><a href="javascript:;" data-url="UserShopManage/ShopScutcheon.aspx"><%:lang.LF("品牌管理") %></a></li>
			<li id="menu3_13_11"><a href="javascript:;" data-url="UserShopManage/ShopGrade.aspx"><%:lang.LF("等级管理") %></a></li>
			<li id="menu3_13_12"><a href="javascript:;" data-url="UserShopManage/ProducerManage.aspx"><%:lang.LF("厂商管理") %></a></li>
			<li id="menu3_13_13"><a href="javascript:;" data-url="AddOn/PayPlatManage.aspx"><%:lang.LF("支付方式管理") %></a></li>
			<li id="menu3_13_14"><a href="javascript:;" data-url="UserShopManage/DeliverType.aspx"><%:lang.LF("送货方式设置") %></a></li>
			<li id="menu3_13_15"><a href="javascript:;" data-url="UserShopManage/ShopMailConfig.aspx"><%:lang.LF("店铺邮件设置") %></a></li>
		</ul>
			<ul id="menu3_14" class="m_left_ulin">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>3D店铺管理</li>
			<li id="menu3_14_1"><a href="javascript:;" data-url="/3D/3DManage.aspx"><%:lang.LF("3D店铺管理") %></a></li>
			<li id="menu3_14_2"><a href="javascript:;" data-url="/3D/AddShop.aspx"><%:lang.LF("添加店铺") %></a></li>
		</ul>
	</div>
	<div id="menu4" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu4_1">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页申请设置</li>
			<li id="menu4_1_1"><a href="javascript:;" data-url="Page/UserModelManage.aspx"><%:lang.LF("申请模型管理") %></a></li>
			<li id="menu4_1_2"><a href="javascript:;" data-url="Page/UserModel.aspx"><%:lang.LF("添加申请模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_2">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页审核</li>
			<li id="menu4_2_1"><a href="javascript:;" data-url="page/PageManage.aspx"><%:lang.LF("黄页审核") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页用户栏目管理</li>
			<li id="menu4_3_1"><a href="javascript:;" data-url="page/PageAudit.aspx"><%:lang.LF("黄页用户栏目管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_4">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页内容管理</li>
			<li id="menu4_4_1"><a href="javascript:;" data-url="page/PageContent.aspx"><%:lang.LF("黄页内容管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页模型管理</li>
			<li id="menu4_5_1"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=4"><%:lang.LF("黄页模型管理") %></a></li>
			<li id="menu4_5_2"><a href="javascript:;" data-url="Page/AddPageModel.aspx"><%:lang.LF("添加黄页模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页样式管理</li>
			<li id="menu4_6_1"><a href="javascript:;" data-url="Page/PageStyle.aspx"><%:lang.LF("黄页样式管理") %></a></li>
			<li id="menu4_6_2"><a href="javascript:;" data-url="Page/AddPageStyle.aspx"><%:lang.LF("添加黄页样式") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu4_8">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>黄页标签管理</li>
			<li id="menu4_8_1"><a href="javascript:;" data-url="Page/SheetStyleManage.aspx"><%:lang.LF("黄页标签管理") %></a></li>
			<li id="menu4_8_2"><a href="javascript:;" data-url="Page/AddSheetStyle.aspx"><%:lang.LF("添加黄页标签") %></a></li>
		</ul>
	</div>
	<div id="menu5" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu5_1">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>考试管理</li>
            <li id="menu5_1_7"><a href="javascript:;" data-url="Exam/News.aspx">报纸管理</a></li>
			<li id="menu5_1_1"><a href="javascript:;" data-url="Exam/Papers_System_Manage.aspx"><%:lang.LF("试卷管理") %></a></li>
			<li id="menu5_1_2"><a href="javascript:;" data-url="Exam/CoureseManage.aspx"><%:lang.LF("课程管理") %></a></li>
			<li id="menu5_1_3"><a href="javascript:;" data-url="Exam/QuestionManage.aspx"><%:lang.LF("试题管理") %></a></li>
			<li id="menu5_1_4"><a href="javascript:;" data-url="Exam/Question_Class_Manage.aspx"><%:lang.LF("分类管理") %></a></li>
			<li id="menu5_1_5"><a href="javascript:;" data-url="Exam/ExamPointManage.aspx"><%:lang.LF("考点管理") %></a></li>
			<li id="menu5_1_6"><a href="javascript:;" data-url="Exam/QuestionTypeManage.aspx"><%:lang.LF("题型管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_2">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>阅卷中心</li>
			<li id="menu5_2_1"><a href="javascript:;" data-url="Exam/ToScore.aspx"><%:lang.LF("评阅试卷") %></a></li>
			<li id="menu5_2_2"><a href="javascript:;" data-url="Exam/ScoreStatics.aspx"><%:lang.LF("成绩统计") %></a> </li>
		</ul>
		<ul class="m_left_ulin" id="menu5_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>班级管理</li>
			<li id="menu5_3_1"><a href="javascript:;" data-url="Exam/ClassManage.aspx"><%:lang.LF("班级管理") %></a></li>
			<li id="menu5_3_2"><a href="javascript:;" data-url="Exam/AddClass.aspx"><%:lang.LF("添加班级") %></a></li>
			<li id="menu5_3_3"><a href="javascript:;" data-url="Exam/InsertClass.aspx"><%:lang.LF("添加班级类别") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_4">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>学员管理</li>
			<li id="menu5_4_1"><a href="javascript:;" data-url="Exam/Audit.aspx"><%:lang.LF("学员申请审批") %></a></li>
			<li id="menu5_4_2"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=0"><%:lang.LF("学员管理") %></a></li>
			<li id="menu5_4_3"><a href="javascript:;" data-url="iServer/BselectiServer.aspx?num=-3&strTitle="><%:lang.LF("有问必答") %></a></li>
			<li id="menu5_4_4"><a href="javascript:;" data-url="User/Message.aspx"><%:lang.LF("短信通知") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_5">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>培训资源库</li>
			<li id="menu5_5_1"><a href="javascript:;" data-url="Exam/ApplicationManage.aspx"><%:lang.LF("提交学员") %></a></li>
			<li id="menu5_5_2"><a href="javascript:;" data-url="Exam/ExTeacherManage.aspx"><%:lang.LF("教师管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_6">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>财务管理</li>
			<li id="menu5_6_1"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%:lang.LF("所有订单") %></a></li>
			<li id="menu5_6_2"><a href="javascript:;" data-url="Shop/BankRollList.aspx"><%:lang.LF("销售明细") %></a></li>
			<li id="menu5_6_3"><a href="javascript:;" data-url="Shop/InvoiceList.aspx"><%:lang.LF("开发票明细") %></a></li>
			<li id="menu5_6_4"><a href="javascript:;" data-url="Shop/CartManage.aspx"><%:lang.LF("购物车记录") %></a></li>
			<li id="menu5_6_5"><a href="javascript:;" data-url="Shop/PayList.aspx"><%:lang.LF("支付明细") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu5_7">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>组卷管理</li>
			<li id="menu5_7_1"><a href="javascript:;" data-url="Exam/Papers_System_Manage.aspx"><%:lang.LF("系统试卷管理") %></a></li>
			<li id="menu5_7_2"><a href="javascript:;" data-url="Exam/QuestionManage.aspx"><%:lang.LF("系统试题管理") %></a></li>
			<li id="menu5_7_3"><a href="javascript:;" data-url="Exam/AddQuestion.aspx?Operation=Add"><%:lang.LF("添加试题") %></a></li>
			<li id="menu5_7_4"><a href="javascript:;" data-url="Exam/Question_Class_Manage.aspx"><%:lang.LF("试题分类管理") %></a></li>
			<li id="menu5_7_5"><a href="javascript:;" data-url="Exam/AddQuestion_Class.aspx?menu=Add&C_id=0"><%:lang.LF("添加试题分类") %></a></li>
			<li id="menu5_7_6"><a href="javascript:;" data-url="Exam/Papers_User_Manage.aspx"><%:lang.LF("用户试卷管理") %></a></li>
		</ul>
	</div>
	<div id="menu6" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu6_1">

		</ul>
		<ul class="m_left_ulin" id="menu6_2">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>管理员管理</li>
			<li id="menu6_2_1"><a href="javascript:;" data-url="User/AdminManage.aspx"><%:lang.LF("管理员管理") %></a></li>
			<li id="menu6_2_2"><a href="javascript:;" data-url="User/RoleManage.aspx"><%:lang.LF("管理员角色") %></a></li>
            <li>
                <div class="input-group margintop10">
                    <input type="text" id="keyWordss" class="form-control" placeholder="搜索管理员名称" onkeydown="return ASCX.OnEnterSearch('User/AdminManage.aspx?keyWordss=',this);" />
                    <span class="input-group-btn">
                        <button id="Ok" class="btn btn-default" type="button" onclick="ASCX.Search('User/AdminManage.aspx?keyWordss=','keyWordss');"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </li>
		</ul>
		<ul class="m_left_ulin" id="menu6_3">
			<%--	<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>用户角色</li>
			<li id="menu6_3_1"><a href="javascript:;" data-url="User/PermissionInfo.aspx"><%:lang.LF("角色管理") %></a></li>--%>
		</ul>
		<ul class="m_left_ulin" id="menu6_4">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>信息发送</li>
			<li id="menu6_4_1"><a href="javascript:;" data-url="User/MessageSend.aspx"><%:lang.LF("发送短消息") %></a></li>
			<li id="menu6_4_2"><a href="javascript:;" data-url="User/Message.aspx"><%:lang.LF("短消息列表") %></a></li>
			<li id="menu6_4_3"><a href="javascript:;" data-url="User/MobileMsg.aspx"><%:lang.LF("手机信息") %></a></li>
			<li id="menu6_4_4"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("订阅列表") %></a></li>
			<li id="menu6_4_5"><a href="javascript:;" data-url="User/AddMail.aspx"><%:lang.LF("订阅群发") %></a></li>
			<li id="menu6_4_6"><a href="javascript:;" data-url="User/MailIdiographList.aspx"><%:lang.LF("签名管理") %></a></li>
			<li id="menu6_4_7"><a href="javascript:;" data-url="User/MailList.aspx"><%:lang.LF("邮件发送") %></a></li>
			<li id="menu6_4_8"><a href="javascript:;" data-url="User/MailTemplist.aspx"><%:lang.LF("邮件模版") %></a></li>
			<li id="menu6_4_9"><a href="javascript:;" data-url="Mail/Mail.aspx"><%:lang.LF("邮件列表") %></a></li>
			<li id="menu6_4_10"><a href="javascript:;" data-url="Mail/MailMorSend.aspx"><%:lang.LF("邮件群发") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu6_5">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>订阅中心</li>
			<li id="menu6_5_1"><a href="javascript:;" data-url="User/SubscriptListManage.aspx?menu=all"><%:lang.LF("邮件订阅管理") %></a></li>
			<li id="menu6_5_2"><a href="javascript:;" data-url="User/SubscriptListManage.aspx?menu=audit"><%:lang.LF("邮件订阅审核") %></a></li>
			<li id="menu6_5_3"><a href="javascript:;" data-url="User/EidtMailModel.aspx"><%:lang.LF("邮件模板编辑") %></a></li>
			<li id="menu6_5_4"><a href="javascript:;" data-url="User/RegValidateMail.aspx"><%:lang.LF("邮件内容管理") %></a></li>
			<li id="menu6_5_5"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("发送邮件管理") %></a></li>
			<li id="menu6_5_6"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("邮件列表管理") %></a></li>
			<li id="menu6_5_7"><a href="javascript:;" data-url="User/SendMailList.aspx"><%:lang.LF("邮件发送") %></a></li>
			<li id="menu6_5_8"><a href="javascript:;" data-url="User/MailIdiographList.aspx"><%:lang.LF("签名管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu6_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>人才招聘</li>
			<li id="menu6_6_1"><a href="javascript:;" data-url="User/Jobsconfig.aspx"><%:lang.LF("人才模板配置") %></a></li>
			<li id="menu6_6_2"><a href="javascript:;" data-url="User/Jobsinfos.aspx?modeid=qiye"><%:lang.LF("招聘企业管理") %></a></li>
			<li id="menu6_6_3"><a href="javascript:;" data-url="User/Jobsinfos.aspx?modeid=zhappin"><%:lang.LF("职位信息管理") %></a></li>
			<li id="menu6_6_4"><a href="javascript:;" data-url="User/Jobsinfos.aspx?modeid=geren"><%:lang.LF("用户简历管理") %></a></li>
			<li id="menu6_6_5"><a href="javascript:;" data-url="User/JobsRecycler.aspx?modeid=qiye"><%:lang.LF("回收站") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu6_7">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>SNS社区模块</li>
			<li id="menu6_7_1"><a href="javascript:;" data-url="Zone/ZoneConfig.aspx"><%:lang.LF("会员空间配置") %></a></li>
			<li id="menu6_7_2"><a href="javascript:;" data-url="Zone/ZoneManage.aspx"><%:lang.LF("会员空间管理") %></a></li>
			<li id="menu6_7_3"><a href="javascript:;" data-url="Zone/ZoneApplyManage.aspx"><%:lang.LF("审核用户空间") %></a></li>
			<li id="menu6_7_4"><a href="javascript:;" data-url="Zone/ZoneStyleManage.aspx"><%:lang.LF("空间模板管理") %></a></li>
			<li id="menu6_7_5"><a href="javascript:;" data-url="Zone/FriendSearchManage.aspx"><%:lang.LF("搜索好友管理") %></a></li>
			<li id="menu6_7_6"><a href="javascript:;" data-url="Zone/ProductManage.aspx"><%:lang.LF("虚拟商品管理") %></a></li>
			<li id="menu6_7_7"><a href="javascript:;" data-url="Zone/CarManage.aspx"><%:lang.LF("抢车位车辆管理") %></a></li>
			<li id="menu6_7_8"><a href="javascript:;" data-url="Zone/LargessMoney.aspx"><%:lang.LF("赠送游戏币") %></a></li>
			<li id="menu6_7_9"><a href="javascript:;" data-url="Zone/GSManage.aspx"><%:lang.LF("回收站") %></a></li>
			<li id="menu6_7_10"><a href="javascript:;" data-url="Zone/UnitConfig.aspx"><%:lang.LF("空间信息设置") %></a></li>
			<li id="menu6_7_11"><a href="javascript:;" data-url="Zone/SnsSchool.aspx"><%:lang.LF("学校信息管理") %></a></li>
			<li id="menu6_7_12"><a href="javascript:;" data-url="Zone/SnsClassRoom.aspx"><%:lang.LF("班级信息管理") %></a></li>
			<li id="menu6_7_13"><a href="javascript:;" data-url="Zone/LabelHelp.aspx"><%:lang.LF("标签说明") %></a></li>
		</ul>
	</div>
	<div id="menu7" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu7_1">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>开发中心</li>
			<li id="menu7_1_1"><a href="javascript:;" data-url="Config/CreateTable.aspx"><%:lang.LF("快速建表") %></a></li>
			<li id="menu7_1_2"><a href="javascript:;" data-url="Config/ViewList.aspx"><%:lang.LF("视图管理") %></a></li>
			<li id="menu7_1_3"><a href="javascript:;" data-url="Config/DatalistProfile.aspx"><%:lang.LF("系统全库概况") %></a></li>
			<li id="menu7_1_4"><a href="javascript:;" data-url="Config/BackupRestore.aspx"><%:lang.LF("备份还原数据") %></a></li>
			<li id="menu7_1_5"><a href="javascript:;" data-url="Config/Optimization.aspx"><%:lang.LF("数据索引优化") %></a></li>
			<li id="menu7_1_6"><a href="javascript:;" data-url="Config/DataSearch.aspx"><%:lang.LF("全库数据检索") %></a></li>
			<li id="menu7_1_7"><a href="javascript:;" data-url="Config/RunSql.aspx"><%:lang.LF("执行SQL语句") %></a></li>
			<li id="menu7_1_8"><a href="javascript:;" data-url="Config/DataAssert.aspx"><%:lang.LF("表内容批处理") %></a></li>
			<li id="menu7_1_9"><a href="javascript:;" data-url="Config/EmptyData.aspx"><%:lang.LF("清空测试数据") %></a></li>
			<li id="menu7_1_10"><a href="javascript:;" data-url="Common/SystemFinger.aspx"><%:lang.LF("服务器信息总览") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_2">
				<li class="menu_tit"><%:lang.LF("广告管理") %></li>
			<li id="menu7_2_1"><a href="javascript:;" data-url="Plus/ADZoneManage.aspx"><%:lang.LF("广告版位") %></a></li>
			<li id="menu7_2_2"><a href="javascript:;" data-url="Plus/ADManage.aspx"><%:lang.LF("广告内容") %></a></li>
			<li id="menu7_2_3"><a href="javascript:;" data-url="Plus/ADAdbuy.aspx"><%:lang.LF("推广申请") %></a></li>
			<li id="menu7_2_4"><a href="javascript:;" data-url="Plus/ChartManage.aspx"><%:lang.LF("图表管理") %></a></li>
			<li id="menu7_2_5"><a href="javascript:;" data-url="Panoramic/PanoramicManage.aspx"><%:lang.LF("全景列表") %></a></li>
			<li id="menu7_2_6"><a href="javascript:;" data-url="Panoramic/MusicManage.aspx"><%:lang.LF("全景音乐") %></a></li>
			<li id="menu7_2_7"><a href="javascript:;" data-url="AddOn/Maps.aspx"><%:lang.LF("地图管理") %></a></li>
			<li id="menu7_2_8"><a href="javascript:;" data-url="Magazine/AddMagazine.aspx"><%:lang.LF("电子杂志") %></a></li>
			<li id="menu7_2_9"><a href="javascript:;" data-url="/Plugins/Flex/Default.aspx"><%:lang.LF("在线设计") %></a></li>
			<li id="menu7_2_10"><a href="javascript:;" data-url="Flex/MyMaterial.aspx"><%:lang.LF("素材中心") %></a></li>
			<li id="menu7_2_11"><a href="javascript:;" data-url="Flex/MyWork.aspx"><%:lang.LF("我的作品") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>访问统计</li>
			<li id="menu7_3_1"><a href="javascript:;" data-url="Counter/Counter.aspx"><%:lang.LF("统计导航") %></a></li>
			<li id="menu7_3_2"><a href="javascript:;" data-url="Counter/Ip.aspx"><%:lang.LF("总访问统计") %></a></li>
			<li id="menu7_3_3"><a href="javascript:;" data-url="Counter/Month.aspx"><%:lang.LF("日访问统计") %></a></li>
			<li id="menu7_3_4"><a href="javascript:;" data-url="Counter/Year.aspx"><%:lang.LF("月访问统计") %></a></li>
			<li id="menu7_3_5"><a href="javascript:;" data-url="Counter/Local.aspx"><%:lang.LF("地区访问统计") %></a></li>
			<li id="menu7_3_6"><a href="javascript:;" data-url="Counter/Browser.aspx"><%:lang.LF("浏览器访问统计") %></a></li>
			<li id="menu7_3_7"><a href="javascript:;" data-url="Counter/Os.aspx"><%:lang.LF("操作系统访问统计") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_4">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>问卷调查</li>
			<li id="menu7_4_1"><a href="javascript:;" data-url="Plus/SurveyManage.aspx"><%:lang.LF("问卷调查管理") %></a></li>
			<li id="menu7_4_2"><a href="javascript:;" data-url="Plus/Survey.aspx"><%:lang.LF("添加问卷投票") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>文件管理</li>
			<li id="menu7_5_1"><a href="javascript:;" data-url="File/UploadFile.aspx"><%:lang.LF("本地文件") %></a></li>
			<li id="menu7_5_2"><a href="javascript:;" data-url="File/FtpAll.aspx"><%:lang.LF("云端存储") %></a></li>
			<li id="menu7_5_3"><a href="javascript:;" data-url="File/DownServerManage.aspx"><%:lang.LF("下载服务器") %></a></li>
			<li id="menu7_5_4"><a href="javascript:;" data-url="File/BackupManage.aspx"><%:lang.LF("文件备份") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_6">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>数据字典</li>   
			<li id="menu7_6_1"><a href="javascript:;" data-url="Addon/DictionaryManage.aspx"><%:lang.LF("单级数据字典管理") %></a></li>
			<li id="menu7_6_2"><a href="javascript:;" data-url="Addon/GradeCateManage.aspx"><%:lang.LF("多级数据字典管理") %></a></li>
			<li id="menu7_6_3"><a href="javascript:;" data-url="Config/CitizenXmlConfig.aspx"><%:lang.LF("国籍数据字典管理") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_7">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>站内链接</li> 
			<li id="menu7_7_1"><a href="javascript:;" data-url="File/Addlinkhttp.aspx"><%:lang.LF("管理链接") %></a></li>
			<li id="menu7_7_2"><a href="javascript:;" data-url="File/tjlink.aspx"><%:lang.LF("添加内链") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_8">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>客户端</li> 
			<li id="menu7_8_1"><a href="javascript:;" data-url="AddOn/Download.aspx"><%:lang.LF("客户端下载") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_9">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>移动与微信</li> 
			<li id="menu7_9_1"><a href="javascript:;" data-url="WeiXin/wxApi.aspx"><%:lang.LF("接口配置") %></a></li>
			<li id="menu7_9_2"><a href="javascript:;" data-url="WeiXin/Default.aspx"><%:lang.LF("微信应答") %></a></li>
			<li id="menu7_9_3"><a href="javascript:;" data-url="WeiXin/SendWx.aspx"><%:lang.LF("微信发送") %></a></li>
			<li id="menu7_9_4"><a href="javascript:;" data-url="WeiXin/QrCodeManage.aspx"><%:lang.LF("二维码管理") %></a></li>
			<li id="menu7_9_5"><a href="javascript:;" data-url="WeiXin/QrCodeDecode.aspx"><%:lang.LF("解码管理") %></a></li>
			<li id="menu7_9_6"><a href="javascript:;" data-url="AddOn/UAgent.aspx"><%:lang.LF("设备接入") %></a></li>
			<li id="menu7_9_7"><a href="javascript:;" data-url="/APP/AddTemplate.aspx"><%:lang.LF("移动APP") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu7_10">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>其他功能</li> 
			<li id="menu7_10_1"><a href="javascript:;" data-url="Iplook/IPManage.aspx"><%:lang.LF("IP分类管理") %></a></li>
			<li id="menu7_10_2"><a href="javascript:;" data-url="Iplook/LookIp.aspx"><%:lang.LF("IP地址管理") %></a></li>
			<li id="menu7_10_3"><a href="javascript:;" data-url="Search/DirectoryManage.aspx"><%:lang.LF("定义全文检索") %></a></li>
			<li id="menu7_10_4"><a href="javascript:;" data-url="Search/SeachDirectory.aspx"><%:lang.LF("全文目录管理") %></a></li>
			<li id="menu7_10_5"><a href="javascript:;" data-url="AddOn/FileseeManage.aspx"><%:lang.LF("比较所有文件") %></a></li>
			<li id="menu7_10_6"><a href="javascript:;" data-url="AddOn/FileSynchronize.aspx"><%:lang.LF("文件同步") %></a></li>
		</ul>
	</div>
	<div id="menu8" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu8_1">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>网站配置</li> 
			<li id="menu8_1_1"><a href="javascript:;" data-url="Config/SiteInfo.aspx"><%:lang.LF("基本信息") %></a></li>
			<li id="menu8_1_2"><a href="javascript:;" data-url="Config/SiteOption.aspx"><%:lang.LF("进阶信息") %></a></li>
			<li id="menu8_1_3"><a href="javascript:;" data-url="Config/MobileMsgConfig.aspx"><%:lang.LF("短信配置") %></a></li>
			<li id="menu8_1_4"><a href="javascript:;" data-url="Config/MailConfig.aspx"><%:lang.LF("邮件参数") %></a></li>
			<li id="menu8_1_5"><a href="javascript:;" data-url="Config/ThumbConfig.aspx"><%:lang.LF("水印缩图") %></a></li>
			<li id="menu8_1_6"><a href="javascript:;" data-url="Config/IPLockConfig.aspx"><%:lang.LF("访问限定") %></a></li>
			<li id="menu8_1_7"><a href="javascript:;" data-url="Config/AppConfig.aspx"><%:lang.LF("维护中心") %></a></li>
			<li id="menu8_1_8"><a href="javascript:;" data-url="Config/Sensitivity.aspx"><%:lang.LF("敏感过滤") %></a></li>
			<li id="menu8_1_9"><a href="javascript:;" data-url="Config/CreateMap.aspx"><%:lang.LF("快速索引") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_2">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>模型管理</li> 
			<li id="menu8_2_1"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=1"><%:lang.LF("内容模型") %></a></li>
			<li id="menu8_2_2"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=2"><%:lang.LF("商城模型") %></a></li>
			<li id="menu8_2_3"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=5"><%:lang.LF("店铺模型") %></a></li>
			<li id="menu8_2_4"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=3"><%:lang.LF("用户模型") %></a></li>
			<li id="menu8_2_5"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=4"><%:lang.LF("黄页模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_3">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>节点管理</li> 
			<li id="menu8_3_1"><a href="javascript:;" data-url="Content/NodeManage.aspx"><%:lang.LF("节点管理") %></a></li>
			<li id="menu8_3_2"><a href="javascript:;" data-url="Content/BatchNode.aspx"><%:lang.LF("批量设置") %></a></li>
			<li id="menu8_3_3"><a href="javascript:;" data-url="Content/UnionNode.aspx"><%:lang.LF("合并迁移") %></a></li>
            <li id="menu8_3_4"><a href="javascript:;" data-url="Config/RouteConfig.aspx">站点路由</a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_4">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>流程管理</li> 
			<li id="menu8_4_1"><a href="javascript:;" data-url="Content/FlowManager.aspx"><%:lang.LF("流程管理") %></a></li>
			<li id="menu8_4_2"><a href="javascript:;" data-url="Content/AuditingState.aspx"><%:lang.LF("状态编码") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_5">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>专题管理</li> 
			<li id="menu8_5_1"><a href="javascript:;" data-url="Content/SpecialManage.aspx"><%:lang.LF("专题类别管理") %></a></li>
			<li id="menu8_5_2"><a href="javascript:;" data-url="Content/SpecBatchSet.aspx"><%:lang.LF("专题批量设置") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_6">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>模板风格</li> 
			<li id="menu8_6_1"><a href="javascript:;" data-url="Template/TemplateSet.aspx"><%:lang.LF("方案列表") %></a></li>
			<li id="menu8_6_2"><a href="javascript:;" data-url="Template/TemplateManage.aspx"><%:lang.LF("模板中心") %></a></li>
			<li id="menu8_6_3"><a href="javascript:;" data-url="Template/CSSManage.aspx"><%:lang.LF("风格管理") %></a></li>
			<li id="menu8_6_4"><a href="javascript:;" data-url="Template/CloudLead.aspx"><%:lang.LF("云端下载") %></a></li>
			<li id="menu8_6_5"><a href="javascript:;" data-url="Template/DSManage.aspx"><%:lang.LF("外部数据库源") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu8_7">
		</ul>
		<ul class="m_left_ulin" id="menu8_8">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>在线支付平台</li> 
			<li id="menu8_8_1"><a href="javascript:;" data-url="Pay/PayPlatManage.aspx"><%:lang.LF("支付平台管理") %></a></li>
			<li id="menu8_8_2"><a href="javascript:;" data-url="Pay/AlipayBank.aspx"><%:lang.LF("支付宝网银管理") %></a></li>
			<li id="menu8_8_3"><a href="javascript:;" data-url="Pay/AddPayPlat.aspx"><%:lang.LF("添加支付平台") %></a></li>
			<li id="menu8_8_4"><a href="javascript:;" data-url="Pay/PaymentList.aspx"><%:lang.LF("充值信息管理") %></a></li>
			<li id="menu8_8_5"><a href="javascript:;" data-url="Pay/Paypalmanage.aspx"><%:lang.LF("Paypal支付") %></a></li>
		</ul>
	</div>
	<div id="menu9" class="m_left_ul">
		<ul class="m_left_ulin open" id="menu9_1">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>OA配置</li> 
			<li id="menu9_1_1"><a href="javascript:;" data-url="Content/ModelManage.aspx?ModelType=9"><%:lang.LF("办公模型") %></a></li>
			<li id="menu9_1_2"><a href="javascript:;" data-url="WorkFlow/Default.aspx"><%:lang.LF("流程管理") %></a></li>
			<li id="menu9_1_3"><a href="javascript:;" data-url="WorkFlow/FlowTypeList.aspx"><%:lang.LF("类型管理") %></a></li>
			<li id="menu9_1_4"><a href="javascript:;" data-url="WorkFlow/MisModelManage.aspx"><%:lang.LF("模板管理") %></a></li>
			<li id="menu9_1_5"><a href="javascript:;" data-url="WorkFlow/SignManage.aspx"><%:lang.LF("印章管理") %></a></li>
			<li id="menu9_1_7"><a href="javascript:;" data-url="WorkFlow/OAConfig.aspx"><%:lang.LF("系统配置") %></a></li>
			<li id="menu9_1_8"><a href="javascript:;" data-url="WorkFlow/AffairManage.aspx"><%:lang.LF("公文管理") %></a></li>
			<li id="menu9_1_9"><a href="javascript:;" data-url="WorkFlow/DocManage.aspx"><%:lang.LF("文档管理") %></a></li>
            <li id="menu9_1_10"><a href="javascript:;" data-url="WorkFlow/MailManage.aspx">邮箱管理</a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_2">
		<%--	<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>组织结构</li> 
			<li id="menu9_2_1"><a href="javascript:;" data-url="AddOn/StructManage.aspx?type=0"><%:lang.LF("组织结构") %></a></li>
			<li id="menu9_2_2"><a href="javascript:;" data-url="AddOn/StructList.aspx?type=0"><%:lang.LF("配置结构") %></a></li>
			<li id="menu9_2_3"><a href="javascript:;" data-url="AddOn/StructList.aspx?type=1"><%:lang.LF("管理结构") %></a></li>
			<li id="menu9_2_4"><a href="javascript:;" data-url="AddOn/StructAnalysis.aspx"><%:lang.LF("分析结构") %></a></li>--%>
		</ul>
		<ul class="m_left_ulin" id="menu9_3">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>项目管理</li> 
			<li id="menu9_3_1"><a href="javascript:;" data-url="AddOn/ManageProjects.aspx"><%:lang.LF("项目管理") %></a></li>
			<li id="menu9_3_2"><a href="javascript:;" data-url="AddOn/ProjectRequireList.aspx"><%:lang.LF("需求管理") %></a></li>
			<li id="menu9_3_3"><a href="javascript:;" data-url="AddOn/WorkManage.aspx"><%:lang.LF("流程管理") %></a></li>
			<li id="menu9_3_4"><a href="javascript:;" data-url="AddOn/ProjectsType.aspx"><%:lang.LF("项目配置") %></a></li>
			<li id="menu9_3_5"><a href="javascript:;" data-url="AddOn/ProjectsModelField.aspx"><%:lang.LF("项目模型") %></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_4" style="height:700px;overflow:auto;">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>CRM管理</li> 
			<li id="menu9_4_1"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=0"><%:lang.LF("所有客户") %></a></li>
			<li id="menu9_4_2"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=2"><%:lang.LF("企业客户") %></a></li>
			<li id="menu9_4_3"><a href="javascript:;" data-url="AddCRM/CustomerList.aspx?usertype=1"><%:lang.LF("个人客户") %></a></li>
			<li><a href="javascript:" data-url="AddCRM/AddOption.aspx"><%:lang.LF("添加新选项") %></a></li>     
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Type"><%=lang.LF("投诉记录表")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Type"><%=lang.LF("服务记录表")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Area"><%=lang.LF("客户区域")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Calling" ><%=lang.LF("所属行业")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Value"><%=lang.LF("价值评估")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Credit"><%=lang.LF("信用等级")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Importance"><%=lang.LF("重要程度")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Connection"><%=lang.LF("关系等级")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Group"><%=lang.LF("客户组别")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Source"><%=lang.LF("客户来源")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Client_Phase" ><%=lang.LF("阶段")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Co_Status" ><%=lang.LF("行业地位")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Co_Size"><%=lang.LF("公司规模")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Co_Management" ><%=lang.LF("经营状态")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Type" ><%=lang.LF("服务类型")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Mode" ><%=lang.LF("服务方式")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Complain_Urgency" ><%=lang.LF("紧急程度")%></a></li>                    
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Linkman_Income" ><%=lang.LF("月收入")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Linkman_Education"><%=lang.LF("学历")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Type"><%=lang.LF("服务类型")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Mode"><%=lang.LF("服务方式")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_TakeTime"><%=lang.LF("花费时间")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Result"><%=lang.LF("服务结果")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Service_Score"><%=lang.LF("客户评价")%></a></li>
			<li><a href="javascript:" data-url="AddCRM/CRMDictionary.aspx?FieldName=Time"><%=lang.LF("期限")%></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_5">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>有问必答</li> 
			<li id="menu9_5_1"><a href="javascript:;" data-url="iServer/BiServer.aspx?num=-3"><%=lang.LF("有问必答")%></a></li>
			<li id="menu9_5_2"><a href="javascript:;" data-url="iServer/BselectiServer.aspx?num=-3"><%=lang.LF("问题列表")%></a></li>
			<li id="menu9_5_3"><a href="javascript:;" data-url="iServer/AddQuestionRecord.aspx"><%=lang.LF("创建问题记录")%></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_6">
			<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>客服通</li> 
			<li><a href="javascript:;" data-url="User/ServiceSeat.aspx"><%=lang.LF("客服席位")%></a> </li>
			<li><a href="javascript:;" data-url="User/ServiceCode.aspx"><%=lang.LF("在线生成")%></a> </li>
			<li><a href="javascript:;" data-url="User/ALLOnlineInfo.aspx"><%=lang.LF("客服信息")%></a></li>
			<li><a href="javascript:;" data-url="User/MsgEx.aspx"><%=lang.LF("聊天记录")%></a> </li>
			<li><a href="javascript:;" data-url="User/UserGroup.aspx"><%=lang.LF("用户组管理")%></a> </li>
			<li><a href="javascript:;" data-url="User/SelectFrient.aspx"><%=lang.LF("查找好友")%></a> </li>
		</ul>
		<ul class="m_left_ulin" id="menu9_7">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>工作统计</li> 
			<li id="menu9_7_1"><a href="javascript:;" data-url="Workload/Subject.aspx?Type=subject"><%=lang.LF("按栏目统计")%></a></li>
			<li id="menu9_7_2"><a href="javascript:;" data-url="Workload/Subject.aspx?Type=manager"><%=lang.LF("按管理员统计")%></a></li>
			<li id="menu9_7_3"><a href="javascript:;" data-url="Workload/Subject.aspx?Type=dateTime"><%=lang.LF("按时间统计")%></a></li>
		</ul>
		<ul class="m_left_ulin" id="menu9_8">
				<li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>日志管理</li> 
			<li id="menu9_8_1"><a href="javascript:;" data-url="Plus/LogManage.aspx?Cate=4"><%=lang.LF("常规操作")%></a></li>
			<li id="menu9_8_2"><a href="javascript:;" data-url="Plus/LogManage.aspx?Cate=5"><%=lang.LF("程序异常")%></a></li>
			<li id="menu9_8_3"><a href="javascript:;" data-url="Plus/LogManage.aspx?Cate=2"><%=lang.LF("登录失败")%></a></li>
			<li id="menu9_8_4"><a href="javascript:;" data-url="Plus/LogManage.aspx?Cate=1"><%=lang.LF("登录成功")%></a></li>
			<li id="menu9_8_5"><a href="javascript:" data-url="Plus/LogManage.aspx?Cate=3"><%=lang.LF("退出登录")%></a></li>
			<li id="menu9_8_6"><a href="javascript:;" data-url="Plus/AuditNotes.aspx"><%=lang.LF("内容审核记录")%></a></li>
		</ul>
        <ul class="m_left_ulin" id="menu9_9">
            <li class="menu_tit"><span class="glyphicon glyphicon-globe"></span>能力中心</li>
            <li id="menu9_9_1"><a href="javascript:;" data-url="Plat/PlatInfoManage.aspx">信息管理</a></li>
            <li id="menu9_9_2"><a href="javascript:;" data-url="Plat/PlatConfig.aspx">全局配置</a></li>
        </ul>
	</div>
</div>
<asp:UpdatePanel ID="LeftPanel" runat="server" EnableViewState="false">
	<ContentTemplate>
		<div runat="server" id="left_Div" style="overflow-y:auto;position:relative;"></div>
		<asp:Button runat="server" ID="leftSwitch_Btn" OnClick="leftSwitch_Btn_Click" Style="display: none;" />
		<asp:HiddenField runat="server" ID="left_Hid" />
	</ContentTemplate>
</asp:UpdatePanel>
<div class="clearfix"></div>
</div>
<div id="leftSwitch" style="cursor:pointer;position:absolute;margin-top:12%;z-index:10;display:none;" class="hidden-xs hidden-sm" onclick="hideleft();">
<img src="/MIS/OA/Images/butClose.gif"/>
</div>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 main_right pull-right" id="right" style="overflow:hidden;">
<div class="m_tabs">
	<table style="height: 100%; width: 100%;">
		<tr style="vertical-align: top">
			<td id="frmRtd" style="text-align: left;">
				<div class="FrameTabs_bg">
					<div class="FrameTab_nav">
						<div id="FrameTabs" style="overflow: hidden; width: 100%;">
							<div class="tab-right"></div>
							<div class="tab-left"></div>
							<div class="tab-strip-wrap">
								<ul class="tab-strip pull-left" id="tab_ul" style="position: fixed;background:#FFF;border-bottom:1px solid #ddd;">
									<li class="current first" id="iFrameTab1"><a href="javascript:"><span id="frameTabTitle">新选项卡</span></a><a class="closeTab" title="关闭"><span class="glyphicon glyphicon-remove"></span></a></li>
									<li class="end" id="newFrameTab"><a title="新选项卡" href="javascript:"><span class="glyphicon glyphicon-plus"></span></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 书签结束 -->
				<div class="thumbnail">
					<div id="main_right_frame">
						<iframe id="main_right" onload="SetTabTitle(this)" style="z-index: 2; background: #fff; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%;" name="main_right" src="../Profile/Worktable.aspx" frameborder="0" tabid="1"></iframe>
						<div class="clearfix"></div>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
<div id="Meno" style="position: inherit; width: 100%;">
	<div id="iframeGuideTemplate" style="display: none;">
		<iframe style="z-index: 2; visibility: inherit; width: 100%;" src="about:blank" frameborder="0" tabid="0"></iframe>
		<div class="clearfix"></div>
	</div>
	<div id="iframeMainTemplate" style="display: none">
		<iframe style="z-index: 2; visibility: inherit; overflow-x: hidden; width: 100%;" src="about:blank" frameborder="0" scrolling="yes" onload="SetTabTitle(this)" tabid="0"></iframe>
		<div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<div style="position: absolute; left: 0px; top: 0px; z-index: 10001; text-align: center;" id="infoDiv"></div><!--锁屏-->
<div style="position: absolute; display: none; left: 0px; top: 0px;height:100%; z-index: 10000; background: #1c6297;" id="tranDiv" class="insbox">
<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; filter: alpha(Opacity=20)" id="tranDivBack"></div></div>
<script type="text/javascript" src="/JS/Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ascx.js?ver=20140916a"></script>
<script type="text/javascript" src="/JS/ICMS/alt.js"></script>
<script type="text/javascript" src="/JS/ICMS/Main.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $("li a[data-url]").click(function () {
            ShowMain('', $(this).attr("data-url"), this);
        });
        $("#tab_ul").sortable
            ({
                //placeholder: "ui-state-highlight",
                containment: 'parent'
            });//dragable end;
    });
    var Path = '<%=CustomerPageAction.customPath2%>';
    //function showd(obj) {
    //var dr = document.getElementById(obj).style.display;
    //if (dr == "none") {
    //	document.getElementById(obj).style.display = "block";
    //}
    //else {
    //	document.getElementById(obj).style.display = "none";
    //}
    //}
    //setLayout,必须放在main_right之后
    window.onresize = setLayout;
    document.body.scroll = "no";
    function setLayout() {
        document.getElementById("main_right_frame").style.width = document.documentElement.clientWidth;
        document.getElementById("main_right").height = document.documentElement.clientHeight - 140;
        //----边栏切换按钮
        if ($(window).width() < 768) {
            $("#leftSwitch").hide();
        }
        else {
            LeftSwitchFunc();
        }
        //----边栏滚动条高度
        $("#left_Div").css("height", $(window).height() - 150 + "px");
    }
    setLayout();
    function IsEnter(obj) {
        if (event.keyCode == 13) {
            SearchPage(); return false;
        }
    }
    //搜索
    function SearchPage() {
        var key = $("#keyText").val();
        if (!key || key == "") return;
        ShowMain('', Path + 'I/Main.aspx?key=' + key);
    }
    function closdlg() {
        Dialog.close();
    }
    function DivCache(url) {
        myFrame.AddTabJson(currentFrameTabId, url, $("#left_Div").html());
    }
    $('.popover-dismiss').popover({
        trigger: 'toggle'
    })
    function ShowTradition() {
        var isclose = '<%= ZoomLa.Components.SiteConfig.SiteOption.TraditionClose%>';
            if (isclose == "False")
                location.href = '<%= customPath2%>Default.aspx';
        }
        //function gotourl(url) {
        //frames["main_right"].location = url; void (0);
    //}
    var adDiag = new ZL_Dialog();
    function ShowAD() {
        adDiag.title = "场景控制";
        adDiag.url = "../I/Scence.aspx";
        adDiag.maxbtn = false;
        adDiag.height = 675;
        adDiag.ShowModal();
    }
</script>
</form>
</body>
</html>