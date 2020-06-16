<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_AddWx, App_Web_ckavs3bx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>微信回复</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>

<body> 
<form id="form1" runat="server">
<div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
    <div id="help"> <a onclick="help_show('107')" title="帮助"></a></div>
<%} %>后台管理 &gt;&gt; <a href="Default.aspx">微信管理</a> &gt;&gt; <a href="Default.aspx?Types=1">网站响应</a> &gt;&gt; <asp:Label ID="TxtNames" runat="server" ></asp:Label>网站响应</div>
<div class="spacingtitle">设置微信回复消息</div>
<asp:HiddenField ID="TxtType" runat="server" Value="1" />
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong> 接收的信息类型：</strong> 
</td><td><asp:RadioButtonList ID="drGetType" runat="server" RepeatDirection="Horizontal"  AutoPostBack="True" OnSelectedIndexChanged="getType_SelectedIndexChanged">
<asp:ListItem Text="text" Value="text" Selected >文字</asp:ListItem>
<asp:ListItem Text="image"  Value="image" >图片</asp:ListItem>
<asp:ListItem Text="location"  Value="location">地理位置</asp:ListItem>
<asp:ListItem Text="link"  Value="link">链接</asp:ListItem>
 

</asp:RadioButtonList></td></tr> 
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong>类别筛选</strong></td><td>
     <asp:TextBox ID="drMsgType" CssClass="l_input" runat="server"  Text="text" Visible="false"></asp:TextBox>
    <asp:RadioButtonList ID="txtTitle" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="MsgType_SelectedIndexChanged"  RepeatDirection="Horizontal">
<asp:ListItem Text="text"  Value="NodeID">栏目列表</asp:ListItem>
<asp:ListItem Text="text"  Value="Artice" Selected>文章列表</asp:ListItem>
<asp:ListItem Text="text"  Value="Photo" >图库中心</asp:ListItem>
<asp:ListItem Text="text"  Value="Tel">联系我们</asp:ListItem>  
<asp:ListItem Text="text"  Value="SmallSite">微门户</asp:ListItem>  
<asp:ListItem Text="text"  Value="LBS">地理位置</asp:ListItem> 
 </asp:RadioButtonList>
</td></tr> 
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" id="Tabkey" runat="server">
<td  class="tdbgleft" width="150" ><strong> 关键字：</strong></td>
<td><asp:TextBox ID="TxtKeys" runat="server" CssClass="l_input" Width="200"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="关键字不能为空" SetFocusOnError="false"  ControlToValidate="TxtKeys"></asp:RequiredFieldValidator>
</td></tr>
 </table>   

<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabCont"  runat="server">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong>选择栏目：</strong></td>
<td>
    <asp:DropDownList ID="TxtContent" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="TxtContent_SelectedIndexChanged" >
        <asp:ListItem Text="text"  Value="NodeID">栏目列表</asp:ListItem>
        </asp:DropDownList>

 </td></tr>
</table>   
 <table width="100%" border="0" cellpadding="2" cellspacing="1" id="FieldTable"  runat="server" visible="false">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong>选择字段：</strong></td>
<td>
<asp:DropDownList ID="Field" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="Field_SelectedIndexChanged" >
    <asp:ListItem Text="text"  Value="">字段</asp:ListItem>
</asp:DropDownList>

 </td></tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" >
<tr class="tdbg"  ><td></td><td >
<asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="确定" CssClass="C_input"  />
<input type="button" ID="Button2" OnClick="javascript: window.history.go(-1)" class="C_input" value="取消" /></td></tr>
</table>
</form>
</body>
</html>
