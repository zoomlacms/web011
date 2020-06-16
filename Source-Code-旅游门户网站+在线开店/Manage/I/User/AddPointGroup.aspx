<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddPointGroup, App_Web_ub3q0ybo" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加积分等级</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField runat="server" ID="LNav_Hid" Value="添加积分等级" />
    <table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
        <tr style="display: none;">
            <td class="spacingtitle" colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="添加积分等级"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: auto"><strong>积分等级：</strong></td>
            <td>
                <asp:TextBox class="form-control pull-left" ID="txtPointGroup" runat="server" />
                <font color="red" style="float: left; padding: 5px;">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPointGroup">积分等级不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: auto"><strong>积分值：</strong></td>
            <td>
                <asp:TextBox class="form-control pull-left" ID="txtPoint" runat="server" Style="width: auto">0</asp:TextBox>
                <span style="float: left; padding: 5px">(用户多少积分可升级为此等级)</span>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0" ControlToValidate="txtPoint"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: auto"><strong>备注：</strong></td>
            <td>
                <asp:TextBox class="form-control" ID="TxtDescription" runat="server" TextMode="MultiLine" Style="max-width: 372px" Height="61px" />
            </td>
        </tr>
        <tr>
            <td class="text-right"><strong>等级图片：</strong></td>
            <td>
                <asp:TextBox ID="imgUrl" runat='server' class="form-control" Style="max-width: 350px;"></asp:TextBox>
                <iframe id="bigimgs" style="top: 2px" src="<%=CustomerPageAction.customPath2 %>Shop/FileUpload.aspx?menu=imgUrl" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="padding-left: 19%">
                <asp:HiddenField ID="HdnGroupID" runat="server" />
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存设置" OnClick="EBtnSubmit_Click" runat="server" />
                <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="返回列表" onclick="location.href = 'PointGroup.aspx'" />
            </td>
        </tr>
    </table>
</asp:Content>
