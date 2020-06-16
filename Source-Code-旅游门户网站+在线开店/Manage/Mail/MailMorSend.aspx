<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_MailMorSend, App_Web_0vozbcrl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>邮件群发</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/EditFile/sample.js"></script>
<link type="text/css" href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr>
    
<td align="center" colspan="3" class="spacingtitle"><b>邮件群发</b></td>
</tr>
    <tr class="tdbg" >
        <td align="right" class="tdbgleft"><strong>邮件模板：</strong></td>
        <td><asp:DropDownList ID="MailTemp" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="GetTempCon" Width="100px">
        <asp:ListItem ></asp:ListItem>
        </asp:DropDownList></td>
      </tr>
 

    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td align="right" class="tdbgleft"><strong>选择联系人组：</strong></td>
        <td><asp:DropDownList ID="Type" runat="server" AutoPostBack="True"  Width="160px" OnSelectedIndexChanged="Type_SelectedIndexChanged"  >
        <asp:ListItem Value="0">请选择</asp:ListItem>
        <asp:ListItem ></asp:ListItem>
        </asp:DropDownList></td>
      </tr>
 <tr class="tdbg"  onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td width="15%" align="right" class="tdbgleft"> </td>
<td style="text-align: left"> 
<asp:ListBox ID="txtSendTo" runat="server" Width="300px" SelectionMode="Multiple" Height="108px" Visible="False" > 
</asp:ListBox>
    
    
</td>
</tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td width="15%" align="right" class="tdbgleft"><strong>主 题：</strong></td>
<td style="text-align: left">
<asp:TextBox ID="TxtSubject" runat="server" Width="350px"  ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtSubject"    SetFocusOnError="false" ErrorMessage="*主题不能为空"></asp:RequiredFieldValidator>
</td>
</tr>
 <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td width="15%" align="right" class="tdbgleft"><strong>内 容：</strong></td>
<td style="text-align: left">
<asp:TextBox ID="TxtContent" runat="server" class="x_input" TextMode="MultiLine" Rows="10" Columns="60"></asp:TextBox>

</td>
     <script id="Script1" type="text/javascript">
         //<![CDATA[
         CKEDITOR.replace('TxtContent',
         {
             toolbar: [['Source', '-', 'Bold', 'Italic', 'Underline', 'Strike'], ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'], ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'], ['Link', 'Unlink', 'Anchor'], ['Image', 'Flash', 'SpecialChar'], '/', ['Styles', 'Format', 'Font', 'FontSize'], ['TextColor', 'BGColor', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
         }); //]]>
     </script>
</tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdb this.TxtSenderName.Text = SiteConfig.SiteInfo.Webmaster;
                this.TxtSenderEmail.Text = SiteConfig.SiteInfo.WebmasterEmail;g'">
<td width="15%" align="right" class="tdbgleft"><strong>发件人别名：</strong></td>
<td style="text-align: left">
<asp:TextBox ID="txtSendFrom" runat="server" Width="350px"></asp:TextBox>
 
</td>
</tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td align="right" class="tdbgleft"><strong>回复Email：</strong></td>
<td><asp:TextBox class="l_input" ID="TxtSenderEmail" runat="server" Width="350px"></asp:TextBox>
   <!-- <asp:Label ID="Label2" runat="server" Text="*注：默认回复到系统邮箱" ForeColor="#ff0066" Font-Size="12px"></asp:Label>-->
    <asp:RegularExpressionValidator ID="ValeSenderEmail" runat="server" ControlToValidate="TxtSenderEmail"  Display="None" ErrorMessage="回复Email不是有效的Email地址！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
</tr>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td align="right" class="tdbgleft"><strong>邮件优先级：</strong></td>
<td>
<asp:RadioButtonList ID="RadlPriority" runat="server" RepeatDirection="Horizontal">
<asp:ListItem Value="2">高</asp:ListItem>
<asp:ListItem Selected="True" Value="0">普通</asp:ListItem>
<asp:ListItem Value="1">低</asp:ListItem>
</asp:RadioButtonList></td>
</tr>

<tr class="tdbgbottom">
<td align="center" colspan="2">
    
    <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" CssClass="C_input" />
    &nbsp;&nbsp; &nbsp;
    <asp:Button ID="BtnClear" runat="server" Text="清除"  CssClass="C_input" OnClick="BtnClear_Click" /></td>
</tr>
</table>
</form>
    <script>
        function opendialog()
        {
            document.getElementById("FileUpload1").click();
        }
    </script>
</body>
</html>
