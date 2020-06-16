<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.MyFavori, App_Web_lvsrob24" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<script runat="server">
    protected void Egv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
</script>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>内容收藏</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">内容收藏</li>
    </ol>
    <div>
        <div class="clearbox"></div>
        <div id="noconten" runat="server" align="center">暂无收藏内容</div>
        <div id="cont" runat="server">
            <ZL:ExGridView ID="Egv" runat="server" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" OnPageIndexChanging="Egv_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="FavoriteID" OnRowCommand="Lnk_Click">
                <Columns>
                    <asp:TemplateField HeaderText="选择">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSel" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="InfoID" HeaderText="ID">
                        <HeaderStyle Width="6%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="标题">
                        <HeaderStyle Width="50%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a href="<%#Eval("FavUrl")%>" target="_blank"><%# Eval("Title")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("FavoriteID") %>' OnClientClick="return confirm('你确定将该数据从收藏夹删除吗？')">移出收藏夹</asp:LinkButton>
                            <%--<a href='MyFavori.aspx?type=1&method=Del&ID=<%# Eval("FavoriteID") %>'>移除</a>--%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
            <div style="padding-top: 5px;">
                <div class="us_seta" style="height: auto;">
                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="选中本页显示的所有项目" />
                    <asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项从收藏夹删除吗？')}" CssClass="btn btn-primary" UseSubmitBehavior="true" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索标题：
                    <asp:TextBox ID="TxtSearchTitle" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
