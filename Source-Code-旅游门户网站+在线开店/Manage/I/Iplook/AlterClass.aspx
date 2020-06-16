<%@ page language="C#" autoeventwireup="true" inherits="AlterIp, App_Web_tjowvou3" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<title>IP分类管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<style type="text/css">
    .style1
    {
        background: #e0f7e5;
/*line-height: 120%;*/    padding: 2px;
        width: 223px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server" class="tdbgleft">
      <div class="r_navigation">
        
        <span>后台管理</span> &gt;&gt; <span>扩展功能</span> &gt;&gt; <span>其他功能</span> &gt;&gt; <span><a href="DownServerManage.aspx"> IP分类管理</a></span>
        &gt;&gt; <span> 
            <asp:Label ID="Label4" runat="server" Text="修改分类信息"></asp:Label></span>
    </div>
    <div class="clearbox">
    </div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
        
        <tr align="center">
            <td colspan="2" class="spacingtitle">
                <strong>
                    <asp:Label ID="LblTitle" runat="server" Text="修改分类信息" Font-Bold="True"></asp:Label>
                </strong>
            </td>
        </tr>
        
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="left" class="style1">
                <strong>分类ID�?/strong>
            </td>
            <td class="tdbg" style="text-align: left; width: 70%;">
                <asp:TextBox ID="class_ID"  class="l_input" runat="server" Width="290px" Enabled="False"></asp:TextBox>
               
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td  align="left" class="style1">
                <strong>分类名：</strong><br />
            </td>
            <td class="tdbg" style="text-align: left; width: 70%;">
                <asp:TextBox ID="class_name" class="l_input" runat="server" Width="290px"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="left" class="style1">
                <strong>所属分类：</strong>
            </td>
            <td class="tdbg" style="text-align: left; ">
                <asp:DropDownList ID="leadto_ID" runat="server" Width="156px" DataTextField="class_name" DataValueField="class_ID">
        </asp:DropDownList>
            </td>
        </tr>
       
        <tr class="tdbg">
            <td style="text-align: center" colspan="2">
                <asp:Button ID="EBtnModify" class="C_input"  Text="修改" OnClick="EBtnModify_Click" runat="server" /><input name="BtnCancel" type="button" class="C_input"  onclick="javascript:window.location.href='IPManage.aspx'"
                    value=" 取消 " /></td>
        </tr>
    </table>
    
    </form>
</body>
</html>
