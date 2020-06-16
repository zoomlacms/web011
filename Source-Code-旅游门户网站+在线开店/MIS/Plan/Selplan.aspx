<%@ page language="C#" autoeventwireup="true" inherits="MIS_Plan_Selplan, App_Web_rf4ejtbp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>计划</title> 
</head>
<body>
<form id="form1" runat="server"> 
<asp:Repeater ID="Repeater1" runat="server"><ItemTemplate>
<span> <%#getInfo(Convert.ToInt32(Eval("ID"))) %> </span>
</ItemTemplate></asp:Repeater>
</form>
</body>

</html>

