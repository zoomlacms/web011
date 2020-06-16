<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_Default, App_Web_znlyx4aw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>任务</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
    <link href="../OA/CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
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
<form id="mform1" runat="server">
 <div id="Meno" class="Mis_pad">
     <div class="Mis_title">
<strong><a href="javascript:void(0)"  onclick="javascript:window.open('AddTask.aspx', 'newwindow', 'height=600,width=600,toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');"> 派任务</a></strong><br />
<div style="display:none;">所有任务  <a href="">延期任务(0)</a> <a href="">7天内到期的任务(0)</a> <a href="">30天内到期的任务(0)</a> <a href="">待接收的任务(0)</a> <a href="">需尽快完成的任务(2)</a> <a href="">未完成的重要且紧急的任务(0)</a><br /></div>

</div>
<table  width="100%"><tr><td>
<table class="border" width="100%" >
<tr class="title" style=" background:#e7f3ff" ><td colspan="4">
<asp:DropDownList ID="drSta"  runat="server">
<asp:ListItem value=""> 所有状态</asp:ListItem> 
<asp:ListItem value="-3"> 待接收</asp:ListItem> 
<asp:ListItem value="-2"> 待分派</asp:ListItem> 
<asp:ListItem value="-1"> 已拒绝</asp:ListItem> 
<asp:ListItem value="0"> 进行中</asp:ListItem> 
<asp:ListItem value="1"> 待审核</asp:ListItem> 
<asp:ListItem value="2"> 已完成 </asp:ListItem>
<asp:ListItem value="3"> 已撤销 </asp:ListItem>
</asp:DropDownList>
<asp:DropDownList ID="drJor"    runat="server">
<asp:ListItem Value="0"> 所有角色 </asp:ListItem>
<asp:ListItem Value="1"> 派发的</asp:ListItem>
<asp:ListItem Value="2"> 负责的 </asp:ListItem>
<asp:ListItem Value="3"> 参与的 </asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="key" runat="server" ></asp:TextBox><asp:Button ID="sech_btn" runat="server" Text="名称过滤" OnClick="sech_Click" />
</td></tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate><tr height="25"><td><%#GetStatus(Convert.ToInt32(Eval("ProStatus"))) %> </td><td><a href="TaskView.aspx?ID=<%#Eval("ID") %>" target="_blank"> <%#Eval("Name") %></a> - <%#Eval("Leader") %> [负责人]  </td><td> <%#GetUName(Convert.ToInt32(Eval("UserID"))) %>   [新建任务] </td><td>   <%#Eval("ApplicationTime") %></td></tr></ItemTemplate>
</asp:Repeater> 
</table>  
<table width="100%" style="text-align:center;">
<tr class="tdbg">
<td class="tdbgleft" colspan="6" >共
<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
条信息
<asp:Label ID="Toppage" runat="server" Text="" />
<asp:Label ID="Nextpage" runat="server" Text="" />
<asp:Label ID="Downpage" runat="server" Text="" />
<asp:Label ID="Endpage" runat="server" Text="" />
页次：
<asp:Label ID="Nowpage" runat="server" Text="" />
/
<asp:Label ID="PageSize" runat="server" Text="" />
页
<asp:Label ID="pagess" runat="server" Text="" />
条信息/页 转到第
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
页 </td>
</tr>
</table>
</td>
    <td>
 
<div class="tskTit"><a href="#">任务事件>></a></div>
<ul>
<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
<li><a href="TaskInfoView.aspx?TID=<%#Eval("ProID") %>&ID=<%#Eval("ID") %>"><%#Eval("Title") %></a></li>
</ItemTemplate>
</asp:Repeater> 
</ul>
<div class="tskTit"><a href="#">任务讨论>></a></div>
 
</td>
    </tr>
    </table>
</form>
</body>
</html>
