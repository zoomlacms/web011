<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_CommentView, App_Web_gqexlk3x" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>查看评论</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div>
        <table class="table table-bordered">
            <tr>
                <td>评论ID</td>
                <td><asp:Label ID="CommentID" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>标题</td>
                <td><asp:Label ID="Title" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>评论内容</td>
                <td><asp:Label ID="Contents" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>评论时间</td>
                <td><asp:Label ID="CommentTime" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>评论分数</td>
                <td><asp:Label ID="commScore" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>审核状态</td>
                <td><asp:Label ID="commStatus" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>

