﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_AddWx, App_Web_rkfx1jmi" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>微信回复</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script language="javascript">
        function setEmpty(obj,names) {
            if (obj.value == names) {
                obj.value = "";
            }
        }
        function settxt(obj,names) {
            if (obj.value == "") {
                obj.value = names;
            }
        }
</script>
</head>

<body> 
<form id="form1" runat="server">
<div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
    <div id="help"> <a onclick="help_show('107')" title="帮助"></a></div>
<%} %>后台管理 &gt;&gt; <a href="Default.aspx">微信管理</a> &gt;&gt; <a href="Default.aspx?Types=0">预设响应</a> &gt;&gt; <asp:Label ID="TxtNames" runat="server" ></asp:Label>预设响应</div>
<div class="spacingtitle">设置微信回复消息</div>
<asp:HiddenField ID="TxtType" runat="server" Value="0" />
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong> 接收的信息类型：</strong> 
</td><td><asp:RadioButtonList ID="drGetType" runat="server"  RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="getType_SelectedIndexChanged">
<asp:ListItem Text="text" Value="text" Selected >文字</asp:ListItem>
<asp:ListItem Text="image"  Value="image" >图片</asp:ListItem>
<asp:ListItem Text="location"  Value="location">地理位置</asp:ListItem>
<asp:ListItem Text="link"  Value="link">链接</asp:ListItem> 
</asp:RadioButtonList></td></tr> 
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong>发送信息类型</strong></td><td>
    <asp:RadioButtonList ID="drMsgType" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="MsgType_SelectedIndexChanged"  RepeatDirection="Horizontal" >
<asp:ListItem Text="text"  Value="text" Selected>文字</asp:ListItem>
<asp:ListItem Text="music"  Value="music">音乐</asp:ListItem>
 <asp:ListItem Text="news"  Value="news"> 图文</asp:ListItem> 
</asp:RadioButtonList> </td></tr> 
<tr id="Tablekey" runat="server" class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150"  id="Td1" runat="server"><strong> 关键字：</strong></td><td><asp:TextBox ID="TxtKeys" runat="server" CssClass="l_input" Width="350"></asp:TextBox> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="关键字不能为空" SetFocusOnError="false"  ControlToValidate="TxtKeys"></asp:RequiredFieldValidator>
</td></tr>
</table>
 <table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabTit" runat="server" visible="false">
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>标题</strong></td>
<td> <asp:TextBox ID="txtTitle" CssClass="l_input" runat="server" Width="350"></asp:TextBox></td></tr>
</table> 
<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabCont"  runat="server">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong>信息内容： </strong></td><td><asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Rows="10" Columns="47" class="x_input"></asp:TextBox></td></tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabMus" runat="server" visible="false">
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong id="MusicName" runat="server">音乐链接 </strong></td>
    <td><asp:TextBox ID="txtMusicUrl" runat="server" CssClass="l_input" Text="" Width="350"></asp:TextBox>
        <iframe id="Iframe1" style="top: 2px" src="/manage/shop/fileupload.aspx?menu=txtMusicUrl" width="100%" height="25" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
        <span class="tips" style="color: #808000;">  </span></td></tr></table>

<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabMusUrl" runat="server" visible="false">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>高质量音乐链接： </strong></td>
    <td><asp:TextBox ID="HQMusicUrl" runat="server" CssClass="l_input" onclick="setEmpty(this,'http://')" onblur="settxt(this,'http://')" Text="http://"  Width="450"></asp:TextBox>
        <span class="tips" style="color: #808000;">  </td></tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1"  id="TabPic" runat="server" visible="false">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>图片地址：</strong></td><td> 
    <asp:TextBox ID="TxtPicUrl" runat="server" CssClass="l_input" Text="" Width="350"></asp:TextBox>
    <iframe id="bigimgs" style="top: 2px" src="/manage/shop/fileupload.aspx?menu=TxtPicUrl" width="100%" height="25" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
    <span class="tips" style="color: #808000;"> </td></tr>
    </table>
<table width="100%" border="0" cellpadding="2" cellspacing="1"  id="TabUrl" runat="server" visible="false">
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>信息链接地址：</strong></td><td> <asp:TextBox ID="TxtUrl" runat="server" CssClass="l_input"  onclick="setEmpty(this,'http://')" onblur="settxt(this,'http://')" Text="http://" Width="350"></asp:TextBox><span class="tips" style="color: #808000;"> </td></tr> 
</table>  
     
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" >
<tr class="tdbg"  ><td></td><td ><asp:Button ID="Button1" runat="server"  OnClick="Button1_Click" Text="确定" CssClass="C_input"  /> <input type="button" ID="Button2" OnClick="javascript: window.history.go(-1)" class="C_input" value="取消" /></td></tr>
</table>
</form>
</body>
</html>
