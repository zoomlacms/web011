<%@ page language="C#" autoeventwireup="true" inherits="manage_User_wxApi, App_Web_uaxbugcv" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>接口配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
<tr>
	<td class="tdbgleft" width="120"><strong>ToKen:</strong></td>
	<td style="padding-left: 10px">
		<asp:TextBox ID="txtToKen" runat="server" class="form-control"></asp:TextBox>
	</td>
</tr>
<tr>
	<td class="tdbgleft" width="120"><strong>默认信息:</strong></td>
	<td style="padding-left: 10px">
		<asp:TextBox ID="TxtBox" runat="server" Text="" TextMode="MultiLine" Rows="5"  class="form-control"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入默认信息" ControlToValidate="TxtBox"></asp:RequiredFieldValidator>
	</td>
</tr>
<tr>
	<td colspan="2">
		<asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="保存" OnClick="CreateAPI_Click" /><asp:RequiredFieldValidator ID="Reqtoken" runat="server" ErrorMessage="请输入ToKen" ControlToValidate="txtToKen"></asp:RequiredFieldValidator>
	</td>
</tr>
<tr id="trcode" runat="server" visible="false">
	<td class="tdbgleft"><strong>代码:</strong></td>
	<td align="left" style="text-align: left; padding-left: 10px">
		<asp:TextBox ID="TxtZoneCode" runat="server" TextMode="MultiLine" class="x_input" Style="padding: 5px;" Height="310px" Width="910px" Text=""></asp:TextBox>
		&nbsp;<br />
		<br />
		<input id="Button1" type="button" value="获取Api代码" class="btn btn-primary" onclick="copy()" />
	</td>
</tr>
</table>
<table class="table table-striped table-bordered table-hover">
<tr class="tdbg">
	<td align="left" style="padding-left: 10px;" colspan="2">
		<strong>使用说明：</strong>
		<ul class="disc">
			<li>您需要访问[<a href="http://mp.weixin.qq.com" target="_blank" style="color: Grey">微信公众平台</a>]申请开发者ToKen号。</li>
			<%--<li>点击按钮复制代码然后替换[<A href='../Template/TemplateManage.aspx' style="color:Grey">首页模板</A>]从而验过验证，验证教程可见<a href="http://www.zoomla.cn/help/Mobile/2052.shtml" target="_blank"  style="color:Grey"> http://www.zoomla.cn/help/Mobile/2052.shtml </a>。</li>--%>
			<li>默认信息为用户访问出错的友好提示。</li>
		</ul>
	</td>
</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/js/Common.js"></script>
<script type="text/javascript">
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
</asp:Content>