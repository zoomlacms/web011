<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.User_GetPassword, App_Web_alwjrles" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head runat="server">
<meta charset="utf-8">
<title>找回密码-<%:Call.SiteName %></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/App_Themes/UserThem/Responsive.css"rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../JS/ajaxrequest.js"></script>
 </head>
<body onload="onfocus();" class="cms2login">
<form id="form" runat="server">
<div class="navbar navbar-default">
<div class="navbar navbar-static-top" role="navigation" id="scolls">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
<span class="sr-only">移动下拉</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<div class="menua"><a class="navbar-brand" href="#"  onmouseover="showMoreSoftware(this,'softList')" onmouseout="hideMoreSoftware()">登录<%:Call.SiteName %></a></div>
</div>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav">
<li><a href="/" target="_blank">网站首页</a></li>
<li><a href="/Home" target="_blank">能力中心</a></li>
<li><a href="/Index" target="_blank">社区</a></li>
<li><a href="/Ask" target="_blank">问答</a></li>
<li><a href="/Guest" target="_blank">留言</a></li>
<li><a href="/Baike" target="_blank">百科</a></li>
<li><a href="/Office" target="_blank">OA</a></li>
</ul>
</div>
</div>
</div>
<div class="container">
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-md-offset-4">
<div class="main_ldiv">
<h1><span class="glyphicon glyphicon-refresh"></span>输入用户名请求密码重设邮件！</h1>
<ul class="list-unstyled">
<asp:Panel ID="PnlStep1" runat="server" Visible="false">
<li><asp:TextBox ID="TxtUserName" placeholder="输入会员名" runat="server" CssClass="form-control">
</asp:TextBox><asp:RequiredFieldValidator ID="ValrTxtUserName" runat="server" ValidationGroup="find" ErrorMessage="输入会员名！" ControlToValidate="TxtUserName" Display="dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator></li>
<li><div class="form-group" id="trVcodeRegister" runat="server">
<%--<asp:TextBox ID="txtCode" MaxLength="6" placeholder="验证码" runat="server" CssClass="form-control pull-left codestyle" autocomplete="off"></asp:TextBox>--%>
<asp:TextBox ID="txtCode" MaxLength="6" placeholder="验证码" runat="server" CssClass="form-control pull-left codestyle" autocomplete="off"></asp:TextBox>

<span class="pass_code"> <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" ToolTip="点击刷新验证码" CssClass="imgstyle"
onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()" /></span> <span id="codeCheck"></span>
</div>
</li>
<li class="text-center"><asp:Button ID="BtnStep1" runat="server" ValidationGroup="find" CssClass="btn btn-primary" Text="下一步" OnClick="BtnStep1_Click" />
<asp:Button ID="ReTurnLogin_B" runat="server" CssClass="btn btn-primary" Text="返回登录" OnClick="ReTurnLogin_B_Click" />
</li>
</asp:Panel>
<asp:Panel ID="PnlStep2" runat="server" Visible="false">
<li>密码提示问题：<asp:Literal ID="LitQuestion" runat="server"></asp:Literal></li>
<li>密码提示答案：<asp:TextBox ID="TxtAnswer" runat="server" CssClass="form-control" 
></asp:TextBox></li>
<asp:Button ID="BtnStep2" runat="server" Text="完成" OnClick="BtnStep2_Click" CssClass="btn btn-primary" />
</asp:Panel>
<asp:Panel ID="PnlStep3" runat="server" Visible="false">
<li>新密码：<asp:TextBox ID="TxtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox></li>
<li>确认新密码：<asp:TextBox ID="TxtConfirmPassword" runat="server" TextMode="Password"
Width="148px" CssClass="form-control" ></asp:TextBox>
<asp:CompareValidator ID="CompareValTxtConfirmPassword" ControlToValidate="TxtConfirmPassword"
ControlToCompare="TxtPassword" Display="Dynamic" Type="String" Operator="Equal"
runat="server" ErrorMessage="两次密码输入不一致！"></asp:CompareValidator>
<asp:Button ID="BtnStep3" runat="server" Text="修改密码" OnClick="BtnStep3_Click" CssClass="btn btn-primary" />
</li>
</asp:Panel>
</ul>
</div>
</div>
</div>
</div>
</form>
<script type="text/javascript">
$().ready(function () {
$("#TxtUserName").focus();
$("#txtCode").keyup(function () {
a = "checkcode";
v = $("#txtCode").val();
$.ajax({
type: "Post",
url: "/Common/ValidateCode.aspx",
data: { action: a, value: v },
success: function (data) {
if (data == 0) {
//$("#codeCheck").removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove");
//$("#codeCheck").attr("title", "验证码错误");
$("#txtCode").removeClass("codeok").addClass("codeno");
}
else if (data == 1) {
//$("#codeCheck").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok");
//$("#codeCheck").attr("title", "验证码通过");
$("#txtCode").removeClass("codeno").addClass("codeok");
}
}
});
})
});
</script>
<style type="text/css">
    .codeok{background:url(/Install/images/right.gif) no-repeat #fff;background-position:98% 8px;}
    .codeno{background:url(/App_Themes/AdminDefaultTheme/images/error.gif) no-repeat #fff;background-position:98% 8px ;}
</style>
</body>
</html>
