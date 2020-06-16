<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.SelectTemplate, App_Web_uf4f5mnd" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>选择模板</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/ICMS/V3.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div>
<table width="100%">
    <tr>
		<td align="left">
			当前目录：<asp:Label ID="lblDir" runat="server" Text="Label"></asp:Label>
		</td>
		<td align="right">↑<asp:Literal ID="LitParentDirLink" runat="server"></asp:Literal>
        </td>
	</tr>
</table>
<div style="width: 100%; height: 200px;">
        <asp:Repeater ID="RepFiles" runat="server" OnItemDataBound="RepFiles_ItemDataBound">
            <ItemTemplate>
                <%#  System.Convert.ToInt32(Eval("type")) == 1 ? "<img src=\"/App_Themes/AdminDefaultTheme/Images/Node/closefolder.gif\" style=border-right: 0px; border-top: 0px;border-left: 0px; border-bottom: 0px />" : "<img src=\"/App_Themes/AdminDefaultTheme/Images/Node/singlepage.gif\" style=border-right: 0px; border-top: 0px;border-left: 0px; border-bottom: 0px />"%>
                <a href="#" onclick="<%#  System.Convert.ToInt32(Eval("type")) == 1 ?"openfilesdir('" + Eval("Name") + "')":"add('" + Eval("Name") + "')"%>">
                    <%# Eval("Name")%>
                </a>
                <br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:HiddenField ID="HdnFileText" runat="server" />
    </div>
</div>
</form>
<script type="text/javascript">
function add(obj)
{
    if(obj==""){return false;}
    var s = document.getElementById('HdnFileText').value + "\/" + obj;
    parent.document.getElementById('FileName').value = s.substring(1);
}
function openfilesdir(obj)
{
    if(obj==""){return false;}
    var pathtext="<%=Server.UrlEncode(Request.QueryString["FilesDir"]) %>";
    parent.document.getElementById('ParentDirText').value = pathtext;
    var path="SelectTemplate.aspx?FilesDir="+pathtext+"/"+escape(obj);
    parent.document.getElementById('main_right').src=path;
}
</script>
</body>
</html>
