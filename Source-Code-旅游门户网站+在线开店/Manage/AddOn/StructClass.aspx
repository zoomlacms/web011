<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_StatusClass, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>结构</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body style=" background:#C7E0F6;">
    <form id="form1" runat="server">
    <div>
        <asp:TreeView ID="TreeView1" runat="server" ShowLines="True" EnableViewState="False"
            NodeIndent="10">
            <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
            <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
            <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
            <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
        </asp:TreeView>
    </div>
    <div style="margin-top:20px">
        <asp:TreeView ID="TreeView2" runat="server" ShowLines="True" EnableViewState="False"
            NodeIndent="10">
            <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
            <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
            <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
            <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
        </asp:TreeView>
    </div>
    </form>
</body>
</html>