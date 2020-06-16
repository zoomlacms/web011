<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_Pay_View, App_Web_vkx1tc11" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>浏览支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">浏览支付平台<a href="Pay_Add.aspx">[添加支付平台]</a></li>
    </ol>
    <asp:GridView ID="Egv" runat="server" AllowPaging="True" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="False" DataKeyNames="PayPlatID" PageSize="20" OnRowDataBound="Egv_RowCreated" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="PayPlatID" Visible="false">
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
                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Delete" CommandArgument='<%# Eval("PayPlatID") %>' OnClientClick="return confirm('您确定要将该数据删除吗？');">删除</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
    </asp:GridView>
</asp:Content>
