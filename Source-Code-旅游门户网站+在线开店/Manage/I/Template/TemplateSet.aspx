<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_TemplateSet, App_Web_5nkxzgmd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>方案设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
    <table class="table table-bordered">
        <tr>
            <td width="100%" colspan="4" style="cursor: pointer" onclick="clicklocal()">本地方案列表↓</td>
        </tr>
        <tr>
            <td id="localtb" name="localtb" style="padding:0;">
                 <asp:Label ID="tempclientlist" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
            $(".lightbox").lightbox({
                fitToScreen: true,
                imageClickClose: false
            });
        });
    </script>
</asp:Content>