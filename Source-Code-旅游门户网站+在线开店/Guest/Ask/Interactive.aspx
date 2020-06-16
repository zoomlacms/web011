<%@ page language="C#" autoeventwireup="true" inherits="Guest_Interactive, App_Web_3jie2zxp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>我的提问-<%Call.Label("{$SiteName/}"); %>问答</title>
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
<script src="/Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script type="text/javascript"  charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>
</head>
<body>
<div id="ask_top">
<div class="container">
<div class="row">
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
<div class="ask_top_l">
<ul class="list-inline">
<li><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('{$SiteURL/}');" href="javascript:;">设为首页</a></li>
<li><a href="/">手机网</a></li>
<li><a href="/">Pad版</a></li>
<li><a href="javascript:;" hrehtype="button" id="dropdownMenu1" data-toggle="dropdown"><%Call.Label("{$SiteName/}");%><span class="caret"></span></a>
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
<li><%Call.Label("{ZL.Label id=\"首页登录状态\"/}"); %></li>
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
<a class="navbar-brand" href="/"><%Call.Label("{$SiteName/}"); %></a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="/Ask">问答首页</a></li>
<li><a href="/Guest/Ask/List.aspx" target="_blank">问题库</a></li>
<li><a href="/Guest/Ask/Add.aspx" target="_blank">在线提问</a></li>
<li><a href="/Guest/Ask/Star.aspx" target="_blank">问答专家</a></li>
<li class="active"><a href="/Guest/Ask/MyAskList.aspx" target="_blank">我的提问</a></li>
<li><a href="/Guest/Ask/MyAnswerlist.aspx" target="_blank">我的问答</a></li>
</ul>
</div>
</div>
</div>
<div class="container">
<ol class="breadcrumb">  
<li>您的位置：<a href="/">网站首页</a></li>
<li><a href="/Ask">问答中心</a></li>
<li><a href="MyAskList.aspx?QueType=">我的提问</a></li>
<li class="active">我的提问互动详情</li>
</ol>
<div class="row">
<div class="padding10">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 padding5">

<div class="ask_detial">
<div class="ask_detial_t"><span>提问问题</span><div class="clearfix"></div></div>
<div class="ask_detial_tc">
<ul class="list-unstyled">
<li><span>问题：</span><asp:Label ID="question" runat="server"></asp:Label></li>
<li><span>提问者：</span><asp:Label  ID="username" runat="server"></asp:Label> <span>提问日期：</span><asp:Label  ID="addtime" runat="server"></asp:Label></li>
</ul>
<div class="row">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
</div>

<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
</div>
</div>
</div>
<div class="ask_detial_t"><span>补充问题</span><div class="clearfix"></div></div>
<div class="ask_detial_tc">
<asp:Label ID="supment" runat="server"></asp:Label>
<div class="asl_detial_tb">
<asp:TextBox ID="Txtsupment" runat="server" TextMode="MultiLine" Rows="6" CssClass="form-control" ></asp:TextBox>
<asp:Button ID="Button2" OnClick="Button2_Click" Text="提交" runat="server" CssClass="btn btn-default" />
</div>
</div>

