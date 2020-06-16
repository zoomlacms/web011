<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Template_TemplateSetOfficial, App_Web_uf4f5mnd" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>方案列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered" align="center">
        <tr align="center">
            <td width="100%" colspan="4">云台方案列表↓<a href="http://www.zoomla.cn/templet/" target="_blank" style="color: #FFF;">[更多模板]</a></td>
        </tr>
        <tr>
            <td id="servertb" name="servertb">
                <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table table-bordered">
                    <asp:Label ID="templatelist" runat="server" Text=""></asp:Label>
                    <tr align="center" style="height: 25px;">
                        <td width="25%" colspan="4">共
                            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            套模板
                            <asp:Label ID="Toppage" runat="server" Text="" />
                            <asp:Label ID="Nextpage" runat="server" Text="" />
                            <asp:Label ID="Downpage" runat="server" Text="" />
                            <asp:Label ID="Endpage" runat="server" Text="" />
                            页次：
                            <asp:Label ID="Nowpage" runat="server" Text="" />
                            /
                            <asp:Label ID="PageSize" runat="server" Text="" />
                            页
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" Visible="false" class="l_input" Width="16px" Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                            8
                            条信息/页 转到第
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                            页
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
    <script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
            $(".lightbox").lightbox({
                fitToScreen: true,
                imageClickClose: false
            });
        });
    </script>
    <style>
        .Template_box {
            border: 1px solid #ddd;
        }
        .table_td >td:hover{ background:#6f5499; cursor:pointer;}
    </style>
</asp:Content>
