<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_MyCommentList, App_Web_lvsrob24" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我参与的</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我参与的 </li>
    </ol>
    <div class="us_topinfo" style="margin-bottom:10px;">
        <div class="us_pynews">
            <asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150" runat="server">
                <asp:ListItem Value="0" Selected="True">按标题查找</asp:ListItem>
                <asp:ListItem Value="1">按ID查找</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="TxtSearchTitle" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:Button ID="Btn_Search" runat="server" class="btn btn-primary" Text="搜索" OnClick="Btn_Search_Click" />
        </div>
        <div class="cleardiv"></div>
    </div>
    <div class="us_seta">
        <asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False"
            DataKeyNames="ID" Width="100%" CssClass="table table-striped table-bordered table-hover" EmptyDataText="无相关信息"
            GridLines="None" OnRowDataBound="Egv_RowDataBound"
            EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="GeneralID" HeaderText="ID">
                    <HeaderStyle Width="6%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title" ) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="作者">
                    <ItemTemplate>
                        <asp:Label ID="lblInput" runat="server" Text='<%# Eval("inputer" ) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发表时间">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# getTime(Eval("commentTime")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# GetStatus(Eval("status", "{0}")) %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href='../../Comments/CommentFor.aspx?ID=<%#Eval("GeneralID","{0}") %>' target="_blank">访问</a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#f6fdf6" Height="25px" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#f6fdf6" />
        </asp:GridView>
        <div align="center" class="tdbgleft">
            共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>个信息
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />个信息/页 转到第<asp:DropDownList ID="DropDownList2"
                runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            页<asp:HiddenField ID="HdnItemID" runat="server" />
            <asp:HiddenField ID="HdnTitle" runat="server" />
        </div>
    </div>
</asp:Content>
