<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_StoreStyleEdit, App_Web_2pfg00wt" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="修改模板"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>模板名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtModelName" CssClass="form-control" runat="server" Width="156" MaxLength="200" /><font color="red">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">模板名称不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>所属模型：</strong>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>模板缩略图：</strong>
            </td>
            <td>
                <asp:TextBox ID="Thumbnails" runat="server" CssClass="form-control" Width="300px" />
                <iframe id="smallimgs" style="top: 2px" src="../../shop/fileupload.aspx?menu=Thumbnails" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>店铺主页模板选择：</strong>
            </td>
            <td>
                <asp:TextBox ID="ModeTemplate" CssClass="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('ModeTemplate') + '&FilesDir=', 650, 480)" class="btn btn-primary" /></td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>店铺商品列表模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="ListModeTemplate" CssClass="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('ListModeTemplate') + '&FilesDir=', 650, 480)" class="btn btn-primary" /></td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>店铺商品信息模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="ContentModeTemplate" CssClass="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('ContentModeTemplate') + '&FilesDir=', 650, 480)" class="btn btn-primary" /></td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>模板状态：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">停用</asp:ListItem>
                    <asp:ListItem Value="1">使用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:HiddenField ID="HdnModelId" runat="server" />
                <asp:Button ID="EBtnSubmit" Text="保存" CssClass="btn btn-primary" runat="server" OnClick="EBtnSubmit_Click" />
                <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="取消" onclick="javescript: history.go(-1)" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Common.js" type="text/javascript"></script>
</asp:Content>
