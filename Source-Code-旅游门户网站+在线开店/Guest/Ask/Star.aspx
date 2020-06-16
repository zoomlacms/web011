<%@ page language="C#" autoeventwireup="true" inherits="Guest_AskStar, App_Web_3jie2zxp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8">
<title>问答中心-问答之星</title>
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
<a id="dLabel" data-target="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><asp:Label runat="server"  ID="user"></asp:Label><span class="caret"></span></a>
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
<li style="<%=getstyles()%>"><a href="/User/Login.aspx?ReturnUrl=/guest/" target="_blank">登录</a>|<a href="/User/Register.aspx?ReturnUrl=/Guest/" target="_blank">注册</a></li>
</ul>
</div>
</div>
<div class="clearfix"></div>
</div>
</div>
</div>
<div class="container">
<div class="ask_logo">
<div class="row">
<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ask_logo_l"><a href="/Guest/Ask/Default.aspx"><img src='<%Call.Label("{$LogoUrl/}"); %>' alt="<%Call.Label("{$SiteName/}"); %>留言系统" /></a></div>
<div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 ask_logo_r">
<div class="input-group">
<asp:TextBox runat="server" ID="txtAsk" onmouseover="this.focus()" autocomplete="off" class="form-control" Style="vertical-align: middle;" TabIndex="1"></asp:TextBox>
<div class="input-group-btn">
<asp:Button runat="server" ID="btnAsk" class="btn btn-primary" Text="免费提问" OnClick="btnAsk_Click"/>
<asp:Button runat="server" ID="btnSearch" AccessKey="" class="btn btn-primary" Text="搜索" OnClick="btnSearch_Click"/>
<asp:Button runat="server" ID="btnAnswer" class="btn btn-primary" Text="我要回答" OnClick="btnAnswer_Click" /></div>
</div>
</div>
</div>
</div>
</div>
<div class="navbar navbar-default" role="navigation" id="guest_nav">
<div class="container">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/Guest">留言反馈</a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="/Ask">问答首页</a></li>
<li><a href="/Guest/Ask/List.aspx" target="_blank">问题库</a></li>
<li class="active"><a href="/Guest/Ask/Add.aspx" target="_blank">在线提问</a></li>
<li><a href="/Guest/Ask/Star.aspx" target="_blank">问答专家</a></li>
<li><a href="/Guest/Ask/MyAskList.aspx" target="_blank">我的提问</a></li>
<li><a href="/Guest/Ask/MyAnswerlist.aspx" target="_blank">我的问答</a></li>
</ul>
</div>
</div>
</div>
<div class="container">
<div class="header"> 
<div class="h_top">
<div class="logo">
<a href="/Ask" title="问答系统" target="_top">
<img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>问答系统" />
</a>
</div> 
<div class="clr"></div>
</div>
<div class="h_mid">
<div class="h_mid_l"></div>
<div id="tdh" class="h_mid_m">
<span style="<%=getstyle()%>">   <a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a></span>
<ul>
<li><a title="问答首页" href="/Ask">问答首页</a> </li>
<li class="on"><a title="问答之星" href="../Ask/Star.aspx">问答之星</a></li>
<li><a title="分类大全" href="../Ask/Classification.aspx">分类大全</a></li>
</ul>
</div>
<div class="h_mid_r"></div>
</div>
<div class="clr"></div>
<div class="h_b">
<div class="h_b_l"></div>
<div class="h_b_m">
<div class="question_count">
<span class="count">最佳回答采纳率:</span><span class="adopt" ><%=getAdoption() %></span><br />
<span class="count">已解决问题数:</span><span class="countques" ><% =getSolvedCount() %></span><br />
<span class="count">待解决问题数:</span><span class="countques" ><% =getSolvingCount() %></span>
</div>
<div class="h_b_input">
                
</div>
<div class="sybz">
<a href="http://help.Zoomla.cn/?index/help.html" title="帮助" target="_blank">使用<br />帮助</a>
</div>
<div class="tongji">
<div id="move">
<span class="count">当前在线:</span><%=getLogined() %><br />
<span class="count">注册用户:</span><%=getUserCount() %><br />
</div>
</div>
<div class="clr"></div>
</div>
<div class="h_b_r"></div>
</div>
<div class="clr"></div>
</div>
<div id="main" class="rg_inout">
<h1><span style="float:left; width: 397px;" >您的位置：<a href="/">网站首页</a>>><a href="/Ask">问答中心</a>>><a href="Star.aspx" >问答之星</a></span></h1>
<div class="clear"></div>
<asp:Repeater runat="server" ID="Repeater1" OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate> 
<div class="starR">
<div>
<div class="starRimg">
<img src="../../Images/InitHead.gif" width='100px' height='100px' />
</div>
<div class="starRC">
<ul>
<li style="line-height:40px; float:none;">用户ID:<a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName")%></a></li>
<div class="clear"></div>
<li class="sli1">回答数:<%#getanswer(Eval("UserID","{0}"))%></li>
<li class="sli1">采纳率:<%#getRat(Eval("UserID","{0}"))%></li>
<li class="sli1">提问数:<%#getask(Eval("UserID","{0}"))%></li>
<li class="sli1">问答积分:<%#Eval("GuestScore","{0}")%></li>
</ul>
</div>
<div class="starRW">
精选解答:  <a href='Add.aspx?fix=<%#Eval("UserID") %>' class="button1">向TA提问</a>
<asp:Repeater runat="server" ID="Repeater2">
<ItemTemplate>
<br /><a href="SearchDetails.aspx?ID=<%#Eval("ID")%>" target='_blank' title=" "><%#Eval("Qcontent")%></a>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
<div class="clr"></div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</form>
</body>
</html>