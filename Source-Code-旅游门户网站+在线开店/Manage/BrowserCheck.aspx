<%@ page language="C#" autoeventwireup="true" inherits="manage_SystemCheck_, App_Web_xjztgbsf" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>浏览器检测</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        .info_url a {color:#1370b5;text-decoration:none;}
        .info_url a:hover {color:#ff6600;}
        #mainTB tr td {height:26px;line-height:26px;padding:1px;padding-left:8px;font-size:12px;font-family:'Microsoft YaHei';}
    </style>
</head>
<body>
<form id="form1" runat="server">
<div>
<table id="mainTB" class="table table-striped table-bordered table-hover"> 
    <tr><td style="width:100px">浏览器</td><td><%=browser%></td></tr>
    <tr><td>当前IP</td><td><%=currentIP %></td></tr>
    <tr><td>当前屏幕</td><td><%=currentWindow%>  屏大小：(<script>document.write(window.screen.width+"px,");document.write(window.screen.height+"px");</script>)</td></tr>
    <tr><td>Cookies</td><td><%=cookiesSurrport%></td></tr>
    <tr><td>服务器Mac</td><td id="tdMac" runat="server"></td></tr>
    <tr><td>当前Url</td><td> <asp:Label ID="lbServerName" runat="server" /></td></tr>
    <tr><td>服务器IIS版本</td><td> <asp:Label ID="IISVersion_L"  runat="server" /></td></tr>
    <tr><td>.NET 版本</td><td> <asp:Label ID="NFVersion_L" runat="server" /></td></tr> 
</table>
<div class="info_url">
    <a href="http://www.zoomla.cn/help/web/1414.shtml" title="设置Cookie" target="_blank">设置Cookie</a>&nbsp;&nbsp;
    <a href="http://www.zoomla.cn/help/web/1413.shtml" title="设置脚本" target="_blank">设置网页脚本</a>&nbsp;&nbsp;
    <a href="<%:customPath2+"I/Common/SystemFinger.aspx" %>" title="服务器信息总览" target="_parent">服务器信息总览>></a>
    </div>
</div>
 <iframe width="0" height="0" id="nwin1" name="nwin1" src="about:blank" style="display:none;"></iframe>
</form>
<%--<script type="text/javascript">
    var strSupport = "<span >支持（<font color='red'>推荐</font>）</span>";
    var vwind = document.getElementById('vwind');
    var nwin = window.open("about:blank", "nwin1", "width=1,height=1,top=1000,left=0,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=no,resizable=no");
    nwin.document.open();
    nwin.document.writeln("<script language=\"javascript\" type=\"text/javascript\">");
    window.document.getElementById("vwind").innerHTML = strSupport;
    nwin.document.writeln("<\/script>");
    nwin.document.close();
    nwin.close();
</script>--%>
</body>
</html>