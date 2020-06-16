<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="manage_GuestBook_BkAlter, App_Web_txhf3cqq" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title> 修改-<%Call.Label("{$SiteName/}"); %>百科</title> 
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
<link href="/App_Themes/Guest/editor.css" rel="stylesheet" type="text/css" />
<script src="/JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/base.js"></script>
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
<li style="<%=getstyles()%>"><a href="/User/Login.aspx?ReturnUrl=/guest" target="_blank">登录</a>|<a href="/User/Register.aspx?ReturnUrl=/Guest" target="_blank">注册</a></li>
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
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5"><a href="/Baike"><img class="img-responsive" src='<%Call.Label("{$LogoUrl/}"); %>' alt="百科_<%Call.Label("{$SiteName/}"); %>" /></a></div>
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
    <li class="active">修改词条</li>
</ol>
<div><h1><asp:Label runat="server" ID="lblTittle" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3171AF">百科</asp:Label></h1></div>
<script type="text/javascript">
    var Fe = Fe || { version: "20080809", emptyFn: function () { } };
    Fe.G = function () {
        for (var A = [], B = arguments.length - 1; B > -1; B--) {
            var C = arguments[B]; A[B] = null;
            if (typeof C == "object" && C && C.dom) { A[B] = C.dom } else { if ((typeof C == "object" && C && C.tagName) || C == window || C == document) { A[B] = C } else { if (typeof C == "string" && (C = document.getElementById(C))) { A[B] = C } } }
        } return A.length < 2 ? A[0] : A
    }; Fe.on = function (C, B, A) {
        if (!(C = Fe.G(C))) { return C } B = B.replace(/^on/, "").toLowerCase();
        if (C.attachEvent) {
            C[B + A] = function () { A.call(C, window.event) };
            C.attachEvent("on" + B, C[B + A])
        } else { C.addEventListener(B, A, false) } return C
    };
    Fe.un = function (C, B, A) { if (!(C = Fe.G(C))) { return C } B = B.replace(/^on/, "").toLowerCase(); if (C.attachEvent) { C.detachEvent("on" + B, C[B + A]); C[B + A] = null } else { C.removeEventListener(B, A, false) } return C };
    var G_HIBAR = (function () {
        var H = document, F, E, C, B = 3; function A(K, I, J) {
            K.style.display = C ? "none" : "block";
            K.style.left = I + "px"; K.style.top = J + "px"
        }
        function G(I) { C && G_HIBAR(I) }
        function D() { F = null; E = null; Fe.un(window, "unload", D) } Fe.on(window, "resize", G);
        Fe.on(document, "click", G); Fe.on(window, "unload", D);
        return function (J) {
            (J || window.event).cancelBubble = true; F = F || H.getElementById("usrbar");
            E = E || H.getElementById("nav_extra");
            var K = H.getElementById("my_home"), L = F.scrollHeight, I = 0;
            do { I += K.offsetLeft } while (K = K.offsetParent);
            I = I - 6;
            A(E, I, B);
            Fe.G("usrbar").scrollWidth; C = !C
        }
    })();
</script>
<style type="text/css">
.popb2{ padding:10px; line-height: 22px;font-size: 14px;width: 280px;height: 230px;margin: 0 auto;}
#rempassItem{font-size:12px;color:#F00;display:none;}
.regButton{padding: 2px;height: 25px;width: 140px;margin: 10px 60px;}
.f12{font-size: 12px;}
#rgHandle{text-align: center;font-weight: bold;}
.loginItem{width: 140px;}
</style>
<script src="../../JS/Bkpopup.js" type="text/javascript"></script>
<script type="text/javascript">            wikiConflict.isEdit = 1;</script>
<div id="inputShowSummaryDiv" style="padding: 0 0 10px; display: none;">
<div id="canEditSummary" style="display: none">
</div>
<div id="cardSummary">
</div>
</div>
<div id="inputShowMainInfoDiv" style="display: none;">
<div id="canEditMainInfo">
</div>
<div id="inputMainInfoDivContent">
</div>
</div>
<div style="position: relative">
<div id="loading">
</div>
<!-- 工具栏 --><div style=" position:absolute; top:6px; left:10px;z-index:99999; display:block; width:63px; height:23px; background:#EBEBEB;"><asp:LinkButton ID="lbt_Save" runat="server" OnClick="lbt_Save_Click" Style="display:block; width:65px; height:25px; text-align:center; line-height:25px;">存为草稿</asp:LinkButton></div>
<div id="toolsHolder">
<div id="tools">
<div id="toolbar">
</div>
<div class="bg">
</div>
</div>
</div>
<div id="EditorHolder" runat="server">
<div class="tangram_editor_container" style="height: 390px">
</div>
</div>
 <div class="tip">(不超过20000字，如有疑问请查看<a href="#">使用帮助</a>)</div>
