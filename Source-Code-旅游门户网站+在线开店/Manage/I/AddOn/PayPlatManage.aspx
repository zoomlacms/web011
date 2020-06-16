<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.PayPlatManage, App_Web_uw5yi4gb" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>支付平台管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ZL:ExGridView ID="EGV" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="PayPlatID" PageSize="20" OnRowDataBound="Egv_RowCreated" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%" EmptyDataText="无相关信息！！">
<Columns>
	<asp:BoundField HeaderText="ID" DataField="PayPlatID">
		<HeaderStyle Width="5%" />
		<ItemStyle HorizontalAlign="Center" />
	</asp:BoundField>
	<asp:BoundField HeaderText="名称" DataField="PayPlatName">
		<HeaderStyle Width="20%" />
		<ItemStyle HorizontalAlign="Center" />
	</asp:BoundField>
	<asp:BoundField HeaderText="商户ID" DataField="AccountID">
		<HeaderStyle Width="20%" />
		<ItemStyle HorizontalAlign="Center" />
	</asp:BoundField>
	<asp:TemplateField HeaderText="手续费">
		<ItemTemplate>
			<%# GetRate(Eval("Rate", "{0}")) %>
		</ItemTemplate>
		<HeaderStyle Width="5%" />
		<ItemStyle HorizontalAlign="Center" />
	</asp:TemplateField>
	<asp:TemplateField HeaderText="默认">
		<ItemTemplate>
			<%# GetDefault(Eval("IsDefault", "{0}")) %>
		</ItemTemplate>
		<HeaderStyle Width="5%" />
		<ItemStyle HorizontalAlign="Center" />
	</asp:TemplateField>
	<asp:TemplateField HeaderText="启用">
		<ItemTemplate>
			<%# GetDisabled(Eval("IsDisabled", "{0}")) %>
		</ItemTemplate>
		<HeaderStyle Width="5%" />
		<ItemStyle HorizontalAlign="Center" />
	</asp:TemplateField>
	<asp:TemplateField HeaderText="操作">
		<ItemTemplate>
			<asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("PayPlatID") %>'>修改</asp:LinkButton>
			| 
		<asp:LinkButton ID="LinkButton3" runat="server" CommandName="SetDef" CommandArgument='<%# Eval("PayPlatID") %>'>默认</asp:LinkButton>
			|
		<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Disabled" CommandArgument='<%# Eval("PayPlatID") %>'>禁用</asp:LinkButton>
			|
		<asp:LinkButton ID="LinkButton4" runat="server" CommandName="MovePre" CommandArgument='<%# Eval("PayPlatID") %>'>前移</asp:LinkButton>
			| 
		<asp:LinkButton ID="LinkButton5" runat="server" CommandName="MoveNext" CommandArgument='<%# Eval("PayPlatID") %>'>后移</asp:LinkButton>
			|
		<asp:LinkButton ID="LinkButton6" runat="server" CommandName="Delete" CommandArgument='<%# Eval("PayPlatID") %>' OnClientClick="return confirm('确定删除？')">删除</asp:LinkButton>
		</ItemTemplate>
		<ItemStyle HorizontalAlign="Center" />
	</asp:TemplateField>
</Columns> 
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/js/Common.js"></script>
<script type="text/javascript">
HideColumn("3,4,5");
</script>
</asp:Content>
