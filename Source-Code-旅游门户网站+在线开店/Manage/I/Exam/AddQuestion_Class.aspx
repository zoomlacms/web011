<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_AddQuestion_Class, App_Web_fk1hbgsf" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>编辑分类</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="ssjd_txt" runat="server" Text="类别名称："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtClassName" runat="server" class="form-control" OnTextChanged="txtClassName_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="类别不能为空!"
                    ControlToValidate="txtClassName"></asp:RequiredFieldValidator>
                <asp:HiddenField ID="hfC_Id" runat="server" Value="" />
            </td>
        </tr>
        <tr class="tdbg">
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="zt_txt" runat="server" Text="所属类别："></asp:Label>
                &nbsp;
            </td>
            <td>
                <asp:DropDownList ID="ddlC_ClassId" runat="server">
                </asp:DropDownList>
                <asp:TextBox ID="txtClassId" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg">
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label3" runat="server" Text="类别类型："></asp:Label>
                &nbsp;
            </td>
            <td>
                <asp:RadioButtonList ID="C_ClassType" runat="server"
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">答题类型</asp:ListItem>
                    <asp:ListItem Value="2">视频操作类型</asp:ListItem>
                </asp:RadioButtonList>
                <font color="blue">说明：答题类型将按时间限制答题，视频操作类型不按时间限制答题</font></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="hits_txt" runat="server" Text="排　　序："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtC_OrderBy"  class="form-control" runat="server">0</asp:TextBox>
            </td>
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存分类" OnClick="EBtnSubmit_Click"
                    runat="server" />
                &nbsp;
                <asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返　回" OnClick="BtnBack_Click"
                    UseSubmitBehavior="False" CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>