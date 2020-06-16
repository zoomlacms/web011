<%@ page language="C#" autoeventwireup="true" inherits="manage_User_wxApi, App_Web_ts0myu12" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>接口配置</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
    <div id="help"> <a onclick="help_show('107')" title="帮助"></a></div>
<%} %>后台管理 &gt;&gt; <a href="wxApi.aspx">微信管理</a> &gt;&gt; 接口配置</div>
    <div class="spacingtitle">微信公众平台接口配置</div>
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="120" ><strong> ToKen:</strong></td><td style=" padding-left:10px"><asp:TextBox ID="txtToKen" runat="server"  Width="210px" class="l_input"></asp:TextBox>
    
</td></tr>

<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" width="120" ><strong> 默认信息:</strong></td><td style=" padding-left:10px">
    <asp:TextBox ID="TxtBox" runat="server" Text="" TextMode="MultiLine"   Rows="5" Columns="60" class="x_input"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入默认信息" ControlToValidate="TxtBox"></asp:RequiredFieldValidator>
 </td></tr>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
   <td colspan="2">

<asp:Button ID="Button3" runat="server" class="C_input" Text="保存" OnClick="CreateAPI_Click" /><asp:RequiredFieldValidator ID="Reqtoken" runat="server" ErrorMessage="请输入ToKen" ControlToValidate="txtToKen"></asp:RequiredFieldValidator> 

   </td> </tr>


<tr id="trcode" runat="server" visible="false" class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
<td  class="tdbgleft" ><strong>代码:</strong></td> <td align="left" style=" text-align:left; padding-left:10px">
	<asp:TextBox ID="TxtZoneCode" runat="server" TextMode="MultiLine" class="x_input" style="padding:5px;" Height="310px" Width="910px" Text=""></asp:TextBox>
	&nbsp;<br />
    <br /> 
    <input id="Button1" type="button" value="获取Api代码" class="C_input"  onclick="copy()"/>
	</td>
</tr> 

</table>
<table width="100%" class="border" style="margin-top: 5px;" border="0" cellspacing="1" cellpadding="2">
<tr class="tdbg" >
<td align="left" style="  padding-left:10px;"  colspan="2"> 
<strong>使用说明：</strong>
<ul class="disc">
<li>您需要访问[<a href="http://mp.weixin.qq.com" target="_blank" style="color:Grey">微信公众平台</a>]申请开发者ToKen号。</li>
<%--<li>点击按钮复制代码然后替换[<A href='../Template/TemplateManage.aspx' style="color:Grey">首页模板</A>]从而验过验证，验证教程可见<a href="http://www.zoomla.cn/help/Mobile/2052.shtml" target="_blank"  style="color:Grey"> http://www.zoomla.cn/help/Mobile/2052.shtml </a>。</li>--%>
    <li>默认信息为用户访问出错的友好提示。</li>
</ul>
</td>
</tr>
</table>
</form>
<script>
function copy() {
    var inner = "复制脚本失败您的浏览器不支持复制，请手动复制代码。";
    if (window.clipboardData) {
        inner = "复制脚本成功您现在可以将代码粘贴（ctrl+v）到网站首页中。";

        var str = document.getElementById("TxtZoneCode").value;
        while (str.indexOf("&lt;") >= 0) {
            str = str.replace("&lt;", "<");
        }
        while (str.indexOf("&gt;") >= 0) {
            str = str.replace("&gt;", ">");
        }

        window.clipboardData.setData("Text", str);
        alert(inner);

    }
    else { alert(inner); }
}
</script>
</body>
</html>
