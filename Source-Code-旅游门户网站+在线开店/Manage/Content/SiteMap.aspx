<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.SiteMap, App_Web_zxhe1krl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<title>ZoomLaSiteMap</title>
</head>
<body>
<form id="form1" runat="server">    
<div id="overstr"></div>
<div id="nav_box">
<div class="r_navigation">后台管理 &gt;&gt; <a href="ContentManage.aspx">内容管理</a>&gt;&gt;SiteMap生成发布
</div>
</div>
<div style="height:24px;"></div>
<asp:Label ID="Label1" runat="server" Text=""><br /></asp:Label>

<table width="100%" border="0" align="center" cellpadding="6" cellspacing="0" class="border">
	<tr class="tdbg">
		<td width="34%" height="24" align="left" class="title">
			★GOOGLE规范的XML地图生成操作
		</td>
	</tr>
	<tr class="tdbg">
		<td height="17" align="center">
			<a href='http://www.google.com/webmasters/sitemaps/login' target='_blank'>
				<img border="0" src="../../images/google.gif" /></a>生成符合GOOGLE规范的XML格式地图页面
			<br />
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<td height="18">
			更新频率：
			<asp:DropDownList ID="DropDownList1" runat="server">
				<asp:ListItem Value="always">频繁的更新</asp:ListItem>
				<asp:ListItem Value="hourly">每小时更新</asp:ListItem>
				<asp:ListItem Value="daily" Selected="selected">每日更新</asp:ListItem>
				<asp:ListItem Value="weekly">每周更新</asp:ListItem>
				<asp:ListItem Value="monthly">每月更新</asp:ListItem>
				<asp:ListItem Value="yearly">每年更新</asp:ListItem>
				<asp:ListItem Value="never">从不更新</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<td height="35">
			每个系统调用：
			<asp:TextBox ID="TextBox1" runat="server" class="l_input" Width="29px" Height="16px" Text="5"></asp:TextBox>
			条信息内容为最高注意度
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<td height="35">
			注 意 度：<asp:TextBox ID="TextBox2" class="l_input" runat="server" Width="30px" Text="0.5"></asp:TextBox>&nbsp;0-1.0之间,推荐使用默认值
		</td>
	</tr>
</table>

<table width="100%" border="0" align="center" cellpadding="6" cellspacing="0">
	<tr>
		<td height="45" align="center">
			<asp:Button ID="Button1" runat="server" Text="开始生成网站地图" class="C_input" OnClick="Button1_Click"
				Width="180px" />&nbsp;
		</td>
	</tr>
</table>

<table width="100%" border="0" align="center" cellpadding="6" cellspacing="0" class="border">
	<tr class="tdbg">
		<td width="34%" height="24" align="left" class="title">
			★百度新闻开放协议XML生成操作
		</td>
	</tr>
	<tr class="tdbg">
		<td height="17" align="center">
			<a href="http://news.baidu.com/newsop.html#kg" target="_blank">
				<img border="0" src="../../images/baidulogo.gif" /></a>生成符合百度XML格式的开放新闻协议
			<br />
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<td height="18">
			更新周期：<asp:TextBox ID="changefreq" class="l_input" runat="server" Width="36px">15</asp:TextBox>分钟
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<td height="35">每个系统调用：<asp:TextBox ID="prioritynum" class="l_input" runat="server" Width="31px" Height="18px">50</asp:TextBox>条信息内容为最高注意度(最多100条)
		</td>
	</tr>
</table>

<table width="100%" border="0" align="center" cellpadding="6" cellspacing="0">
	<tr>
		<td height="45" align="center">
			<asp:Button ID="Submit1" runat="server" Text="开始生成网站地图" class="C_input" OnClick="Submit1_Click" Width="180px" />
		</td>
	</tr>
</table>
</form>
</body>
</html>