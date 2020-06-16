<%@ page language="C#" autoeventwireup="true" inherits="MIS_Project, App_Web_1230bsik" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>我的项目</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script> 
<script src="../../Plugins/Ckeditor/ckeditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
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
<div id="Meno" class="Mis_pad">
<div class="Mis_Title"><strong><a href="javascript:void(0)" onclick="loadPage('Meno', 'AddProject.aspx')">新建项目</a></strong></div>
<div class="td_center">
<table width="100%"  cellspacing="1" cellpadding="0" rules="all" border="0" class="border"  >
<tr class="title" style=" background:#e7f3ff" height="25">
<th width="30"></th>
<th width="25"></th>
<th>项目名称</th>
<th width="100">负责人</th>
<th width="120">完成时间</th>
<th width="60">进度</th></tr>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<tr><td width="30">1</td><td  width="25"><%#Eval("ID") %></td>
<td style="text-align:left" >(根) <a  href="ProjectView.aspx?ID=<%#Eval("ID") %>"  ><%#Eval("Name") %></a>  <br> [新建项目] <%#GetUName(Convert.ToInt32(Eval("UserID"))) %>  </td>
<td width="100"> <%#Eval("Leader") %></td>
<td width="120"><%#Eval("CompletionTime") %></td>
<td width="60"><%#Eval("Rating") %>%</td> </tr>
</ItemTemplate>
</asp:Repeater>
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
</div>
</div>
    
</form> 
</body>
</html>
