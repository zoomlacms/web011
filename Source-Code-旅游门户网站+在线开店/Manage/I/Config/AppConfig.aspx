<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Config_AppConfig, App_Web_gsi5yeuj" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" clientidmode="AutoID" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>维护中心</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField ID="HiddenSele" runat="server" />
    <asp:HiddenField ID="HiddenText" runat="server" />
    <table width="99%" cellspacing="1" cellpadding="0" class="table table-striped table-bordered table-hover">
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td  style="width: 200px"><strong><%:lang.LF("是否重新安装") %>：</strong></td>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" />点击即需要重新安装数据库，请慎重.
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td  style="width: 200px"><strong><%:lang.LF("设置调试模式") %>：</strong></td>
            <td colspan="1">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="3">
                    <asp:ListItem Value="0">停用自定义错误</asp:ListItem>
                    <asp:ListItem Value="1">启用自定义错误</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td  style="width: 200px"><strong><%:lang.LF("防盗链后缀名") %>：</strong></td>
            <td colspan="1">
                <asp:TextBox ID="TextBox1" runat="server" Width="483px" Height="64px" TextMode="MultiLine" class=" form-control"></asp:TextBox>
            </td>
        </tr>
  </table>
  <asp:Button ID="Button1" runat="server" Text="保存设置" OnClick="Button1_Click" class="btn btn-primary" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>