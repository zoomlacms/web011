<%@ page language="C#" autoeventwireup="true" inherits="MIS_Project_Pro_left, App_Web_1230bsik" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>项目左侧</title>
</head>
<body>
<form id="form1" runat="server">
        <asp:TreeView ID="TreeView1" runat="server" ShowLines="True" EnableViewState="False"
            NodeIndent="10">
            <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
            <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
            <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
            <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
        </asp:TreeView>
</form>
</body>
</html>
