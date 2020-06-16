<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_AddStruct, App_Web_hc0q2vuk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加组织结构</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <div class="r_navigation">
           后台管理 &nbsp;&gt;&gt;&nbsp; 企业办公 &nbsp;&gt;&gt;&nbsp; <a href="Structure.aspx">组织结构</a> &gt;&gt; 添加组织结构
        </div>
    <div class="clearbox"></div>

    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
        <tbody id="Tabs0">
            <tr class="spacingtitle" style="height:30px;">
			    <td align="center" colspan="2" ><asp:Label ID="lblText" runat="server">组织结构</asp:Label></td>
            </tr>  
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td style="width: 288px" class="tdbgleft"><strong>结构名：</strong></td>
                <td>
                    <asp:TextBox ID="TxtStructName" class="l_input" runat="server" />
                    <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>    
        </table>
        <div class="clearbox"></div>
        <div style=" text-align:center; width:800px"><asp:Button ID="BtnCommit" runat="server" Text="提交"  class="C_input" onclick="Button1_Click"/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Btn" runat="server" Text="返回" class="C_input" onclick="Button2_Click" />
        </div>
    </form>
</body>
</html>
