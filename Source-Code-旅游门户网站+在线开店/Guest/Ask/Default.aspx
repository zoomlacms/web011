<%@ page language="C#" autoeventwireup="true" inherits="Guestbook_Ask, App_Web_3jie2zxp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>问答中心首页</title>
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
<script src="/Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>    
</head>
<body>
<div id="ask_top">
<div class="container">
<div class="row">
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
<div class="ask_top_l">
<ul class="list-inline">
<li><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('{$SiteURL/}');" href="javascript:;">设为首页</a></li>
<li><a href="javascript:;" id="dropdownMenu1" data-toggle="dropdown"><%Call.Label("{$SiteName/}");%><span class="caret"></span></a>
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
<form id="form2" runat="server">
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
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li class="active"><a href="/Ask">问答首页</a></li>
<li><a href="/Guest/Ask/List.aspx" target="_blank">问题库</a></li>
<li><a href="/Guest/Ask/Add.aspx" target="_blank">在线咨询</a></li>
<li><a href="/Guest/Ask/Star.aspx" target="_blank">问答专家</a></li>
<li><a href="/Guest/Ask/MyAskList.aspx" target="_blank">我的提问</a></li>
<li><a href="/Guest/Ask/MyAnswerlist.aspx" target="_blank">我的问答</a></li>
</ul>
</div>
</div>
</div>
<div class="container">
<div class="row">
<div class="padding5">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding2 margin_top20">
<div class="ask_class">
<div class="ask_class_t"><a href="Classification.aspx" target="_blank">更多>></a>问题分类</div>
<table class="table table-bordered" id="ask_class_table">
<asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate>
<tr>
<td class="ask_class_tl"><a href="Classification.aspx?GradeID=<%#Eval("GradeID") %>" title="<%#Eval("GradeName") %>"><%#Eval("GradeName") %></a></td>
<td class="ask_class_tr">
<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate><a href="Classification.aspx?ParentID=<%#Eval("ParentID") %>&GradeID=<%#Eval("GradeID") %>" title="<%#Eval("GradeName") %>"><%#Eval("GradeName") %></a></ItemTemplate>
</asp:Repeater>
</td>
</tr>
</ItemTemplate>
</asp:Repeater>
</table>
</div>
</div>
<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 padding2 margin_top20">
<div class="ask_Resolved">
<div class="ask_Resolved_t"><span><i class="fa fa-heart"></i>我们向您承诺：10分钟内给您满意的答复</span>已解决问题</div>
<div class="ask_Resolved_c">
<div class="row">
<div class="padding10">
<div>
<div class="ask_Resolved_cr">
<ul class="list-unstyled">
<asp:Repeater runat="server" ID="Repeater6"><ItemTemplate>                                            
<li class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
<strong><%#getanswers(Eval("ID", "{0}"))%>回答</strong>
<a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),12) %></a>
<span>[<a target="_self" href="List.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%></a>]</span>
</li>
</ItemTemplate></asp:Repeater>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="ask_hotsearch">
<div class="ask_hotsearch_t">热门搜索</div>
<div id="know">
<asp:Repeater runat="server" ID="Repeater11">
<ItemTemplate>
<a class="btn btn-warning btn_hot" target="_self" href="List.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%><span></span></a>
</ItemTemplate>
</asp:Repeater>
</div>
<div class="ask_hotsearch_c">
<div class="row">
<ul class="list-unstyled">
<li class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
<div class="ask_hotsearch_ct"><span>电脑装机</span></div>
<div class="clearfix"></div>
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出指定问题分类最新问题\" ShowNum=\"4\" TitleNum=\"30\" QueType=\"402\" /}");%>
<div class="clearfix"></div>
</ul>
</li>
<li class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
<div class="ask_hotsearch_ct"><span>体育/运动</span></div>
<div class="clearfix"></div>
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出指定问题分类最新问题\" ShowNum=\"4\" TitleNum=\"30\" QueType=\"392\" /}");%>
<div class="clearfix"></div>
</ul>
</li>
<li class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
<div class="ask_hotsearch_ct"><span>商业/理财</span></div>
<div class="clearfix"></div>
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出指定问题分类最新问题\" ShowNum=\"4\" TitleNum=\"30\" QueType=\"394\" /}");%>
<div class="clearfix"></div>
</ul>
</li>
</ul>
</div>
</div>
</div>
<div class="ask_Wait">
<div class="ask_Wait_t"><a href="/Guest/ask/MoreProblems.aspx?type=1" target="_blank">更多<i class="fa fa-caret-right"></i></a>待解决问题</div>
<div class="ask_wait_c">
<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
<li class="active"><a href="#ask_wait_c1" role="tab" data-toggle="tab">电脑装机</a></li>
<li><a href="#ask_wait_c2" role="tab" data-toggle="tab">硬件</a></li>
<li><a href="#ask_wait_c3" role="tab" data-toggle="tab">软件</a></li>
<li><a href="#ask_wait_c4" role="tab" data-toggle="tab">反病毒</a></li>
<li><a href="#ask_wait_c5" role="tab" data-toggle="tab">互联网</a></li>
</ul>
<!-- Tab panes -->
<div class="tab-content">
<div class="tab-pane active" id="ask_wait_c1">
<div class="ask_wait_cr">
<div class="row">
<div class="padding10">
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出待解决问题\" TitleNum=\"38\" ShowNum=\"12\" Type=\"402\" /}");%>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
</div>
<div class="tab-pane" id="ask_wait_c2">
<div class="ask_wait_cr">
<div class="row">
<div class="padding10">
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出待解决问题\" TitleNum=\"38\" ShowNum=\"6\" Type=\"403\" /}");%>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
</div>
<div class="tab-pane" id="ask_wait_c3">
<div class="ask_wait_cr">
<div class="row">
<div class="padding10">
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出待解决问题\" TitleNum=\"38\" ShowNum=\"6\" Type=\"404\" /}");%>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
</div>
<div class="tab-pane" id="ask_wait_c4">
<div class="ask_wait_cr">
<div class="row">
<div class="padding10">
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出待解决问题\" TitleNum=\"38\" ShowNum=\"6\" Type=\"405\" /}");%>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
</div>
<div class="tab-pane" id="ask_wait_c5">
<div class="ask_wait_cr">
<div class="row">
<div class="padding10">
<ul class="list-unstyled">
<%Call.Label("{ZL.Label id=\"输出待解决问题\" TitleNum=\"38\" ShowNum=\"6\" Type=\"406\" /}");%>
<div class="clearfix"></div>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>


