<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_UserVote, App_Web_ka5t45ft" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>用户答卷</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="/manage/Common/Common.js"></script>
<style>
.border th{ background-image:none; text-align:left;}
.title,.bottom { text-align:center} 
#sendMsg{width:610px;}
.closex { float:right;}
.closex a {color:#F00;font-size:20px;}
</style>
<script>
function hid(obj) {
    document.getElementById(obj).innerHTML = '';
    document.getElementById(obj).style.display = 'none';
}
</script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理&gt;&gt;<a href="SurveyManage.aspx">问卷投票管理</a>&gt;&gt;<a href="SurveyViewer.aspx?SID=<%=Request["SID"] %>">问卷管理</a> &gt;&gt;用户答卷</div>
<div id="divContent" class="content" runat="server">  
<div class="title">
<asp:Literal ID="ltlSurveyName" runat="server" Text="Label"></asp:Literal>  (<asp:Literal ID="ltlDate" runat="server"></asp:Literal>)
</div>     
<div class="desp">
<p>
    <asp:Literal ID="ltlDesp" runat="server" Text="Label"></asp:Literal>
</p>
</div>              
<div class="list"><ul>
<asp:Literal ID="ltlResultHtml" runat="server"></asp:Literal>
</ul> </div> </div>
<div class="bottom"> 
<asp:Button ID="btnExport" runat="server" Text="导 出" CssClass="btn" OnClick="btnExport_Click" />
<asp:Button ID="btnStatus" runat="server" Text="审核" title="通过审核并发送手机短信" CssClass="btn" OnClick="btnStatus_Click" Visible="false" />
<asp:Button ID="Button1" runat="server" Text="取消审核" CssClass="btn" OnClick="Button1_Click" Visible="false" />
<asp:Button ID="Button2" runat="server" Text="通过" title="录用并发送手机短信" CssClass="btn" OnClick="Button2_Click" Visible="false" />
</div>
<asp:HiddenField ID="HdnSID" runat="server" Visible="false" />
    <div id="sendMsg" runat="server" visible="false" style=" position:absolute; top:20px; left:20px; background:#fff; padding:5px;">
       

    </div>
</form>
</body>
</html>
