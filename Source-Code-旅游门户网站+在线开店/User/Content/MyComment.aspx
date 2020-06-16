<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.MyComment, App_Web_lvsrob24" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的评论</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的评论 </li>
    </ol>
    <div>
        <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CommentID" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" Width="100%" CellPadding="4" CssClass="table table-striped table-bordered table-hover" GridLines="None" EmptyDataText="无相关信息！！">
            <Columns>
                <asp:BoundField DataField="CommentID" HeaderText="ID">
                    <HeaderStyle Width="6%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="所属内容标题">
                    <HeaderStyle Width="25%" />
                    <ItemTemplate>
                        <a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank"><%# GetTitle(Eval("GeneralID", "{0}"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="评论标题">
                    <HeaderStyle Width="24%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Contents" HeaderText="评论内容">
                    <HeaderStyle Width="25%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="发表日期">
                    <ItemTemplate>
                        <%# Eval("CommentTime", "{0:yyyy-mm-dd}")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        </asp:GridView>
    </div>
</asp:Content>