<div class="hidden">
<div>最佳回答采纳率:<%=getAdoption() %> 已解决问题数:<% =getSolvedCount() %> 待解决问题数:<% =getSolvingCount() %></div>
<div>
积分排行榜
<asp:Repeater ID="Repeater10" runat="server"  OnItemDataBound="Repeater10_ItemDataBound">
<ItemTemplate>
<img align="absmiddle" src="/App_Themes/Guest/images/num1.gif" id="ph" runat="server"><a target="_blank" href="/ShowList.aspx?id=<%#Eval("UserID") %>"><%#Eval("UserName") %></a><img align="absmiddle" src="/App_Themes/Guest/images/up.gif"><%#Eval("GuestScore") %>
</ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="Repeater9" runat="server" OnItemDataBound="Repeater9_ItemDataBound">
<ItemTemplate>
<img align="absmiddle" src="/App_Themes/Guest/images/num1.gif" id="ph" runat="server"> <a target="_blank" href="/ShowList.aspx?id=<%#Eval("UserID") %>"><%#Eval("UserName") %></a></span><img align="absmiddle" src="/App_Themes/Guest/images/up.gif"><%#Eval("GuestScore") %>
</ItemTemplate>
</asp:Repeater>
</div>
<div>
精彩推荐的问题
<asp:Repeater ID="Repeater3" runat="server"><ItemTemplate><a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),25) %></a><span class="lei">[<a target="_self" href="AskList.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%></a>]<%#getcount(Eval("ID", "{0}"))%>回答</span></ItemTemplate></asp:Repeater>
大家都在问什么
<asp:Repeater ID="Repeater4" runat="server"><ItemTemplate><a target="_self" href="MyAnswer.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),25) %></a>&nbsp;[<a target="_self" href="List.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%></a>]<%#getanswers(Eval("ID", "{0}"))%>回答</ItemTemplate></asp:Repeater>                       
悬赏求答案的问题
<asp:Repeater runat="server" ID="Repeater5"><ItemTemplate><img  alt=" " src="/App_Themes/Guest/images/TB2.gif" /><%#Eval("Score")%><a target="_self"  href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),25) %>&nbsp;</a>[<a target="_self" href="AskList.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%>]</a><%#getanswers(Eval("ID", "{0}"))%>回答</ItemTemplate></asp:Repeater>
<asp:Repeater runat="server" ID="Repeater7" OnItemDataBound="Repeater7_ItemDataBound">
<ItemTemplate> 
<div class="rb_zj_mm">
<div class="rb_zj_mmc">
<div class='zjimg'><img src="/Images/InitHead.gif" width='50px' height='50px' /></div>
<div class='jbzl'>
<a href="/ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName")%></a><br/>
回答数:<%#getanswer(Eval("UserID","{0}"))%><br />
提问数:<%#getask(Eval("UserID","{0}"))%>
</div>
精选解答:
<a class="button1" id="fix" runat="server">向TA提问</a>
<asp:Repeater runat="server" ID="Repeater8"><ItemTemplate>                         
<ul>
<li><a href="SearchDetails.aspx?ID=<%#Eval("ID")%>" target='_blank' title=" "><%#Eval("Qcontent")%></a></li>
</ul></ItemTemplate></asp:Repeater>
</div>
</div>
</ItemTemplate>
</asp:Repeater>                 
</div>
</div>
<script>
function showtop(type) {
    if (type == 'week') {
        document.getElementById("weektab").className = "on";
        document.getElementById("alltab").className = "";
        document.getElementById("weektop").style.display = "";
        document.getElementById("alltop").style.display = "none";
    } else {
        document.getElementById("weektab").className = "";
        document.getElementById("alltab").className = "on";
        document.getElementById("weektop").style.display = "none";
        document.getElementById("alltop").style.display = "";
    }
}
</script>  
<asp:HiddenField runat="server" ID="hfid" />
</form>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</body>
</html>
<script type="text/javascript">
    function supplyment() {
        var div = document.getElementById("divSupplyment");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
        else {
            div.style.display = "none";
        }
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