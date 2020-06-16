<%@ page language="C#" autoeventwireup="true" inherits="Scha, App_Web_nrvv23mt" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>防伪查询</title> 
<link type="text/css" rel="stylesheet" href="/App_Themes/UserThem/Default.css" /> 
</head>
<body style="background:#eaf3fc">
<form id="form1" runat="server">
<div  class="fwdiv">
<h1>防伪查询</h1> 
<div class="us_topinfo">
请输入防伪码:&nbsp;<asp:TextBox ID="FakeCode" runat="server" onkeypress="TextValidate()" CssClass="input_on" onkeyup="value=value.replace(/[^\w]/ig,'')" height="21"></asp:TextBox>
    <script type="text/javascript">
    </script>
    <asp:Button ID="Sub" runat="server" Text="查询" OnClick="sub_Click" class="i_bottom" height="28" Width="80"/>
    <asp:Label ID="Remind" runat="server" Text="" style="color:red;font-size:15px;"></asp:Label>
</div>
    
 <div class="grey">注：如需进行兑换，请<a href="/user/">点击登录</a>会员中心进行操作！</div>
</div>
</form>
</body>
</html>
