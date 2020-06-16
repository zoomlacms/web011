<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_SendWx, App_Web_rkfx1jmi" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>微信发送</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/thickbox.css" rel="stylesheet" />
        <script language="javascript">
            function setEmpty(obj, names) {
                if (obj.value == names) {
                    obj.value = "";
                }
            }
            function settxt(obj, names) {
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
<%} %>后台管理 &gt;&gt; <a href="wxApi.aspx">微信管理</a> &gt;&gt; 微信发送</div>
<div class="spacingtitle">发送微信公众消息</div> 
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border"> 
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<asp:HiddenField ID="TxtType" runat="server" Value="0" />
<td  class="tdbgleft" width="150" ><strong>发送信息类型</strong></td><td><asp:RadioButtonList ID="drMsgType" runat="server"  AutoPostBack="True"   RepeatDirection="Horizontal"  OnSelectedIndexChanged="MsgType_SelectedIndexChanged" >
<asp:ListItem Text="text"  Value="text" Selected>文字</asp:ListItem>
<asp:ListItem Text="music"  Value="music">音乐</asp:ListItem>
<asp:ListItem Text="news"  Value="news">图文</asp:ListItem></asp:RadioButtonList></td></tr>  
 </table> 
<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabTit" runat="server" visible="false">
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>标题</strong></td>
<td> <asp:TextBox ID="txtTitle" CssClass="l_input" runat="server" Width="450"></asp:TextBox></td></tr>
</table> 
<table width="100%" border="0" cellpadding="2" cellspacing="1" >
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="150" ><strong>信息内容： </strong></td><td><asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Rows="10" Columns="60" class="x_input"></asp:TextBox></td></tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabMus" runat="server" visible="false">
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>音乐链接 </strong></td><td><asp:TextBox ID="txtMusicUrl" runat="server" CssClass="l_input"  onclick="setEmpty(this,'地址必须完整，如：http://zoomla.cn')" onblur="settxt(this,'地址必须完整，如：http://zoomla.cn')" Text="地址必须完整，如：http://zoomla.cn" Width="450"></asp:TextBox> </td></tr>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>高质量音乐链接 </strong></td><td><asp:TextBox ID="HQMusicUrl" runat="server" CssClass="l_input"  onclick="setEmpty(this,'地址必须完整，如：http://zoomla.cn')" onblur="settxt(this,'地址必须完整，如：http://zoomla.cn')" Text="地址必须完整，如：http://zoomla.cn"  Width="450"></asp:TextBox></td></tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="1"  id="TabNews" runat="server" visible="false">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>图片URl</strong></td><td> <asp:TextBox ID="TxtPicUrl" runat="server" CssClass="l_input" onclick="setEmpty(this,'地址必须完整，如：http://zoomla.cn')" onblur="settxt(this,'地址必须完整，如：http://zoomla.cn')" Text="地址必须完整，如：http://zoomla.cn"  Width="450"></asp:TextBox></td></tr>
<tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td class="tdbgleft" width="150" ><strong>信息链接地址</strong></td><td> <asp:TextBox ID="TxtUrl" runat="server" CssClass="l_input"  onclick="setEmpty(this,'地址必须完整，如：http://zoomla.cn')" onblur="settxt(this,'地址必须完整，如：http://zoomla.cn')" Text="地址必须完整，如：http://zoomla.cn"  Width="450"></asp:TextBox> </td></tr> 
</table>  
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" >
<tr class="tdbg"  ><td  width="150"></td><td > <input id="button" onclick="ontips()" type="button" value="发送"  class="C_input" /></td></tr></table>
 
<div id="Divtips" style="display:none;" > 
<div class="tit error"> 发送失败 <a id="fancybox-close" style="display: inline;" onclick="tb_remove()" href="javascript:void(0);" >  </a></div>
<p>出错的原因可能是CMS版本授权或认证的原因，<br />访问官网：<a href="http://www.zoomla.cn" style="color:grey;">www.zoomla.cn</a>，获官方支持。</p> 
</div>
</form>
<script>
function ontips()
{
    document.getElementById("Divtips").style.display = "";
}
function tb_remove()
{
    document.getElementById("Divtips").style.display = "none";
}
</script>
</body>
</html>
