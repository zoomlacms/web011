<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ContentShow, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>显示内容</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/js/Dialog.js"></script>
<script type="text/javascript">
    var diag = new Dialog();
    function opentitle(url, title) {
        diag.Width = 800;
        diag.Height = 600;
        diag.Title = title;
        diag.URL = url;
        diag.show();
    }
    function editnode(NodeID) {
        var answer = confirm("该栏目未绑定模板，是否立即绑定");
        if (answer == false) {
            return false;
        }
        else {
            open_page(NodeID, "EditNode.aspx?NodeID=");
        }
    }
    function open_page(NodeID, strURL) {
        var diag = new Dialog();
        diag.Width = 800;
        diag.Height = 600;
        diag.Title = "添加节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = strURL + NodeID;
        diag.show();
    }
</script>
<style>
#viewtask { float:left;padding-top:4px;display:block; width:16px; height:16px; margin-right:5px;}
#browse{float:left;margin-top:3px; margin-right:5px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation">
<span>后台管理</span> &gt;&gt; <span><a href="ContentManage.aspx">内容管理</a></span>&gt;&gt;
    <span style="float: right;padding-right: 10px;">
        <a href="SchedTask.aspx" id="viewtask" title="查看计划任务"><img src="../../../Images/ModelIcon/taskview.gif" alt="" /></a>
        <%=GetOper()%>
        <a onclick="opentitle('EditNode.aspx?NodeID=<%=GetNodeID()%>','配置本节点')" href="javascript:void(0);" title="配置本节点"><%=lang.LF("配置本节点")%></a></span>
<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></div>
</div>
<div style="height:24px;"></div>
<div class="clearbox">
</div>
<div>
	<table width="100%" cellpadding="2" cellspacing="1" border="0" class="border"
		align="center">
		<tr align="center" class="tdbgleft">
			<td colspan="2">
				<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
			</td>
		</tr>
		<tr class="tdbg">
			<td height="22" class="tdbgleft" align="right" style="width: 24%">所属栏目：</td>
			<td class="tdbg">
				<asp:Label ID="NodeName" runat="server" Text=""></asp:Label>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td height="22" class="tdbgleft" align="right" style="width: 24%">标题：</td>
			<td class="tdbg">
				<asp:Label ID="title_T" runat="server" Text=""></asp:Label>
			</td>
		</tr>
		<tr>
			<td height="22" class="tdbgleft" align="right" style="width: 24%">
				状态：
			</td>
			<td class="tdbg">
				<asp:Label ID="statess" runat="server" Text=""></asp:Label>
			</td>
		</tr>
		<tr>
			<td height="22" align="center" colspan="2" style="line-height: 25px;">
				<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
				<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
				<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
				<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
				<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
				<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
			</td>
		</tr>
	</table>
	<br />
	 <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
</div>
</form>
</body>
</html>