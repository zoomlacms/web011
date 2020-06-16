<%@ page language="C#" autoeventwireup="true" inherits="manage_Exam_ExportExcel, App_Web_lmkt1j3a" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>导入数据</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<style>
    #Div1 {padding-left:20px; line-height:30px;}
    #Div1 a{text-decoration:underline;}
</style>
</head>
<body id="Guidebody" style="margin-left: 0px; margin-right: 0px; margin-top: 1px; margin-bottom: 0px">
    <form id="formGuide" runat="server">
    <div id="Div1" > <br /> <asp:HiddenField ID="HdnPath" runat="server" />
       导入Excel文件：<asp:FileUpload runat="server" ID="FileUpload1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button   runat="server" ID="Export"  class="C_input" Text="导入文件"  onclick="Export_Click" /> [<asp:LinkButton ID="LinkButton1" Text="点击下载Excel模版↓" OnClick="Button1_Click" runat="server"></asp:LinkButton>]
      
    </div>
    </form>
</body>
</html>
