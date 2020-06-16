<%@ page language="C#" autoeventwireup="true" inherits="Guest_AskAdd, App_Web_3jie2zxp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>在线提问_<%Call.Label("{$SiteName/}"); %>问答</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
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
<form id="form1" runat="server">
<div class="container">
<div class="ask_logo">
<div class="row">
<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ask_logo_l"><a href="/Ask"><img src='<%Call.Label("{$LogoUrl/}"); %>' alt="<%Call.Label("{$SiteName/}"); %>留言系统" /></a></div>
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
<ol class="breadcrumb">  
<li>您的位置：<a href="/">网站首页</a></li>
<li><a href="/Ask">问答中心</a></li>
<li class="active">我要提问</li>
</ol>
<div role="form">
<div class="form-group">
<label for="txtContent">请将您的疑问告诉我们吧：</label>
<asp:TextBox runat="server" ID="txtContent" CssClass="form-control" TextMode="MultiLine" Rows="10" ></asp:TextBox>
</div>
<div class="form-group">
<label for="txtSupplyment">补充问题(选填)：</label>
<asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
</div>
<div class="form-group">
<label for="exampleInputFile">问题分类：</label>
<asp:DropDownList ID="ddlCate" CssClass="form-control" style="display:inline-table;" runat="server" Width="200px" OnSelectedIndexChanged="ddlCate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
<asp:DropDownList ID="ddlGrade" CssClass="form-control" style="display:inline-table;" runat="server" Width="200px"></asp:DropDownList>
<div class="checkbox pull-right">
<label style="margin-right:10px;"><asp:CheckBox ID="isNi" runat="server" /> 匿名</label>
悬赏分：
<asp:DropDownList ID="ddlScore" runat="server" CssClass="form-control" style="display:inline-table;" Width="100px">
<asp:ListItem>0</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>15</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
<asp:ListItem>30</asp:ListItem>
<asp:ListItem>40</asp:ListItem>
<asp:ListItem>50</asp:ListItem>
<asp:ListItem>60</asp:ListItem>
<asp:ListItem>70</asp:ListItem>
<asp:ListItem>80</asp:ListItem>
<asp:ListItem>90</asp:ListItem>
<asp:ListItem>100</asp:ListItem>
</asp:DropDownList>
</div>
</div>
<div id="fix" class="form-group" runat="server" visible="false">
求助对象:<a href="/ShowList.aspx?id=<%=fixID %>" target="_blank"><%=fixName %></a>
<a href="javascript:void(0)" onclick="removeFix()"><img src="/App_Themes/Guest/images/layer_close.png" style="width:14px;height:13px;" alt=""/></a>
</div>
<div class="text-center">
<asp:Button runat="server" ID="btnSubmit" Text="提交问题" CssClass="btn btn-default" OnClick="btnSubmit_Click" />
</div>
</div>
</div>
<asp:HiddenField runat="server" ID="hfid" />
</form>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</body>
</html>
<script>
    function removeFix() {
        if (confirm("你确定要删除求助对象？")) {
            document.getElementById("fix").style.display = "none";
        }
    }
</script>