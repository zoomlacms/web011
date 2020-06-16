<%@ page language="C#" autoeventwireup="true" inherits="FreeHome.Manage.ProductAdd, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加空间虚拟商品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">空间虚拟商品添加</td>
            </tr>
            <tr>
                <td style="width:24%;" class="text-center">商品名称：</td>
                <td style="width:76%;">
                    <asp:TextBox ID="Nametxt" class="form-control" runat="server"></asp:TextBox><span style="color: #ff0000"> *</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Nametxt" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="text-center">普通价格：</td>
                <td>
                    <asp:TextBox ID="pricetxt" class="form-control" runat="server"></asp:TextBox>
                    <span style="color: #ff0000">* 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="pricetxt" ErrorMessage="必须是数字" ValidationExpression="^\d{1,7}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="text-center">VIP价格：</td>
                <td>
                    <asp:TextBox ID="viptxt" class="form-control" runat="server"></asp:TextBox>
                    <span style="color: #ff0000"> * 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="viptxt"  ErrorMessage="必须是数字" ValidationExpression="^\d{1,7}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="text-center">商品图片：</td>
                <td>
                    <asp:TextBox ID="Thumbnails" class="form-control" runat="server" />
                    <span style="color: #ff0000">* 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Thumbnails" ErrorMessage="商品图片不能为空"></asp:RequiredFieldValidator>
                    </span>
                    <iframe id="smallimgs" style="top: 2px" src="../../shop/fileupload.aspx?menu=Thumbnails" width="100%" height="30" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                </td>
            </tr>
            <tr>
                <td class="text-center">商品简介：</td>
                <td>
                    <textarea name="textarea" class="form-control" id="contenttextarea" cols="45" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="text-center"></td>
                <td><asp:Button ID="addbtn" runat="server" class="btn btn-primary" Text="保存" Width="84px" OnClick="addbtn_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
