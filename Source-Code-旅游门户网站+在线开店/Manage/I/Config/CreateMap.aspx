<%@ page language="C#" autoeventwireup="true" inherits="test_test, App_Web_bnkjraqn" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>后台管理索引</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<span style="color:green;font-size:20px;font-family:'Microsoft YaHei'">本功能用于后台前台生成快速检索应用，一般维护时发布一次即可</span><br />
<asp:Button runat="server" ID="Sure_Btn" OnClick="Sure_Btn_Click" Text="生成后台索引" CssClass="btn btn-primary" OnClientClick="return confirm('确定要重新生成SiteMap.config吗?');" />
<asp:Button ID="SureUser_Btn" runat="server" Text="生成会员中心索引" CssClass="btn btn-primary" OnClientClick="return confirm('确定要生成UserMap.config吗?');" OnClick="SureUser_Btn_Click" />
</asp:Content>