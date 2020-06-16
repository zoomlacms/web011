<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="User_login, App_Web_ydfmcklp" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head runat="server">
<meta charset="utf-8">
<title>小铺登录-<%:Call.SiteName %></title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/Template/Travel/style/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../JS/ajaxrequest.js"></script>
<script type="text/javascript">
if (self != top) { top.location = self.location; }
function onfocus() {
try {
document.getElementById('TxtUserName').focus();
}catch(Error){}
}
var sts = 3;//登录后跳转等待时间;单位：秒
function sucse(s, url) {
if (s == 1) {//成功
document.getElementById("main_l").style.display = "none";
document.getElementById("main_s").style.display = "";
document.getElementById("sec").innerHTML = sts;
setInterval(loacationgoto, 1000);
}
else {
document.getElementById("main_l").style.display = "";
document.getElementById("main_s").style.display = "none";
}
}
function BtnTj() {
var username = document.getElementById("TxtUserName");
var userpass = document.getElementById("TxtPassword"); 
var TxtValidateCode = document.getElementById("TxtValidateCode");
if (username.value == "") {
username.focus();
return false;
}
if (userpass.value == "") {
userpass.focus();
return false;
}
if (TxtValidateCode&&TxtValidateCode.value == "") {
TxtValidateCode.focus();
return false;
}
}
</script>
<style>
.main_ldiv li{ margin-bottom:10px;}
.main_ldiv h1{ color:#fff;}
.home_footer{ position:absolute; bottom:0; width:100%;}
.login_body{ padding-top:140px; padding-bottom:330px; background:url(/Template/Travel/style/images/login_bg.jpg) center no-repeat; background-size:cover;}
</style>
</head>
<body onload="onfocus();" >
<%Call.Label("{ZL.Label id=\"全站头部\" /}"); %>
<form id="form" runat="server">
<div class="navbar navbar-default" style="display:none;">
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
<li><a target="_blank" href="http://www.zoomla.cn">官网首页</a></li>
<li><a target="_blank" href="http://bbs.zoomla.cn/">技术社区</a></li>
<li><a target="_blank" href="http://www.zoomla.cn/pub/">下载产品</a></li>
<li><a target="_blank" href="http://help.zoomla.cn/">使用帮助</a></li>
</ul>
</div>
</div>
</div>
<!-- 导航到此结束 -->
<div class="login_body">
<div class="container">
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-md-offset-3">
<div class="main_ldiv">
<h1><span class="glyphicon glyphicon-home"></span>登录小铺</h1>
<ul class="list-unstyled">
<li><asp:TextBox ID="TxtUserName" placeholder="小铺名" runat="server" CssClass="form-control"></asp:TextBox></li>
<li><asp:TextBox ID="TxtPassword" placeholder="密码" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></li>
<li><div class="form-group"  visible="false" id="trVcodeRegister" runat="server">
<asp:TextBox ID="TxtValidateCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="form-control codestyle" style="display:inline;"></asp:TextBox>
<asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" ToolTip="点击刷新验证码" style="margin-left:2px;height:34px;width:28%;" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()" />
</div>
</li>
<li style="color:#ccc;">
<input type="checkbox" name="checkbox" checked="checked" id="checkbox" />记住登录<a href="/User/GetPassword.aspx" style="margin-left:5px;margin-right:5px; color:#ccc;">忘记密码？</a>
<asp:Button ID="btnLogin" CssClass="btn btn-info pull-left" OnClientClick="return BtnTj();" Width="100%" runat="server" Text="登录" onclick="btnLogin_Click" />
<div class="clearfix"></div>
</li>
</ul>
<div id="main_s" style="display:none">
<ul>
<li style="color:green; font-size:14px; font-weight:bold">欢迎您！登录成功</li>
<li style="margin-top:25px;">系统将在 <span id="sec">3</span> 秒后自动跳转到<a href="MemoView.aspx">会员首页</a></li>
</ul>
</div>
<div  id="alipayDIV">
<div class="text-left"><label id="AppTitle" runat="server" style="font-size:11px; font-weight:normal;">第三方平台登录：</label></div>
<div  class="applgntype">
<asp:LinkButton ID="appSina" ToolTip="新浪" runat="server" Style="background-image: url('/images/sina.gif');background-repeat: no-repeat; " OnClick="appSina_Click"></asp:LinkButton>
<span id="qqLoginBtn" title="QQ" runat="server" style="padding:0;" ><img src="/images/sina.gif" /></span>
<asp:LinkButton ID="appBaidu" ToolTip="百度" runat="server" style="background-image:url('/images/bdidu.gif');background-repeat:no-repeat;"  OnClick="appBaidu_Click"></asp:LinkButton>
<asp:LinkButton ID="appKaiXin" ToolTip="开心网" runat="server"  style="background-image:url('/images/kaixin.gif');background-repeat:no-repeat;" onclick="appKaiXin_Click1" ></asp:LinkButton>
<asp:LinkButton ID="appRenRen" ToolTip="人人网" runat="server" style="background-image:url('/images/renren.gif');background-repeat:no-repeat;" onclick="appRenRen_Click1" ></asp:LinkButton>
<asp:LinkButton ID="appNetease" ToolTip="网易" runat="server" style="background-image:url('/images/wangyi.gif');background-repeat:no-repeat;" OnClick="appNetease_Click1" ></asp:LinkButton>
<div class="clearfix"></div>
</div>
</div>
<div style="display:none;"><asp:LinkButton ID="appQQ" runat="server" Style="background-image: url('/App_Themes/AdminDefaultTheme/images/QQ.png'); background-repeat: no-repeat;" OnClick="appQQ_Click"> QQ</asp:LinkButton></div>
</div>
</div>
 
</div>
</div>
</div>
</form>
<%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>
<style type="text/css">
.codeok{background:url(/Install/images/right.gif) no-repeat #fff;background-position:98% 8px;}
.codeno{background:url(/App_Themes/AdminDefaultTheme/images/error.gif) no-repeat #fff;background-position:98% 8px ;}
</style>
</body>
</html>
<script type="text/javascript">
    $().ready(function () {
        $("#TxtValidateCode").keyup(function () {
            a = "checkcode";
            v = $("#TxtValidateCode").val();
            $.ajax({
                type: "Post",
                url: "/Common/ValidateCode.aspx",
                data: { action: a, value: v },
                success: function (data) {
                    if (data == 0) {
                        $("#TxtValidateCode").removeClass("codeok").addClass("codeno");
                    }

                    else if (data == 1) {
                        $("#TxtValidateCode").removeClass("codeno").addClass("codeok");
                    }
                }
            });
        })
    });
QC.Login({
btnId: "qqLoginBtn",
scope: "all",
size: "C_S"
}, function (reqData, opts) {//登录成功
QC.Login.getMe(function (openId, accessToken) {
$.post("/user/AppBack.aspx", { nickName: reqData.nickname, openId: openId,Type:""}, function (data) {
if (data.result == 1)
{
location.href = "/user/default.aspx";   
}
else
{
// alert(data.result);
location.href = "/user/AppBack.aspx?type=QQ&openId=" + openId + "&nickname=" + reqData.nickname;
}
}, "json");
});//获取在线用户的信息           
}, function (opts) {//注销成功
alert('QQ登录 注销成功');
}
);
if (QC.Login.check()) {//如果已登录
//这里可以调用自己的保存接口
//用JS SDK调用OpenAPI获取用户信息
var paras = {};
QC.api("get_user_info", paras)
//指定接口访问成功的接收函数，s为成功返回Response对象
.success(function (s) {
//成功回调，通过s.data获取OpenAPI的返回数据
//alert("获取用户信息成功！当前用户昵称为：" + s.data.nickname);         
})
//指定接口访问失败的接收函数，f为失败返回Response对象
.error(function (f) {
//失败回调      
})
//指定接口完成请求后的接收函数，c为完成请求返回Response对象
.complete(function (c) {
//完成请求回调	    
});
//调用自己的接口，保存信息
//......
}
var a = function (id, str) {
var s = str;
$("#" + id).val(s).css('color', '#999')
.focus(function () { if (this.value == s) { this.value = ''; this.style.color = 'black'; } })
.blur(function () { if (this.value == '') { this.value = s; this.style.color = '#999'; } });
}
$().ready(function ()
{
a('TxtUserName', '用户名');
})
</script>