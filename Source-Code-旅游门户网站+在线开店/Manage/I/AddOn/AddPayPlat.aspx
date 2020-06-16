<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.AddPayPlat, App_Web_uw5yi4gb" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>编辑在线支付平台</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
	<table class="table table-striped table-bordered table-hover">
		<tr align="center">
			<td class="spacingtitle" colspan="2">
				<asp:Label ID="LblTitle" runat="server" Text="添加在线支付平台" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>接口类型：</strong>
			</td>
			<td>
				<asp:DropDownList ID="DDLPayPlat" CssClass="form-control" runat="server" Width="160px" AutoPostBack="True" OnSelectedIndexChanged="DDLPayPlat_SelectedIndexChanged">
				</asp:DropDownList>
				<asp:DropDownList ID="DDLPayType" CssClass="form-control" runat="server" Width="130px">
				</asp:DropDownList>
				<span style="color: red">*</span> 必选
			</td>
		</tr>
		<%--<tr>
			 <td>
			</td>
			<td id="alipay" runat="server" style="display:none">
			   支付宝网站(www.alipay.com)是国内先进的网上支付平台<br />
			   <strong>逐浪CMS</strong>联合支付宝推出支付宝接口
			   <a href="http://act.life.alipay.com/systembiz/zhulang/" target="_parent" style="color:Red">立即在线申请</a> 
			</td>
		</tr>--%>
		<tr>
			<td>
				<strong>支付名称：</strong>
			</td>
			<td>
				<asp:TextBox ID="DDLPayName" runat="server" class="form-control"></asp:TextBox>
				<span style="color: red">*</span> 必填
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="支付名称为空！" ForeColor="Red" ControlToValidate="DDLPayName" Display="Dynamic" SetFocusOnError="True" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>商户ID：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtAccountID" runat="server" class="form-control" />
				<span style="color: red">*</span> 必填
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="商户ID不能为空！" ForeColor="Red" ControlToValidate="TxtAccountID" Display="Dynamic" SetFocusOnError="True" />
			</td>
		</tr>
		<tr id="trMD5Key" runat="server">
			<td>
				<strong>安全校验码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtMD5Key" runat="server" class="form-control" />
				<span style="color: red">*</span> 必填        
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="安全校验码不能为空!" ControlToValidate="TxtMd5Key" Display="Dynamic" ForeColor="Red" SetFocusOnError="true">  </asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td>
				<strong>卖家Email：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtSellerEmail" runat="server" class="form-control" />
				<span style="color: black">如支付宝接口必须填写卖家Email,否则会出错</span>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtSellerEmail" ForeColor="Red" Display="Dynamic" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不正确</asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td>
				<strong>分成：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtRate" runat="server" Text="0" class="form-control" />%&nbsp;&nbsp<span style="color: red">*</span>此项如设置为10%，则商户得到90%
				<asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^[0-9]\d*|0$" ControlToValidate="TxtRate" ErrorMessage="只能输入整数"></asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td>
				<strong>备注：</strong>
			</td>
			<td>
				<asp:TextBox ID="txtRemark" runat="server" Text="" class="form-control" TextMode="MultiLine" Height="144px" Width="509px" />
			</td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
				<asp:HiddenField ID="HdnPayPlatID" runat="server" />
				<asp:Button ID="EBtnSubmit" Text="保存" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
				<input name="Cancel" type="button" id="BtnCancel" value="取消" onclick="window.location.href = 'PayPlatManage.aspx'" class="btn btn-primary" />
			</td>
		</tr>
		<tr>
			<td colspan="2"><span style="color: red;">*交通银行专版需要定义/config/site.config中的BankcommUrl中的支持验证服务器，支持多银行支付。</span></td>
		</tr>
	</table>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
