<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_Submit, App_Web_znlyx4aw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>完成提交</title>
</head>
<body>
<form id="form1" runat="server">
<div  id="Meno" style="width:600px;"> 
<div class="dialog_head"><a href="javascript:void(0)" onclick="javascript:Window.Close();"> [关闭窗口]</a><span>总结</span>  </div>
<div class="popup_headti">[任务] <asp:Label ID="lblName" runat="server"></asp:Label> </div> 
<div>
    <table class="dialog" style="width: 540px;" border="0" cellSpacing="8" cellPadding="0">
<tr><th width="18%" align="right"> 事件标签*: </th><td><asp:Label ID="drType" runat="server" Text="总结">  </asp:Label>   </td></tr>
<tr><th align="right">创建人 : </th><td><asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td></tr>
<tr><th align="right">发起人 :  </th><td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td></tr>
<tr><th align="right">总结 : </th><td><asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine"  width="480px" height="200px"></asp:TextBox><br />
    注:提交完成后，您将不能再总结。 </td></tr> 
<tr><th align="right">附件 :</th><td><asp:FileUpload  ID="files" runat="server"/> 添加附件 单次上传文件大小不能超过36MB。 </td></tr> 
 <tr><td colspan="2"> <asp:Button ID="Button1" CssClass="i_bottom"  runat="server" Text="提交" />
   <asp:Button ID="concle" CssClass="i_bottom" runat="server" Text="取消" /></td></tr>
 </table>  
</div>
</form>
</body>
</html>
