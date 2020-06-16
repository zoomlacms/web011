<%@ page language="C#" autoeventwireup="true" inherits="FreeHome.Manage.ProductEdit, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>空间虚拟商品设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">空间虚拟商品修改</td>
            </tr>
            <tr>
                <td style="width: 24%;">商品名称：</td>
                <td>
                    <asp:TextBox ID="Nametxt" CssClass="form-control" runat="server"></asp:TextBox>
                    <span style="color: #ff0000">* </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Nametxt" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>普通价格：</td>
                <td>
                    <asp:TextBox ID="pricetxt" CssClass="form-control" runat="server"></asp:TextBox>
                    <span style="color: #ff0000">*<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="pricetxt"
                        ErrorMessage="必须是数字" ValidationExpression="^\d{1,7}(\.\d{1,4})?$"></asp:RegularExpressionValidator></span>
                </td>
            </tr>
            <tr>
                <td>VIP价格：</td>
                <td>
                    <asp:TextBox ID="viptxt" CssClass="form-control" runat="server"></asp:TextBox>
                    <span style="color: #ff0000">*<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="viptxt" ErrorMessage="必须是数字" ValidationExpression="^\d{1,7}(\.\d{1,4})?$"></asp:RegularExpressionValidator></span>
                </td>
            </tr>
            <tr>
                <td>商品图片：</td>
                <td>
                    <asp:TextBox ID="Thumbnails" CssClass="form-control" runat="server" Width="300px" /><span style="color: #ff0000">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Thumbnails" ErrorMessage="商品图片不能为空"></asp:RequiredFieldValidator>
                    <iframe id="smallimgs" style="top: 2px; height: 25px; width: 100%;" src="../../shop/fileupload.aspx?menu=Thumbnails" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                </td>
            </tr>
            <tr>
                <td>商品简介：</td>
                <td>
                    <textarea name="textarea" class="form-control" id="contenttextarea" cols="45" rows="10" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="addbtn" runat="server" CssClass="btn btn-primary" Text="保存" OnClick="addbtn_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
