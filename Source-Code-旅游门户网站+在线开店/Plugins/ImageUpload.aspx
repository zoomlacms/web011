<%@ page language="C#" autoeventwireup="true" inherits="Plugins_ImageUpload, App_Web_tfch1s4r" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>上传图片</title> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="fup_Image" runat="server" /> &nbsp; &nbsp;
        <asp:Button ID="btnUpload" runat="server" Text="上传" OnClick="btnUpload_Click"  />
        <span id="span_Error" style="display:none;color:red;padding-left:15px;font-size:11px;" runat="server">图片上传成功</span>
    </div>
    </form>
</body>
</html>
