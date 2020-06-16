<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_Mailpinput, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮址列表</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="clearbox">
    </div>
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td align="center" class="spacingtitle">邮箱列表</td>
            </tr>
            <tr>
                <td>来源：<asp:DropDownList ID="SubscribeToType" runat="server">
                </asp:DropDownList></td>
            </tr>
            <tr>
                <td>导入邮箱地址：<asp:FileUpload ID="FileUpload1" runat="server" Height="20px" Width="287px" class="l_input" />
                    <asp:Button ID="Button2"
                        runat="server" Text="导 入" OnClick="Button2_Click" class="btn btn-primary" />&nbsp;支持换行的.txt与.csv格式，点击<a href="/UploadFiles/邮件文件模板.csv">[这里]</a>下载邮件文件模板
                </td>
            </tr>
            <tr class="tdbg">
                <td align="center"></td>
            </tr>
        </table>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
