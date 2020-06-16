<%@ page language="C#" autoeventwireup="true" inherits="Guestbook_BkDetails, App_Web_txhf3cqq" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>逐浪百科</title> 
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
<script>
    wikiConflict.isEdit = 1;
    var templateGuide = templateGuide || {}; templateGuide.textEditType = 'part';
    wikiConflict.isEdit = 1;
</script>
<script type="text/javascript">
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
    <li class="active">词条详情</li>
</ol>
<div class="yulian">
    <div class="yl_items it">
        <h1><span class="right_b">
            <asp:LinkButton runat="server" ID="Edit"
                Text="编辑本词条" OnClick="Edit_Click" Font-Size="Medium"></asp:LinkButton></span>
            <asp:Label runat="server" ID="lblTittle" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3171AF"></asp:Label>
        </h1>
    </div>

    <div id="inputShowSummaryDiv" style="padding: 0 0 10px; display: none;">
        <div id="canEditSummary" style="display: none"></div>
        <div id="cardSummary"></div>
    </div>
    <div id="inputShowMainInfoDiv" style="display: none;">
        <div id="canEditMainInfo"></div>
        <div id="inputMainInfoDivContent"></div>
    </div>
    <div style="position: relative;">
        <div id="loading"></div>
        <div runat="server" id="code" class="x_input">
        </div>
    </div>
    <div class="yl_items its">
        <div class="item first">
            <div class="itme_tit"><strong>参考资料</strong></div>
            <div runat="server" id="txtReference" class="x_input"></div>
        </div>
        <div class="item">
            <div class="itme_tit"><strong>开放分类</strong></div>
            <div runat="server" id="txtBtype" class="x_input"></div>
        </div>
        <div class="item">
            <div class="itme_tit"><strong>扩展阅读</strong></div>
            <div runat="server" id="txtExtend" class="x_input"></div>
        </div>
        <div id="editSpan" class="item" runat="server">
            <div class="itme_tit"><strong>合作编辑</strong></div>
            <div runat="server" id="editman" class="x_input"></div>
        </div>
        <span style="float: right; padding-right: 50px"><asp:LinkButton ID="lbtFavorite" runat="server" OnClick="lbtFavorite_Click">收藏</asp:LinkButton></span>
        <div style="display: none;" id="divSupplyment">
            <asp:TextBox runat="server" ID="txtSupplyment" CssClass="form-control" TextMode="MultiLine" Width="500" Height="120"></asp:TextBox>
        </div>
    </div>
</div>
<div class="right baike_border">
    <div id="userinfo" runat="server" style="display: none"><asp:Label runat="server" ID="username"></asp:Label>----实习小编</div>
    <div class="aa">
        <div class="right-t"><span style="color: Black; font-size: medium">词条统计</span></div>
        <ul>
            <li>浏览次数：</li>
            <li>编辑次数：<asp:Label runat="server" ID="edittime"></asp:Label></li>
            <li>最近更新：<asp:Label runat="server" ID="updatetimes"></asp:Label></li>
            <li>创建者：<asp:Label runat="server" ID="creatbaike"></asp:Label></li>
        </ul>
    </div>
    <div class="aa">
        <div class="right-t"><span style="color: Black; font-size: medium">贡献光荣榜</span></div>
        <ul>
            <asp:Repeater runat="server" ID="Contribution">
                <ItemTemplate>
                    <li><span style="float: right"><a href="Details.aspx?tittle=<%#Eval("Tittle")%>&username=<%#Eval("UserName")%>&soure=baikeedit">版本</a></span><%#Eval("UserName")%></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="aa">
        <div class="right-t"><span style="color: Black; font-size: medium">最新动态</span></div>
        <asp:Repeater runat="server" ID="Latestnews">
            <ItemTemplate></ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div class="claerfix"></div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</form>
<script type="text/javascript">
	$(function () {
		getCode();
	});
	function getCode() {
		//$(window.frames["tangram_editor_iframe_MZ__w"].document).find("#testId").html()
		var catalog = "";
		var code = document.getElementById("code");
		//var content = $(document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body).html();
		//            var content = document.getElementById('code').html();
		//alert(content);
		var arr = document.getElementById('code').getElementsByTagName("h2");
		for (var i = 0; i < arr.length; i++) {
			var aNew = document.createElement("a");
			aNew.setAttribute("name", "a" + i);
			aNew.setAttribute("id", "a" + i);
			arr[i].appendChild(aNew);
			catalog = catalog + "<a href=\"#a" + i + "\">" + arr[i].firstChild.data + "</a><br/>";
		}
		var content = document.getElementById('code').innerHTML;
		document.getElementById("code").innerHTML = "<div class='itme_tit'><strong>目录</strong><br/>" + catalog + "</div>" + content;
	}
</script>
</body>
</html>