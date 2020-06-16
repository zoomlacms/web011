<%@ page language="C#" autoeventwireup="true" inherits="MIS_Project_Menber, App_Web_1230bsik" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>成员</title>
<link href="../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
</head>
<body>
<form id="form1" runat="server">
<div>
<%--<div class="Mis_Title"><strong><a href="javascript:void(0)" onclick="loadPage('see', 'AddMenber.aspx?ID=<%=Request["ID"] %>')" >添加人员</a></strong></div>--%>
<table class="border"  width="100%"  cellspacing="1" cellpadding="0" rules="all" border="0">
<tr class="title" style=" background:#e7f3ff" height="25"><th>编号</th><th>角色</th><th>姓名</th><th>所属项目</th><th>操作</th></tr>
 <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound" >
<ItemTemplate>
    <tr height="25">
        <td><%#Eval("ID") %> </td>
        <td> <%#Eval("joke") %> </td>
        <td> <%#Eval("name") %>   </td>
        <td> <%#Eval("Proname") %> </td>
        <td align="center"><asp:Label id="wdo" runat="server"> <asp:LinkButton ID="Del" runat="server" CommandArgument='<%#Eval("val") %>'  CommandName="Del" Text="删除参与人"></asp:LinkButton> </asp:Label>
            <asp:HiddenField ID="val" runat="server" Value='<%#Eval("val") %>' />

        </td>
    </tr></ItemTemplate>
</asp:Repeater> 
</table> 
     


</div>
</form>
</body>
</html>
