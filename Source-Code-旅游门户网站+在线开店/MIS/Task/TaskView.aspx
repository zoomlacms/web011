<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_TaskView, App_Web_znlyx4aw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>查看任务</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="../../JS/jquery-1.9.1.min.js"></script> 
<script>
function loadPage(id, url) {
    $("#" + id).addClass("loader");
    $("#" + id).append("Loading......");
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        error: function () { alert('加载页面' + url + '时出错！'); },
        success: function (msg) {
            $("#" + id).empty().append(msg);
            $("#" + id).removeClass("loader");
        }
    });
}
</script>

</head>
<body>
<form id="form1" runat="server">
<div id="Meno">
<div class="dialog_head"><a  href="javascript:void(0)" onclick="javascript:Window.Close();"> [关闭窗口]</a><span>查看任务</span>  </div>
 
<div class="popup_headti"> [任务] <asp:Label ID="lblName" runat="server"></asp:Label>   </div>
<div class="myoper">
<%--<a href="javascript:void(0)" > [编辑人员]</a><a href="#" >[修改发起人]</a>--%>
    <a href="#" >[完成提交]</a><a href="javascript:void(0)"  onclick="javascript:window.open('AddTask.aspx?ID=<%=Request["ID"] %>', 'newwindow', 'height=450,width=600,toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');" >[编辑基本信息]</a><a href="javascript:void(0)"  onclick="javascript:window.open('AddTotal.aspx?TID=<%=Request["ID"] %>', 'newwindow', 'height=450,width=600,toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');" >[总结]</a><a href="#" >[撤销任务]</a>
    </div>

<div class="popup_ti"><strong> 基本信息</strong></div>
<table width="100%" class="tsktab">
<tr>
<th align="right" width="10%">当前状态 :</th><td align="left"><asp:Label ID="lblProStatus" runat="server"></asp:Label> </td>
<th align="right" width="10%">完成时间 :</th><td align="left"><asp:Label ID="lblCompletionTime" runat="server"></asp:Label></td>
<th align="right" width="10%">紧要程度 :</th><td align="left"><asp:Label ID="lblLevel" runat="server"></asp:Label></td>
</tr>
<tr>
<th align="right">创建人 :</th><td align="left"><asp:Label ID="lblUserID" runat="server"></asp:Label></td>
<th align="right">负责人 :</th><td align="left"> <asp:Label ID="lblLeader" runat="server"></asp:Label></td>    
<th align="right">参与人 :</th><td align="left"><asp:Label ID="lblJoiner" runat="server"></asp:Label></td>
</tr>
<tr>
<td  align="left" colspan="6"  class="popup_ti"> <strong> 任务描述:</strong> </td> </tr>
<tr><td colspan ="6"><asp:Label ID="lblRequirements" runat="server"></asp:Label></td> </tr>
</table>        
<div class="tab">
<ul>
<li class="log_tab"><a href="/Mis/Task/TaskView.aspx?ID=<%=Request["ID"] %>" class="clk"> 任务看板 </a></li>
<li><a href="javascript:void(0)" onclick="loadPage('taskSee', '/Mis/Task/TaskEvent.aspx?TID=<%=Request["ID"] %>')" class="clk" > 任务事件</a></li>
<li><a href="javascript:void(0)" onclick="loadPage('taskSee', '/Mis/Task/TaskTalk.aspx?TID=<%=Request["ID"] %>')" class="clk" >讨论区</a></li>
<li><a href="javascript:void(0)" onclick="loadPage('taskSee', '/Mis/Task/TaskEvent.aspx?TID=<%=Request["ID"] %>')" class="clk" >文档区</a></li>
</ul>
</div> 
<div id="taskSee">
<div  class="myoper">
<strong><a href="/Mis/Task/AddTaskInfo.aspx?TID=<%=Request["ID"] %>">[添加任务事件]</a></strong><strong><a href="/Mis/Task/AddTalk.aspx?TID=<%=Request["ID"] %>">[发起讨论]</a></strong><strong><a href="/Mis/Task/AddTaskInfo.aspx?TID=<%=Request["ID"] %>">[上传文档]</a></strong></div>
<div class="popup_ti">重要活动项</div>
<table width="100%">
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<tr><td> <%#GetStatus(Convert.ToInt32(Eval("Status")))%> <%#GetType(Convert.ToInt32(Eval("Type"))) %> </td><td><a href="/Mis/Task/TaskInfoView.aspx?TID=<%=Request["ID"] %>&ID=<%#Eval("ID") %>"><%#Eval("Title") %></a>- <%#Eval("Inputer") %> [创建]</td><td> </td><td> <%#Eval("CreateTime") %> </td></tr>
</ItemTemplate>
</asp:Repeater>
</table>
    
<div class="popup_ti">最近活动项</div>
    </div>
</form>
</body>
</html>
