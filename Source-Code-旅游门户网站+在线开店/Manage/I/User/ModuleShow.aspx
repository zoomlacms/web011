<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ModuleShow, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模块信息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server"> </asp:GridView>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
