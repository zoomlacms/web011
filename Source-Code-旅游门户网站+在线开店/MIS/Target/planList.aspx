<%@ page language="C#" autoeventwireup="true" inherits="MIS_Target_planList, App_Web_vixzywbt" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>计划</title>
</head>
<body>
<form id="pformL5" runat="server">
<div class="left_ico"><img src="../../App_Themes/UserThem/images/Mis/jian.jpg" /></div>
<div class="left_Pro">
<a href="javascript:void(0)" onclick="Prolist('<%=Request["ID"] %>','5')">计划</a>
</div>
<div class="Right_Pro">
<table> 
<asp:Repeater ID="Repeater3" runat="server">
<ItemTemplate>
<tr><td>  <a href="../Plan/PlanInfoView.aspx?ID=<%#Eval("ID") %>"><%#Eval("PlanName") %> </a></td></tr>
</ItemTemplate>
</asp:Repeater> 
</table>
</div>
</form>
</body>
</html>
