<%@ page language="C#" autoeventwireup="true" inherits="MIS_Project_AddMenber, App_Web_1230bsik" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加人员</title>
<script src="/JS/MisView.js"></script> 
</head>
<body>
<form id="form1" runat="server"> 
<div id="div_share" class="pop_box" style="width:500px;">
<div class="p_head">
<div class="p_h_title">人员选择</div>
<div class="p_h_close" onclick="HideDiv('div_share')">关闭</div>
</div>
<iframe id="ifm1" src="/Mis/SelUser.aspx" width="420" height="120" scrolling="no" frameborder="0"></iframe>
<div class="p_bottom">
<input type="button" value="确定" onclick="HideDiv('div_share')" />
</div>
</div>
    
</form>
</body>
</html>
