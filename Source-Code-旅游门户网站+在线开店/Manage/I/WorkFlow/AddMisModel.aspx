<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddMisModel, App_Web_5xj5wdms" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板管理</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td style="width: 100px; height: 30px;">模板名称:</td>
                <td>
                    <asp:TextBox ID="ModelName" CssClass=" form-control" runat="server"></asp:TextBox>
                    <span style="color: #f00">*</span>
                    <asp:RequiredFieldValidator ID="r1" ControlToValidate="ModelName" runat="server" ErrorMessage="名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="height: 30px;">模板类型:</td>
                <td>
                    <asp:DropDownList runat="server" ID="DocType_DP">
                        <asp:ListItem Value="0">公文</asp:ListItem>
                        <asp:ListItem Value="1">事务</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 30px;">绑定节点:</td>
                <td>
                    <asp:TextBox runat="server" ID="bindNodeT" CssClass="form-control" />提示:请输入需绑定节点ID(绑定节点添加内容,默认加载该模板,可为空)
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: auto;">
                    <asp:TextBox ID="ModelContent" Style="min-height: 500px;" TextMode="MultiLine" runat="server" Width="815"></asp:TextBox>
                    <script type="text/javascript">
                        setTimeout(function () { UE.getEditor('ModelContent'); }, 300);
                    </script>
                </td>
            </tr>
            <tr style="height: 32px;">
                <td>操作:</td>
                <td>
                    <asp:Button ID="BtnSav" runat="server" CssClass="btn btn-primary" OnClick="BtnSav_Click" Text="保存" />
                    <button type="button" class="btn btn-primary" onclick="window.location.href='MisModelManage.aspx'">返回列表</button>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
