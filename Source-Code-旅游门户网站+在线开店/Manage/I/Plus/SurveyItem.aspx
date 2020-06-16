<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyItem, App_Web_0t1uxiqn" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问卷投票问题</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" align="center">
                <asp:Literal ID="ltlAction" runat="server">添加</asp:Literal>问卷投票问题:
        <asp:Label ID="Label1" runat="server" Text="Label" Style="letter-spacing: normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 180px"><strong>问题标题：</strong></td>
            <td>
                <asp:TextBox ID="TxtQTitle" class="form-control" runat="server" Width="156" MaxLength="80" ToolTip="标题最大长度为80个字符" />
                <font color="red">*</font>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="问题标题不能为空" ControlToValidate="TxtQTitle" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvTitleLength" runat="server" ErrorMessage="标题最大长度为80个字符" ControlToValidate="TxtQTitle" Display="Dynamic" ClientValidationFunction="CheckTitleLen"></asp:CustomValidator>
            </td>
        </tr>
        <tr class="tdbg">
            <td><strong>类型：</strong></td>
            <td>
                <asp:RadioButtonList ID="RblTypeID" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnSelectedIndexChanged="RblTypeID_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="1">单选项</asp:ListItem>
                    <asp:ListItem Value="2">复选项</asp:ListItem>
                    <asp:ListItem Value="3">单行文本</asp:ListItem>
                    <asp:ListItem Value="4">验证文本</asp:ListItem>
                    <asp:ListItem Value="5">图片</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <%-- 单选 --%>
        <tbody id="type1" name="typeRdo" style="display: none;" runat="server" width="100%">
            <tr>
                <td style="width: 180px"><strong>分行键入每个选项：</strong></td>
                <td>
                    <asp:TextBox ID="RadioType_Content" class="form-control" runat="server" AutoPostBack="false" TextMode="MultiLine" Columns="40" Rows="6" Height="68px"></asp:TextBox>
                    <span style="color: red">*</span>
                    <asp:RequiredFieldValidator ID="rfvRadioContent" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="RadioType_Content">选项不能为空</asp:RequiredFieldValidator>
                </td>
            </tr>
        </tbody>
        <%--复选 --%>
        <tbody id="type2" name="typeChk" style="display: none;" runat="server" width="100%">
            <tr>
                <td style="width: 180px"><strong>分行键入每个选项：</strong></td>
                <td>
                    <asp:TextBox ID="ChkType_Content" class="form-control" runat="server" AutoPostBack="false"
                        TextMode="MultiLine" Columns="40" Rows="6" Height="68px"></asp:TextBox>
                    <span style="color: red">*</span>
                    <asp:RequiredFieldValidator ID="rfvChkContent" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ChkType_Content">选项不能为空</asp:RequiredFieldValidator></td>
            </tr>
        </tbody>
        <%--单行文本 --%>
        <tbody id="type3" name="typeTxt" style="display: none;" runat="server" width="100%">
            <tr>
                <td style="width: 180px">
                    <strong>文本框长度：</strong>
                </td>
                <td>
                    <asp:TextBox ID="Txt_Width" CssClass="form-control" runat="server" Columns="10" MaxLength="4">35</asp:TextBox>px
                </td>
            </tr>
        </tbody>
        <%--验证文本 --%>
        <tbody id="type4" name="typeTxtVerify" style="display: none;" runat="server" width="100%">
            <tr>
                <td style="width: 180px">
                    <strong>文本框长度：</strong>
                </td>
                <td>
                    <asp:TextBox ID="txtVWidth" CssClass="form-control" runat="server" Columns="10" MaxLength="4">50</asp:TextBox>px
                </td>
            </tr>
            <tr>
                <td style="width: 180px">
                    <strong>验证类型：</strong>
                </td>
                <td>
                    <asp:RadioButtonList ID="rdoVType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="0" Selected="True">邮箱</asp:ListItem>
                        <asp:ListItem Value="1">手机号码</asp:ListItem>
                        <asp:ListItem Value="2">固定电话</asp:ListItem>
                        <asp:ListItem Value="3">身份证号</asp:ListItem>
                        <asp:ListItem Value="4">准考证号</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </tbody>
        <tbody id="type5" name="typePicture" style="display: none;" runat="server" width="100%">
            <tr>
                <td style="width: 180px">
                    <strong>允许上传的图片类型：</strong>
                </td>
                <td>
                    <asp:TextBox ID="txtPicExt" CssClass="form-control" runat="server" Columns="30">jpg/png</asp:TextBox>
                    <span style="color: red">*</span> <span style="color: Blue">注：允许多个类型请用“/”号分割，如：jpg/gif/bmp/png 等等</span>
                </td>
            </tr>
        </tbody>
        <tr>
            <td style="width: 180px">
                <strong>是否必填：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="NotNull" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:HiddenField ID="HdnSurveyID" runat="server" />
                <asp:Button ID="EBtnSubmit" Text="添加" Enabled="true" OnClick="Button_Click" runat="server" CssClass="btn btn-primary" CommandName="Add" />
                <input type="reset" value="重置" class="btn btn-primary" />
                <input type="button" value="返回" class="btn btn-primary" onclick="location = '<%="SurveyItemList.aspx?SID="+HdnSurveyID.Value%>'" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function CheckTitleLen(source, args) {
            var str = args.Value;
            if (str.length > 80) {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
    </script>
</asp:Content>
