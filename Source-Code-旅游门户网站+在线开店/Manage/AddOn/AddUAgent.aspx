<%@ page language="C#" autoeventwireup="true" inherits="manage_Profile_AddUAgent, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>设置设备</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
 <%=lang.LF("后台管理")%>  &gt;&gt;<%=lang.LF("系统设置")%>  &gt;&gt;<a href="UAgent.aspx"><%=lang.LF("自适配设备")%></a> &gt;&gt;<%=lang.LF("添加自适配设备")%>
</div>
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
<tbody id="Tabs0">
    <tr class="spacingtitle" style="height:30px;">
		<td align="center" colspan="2" ><asp:Label ID="lblText" runat="server"><%=lang.LF("添加自适配设备")%></asp:Label></td>
    </tr>  
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 180px" class="tdbgleft"><strong>设备名称：</strong></td>
        <td>
            <asp:TextBox ID="TxtHeaders" class="l_input" runat="server" Width="200"  /><span style="color: #ff0066;">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtHeaders" ErrorMessage="设备名称"></asp:RequiredFieldValidator> 
            <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>
        </td>
    </tr>    
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 180px" class="tdbgleft"><strong>Agent关键词：</strong></td>
        <td>
            <asp:TextBox ID="TxtUserAgent" class="l_input" runat="server" Width="200"  /><span style="color: #ff0066;">*</span><span class="tips" style="color: #808000;"> 根据此关键词判断Url目标地址</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUserAgent" ErrorMessage="Agent关键词" ></asp:RequiredFieldValidator> 
           <span style="color:#808000;"><a style="color:#f00;" href="http://bbs.zoomla.cn/showtopic-192284.aspx" title="关键字参照" target="_blank">关键字参照</a></span>
        </td>
    </tr>  
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 180px" class="tdbgleft"><strong>Url目标地址：</strong></td>
        <td>
            <asp:TextBox ID="TxtUrl" class="l_input" runat="server" Width="200" /><span style="color: #ff0066;">* </span><span class="tips" style="color: #808000;">注：外部地址请加上"http://" </span><asp:RequiredFieldValidator ID="ReqFv" runat="server" ControlToValidate="TxtUrl" ErrorMessage="请录入Url目标地址" ></asp:RequiredFieldValidator> 
        </td>
    </tr>  
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td style="width: 180px" class="tdbgleft"><strong>启用：</strong></td>
        <td>
            <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem Value="1" Selected="True">开启</asp:ListItem>
            <asp:ListItem Value="0">关闭</asp:ListItem>
          </asp:RadioButtonList>
        </td>
    </tr>

</table>
<div class="clearbox"></div>
<div style=" text-align:center; width:800px"><asp:Button ID="BtnCommit" runat="server" Text="提交"  class="C_input" onclick="Button1_Click"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <input type="button" value="返回" class="C_input" onclick="location.href = 'UAgent.aspx';"
</div> 
</form>
</body>
</html>
