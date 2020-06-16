<%@ page language="C#" autoeventwireup="true" inherits="manage_Content_ModelUpdata, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>模型升级</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">>后台管理&gt;&gt;系统设置 &gt;&gt;<a href="NodeManage.aspx">模型管理</a>&gt;&gt;升级模型</div>
<table width="100%" border="0" cellpadding="5" cellspacing="1" class="border">
<tr align="center">
	<td colspan="2" class="spacingtitle">
		升级模型
	</td>
</tr>
<tr class="tdbg">
	<td align="right" class="tdbg" style="width:10%">
	升级状态：</td>
	<td class="tdbg">
		<span style="color:Red"><asp:Label ID="Label1" runat="server" Text="状态"></asp:Label></span><br /></td>
</tr>
<tr align="center">
	<td colspan="2" class="tdbgleft" style="text-align:left">
		<asp:Button ID="EBtnBacthSet" Text="升级模型" class="C_input" Style="width: 110px;" OnClick="EBtnBacthSet_Click"
			runat="server" />
		&nbsp;&nbsp;<asp:Button ID="Button1" Text="返回列表" class="C_input" Style="width: 110px;" runat="server" OnClientClick="location.href='NodeManage.aspx';return false;" />
	</td>
</tr>
</table>
</form>
</body>
</html>