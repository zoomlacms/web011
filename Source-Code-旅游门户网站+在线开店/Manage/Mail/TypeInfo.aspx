<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_TypeInfo, App_Web_0vozbcrl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>类别信息</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
    <div id="help"> <a onclick="help_show('110')" title="帮助"></a></div>
<%} %>  后台管理&gt;&gt;用户管理&gt;&gt;<a href="../User/MailList.aspx" >邮件发送</a>&gt;&gt;类别信息 [<a href="MailSet.aspx">添加邮箱</a>] [<a href="MailType.aspx">添加类别</a>] [<a href="TypeSet.aspx">类别列表</a>]</div>
        <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr>
<td align="center" colspan="6" class="spacingtitle"><b>类别信息</b></td>
</tr>
<tr><th  width="50" >用户ID</th><th  width="200" >用户名</th><th  width="400">邮箱账号</th><th  width="200">时间</th></tr> 
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" >
    <td align="center"><%#Eval("ID") %></td>
    <td align="center"><%#Eval("FromName") %></a></td>
<td align="center"><%#Eval("ReEmail") %></td>
<td width="100" align="center"><%#Eval("CreateTime") %></td>
</tr> 
</ItemTemplate>
</asp:Repeater>
</table>
    </form>
</body>
</html>
