<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_ReleaseManager, App_Web_lvsrob24" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>竞标管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">竞标管理</li>
    </ol>
    <div class="us_seta">
        <asp:GridView ID="Egv" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="False" AutoGenerateColumns="False" DataKeyNames="GeneralID" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%" CellPadding="4" GridLines="None" OnRowDataBound="Egv_RowDataBound" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="GeneralID" HeaderText="ID">
                    <HeaderStyle Width="6%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="标题">
                    <HeaderStyle Width="50%" />
                    <ItemTemplate>
                        <%# ZoomLa.Common.BaseClass.Htmlcode(Eval("Title","{0}"))%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="../../Comments/CommentFor.aspx?ID=<%#Eval("GeneralID","{0}") %>" target="_blank">访问</a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="竞标管理">
                    <ItemTemplate>
                        <%# GetRelease(Eval("GeneralID","{0}"),Eval("Title","{0}")) %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div class="tdbg">
            <div align="center" class="tdbgleft">
                共
                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                个信息
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                <asp:Label ID="pagess" runat="server" Text="" />个信息/页 转到第<asp:DropDownList ID="DropDownList1"
                    runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                页<asp:HiddenField ID="HdnItemID" runat="server" />
                <asp:HiddenField ID="HdnTitle" runat="server" />
            </div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" />
        </div>
    </div>
</asp:Content>