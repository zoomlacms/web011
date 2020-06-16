<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="MemoList, App_Web_jog2m4ij" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的备忘录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/Userzone/Default.aspx">我的空间</a></li>
        <li class="active">我的备忘录<a href="EditMemo.aspx">[添加备忘录]</a></li>
    </ol>
    <div style="margin-bottom:10px;">
        <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
    </div>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" OnRowCommand="Egv_RowCommand" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！！">
        <Columns>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                    <a href='<%#"memocontext.aspx?ID="+ DataBinder.Eval(Container.DataItem,"ID") %>'>
                        <%#DataBinder.Eval(Container.DataItem,"MemoTitle") %>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="时间">
                <ItemTemplate>
                    <%#DateTime.Parse(DataBinder.Eval(Container.DataItem,"MemoTime").ToString()).ToShortDateString() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href='<%#"EditMemo.aspx?ID="+ DataBinder.Eval(Container.DataItem,"ID") %>'>修改</a>
                    <asp:LinkButton ID="LinkButton1" CommandName="del" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗？');" runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
</asp:Content>
