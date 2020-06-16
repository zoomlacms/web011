<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_AddSchool, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加学校信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td colspan="2" class="text-center">
			<strong>
				<asp:Label ID="Label1" runat="server" Text="添加学校信息"></asp:Label></strong>
		</td>
	</tr>
	<tr>
		<td style="width: 31%;"><strong>学校名称</strong></td>
		<td>
			<asp:TextBox ID="txtSchoolName" class="form-control" runat="server" Width="340px"></asp:TextBox>
			<span style="color: Red">*</span>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSchoolName"
				Display="Dynamic" ErrorMessage="学校名称不能为空!"></asp:RequiredFieldValidator></td>
	</tr>
	<tr>
		<td><strong>所属国家</strong></td>
		<td>
			<asp:DropDownList ID="txtCountry" CssClass="form-control" Width="150" runat="server" AutoPostBack="True" OnSelectedIndexChanged="txtCountry_SelectedIndexChanged"></asp:DropDownList>
			<span style="color: Red">*</span>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCountry" ErrorMessage="所属国家不能为空!"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td><strong>所属省份</strong></td>
		<td>
			<asp:TextBox ID="txtProvince" class="form-control" runat="server" Width="108px"></asp:TextBox>
			<asp:DropDownList ID="Province2" CssClass="form-control" Width="150" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Province2_SelectedIndexChanged"></asp:DropDownList>
			<span style="color: Red">*</span>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProvince" ErrorMessage="省份不能为空!"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td><strong>学校类型</strong></td>
		<td>
			<asp:DropDownList CssClass="form-control" Width="150" ID="txtSchoolType" runat="server">
				<asp:ListItem Value="1">小学</asp:ListItem>
				<asp:ListItem Value="2">中学</asp:ListItem>
				<asp:ListItem Value="3">大学</asp:ListItem>
				<asp:ListItem Value="4">其他</asp:ListItem>
			</asp:DropDownList></td>
	</tr>
	<tr>
		<td><strong>学校性质</strong></td>
		<td>
			<asp:DropDownList CssClass="form-control" Width="150" ID="txtVisage" runat="server">
				<asp:ListItem Value="1">公办</asp:ListItem>
				<asp:ListItem Value="2">私立</asp:ListItem>
			</asp:DropDownList></td>
	</tr>
	<tr>
		<td><strong>学校信息</strong></td>
		<td>
			<asp:TextBox ID="txtSchoolInfo" TextMode="MultiLine" class="form-control" runat="server" Height="148px" Width="451px"></asp:TextBox></td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:HiddenField ID="txtID" runat="server" />
			<asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="确认添加" OnClick="Button1_Click" />
			<asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="取消返回" OnClientClick="location.href='SnsSchool.aspx';return false;" />
		</td>
	</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
	function SetCountry(coun)
	{
		alert(coun);
		$("#txtCountry").val("阿富汗");
	}
</script>
</asp:Content>