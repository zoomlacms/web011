<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_Download, App_Web_oxnlb5iw" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>客户端下载</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:Label ID="tempclientlist" runat="server" Text=""></asp:Label>
<table width="156" height="210" border="0" cellpadding="0" cellspacing="0" class="Template_box">
<tr>
<td>
<table class="table table-striped table-bordered table-hover">
<tr>
<td align="center" bgcolor="#FFFFFF">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="134" align="center"><a alt="点击进入下载" href="TemplateManage.aspx?setTemplate=/Template/blue">
				<img alt="点击进入下载" onerror="this.onerror=null;this.src='/Images/nopic.gif'" onmouseover="this.style.border='1px solid #9ac7f0';" onmouseout="this.style.border='1px solid #eeeeee';" style="border: 1px solid #eeeeee; width: 124px; height: 111px;" src='/Template/blue/view.jpg'></a></td>
		</tr>
		<tr>
			<td height="59" align="center" valign="top">
				<p style='line-height: 18px;'><span value='blue' type='text' sclass='l_input' style='line-height: 18px; width: 110px; color: black' name='tempname0'>名称：逐浪助手</span></p>
				<p style='line-height: 18px;'>
					<a disabled='false' onclick='return false;' href="TemplateSet.aspx?defaultproject=blue">客户端下载</a>&nbsp;&nbsp;
					<a rel="lightbox" href="/Template/blue/Bview.jpg">
						<img alt="大图预览" src='/App_Themes/AdminDefaultTheme/images/glassover.jpg' />
					</a>
				</p>
				<p style='line-height: 18px;'>
					<asp:Button ID="keyDown" OnClick="Button4_Click" Text="密钥文件下载" runat="server" />
				</p>
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>