<asp:TextBox runat="server" TextMode="MultiLine" ID="code" name="message" Style="display: none;"></asp:TextBox>
<span class="gray">
<input type="hidden" id="partContentNum" name="partContentNum" value="11092">
<input type="hidden" id="curPicNum" name="curPicNum" value="13">
<script type='text/javascript'>
    var g_pcNum = G("partContentNum").value;
    function setPicNum() {
        if (editor) { editor.maxPicNum = G("curPicNum").value; }
    }
    Fe.on(window, "load", setPicNum);
</script>
</span>
</div>
<input id="lemmaclass" name="lemmaclass" value="法国,政坛,总统,法兰西第五共和国" type="hidden">
<script>            var templateGuide = templateGuide || {}; templateGuide.textEditType = 'part'</script>
<div class="btn">
<input type="hidden" value=" 提 交 " name="editlemma">
</div>
<div>
<div>
<div class="tip">参考资料</div>
<div><asp:TextBox runat="server" ID="txtReference" CssClass="form-control" TextMode="MultiLine" Height="80"></asp:TextBox></div>
<div><div class="tip">开放分类</div></div>
<div><asp:TextBox runat="server" ID="txtBtype" CssClass="form-control" TextMode="MultiLine" Height="80"></asp:TextBox></div>
<div><div class="tip">扩展阅读</div></div>
<div><asp:TextBox runat="server" ID="txtExtend" CssClass="form-control" TextMode="MultiLine" Height="80"></asp:TextBox></div>
<div class="tip">修改原因</div>              
<div><asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" TextMode="MultiLine" Height="80"></asp:TextBox></div>
<div style="display: none;" id="divSupplyment">
<asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine"
Width="500" Height="120"></asp:TextBox></div> 
<div class="clear"> </div>
</div>     
<div>
<asp:Button runat="server" ID="btnSubmit" Text="提交" CssClass="btn btn-primary" OnClick="btnSubmit_Click"  OnClientClick="getCode()"/>
</div>
<div class="clearfix"></div>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</form>
<%--<script src="../JS/Bkcommon.js" type="text/javascript"></script>
<script src="../JS/Bkcore.js" type="text/javascript"></script>--%>
</body>
<div class="bd-menu-inserttable" id="bdMenuInsertTable" role="menu">
<div class="bd-dimension-picker" id="pickerHolder">
<div id="pickerArea">
<div class="bd-dimension-picker-unhighlighted" style="width: 10em; height: 10em;">
</div>
<div class="bd-dimension-picker-highlighted" style="width: 0em; height: 0em;" id="pickerHighlighted">
</div>
</div>
<div class="bd-dimension-picker-status">
<span style="float: left; font-size: 12px" id="pickerStatus"><span id="columnCount">
0</span>列 x <span id="rowCount">0</span>行</span> <span style="float: right;"><a href="#" onclick="setTablePanel.insertMoreTable();return false;" id="insertMoreTable"
style="text-decoration: none; font-size: 12px;">插入更多</a></span>
</div>
</div>
</div>
<br clear="all"/>
<script src="../../js/bkcommon.js" type="text/javascript"></script>
<script src="../../js/bkcore.js" type="text/javascript"></script>
<script type="text/javascript">
    function getCode() {
        //$(window.frames["tangram_editor_iframe_MZ__w"].document).find("#testId").html()
        //var catalog = "";
        var code = document.getElementById("code");
        //            var arr = document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body.getElementsByTagName("h2");
        //            //alert(arr);
        //            var input_file = document.createElement("input")
        //            input_file.setAttribute("type", "button");
        //            input_file.setAttribute("size", "50");
        //            input_file.setAttribute("name", "input1");

        //            for (var i = 0; i < arr.length; i++) {
        //                var aNew = document.createElement("a");
        //                aNew.setAttribute("name", "a" + i);
        //                aNew.setAttribute("id", "a" + i);
        //                //                var alinks = arr[i].getElementsByTagName("a");
        //                //                for (var j = 0; j < alinks.length; j++) {
        //                //                    aNew.removeChild(alinks[0]);
        //                //                }
        //                arr[i].appendChild(aNew);
        //                //catalog = catalog + "<li><a href=\"#a" + i + "\">" + arr[i].firstChild + "</a></li>";
        //                catalog = catalog + "<a href=\"#a" + i + "\">" + arr[i].firstChild.data + "</a><br/>";
        //            }
        //            //alert(arr[0].getElementsByTagName("a"));
        //            //alert(input_file);
        //            //alert(arr[0].html());
        //            //            for (var i = 0; i < arr.Length; i++) {
        //            //                alert(arr[i].text());
        //            //            }   
        var content = $(document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body).html();
        //            document.getElementById("code").value = "<div>目录<br/>" + catalog + "</div>" + content;
        document.getElementById("code").value = content;
    }
</script>
</html>