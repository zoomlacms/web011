<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Pages_EditPub, App_Web_pa2vy3y0" clientidmode="Static" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>互动信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Default.aspx">企业黄页</a></li>
        <li class="active">互动信息</li>
    </ol>
    <div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
        <table style="width: 100%; margin: 0 auto;" cellpadding="0" cellspacing="0" class="border">
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Label ID="LblModelName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg">
                <td align="right">标题</td>
                <td>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="tdbg">
                <td align="right" class="style1">内容</td>
                <td>
                    <asp:TextBox ID="tx_PubContent" runat="server" CssClass="form-control" style="max-width:400px;" Height="107px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal><tr class="tdbgbottom border">
                <td colspan="2">
                    <asp:HiddenField ID="HdnModel" runat="server" />
                    <asp:HiddenField ID="HdnPubid" runat="server" />
                    <asp:HiddenField ID="HdnID" runat="server" />
                    <asp:HiddenField ID="HdnType" runat="server" />
                    <asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
                    <asp:Button ID="EBtnSubmit" Text="保存" OnClick="EBtnSubmit_Click" runat="server" CssClass="btn btn-primary" />
                    <asp:Button ID="Button1" Text="返回" runat="server" OnClick="Button1_Click" CssClass="btn btn-p" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Common.js" type="text/javascript"></script>
</asp:Content>
