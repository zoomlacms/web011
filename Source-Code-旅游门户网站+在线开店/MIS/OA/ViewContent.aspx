<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_ViewContent, App_Web_kvow1qcj" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>查看文章</title>
<link type="text/css" href="CSS/ZLOA.css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> --%>
<style>
#popImg{ display:none;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="draftnav">
    <a href="/MIS/OA/Main.aspx">行政公文</a>/<a href="ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>">内容管理</a>/<span>浏览内容</span>
</div>
<div id="site_main" style="margin:10px;">
    <table class="table_li table-border" cellspacing="0" cellpadding="0">
        <tr><td colspan="8" class="trhead">内容浏览</td></tr>
        <tr>
            <td >密级：</td><td><asp:Label runat="server" ID="SecretL"></asp:Label></td>
            <td>紧急程度：</td><td><asp:Label runat="server" ID="UrgencyL"></asp:Label></td>
            <td>重要程度：</td><td><asp:Label runat="server" ID="ImportanceL"></asp:Label></td>
        </tr>
        <tr>
            <td>标题:</td><td colspan="3"><asp:Label ID="Title" runat="server" /></td>
            <td>发文日期：</td><td><asp:Label ID="LbCreatTime" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr><td>发文人：</td><td colspan="3"><asp:Label ID="userNameL" runat="server" ></asp:Label></td>
            <td>发文部门：</td><td colspan="3"><asp:Label ID="userGroupL" runat="server"></asp:Label></td></tr>
         <tr><td>附件：</td><td runat="server" id="publicAttachTD" colspan="7"></td></tr>
        <tr><td colspan="8" style="min-height:400px;"><asp:Literal ID="ContentHtml" runat="server"></asp:Literal></td></tr>
    </table>
</div>
</form>
</body>
</html>