<div class="ask_detial_t"><span>问题回答</span><div class="clearfix"></div></div>
<div class="ask_detial_th">
<div>
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
<ItemTemplate>
<div class="ask_detial_tl">
<div class="ask_detial_tlt"><span class="pull-right"><%# Eval("AddTime")%></span><asp:Label id="Isname" runat="server"><a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName") %></a></asp:Label></div>
<div class="ask_detial_tlc">
<div class="ask_detial_tlch"><span class="ask_detial_hui">回答：</span><%# Eval("Content")%></div>
<asp:Repeater runat="server" ID="Repeater2"  OnItemDataBound="Repeater2_ItemDataBound">
<ItemTemplate>
<div>
<div><span class="ask_detial_zhui">追问：</span><%#Eval("Content")%></div>
<asp:Repeater runat="server" ID="Repeater3">
<ItemTemplate> 
<div>回答：<%# Eval("Content")%></div>
</ItemTemplate>
</asp:Repeater>  
</div>
</ItemTemplate>
</asp:Repeater>
<div class="ask_detial_tui">
<div><%#getstatus(Eval("Status","{0}"))%></div>
<asp:Panel  ID="ReplyBtn1" CssClass="pull-left" runat="server" ><input type="button" class="btn btn-warning btn-sm" value="继续追问" onclick="supplyment(<%# Eval("ID")%>)" /></asp:Panel>
<asp:LinkButton ID="recommand" runat="server" CommandName="recomand" CssClass="btn btn-success btn-sm pull-right"  CommandArgument='<%#Eval("ID")%>'  OnClientClick="javascript:return confirm('你确认推荐吗?')">推荐为满意答案</asp:LinkButton>
</div><div class="clearfix"></div>
</div>
</div>
</ItemTemplate>
</asp:Repeater>
<div style="display:none;" id="divSupplyment">
<asp:HiddenField ID="Rid" runat="server" Value="" />
<asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox>
<asp:Button runat="server" ID="btnSubmit" Text="提交追问" CssClass="btn btn-default" OnClick="btnSubmit_Click" />
</div>
</div>
</div>
<span class="questions" id="supdiv" runat="server" ></span>
<div id="main" class="rg_inout">     
</div>
</div>
</div>
</div>
</div>
</div>
<div class="hidden">
<div class="topright"> 
<a href="/">返回首页</a>
<a href="javascript:void(0)" onclick="SetHomepage()">设为首页</a>
<a href="javascript:void(0)" onclick="addfavorite()">收藏本站</a></div> 
<span  style="<%=getstyle()%>"> 您好！<a href="/user/" target="_blank"><asp:Label runat="server"  ID="user"></asp:Label></a> 欢迎来<%Call.Label("{$SiteName/}"); %>问答系统！ [<a href="<%=ResolveUrl("~/User/logout.aspx") %>?url=/Guest/Default.aspx">退出登录</a>]</span> 
<span  style="<%=getstyles()%>">[<a  href="/user/Login.aspx?ReturnUrl=/guest/">请登录</a>] [<a  href="/user/register.aspx?ReturnUrl=/guest/">免费注册</a>]</span>
</div>
<div class="hidden">
<div class="h_top">
<div class="logo">
<a href="/guest/Ask/Default.aspx" title="问答系统" target="_top">
<img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>问答系统" />
</a>
</div>
<div class="userbar">
<div class='hyn'  style="<%=getstyle()%>"> 
<a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a>
</div>
<hr />
</div>
<div class="clr"></div>
</div>
<div class="h_mid">
<div class="h_mid_l"></div>
<div id="tdh" class="h_mid_m"> 
<ul>
<li class="on"><a title="问答首页" href="Default.aspx">问答首页</a> </li>
 <!-- <li><a title="知识专题" href="Topic.aspx">知识专题</a></li>-->
<li><a title="问答之星" href="Star.aspx">问答之星</a></li>
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
<asp:HiddenField  runat="server" ID="hfsid"/>
<asp:HiddenField  runat="server" ID="hfstatus"/>
</form>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</body>
</html>
<script type="text/javascript">
    function show() {
        var div = document.getElementById("show");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
        // else {div.style.display = "none";} 
    }
    function ViewQes()
    {
        if($("#viewQ").css("display")=="none")
            $("#viewQ").css("display","");
        else
            $("#viewQ").css("display","none");
    }
    function supplyment(id) {
        document.getElementById("Rid").value = id; 
        var div = document.getElementById("divSupplyment");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
        else {
            div.style.display = "none";
        }
    }
    function Recommend_click(id) {
        document.getElementById("hfstatus").value = id;
	
    }
    function CheckDirty() {
        var oEditor = CKEDITOR.instances.TxtTContent;
        var value = oEditor.getData();
        var TxtTTitle = document.getElementById("TxtTTitle").value;
        var TxtValidateCode = document.getElementById("TxtValidateCode").value;

        if (value == "" || TxtTTitle == "" || TxtValidateCode == "") {
            if (value == "") {
                var obj = document.getElementById("RequiredFieldValidator1");
                obj.innerHTML = "<font color='red'>内容不能为空！</font>";
            }
            else {
                var obj = document.getElementById("RequiredFieldValidator1");
                obj.innerHTML = "";
            }
            if (TxtTTitle == "") {
                var obj2 = document.getElementById("RequiredFieldValidator2");
                obj2.innerHTML = "<font color='red'>留言标题不能为空！</font>";
            }
            else {
                var obj2 = document.getElementById("RequiredFieldValidator2");
                obj2.innerHTML = "";
            }
            if (TxtValidateCode == "") {
                var obj3 = document.getElementById("sp1");
                obj3.innerHTML = "<font color='red'>验证码不能为空！</font>";
            } else {
                var obj3 = document.getElementById("sp1");
                obj3.innerHTML = "";
            }
            return false;
        }
        else {
            var obj = document.getElementById("RequiredFieldValidator1");
            obj.innerHTML = "";
            var obj2 = document.getElementById("RequiredFieldValidator2");
            obj2.innerHTML = "";
            var obj3 = document.getElementById("sp1");
            obj3.innerHTML = "";
            document.getElementById("EBtnSubmit2").click();
        }
    }
</script>