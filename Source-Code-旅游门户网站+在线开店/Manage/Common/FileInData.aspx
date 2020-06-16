<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Common.FileInData, App_Web_cupi4rzo" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>文件入库</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/Common.js"></script>   
</head>
<body class="tdbg">
   <form id="form1" runat="server" enctype="multipart/form-data">
  <table style="height: 100%; border: 0; width: 100%">
    <tr class="tdbg">
      <td valign="top" align="left">  <div id="divFile" runat="server"><asp:LinkButton ID="lbtn1" runat="server" Text="文件下载" OnClick="lbtn1_Click"></asp:LinkButton> 
          <a href='FileInData.aspx?Showtype=<%= Request["Showtype"]%>&ModelID=<%= Request["ModelID"]%>&FieldName=<%= Request["FieldName"]%>&NodeId=<%= Request["NodeId"]%>&re=1'> 重新上传</a></div>  <asp:Label ID="LblMessage" runat="server" ForeColor="red" Text=""></asp:Label>
          <asp:Label ID="TxtView" runat="server" ></asp:Label>
          <asp:FileUpload ID="FupFile" runat="server" /> 
        <asp:Button ID="BtnUpload" runat="server" Text="上传" OnClick="BtnUpload_Click" />
        <asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="请选择文件路径" ControlToValidate="FupFile"></asp:RequiredFieldValidator>
       
        <asp:HiddenField ID="HiddenNodeDir" runat="server" />
        <asp:HiddenField ID="txtUploader" runat="server"></asp:HiddenField>
          <asp:HiddenField ID="gid" runat="server" Value="1" /> 
      
      </td>
    </tr>

  </table>
</form>
    <script> 
        var itemid = window.parent.document.getElementById("HdnItem").value;
        var id = "<%=Request["Gid"]%>";
        var re = "<%=Request["re"]%>";
        var st = "<%=Request["Showtype"]%>";
        if (itemid != "" && id == "" && re != "1")
        {
            window.location.href = "../Common/FileInData.aspx?Showtype=<%=Request["Showtype"]%>&ModelID=<%=Request["ModelID"]%>&FieldName=<%=Request["FieldName"]%>&NodeId=<%=Request["NodeId"]%>&Gid=" + itemid;
        }
        //document.getElementById("gid").value = itemid;
        
    </script>
</body>
</html>
