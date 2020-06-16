<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_AddDeliverType, App_Web_2pfg00wt" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加送货方式</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center"><span class="spacingtitle">添加送货方式</span></td>
        </tr>
        <tr>
            <td width="24%"><strong>送货方式名称</strong></td>
            <td width="76%">
                <asp:TextBox ID="deliname" runat="server" class="form-control" />
                <asp:HiddenField ID="uptype" runat="server" />
                <asp:HiddenField ID="id_H" runat="server" />
            </td>
        </tr>
        <tr>
            <td><strong>送货方式简介</strong></td>
            <td>
                <asp:TextBox ID="deliinfo" runat="server" class="form-control" /></td>
        </tr>
        <tr>
            <td><strong>运费</strong></td>
            <td>
                <asp:TextBox ID="delitype" runat="server" Width="82px" class="form-control"></asp:TextBox>元</td>
        </tr>
        <tr>
            <td><strong>税率</strong></td>
            <td>
                <asp:TextBox ID="shuilv" runat="server" Text='0' Width="50px" class="form-control" />% 
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <label for="ctl00_CphContent_ChkIsDefault">
                    <asp:CheckBox ID="selectto" Text="设为默认送货方式" runat="server" />
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="Button1" class="btn btn-primary" Text="保存送货方式" runat="server" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
