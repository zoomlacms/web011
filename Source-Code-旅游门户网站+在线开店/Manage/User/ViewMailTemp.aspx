<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ViewMailTemp, App_Web_evybsxrg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>预览模板</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="../../JS/jquery.js"></script>
     <script type="text/javascript">
         function seeBigPicture() {
             top = getAbsoluteTop("LblPic");
             left = getAbsoluteLeft("LblPic");
             $("#seePicture").attr("top", top);
             $("#seePicture").attr("left", left);
             $("#seePicture").toggle("fast");
         }
         function getAbsoluteLeft(objectId) {
             o = document.getElementById(objectId)
             oLeft = o.offsetLeft
             while (o.offsetParent != null) {
                 oParent = o.offsetParent
                 oLeft += oParent.offsetLeft
                 o = oParent
             }
             return oLeft
         }
         //获取控件上绝对位置
         function getAbsoluteTop(objectId) {
             o = document.getElementById(objectId);
             oTop = o.offsetTop;
             while (o.offsetParent != null) {
                 oParent = o.offsetParent
                 oTop += oParent.offsetTop  // Add parent top position
                 o = oParent
             }
             return oTop
         }
         //获取控件宽度
         function getElementWidth(objectId) {
             x = document.getElementById(objectId);
             return x.offsetWidth;
         }
                </script>
</head>
<body>
<form id="form1" runat="server"> 
<div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
      <tr align="center" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td colspan="2" class="spacingtitle"><b>邮件模板</b></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td align="left" style="height: 28px; width: 100%;"><strong>模板名称：</strong>
          <asp:Label ID="LblTempName" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td  style="height: 28px; width: 100%;"><strong>缩略图：</strong> 
            <a href="javascript:seeBigPicture()" >    
            <asp:Image ID="LblPic" ImageUrl="#" runat="server" Width="150" Height="100" ToolTip="点击浏览大图"
                onerror="this.src='/UploadFiles/nopic.gif';"/> 
            </a> 
            <div style="display:none;position:absolute;" id="seePicture" onclick="seeBigPicture()">
                <asp:Image ID="LblPic2" alt="原图" runat="server"/>
            </div>
            <asp:Label ID="LblIncept" runat="server" Text=""></asp:Label></td>
      </tr>
       <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td align="left" style="height: 28px; width: 100%;"><strong>创建人：</strong>
          <asp:Label ID="LblAddUser" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td align="left" style="height: 28px; width: 100%;"><strong>创建时间：</strong>
          <asp:Label ID="LblCreateTime" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td align="left" style="height: 28px; width: 100%;"><strong>模板内容：</strong>
         </td>
      </tr>
      
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">  <td><asp:Label ID="LblContent" runat="server" Text="Label"></asp:Label></td> </tr>
      <tr class="tdbg">
        <td align="left" style="height: 28px; width: 100%; text-align: center">
          <asp:Button ID="BtnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" OnClientClick="return confirm('是否要删除此短消息？')" class="C_input" />
          <asp:Button ID="BtnReturn" runat="server" OnClick="BtnReturn_Click" Text="返回" class="C_input" />
          </td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>
