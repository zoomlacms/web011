<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_SearchResult, App_Web_ovg4efvv" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>搜索结果</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">搜索结果</li>
    </ol>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" EnableTheming="False"  AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging" PageSize="15"
            EmptyDataText="没有匹配的页面，建议更换关键词!!"  class="table table-striped table-bordered table-hover">
        <Columns>
                <asp:BoundField DataField="Index" HeaderText="ID"/>
                <asp:BoundField DataField="DTitle" HeaderText="标题" HtmlEncode="false"/>
                <asp:TemplateField HeaderText="路径">
                    <ItemTemplate>
                        <a href="<%#Eval("Url") %>" title="点击访问"><%#Eval("Url") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PPath" HeaderText="物理路径" />
        </Columns>
    </ZL:ExGridView>
    <style>
        td{ text-align:center;}
    </style>
</asp:Content>
