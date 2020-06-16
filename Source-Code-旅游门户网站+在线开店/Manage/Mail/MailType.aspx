<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_MailType, App_Web_0vozbcrl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>类别设置</title>
     <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation">后台管理&gt;&gt;用户管理&gt;&gt;<a href="../User/MailList.aspx" >邮件发送</a>&gt;&gt;<a href="Mail.aspx">邮箱列表</a>&gt;&gt;类别设置</div>
        <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr>
<td align="center" colspan="2" class="spacingtitle"><b>类别设置</b></td>
</tr>

    <tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td width="180" align="right" class="tdbgleft"><strong>类别名称：</strong></td><td> <asp:TextBox ID="tbxTypeName" runat="server" class="l_input" Width="180"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxTypeName"    SetFocusOnError="false" ErrorMessage="类别名不能为空"></asp:RequiredFieldValidator>
</td></tr>



    
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td colspan="2">
    <asp:Button ID="Button1" CssClass="C_input" runat="server" OnClick="Button1_Click" Text="确定" />   &nbsp;<input type="button" class="C_input" value="返回" onclick="javascript: history.go(-1);" />
    </td></tr> 
</table>
    </form>
</body>
</html>
