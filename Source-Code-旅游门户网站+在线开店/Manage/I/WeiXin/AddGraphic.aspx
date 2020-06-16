<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_AddWx, App_Web_aok2pvzt" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信回复</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:HiddenField ID="TxtType" runat="server" Value="3" />
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td style="vertical-align: top; width: 300px;">
			<div class="wxnum" style="width: 290px; border: 1px solid #8ec1ee; margin-right: 10px;">
				<ul>
					<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="lbtn_Click">
						<ItemTemplate>
							<li class="news">
								<div class="newsl">
									<img src="/uploadfiles/<%#Eval("ObjUrl") %>" />
								</div>
								<div class="newsr">
									<p><%#Eval("Title") %></p>
									<p><a href="<%#GetUrl(Eval("Keys").ToString(),Eval("ID").ToString()) %>">修改 </a>|
										<asp:LinkButton ID="lbtn" CommandArgument="Del" CommandName='<%#Eval("ID")%>' runat="server" Text="删除"> </asp:LinkButton>
									</p>
								</div>
							</li>
						</ItemTemplate>
					</asp:Repeater>
					<div style="clear: both"></div>
				</ul>
			</div>
		</td>

		<td>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
				<tr >
					<td class="tdbgleft" width="150"><strong>接收的信息类型：</strong>
					</td>
					<td>
						<asp:RadioButtonList ID="drGetType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Text="text" Value="text" Selected>文字</asp:ListItem>
							<asp:ListItem Text="image" Value="image">图片</asp:ListItem>
							<asp:ListItem Text="location" Value="location">地理位置</asp:ListItem>
							<asp:ListItem Text="link" Value="link">链接</asp:ListItem>


						</asp:RadioButtonList></td>
				</tr>
				<tr  style="display: none">
					<td class="tdbgleft" width="150"><strong>发送信息类型</strong></td>
					<td>
						<asp:RadioButtonList ID="drMsgType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="MsgType_SelectedIndexChanged">
							<asp:ListItem Text="text" Value="text" Selected>文字</asp:ListItem>
							<asp:ListItem Text="music" Value="music">音乐</asp:ListItem>
							<asp:ListItem Text="news" Value="news" Selected> 图文</asp:ListItem>
						</asp:RadioButtonList>

					</td>
				</tr>
				<tr >
					<td class="tdbgleft" width="150"><strong>关键字：</strong></td>
					<td>
						<asp:TextBox ID="TxtKeys" runat="server" CssClass="l_input" Width="350"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="关键字不能为空" SetFocusOnError="false" ControlToValidate="TxtKeys"></asp:RequiredFieldValidator>

					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabTit" runat="server">
				<tr >
					<td class="tdbgleft" width="150"><strong>标题</strong></td>
					<td>
						<asp:TextBox ID="TxtTitle" CssClass="l_input" runat="server" Width="350"></asp:TextBox></td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabCont" runat="server">
				<tr >
					<td class="tdbgleft" width="150"><strong>信息内容： </strong></td>
					<td>
						<asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Rows="10" Columns="47" class="x_input"></asp:TextBox></td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabMus" runat="server" visible="false">
				<tr >
					<td class="tdbgleft" width="150"><strong id="MusicName" runat="server">音乐链接 </strong></td>
					<td>
						<asp:TextBox ID="txtMusicUrl" runat="server" CssClass="l_input" Text="http://" Width="350"></asp:TextBox>
						<iframe id="Iframe1" style="top: 2px" src="<%:customPath2+"shop/fileupload.aspx?menu=txtMusicUrl" %>" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
						<span class="tips" style="color: #808000;"></span></td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabMusUrl" runat="server" visible="false">
				<tr >
					<td class="tdbgleft" width="150"><strong>高质量音乐链接 </strong></td>
					<td>
						<asp:TextBox ID="HQMusicUrl" runat="server" CssClass="l_input" Text="http://" Width="350"></asp:TextBox>
						<span class="tips" style="color: #808000;"></td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabPic" runat="server">
				<tr >
					<td class="tdbgleft" width="150"><strong>图片地址</strong></td>
					<td>
						<asp:TextBox ID="TxtPicUrl" runat="server" CssClass="l_input" Text="" Width="350"></asp:TextBox>
						<iframe id="bigimgs" style="top: 2px" src="<%:customPath2+"shop/fileupload.aspx?menu=TxtPicUrl" %>" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
						<span class="tips" style="color: #808000;"></td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" id="TabUrl" runat="server">
				<tr >
					<td class="tdbgleft" width="150"><strong>信息链接地址</strong></td>
					<td>
						<asp:TextBox ID="TxtUrl" runat="server" CssClass="l_input" onclick="setEmpty(this,'http://')" onblur="settxt(this,'http://')" Text="http://" Width="350"></asp:TextBox><span class="tips" style="color: #808000;"> </td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
				<tr class="tdbg">
					<td></td>
					<td>
						<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" CssClass="btn btn-primary" />
						<input type="button" id="Button2" onclick="javascript: window.history.go(-1)" class="btn btn-primary" value="取消" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
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
</asp:Content>
