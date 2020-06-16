<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_SpecialContent, App_Web_gqexlk3x" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>专题管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="SpecInfoID" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%" OnRowDataBound="Egv_RowDataBound" GridLines="None" CellPadding="2" CellSpacing="1" CssClass="table table-striped table-bordered table-hover" EmptyDataText="没有内容">
		<Columns>
			<asp:TemplateField HeaderText="选择">
				<ItemTemplate>
					<asp:CheckBox ID="chkSel" runat="server" />
				</ItemTemplate>
				<HeaderStyle Width="5%" />
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
			<asp:BoundField HeaderText="ID" DataField="GeneralID">
				<HeaderStyle Width="5%" />
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:TemplateField HeaderText="标题">
				<ItemTemplate>
					<a href="ShowContent.aspx?GID=<%# Eval("GeneralID")%>&modeid=<%#Eval("ModelID") %>">
						<%# Eval("Title")%></a>
				</ItemTemplate>
				<HeaderStyle Width="30%" />
				<ItemStyle CssClass="tdbg" />
			</asp:TemplateField>
			<asp:BoundField HeaderText="录入人" DataField="Inputer">
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
				<HeaderStyle Width="10%" />
			</asp:BoundField>
			<asp:BoundField HeaderText="点击数" DataField="Hits">
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
				<HeaderStyle Width="10%" />
			</asp:BoundField>
			<asp:TemplateField HeaderText="推荐">
				<ItemTemplate>
					<%# GetElite(Eval("EliteLevel", "{0}")) %>
				</ItemTemplate>
				<HeaderStyle Width="10%" />
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="状态">
				<ItemTemplate>
					<%# GetStatus(Eval("Status", "{0}")) %>
				</ItemTemplate>
				<HeaderStyle Width="10%" />
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="已生成">
				<ItemTemplate>
					<%# GetCteate(Eval("IsCreate", "{0}"))%>
				</ItemTemplate>
				<HeaderStyle Width="10%" />
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="操作">
				<ItemTemplate>
					<a href="EditContent.aspx?GeneralID=<%# Eval("GeneralID")%>">修改</a>
					<asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("SpecInfoID") %>' OnClientClick="return confirm('你确定将该数据从专题中删除吗？')">删除</asp:LinkButton>
				</ItemTemplate>
				<ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
		</Columns>
		<RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
		<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
		<PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
		<HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
		<PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
	</asp:GridView>
	<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" onclick="CheckAll(this)" Font-Size="9pt" Text="全选" />
    <div class="text-center">
        <asp:Button ID="Button1" runat="server" Text="从所属专题删除" CssClass="btn btn-primary"  OnClick="btnDelete_Click" OnClientClick="if(!IsSelectedId()){alert('请选择内容项');return false;}else{return confirm('你确定要从专题中删除选中内容吗？')}" />&nbsp;
	<asp:Button ID="Button2" runat="server" Text="添加到其他专题" OnClick="btnAddTo_Click"  CssClass="btn btn-primary" />&nbsp;
	<asp:Button ID="Button3" runat="server" Text="移动到其他专题" OnClick="btnMoveTo_Click" CssClass="btn btn-primary" />
    </div>
	
</asp:Content>
