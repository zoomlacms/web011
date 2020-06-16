﻿<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_TaskEvent, App_Web_t0xlctza" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
</head>
<body>
<form id="form2" runat="server">
<div>
    
<div  class="myoper"><strong><a href="/Mis/Task/AddTalk.aspx?TID=<%=Request["TID"] %>">[添加讨论]</a></strong></div> 

<table class="border" width="100%" >
<tr class="title" style=" background:#e7f3ff" ><td colspan="5">
<select id="drSta1"> 
<option value=""> 所有状态</option> 
<option value="-3"> 待接收</option> 
<option value="-2"> 待分派</option> 
<option value="-1"> 已拒绝</option> 
<option value="0"> 进行中</option> 
<option value="1"> 待审核</option> 
<option value="2"> 已完成 </option>
<option value="3"> 已撤销 </option>
</select>
<input id="keys" value="" />
<input type="button" value="名称过滤" onclick="sech()" />
</td></tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<tr><td><%#GetStatus(Convert.ToInt32(Eval("Status")))%></td><td>  <%#GetType(Convert.ToInt32(Eval("Type"))) %> </td><td><a href="/Mis/Task/TalkView.aspx?TID=<%=Request["TID"] %>&ID=<%#Eval("ID") %>"><%#Eval("Title") %></a>- <%#Eval("Inputer") %> [创建]</td><td> </td><td> <%#Eval("CreateTime") %> </td></tr>
</ItemTemplate>
</asp:Repeater>
</table>
</div>

</form> 
<script>
    function sech() {
        var drSta = document.getElementById("drSta1");
        var key = document.getElementById("keys");
        var url = "/Mis/Task/TaskEvent.aspx?TID=<%=Request["TID"] %>&Type=4";
        if (drSta.options[drSta.selectedIndex].value != "") 
            url = url + "&sta=" + drSta.options[drSta.selectedIndex].value;
        if (key.value != "" && key.value != "输入名称过滤")
            url = url + "&keys=" + key.value;

            loadPage('taskSee', url)
    }

</script>
</body>
</html>
