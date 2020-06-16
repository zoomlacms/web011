<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_StoreStyleAdd, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加个人空间模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation">
        <span>后台管理</span> &gt;&gt; <span>空间管理</span> &gt;&gt; 空间模板管理  &gt;&gt;<span><asp:Literal ID="LNav" runat="server" Text="添加个人空间模板"></asp:Literal></span>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center"><asp:Literal ID="LTitle" runat="server" Text="添加个人空间模板"></asp:Literal></td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>模板名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtModelName" class="form-control" runat="server" Width="156" MaxLength="200" /><font color="red">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">模板名称不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>模板缩略图：</strong>
            </td>
            <td>
                <asp:TextBox ID="Thumbnails" class="form-control" runat="server" Width="300px" /><span style="color: #ff0000">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Thumbnails" ErrorMessage="RequiredFieldValidator">模板缩略图不能为空</asp:RequiredFieldValidator>
                <iframe id="smallimgs" style="top: 2px" src="../shop/fileupload.aspx?menu=Thumbnails" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no">
                </iframe>
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>用户空间首页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="ModeTemplate" class="form-control" runat="server" />
                <input type="button" value="选择模板" class="btn btn-primary" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('ModeTemplate') + '&FilesDir=', 650, 480)" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>日志列表模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" class="form-control" runat="server" />
                <input type="button" value="选择模板" class="btn btn-primary" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox6') + '&FilesDir=', 650, 480)" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>日志内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox5') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>相册列表模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox1') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>相册内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox2') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>相片内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox7" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox7') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>群族列表模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox3') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>群族内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox4') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>话题内容页模板：</strong>
            </td>
            <td>
                <asp:TextBox ID="TextBox9" class="form-control" runat="server" />
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TextBox9') + '&FilesDir=', 650, 480)" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td style="width: 35%">
                <strong>模板状态：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">停用</asp:ListItem>
                    <asp:ListItem Value="1">启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="EBtnSubmit" Text="保存" class="btn btn-primary" runat="server" OnClick="EBtnSubmit_Click" />
                <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="取消" onclick="javescript: history.go(-1)" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script>
        function GV(id, value) {

            $("#" + id).val(value);
        }
    </script>
</asp:Content>
