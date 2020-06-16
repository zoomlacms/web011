<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.GuestBookShow, App_Web_jwvfgwdw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>留言内容</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">

            <span>后台管理</span>&gt;&gt;<span><a href="Default.aspx?CateID=<%=Server.HtmlEncode(Request.QueryString["CateID"]) %>">留言管理</a></span> &gt;&gt;<span>留言内容</span>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" id="bindset">
            <tr align="center">
                <td colspan="4" class="spacingtitle"><strong>查看留言内容</strong>
                </td>
            </tr>
        </table>
        <div class="clearbox"></div>
        <table class="TableWrap" border="0" cellpadding="0" cellspacing="0" width="100%" style="border: #fff solid 1px; ">
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="repFileReName_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center;"><strong>ID</strong></td>
                        <td class="tdbg" style="width: 85%; "><%# Eval("GID")%></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; "><strong>留言人</strong></td>
                        <td class="tdbg" style="width: 85%; "><a href="../User/UserInfo.aspx?id=<%# Eval("UserID") %>" title="点击查看该用户详情"><%# GetUserName(Eval("UserID","{0}")) %></a></td>
                    </tr>

                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; "><strong>留言标题</strong></td>
                        <td class="tdbg" style="width: 85%; "><%# Eval("Title") %></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; "><strong>留言内容</strong></td>
                        <td class="tdbg" style="width: 85%; "><%# Eval("TContent") %></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; "><strong>IP地址</strong></td>
                        <td class="tdbg" style="width: 85%; "><%# Eval("IP") %></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; "><strong>添加时间</strong></td>
                        <td class="tdbg" style="width: 85%; "><%# Eval("GDate") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <div id="Pager1" runat="server" style="display: none;"></div>
        <asp:HiddenField ID="HdnGID" runat="server" />
        <div class="clearbox"></div>
        <div class="clearbox"></div>
        <div class="clearbox"></div>
        <asp:GridView ID="Egv" CssClass="border" RowStyle-HorizontalAlign="Center" DataKeyNames="GID" runat="server" AutoGenerateColumns="False" PageSize="10" Width="100%" OnRowCommand="Lnk_Click" GridLines="None" CellPadding="4" CellSpacing="1" BackColor="White" ForeColor="Black" EmptyDataText="无相关数据">
            <Columns>
                <asp:TemplateField HeaderText="留言标题">
                    <ItemTemplate>
                       <div style="float:left;margin-left:15px;">
                        <asp:CheckBox ID="chkSel" runat="server" /></div>
                        <%# Eval("Title")%>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="10%" BorderColor="White" />
                </asp:TemplateField>
                <asp:BoundField DataField="Tcontent" HeaderText="留言内容">
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="65%" BorderColor="White" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="留言时间">
                    <ItemTemplate>
                        <%#Eval("GDate") %>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="10%" BorderColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="留言人">
                    <ItemTemplate>
                        <a href="../User/UserInfo.aspx?id=<%# Eval("UserID")%>" title="点击查看用户详情">
                            <%# GetUserName(Eval("UserID","{0}")) %></a>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="5%" BorderColor="White" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("GID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" BorderColor="White" />
                    <HeaderStyle Width="5%" BorderColor="White" />
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
        </asp:GridView>
        <div class="clearbox"></div>
        <table class="TableWrap" border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
            <tr>
                <td style="height: 21px">
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="全选" />
                    &nbsp; &nbsp; 
			<asp:Button ID="btndelete" runat="server" class="C_input" OnClientClick="return confirm('确定要删除选中的项目吗？')" Text="批量删除" OnClick="btndelete_Click" />
                    <asp:HiddenField ID="HdnCateID" runat="server" />
                    <span>共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
				<asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
				<asp:Label ID="Nowpage" runat="server" Text="" />/
				<asp:Label ID="PageSize" runat="server" Text="" />页
				<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                    Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条数据/页 转到第
				<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    </span>
                </td>
            </tr>
        </table>

        <div style="text-align: center; margin-top: 5px;">
            <asp:Button ID="Button2" runat="server" class="C_input" OnClick="Button2_Click" Text="继续回复" />
            &nbsp;<asp:Button ID="Button1" runat="server" Text="返回列表" class="C_input" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
