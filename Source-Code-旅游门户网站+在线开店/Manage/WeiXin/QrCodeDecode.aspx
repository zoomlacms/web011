<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_QrCodeDecode, App_Web_ckavs3bx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>二维解码</title> 
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<script language="javascript" type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理 &gt;&gt; <a href="wxApi.aspx">微信管理</a> &gt;&gt; <a href="QrCode.aspx">生成二维码</a>  <a href="QrCodeManage.aspx" style="color:#ff0000;">[二维码管理]</a></div> 
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr  class="tdbg"><td  class="tdbgleft" width="150" >选择图片</td><td width="350"><asp:FileUpload ID="FupFile" runat="server" /><br /><asp:Label ID="ReturnManage" runat="server"></asp:Label></td><td rowspan="3"><asp:Image ID="ImgCode" runat="server"/> </td></tr>
<tr class="tdbg" ><td  class="tdbgleft" width="150" >解码内容为：</td><td><asp:Label ID="txtEncodeData" runat="server" TextMode="MultiLine" Width="300" Height="100"   ></asp:Label></td></tr>
<tr class="tdbg"><td></td><td ><asp:Button ID="Button2" runat="server" Text="上传解码" OnClick="BtnUpload_Click" /></td></tr>
</table> 
</form>
</body>
</html>
