<%@ page language="C#" autoeventwireup="true" inherits="User_Cloud_NewFolder, App_Web_alwjrles" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>新建文件夹</title>
    <link href="/App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="/App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/jquery.windows-engine.js"></script>
</head>
<body>
<form id="NewFolder" runat="server" action="">
<div style="margin-top: 20px; margin-left: 20px;">
    <input type="text" id="Name" runat="server" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Name" runat="server" ErrorMessage="目录名不能为空"></asp:RequiredFieldValidator>
    <asp:Button ID="New" CssClass="C_input" Text="确定" runat="server" OnClick="New_Click" />
</div>
</form>
</body>
</html>
