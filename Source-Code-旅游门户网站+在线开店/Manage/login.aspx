<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.login, App_Web_xjztgbsf" enableviewstatemac="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/IE6.ascx" TagName="IE6" TagPrefix="IE6" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>管理登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="/JS/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/ZL_ValidateCode.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="/App_Themes/ICMS/V3.css?id=201501300963" />
</head>
<body>
<form id="Login" runat="server">
<IE6:IE6 runat="server" />
<center style="background:url(<%=Call.GetRandomImg()%>);background-position: center;left:0;top:0;right:0;bottom:0; position: absolute; background-repeat:no-repeat;background-size:cover;">
<div class="container loginput">
<div class="row">
<div class="col-lg-12  col-md-12 col-sm-12 col-xs-12">
    <ul class="list-unstyled text-center center-block">
        <li><img src="<%:Call.LogoUrl%>" alt="<%:Call.SiteName%>_后台管理系统" /></li>
        <li style="margin-top:6em;">
            <asp:TextBox ID="TxtUserName" TabIndex="1" runat="server" size="20"  class="form-control input-control" autocomplete="off" 
            placeholder="帐户" onkeydown="return GetEnterCode('focus','TxtPassword');"/></li>
        <li>
            <asp:TextBox ID="TxtPassword" runat="server" TabIndex="2" TextMode="Password" MaxLength="18" 
                class="form-control input-control" autocomplete="off" placeholder="密码" onkeydown="return GetEnter();" /><br />
            <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="TxtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="密码不能为空!" />
        </li>
        <li id="safecode" runat="server"><asp:TextBox ID="TxtAdminValidateCode"  runat="server" MaxLength="6" class="form-control input-control " 
            size="20" /></li>
        <li id="CodeLi" runat="server" visible="false" style="margin-bottom:0;">
            <div class="form-group has-feedback" style="display:inline-block;width:400px;">
               <asp:TextBox ID="TxtValidateCode" runat="server" class="form-control" TabIndex="3" autocomplete="off" onkeydown="return GetEnterCode('click','IbtnEnter');"/>
               <asp:Image ID="VcodeLogin" style="margin-left:5px;height:34px;"  runat="server" ImageUrl="/Common/ValidateCode.aspx" ToolTip="点击刷新验证码" onclick="this.src='/Common/ValidateCode.aspx?t='+Math.random()" />
            </div>
        </li>
        <li>
            <asp:Button runat="server" ID="IbtnEnter" CssClass="btn btn-info input-control" TabIndex="4" Text="立即登录" OnClick="IbtnEnter_Click"/>
        </li>
        <li> 
		<a href="/" target="_blank" title="首页"><span class="glyphicon glyphicon-home"></span></a>
        <a href="/Help.html" target="_blank" title="帮助"><span class="glyphicon glyphicon-globe"></span></a>
        <a href="http://help.zoomla.cn/data/" target="_blank" title="数据字典"><span class="glyphicon glyphicon-book"></span></a> &copy Zoomla!CMS Software Co., LTD All Rights Reserved</li>
    </ul>
</div></div></div>
</center>
<nav class="navbar navbar-default navbar-fixed-bottom logfoot" role="navigation"></nav>
<script>
if (self != top) { top.location = self.location; }
function GetEnter() {
    return $("#TxtValidateCode").length > 0 ? GetEnterCode('focus', 'TxtValidateCode') : GetEnterCode('click', 'IbtnEnter');
}
$(function () {
	$("#TxtUserName").focus();
	if ($("#Apple_Hid").val() == "1") location = "default.aspx";
	$("#TxtValidateCode").ValidateCode();
})
</script>
</form>
</body>
</html>