<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Pub, App_Web_lvsrob24" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>互动页面</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">互动页面</li>
    </ol>
    <div style="margin-bottom: 10px;">
        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" OnClick="LinkButton1_Click">我发布的互动</asp:LinkButton>
        <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary" runat="server" OnClick="LinkButton4_Click">我参与的互动</asp:LinkButton>
    </div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False" EmptyDataText="暂无数据"
        DataKeyNames="GeneralID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" CssClass="table table-striped table-bordered table-hover"
        OnRowCommand="Lnk_Click" Width="100%" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="GeneralID" HeaderText="ID">
                <HeaderStyle Width="6%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="标题">
                <HeaderStyle Width="50%" />
                <ItemTemplate>
                    <a href='ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'>
                        <%# Eval("Title")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%# GetStatus(Eval("Status", "{0}")) %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <%#GetLink(Eval("GeneralID")+"") %>&nbsp;&nbsp;<a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>"
                        target="_blank">访问</a>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%#GetVisible(Eval("GeneralID")+"") %>'>修改</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%# GetVisible(Eval("GeneralID")+"")  %>'
                        OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"><%# GetIsDe(Eval("Status", "{0}")) %></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150" runat="server">
        <asp:ListItem Value="0">按标题查找</asp:ListItem>
        <asp:ListItem Value="1">按ID查找</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TxtSearchTitle" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:Button ID="Btn_Search" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="Btn_Search_Click" />
</asp:Content>
