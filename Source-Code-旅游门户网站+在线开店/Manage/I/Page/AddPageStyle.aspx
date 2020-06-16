<%@ page language="C#" autoeventwireup="true" inherits="manage_Page_AddPageStyle, App_Web_0fbyacen" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加黄页样式</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField runat="server" ID="Label1_Hid" />
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr>
                <td colspan="2" align="center" class="title">
                    <span><asp:Label runat="server" ID="Label1"></asp:Label></span></td>
            </tr>
            <tr id="1">
                <td width="26%"><strong>样式名称：</strong><br />
                    数字越大排列越前</td>
                <td width="74%">
                    <asp:TextBox ID="styleName" class="form-control" runat="server" Width="259px"></asp:TextBox>
                    <font color="red">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="styleName" ErrorMessage="样式名称不能为空!"></asp:RequiredFieldValidator>
                    </font>
                </td>
            </tr>
            <tr>
                <td><strong>样式目录：</strong></td>
                <td>
                    <asp:TextBox ID="stylePath" class="l_input" runat="server" Width="259px"></asp:TextBox>
                    <span style="color: red;">*(示例:/Template/V3/企业黄页/)
              <asp:RequiredFieldValidator ID="RF2" runat="server" ControlToValidate="stylePath" ErrorMessage="样式路径不能为空!"></asp:RequiredFieldValidator></span></td>
            </tr>
            <tr id="Tr2">
                <td><strong>启用状态</strong></td>
                <td>
                    <asp:RadioButtonList ID="isTrue" runat="server" RepeatDirection="Horizontal" Width="109px">
                        <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">停用</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="Tr1">
                <td><strong>默认样式</strong></td>
                <td>
                    <asp:RadioButtonList ID="IsDefault" runat="server" RepeatDirection="Horizontal" Width="190px">
                        <asp:ListItem Value="1">设为默认</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">取消默认</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr id="Tr3">
                <td>
                    <strong>排列顺序</strong></td>
                <td>
                    <asp:TextBox ID="orderid" class="form-control" runat="server" Width="247px">0</asp:TextBox>
                </td>
            </tr>
            <tr id="Tr11">
                <td><strong>添加时间</strong></td>
                <td>
                    <asp:TextBox ID="addtime" class="form-control" runat="server" Width="165px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox></td>
            </tr>
            <tr id="Tr18">
                <td colspan="2" align="center">
                    <asp:HiddenField ID="lblid" runat="server" />
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="添加样式" OnClick="Button1_Click" />
                    <input type="button" class="btn btn-primary" value="取消添加" onclick="location = 'PageStyle.aspx';"/>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
