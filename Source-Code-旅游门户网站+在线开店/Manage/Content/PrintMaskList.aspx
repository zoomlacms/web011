<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.PrintMaskList, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>输出列表</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
    function CheckImg() {
        window.open('../Common/ShowFlash.aspx', 'newWin', 'modal=yes,width=570,height=80,resizable=yes,scrollbars=yes');
    }

</script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理 &gt;&gt; 内容管理&gt;&gt; 打印输出&gt;&gt; 遮罩库 &nbsp; <%=Link %>&nbsp;[<a href="javascript:void{};" style="color: Red" onclick="CheckImg()" >上传遮罩图片</a>]
</div>
<table width="100%" cellpadding="0" cellspacing="0" border="0" >
	<tr>
		<td>
			<asp:DataList ID="dlMask" runat="server" RepeatColumns="6" Width="100%">
			<ItemTemplate>
			<table cellpadding="5" cellspacing="1" border="1" width="128px" style="height:128px" >
			<tr>
			<td><%#getimg(DataBinder.Eval (Container.DataItem,"Name").ToString() )%>  </td>
			</tr>
			</table>
			</ItemTemplate>
			</asp:DataList>
		</td>
	</tr>
</table>
</form>
</body>
</html>