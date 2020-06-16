<%@ page language="C#" autoeventwireup="true" inherits="manage_Guest_ReplyList, App_Web_jwvfgwdw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>留言列表</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            后台管理&gt;&gt;<a href="Default.aspx?CateID=<%=Server.HtmlEncode(Request.QueryString["CateID"]) %>">留言管理</a> &gt;&gt;回复留言列表
        </div>
        <asp:GridView ID="Gdv" CssClass="border" RowStyle-HorizontalAlign="Center" DataKeyNames="GID" runat="server" AutoGenerateColumns="False" PageSize="10" Width="100%" OnRowCommand="Lnk_Click"  GridLines="None" CellPadding="4" CellSpacing="1" BackColor="White" ForeColor="Black" EmptyDataText="无相关数据">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSel" runat="server" />
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="5%" BorderColor="White" />
                </asp:TemplateField>
                <asp:BoundField DataField="GID" HeaderText="ID">
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="5%" BorderColor="White" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                        <a href="guestbookshow.aspx?CateID=<%# Eval("CateID")%>&GID=<%# Eval("GID")%>"><%# Eval("Title")%></a>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="20%" BorderColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="留言时间">
                    <ItemTemplate>
                        <%#Eval("GDate") %>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="15%" BorderColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="留言IP">
                    <ItemTemplate>
                        <%#Eval("IP") %>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="10%" BorderColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("GID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="10%" BorderColor="White" />
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
        </asp:GridView>
        <div class="clearbox"></div>
        <table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
	<tr>
		<td style="height: 21px">                   
		  <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="全选" />  &nbsp; &nbsp; 
			<asp:Button ID="btndelete" runat="server" class="C_input" OnClientClick="return confirm('确定要删除选中的项目吗？')" Text="批量删除" OnClick="btndelete_Click" />                
			<asp:HiddenField ID="HdnCateID" runat="server" />
			 <span>
			共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
				<asp:Label ID="Toppage" runat="server" Text="" />
				<asp:Label ID="Nextpage" runat="server" Text="" />
				<asp:Label ID="Downpage" runat="server" Text="" />
				<asp:Label ID="Endpage" runat="server" Text="" />页次：
				<asp:Label ID="Nowpage" runat="server" Text="" />/
				<asp:Label ID="PageSize" runat="server" Text="" />页
				<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
					Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox> 条数据/页 转到第
				<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
				onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
				页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
					ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
			</span>
		</td>
	</tr>                
</table>
    </form>
</body>
</html>
