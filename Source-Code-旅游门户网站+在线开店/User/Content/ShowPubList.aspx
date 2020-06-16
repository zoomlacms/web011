<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_ShowPubList, App_Web_lvsrob24" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>内容预览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Mycontent.aspx?NodeID=<%= NodeID%>">投稿管理</a></li>
        <li class="active">信息预览</li>
    </ol>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="text-center">
                <asp:Label ID="Label1" runat="server" Text="信息预览"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" CellPadding="4" GridLines="None" Font-Size="12px" Style="margin-bottom: 3px; margin-top: 2px;" CssClass="table table-striped table-bordered table-hover">
                    <Fields></Fields>
                    <FooterStyle Font-Bold="True" BackColor="#FFFFFF" />
                    <CommandRowStyle Font-Bold="True" CssClass="tdbgleft" />
                    <RowStyle />
                    <FieldHeaderStyle Font-Bold="True" />
                    <PagerStyle HorizontalAlign="Center" />
                    <HeaderStyle Font-Bold="True" />
                    <EditRowStyle />
                    <AlternatingRowStyle />
                </asp:DetailsView>
            </td>
        </tr>
    </table>
</asp:Content>