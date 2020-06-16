<%@ page language="C#" autoeventwireup="true" inherits="Guestbook_BkSearch, App_Web_5yxxkshy" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>搜索词条-<%Call.Label("{$SiteName/}"); %>百科</title> 
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit" />
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<link href="/App_Themes/Guest/bar.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">    
<div id="ask_top">
<div class="container">
<div class="row">
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
<div class="ask_top_l">
<ul class="list-inline">
<li><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('{$SiteURL/}');" href="javascript:;">设为首页</a></li>
<li><a href="javascript:;" id="dropdownMenu1" data-toggle="dropdown">官网频道<span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
<%Call.Label("{ZL.Label id=\"输出根节点下一级栏目列表\" ShowNum=\"8\" /}");%>
</ul>
</li>
</ul>
</div>
</div>
<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
<div class="ask_top_r">
<ul class="list-inline">
<li><i class="fa fa-graduation-cap"></i><a href="/Baike" >百科</a></li>
<li><i class="fa fa-envelope"></i><a href="/Guest">留言</a></li>
<li><i class="fa fa-question-circle"></i><a href="/Ask">问答</a></li>
<li><i class="fa fa-paw"></i><a href="/Index" >贴吧</a></li>
<li style="<%=getstyle()%>">
<div class="dropdown">
<a id="dLabel" data-target="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><asp:Label runat="server" ID="user"></asp:Label></a><span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
<li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的空间</a></li>
<li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的帖子</a></li>
<li role="presentation"><a role="menuitem" tabindex="-1" href="/User/Content/MyFavori.aspx" target="_blank">我的喜欢</a></li>
<li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的关注</a></li>
<li role="presentation"><a role="menuitem" tabindex="-1" href="/User/" target="_blank">我的投票</a></li>
<li role="presentation"><a role="menuitem" tabindex="-1" href="/User/Info/UserBase.aspx" target="_blank">个人设置</a></li>
<li role="presentation"><a role="menuitem" tabindex="-1" href="/user/Logout.aspx">安全退出</a></li>
</ul>
</div>
</li>
<li style="<%=getstyles()%>"><a href="/User/Login.aspx?ReturnUrl=/Guest" target="_blank">登录</a>|<a href="/User/Register.aspx?ReturnUrl=/Guest" target="_blank">注册</a></li>
</ul>
</div>
</div>
<div class="clearfix"></div>
</div>
</div>
</div>
<div class="container">
<div class="row">
<div class="baike_top padding2">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5"><a href="/Guest/Baike/"><img class="img-responsive" src='<%Call.Label("{$LogoUrl/}"); %>' alt="百科_<%Call.Label("{$SiteName/}"); %>" /></a></div>
<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 padding5">
<asp:TextBox ID="txtAsk" CssClass="form-control search_input" showHelp="true"  autocomplete="off" runat="server"></asp:TextBox>
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 padding5">
<asp:Button runat="server" ID="btnEnter" Text="进入词条" onclick="btnEnter_Click"  class="btn btn-default" AccessKey=" " /> 
<asp:Button runat="server" ID="btnSearch" Text="搜索词条"   onclick="btnSearch_Click" class="btn btn-default" /> 
</div>
<div class="clearfix"></div>
</div>
</div>
</div>
<div class="baike_nav">
<div class="navbar navbar-static-top" role="navigation" id="baike_scolls">
<div class="container">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
<span class="sr-only">移动下拉</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand visible-xs" href="/Baike">婚姻百科</a>
</div>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav">
<li class="active"><a href="/Baike">百科首页</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("自然") %>">自然</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("文化") %>">文化</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("物理") %>">地理</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("历史") %>">历史</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("生活") %>">生活</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("社会") %>">社会</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("艺术") %>">艺术</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("人物") %>">人物</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("经济") %>">经济</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("科技") %>">科技</a></li>
<li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("体育") %>">体育</a></li>
</ul>
</div>
</div>
</div><div class="clearfix"></div>
</div>
<div class="container">
<ol class="breadcrumb margin_top10">
    <li>您的位置：<a href="/">网站首页</a></li>
    <li><a href="/Baike" target="_self">百科中心</a></li>
    <li><a href="CreatBaike.aspx">创建词条</a></li>
</ol>
<p><asp:Label runat="server" ID="lblTittle">百科</asp:Label></p>
<div style="border-top: 2px solid #3171af; padding: 25px 0 10px 0;">
<asp:Repeater runat="server" ID="repSearch">
<ItemTemplate>
<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tbody>
<tr>
<td class="f">
<h2><a target="_blank" href="Details.aspx?action=new&soure=user&tittle=<%# 
Server.HtmlEncode(Server.UrlEncode(Eval("Tittle").ToString()))%>"><%#Server.HtmlEncode(Eval("Tittle").ToString())%></a>
</h2>
<div class="abstract"><%#NoHTML(Eval("Contents").ToString())%>...</div>
<div class="fs"><%#Eval("AddTime","{0:yyyy-MM-dd}")%>
<a class="lkgn" target="_blank" href="javascript:void(0)"><%#Eval("UserName")%></a></div>
</td>
</tr>
</tbody>
</table>
<br>
</ItemTemplate>
</asp:Repeater>
<div style="text-align:center">共<asp:Label ID="AllNum" runat="server" Text=""></asp:Label>条记录
<asp:Label runat="server" ID="Toppage"></asp:Label>
<asp:Label runat="server" ID="Nextpage"></asp:Label>
<asp:Label runat="server" ID="Downpage"></asp:Label>
<asp:Label runat="server" ID="Endpage"></asp:Label>
页次：<asp:Label ID="Nowpage" runat="server"></asp:Label>/<asp:Label ID="PageSize" runat="server" ></asp:Label>页<asp:Label ID="Lable1" runat="server"></asp:Label>条记录/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList>页
</div>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</form> 
</body>
</html>