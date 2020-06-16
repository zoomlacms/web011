<%@ page language="C#" autoeventwireup="true" inherits="manage_User_UserPointManage, App_Web_2wb0azx5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>点劵管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="UserPDiv" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr class="text-center">
                <td colspan="2"><asp:Label ID="Lbl_t" runat="server" Text="会员虚拟币操作"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 20%" class="text-right">会员名：</td>

                <td><a href="UserInfo.aspx?id=<%=Request.QueryString["UserID"] %>">
                    <asp:Label ID="lbUserName" runat="server" Text=""></asp:Label></a></td>
            </tr>
            <tr>
                <td style="width: 20%" class="text-right">会员点劵：</td>
                <td>
                    <asp:Label ID="lblExp" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 20%" class="text-right">点劵操作：</td>
                <td>
                    <asp:RadioButtonList ID="rblExp" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">加点劵</asp:ListItem>
                        <asp:ListItem Value="2">减点劵</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="width: 20%" class="text-right">点劵：</td>
                <td>
                    <asp:TextBox ID="TxtScore" runat="server" class="form-control">0</asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^-?([1-9]+(\.(\d*)|0)?)|(0(\.\d+){1})$" ControlToValidate="TxtScore" ErrorMessage="只能输入数字"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="ScoreVa" runat="server" Display="Dynamic" ControlToValidate="TxtScore" ErrorMessage="不能为空!" />
                </td>
            </tr>
            <tr>
                <td style="width: 20%" class="text-right">备注：</td>
                <td>
                    <asp:TextBox ID="TxtDetail" runat="server" Rows="10" TextMode="MultiLine" class="form-control" Height="60px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 20%" class="text-right">同时扣减会员：</td>
                <td>
                    <asp:TextBox ID="SourceMem" runat="server" CssClass="form-control" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HiddenField ID="Hdn_t" runat="server" />
                    <asp:HiddenField ID="HdnUserID" runat="server" />
                    <asp:Button ID="EBtnSubmit" Text="执 行" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
                    <asp:Button ID="Button1" Text="取 消" runat="server" class="btn btn-primary" CausesValidation="false" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand"  AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" EnableTheming="False" CssClass="table table-striped table-bordered table-hover" GridLines="None" EnableModelValidation="True">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="操作时间" DataField="AddTime" />
                <asp:BoundField HeaderText="操作金额" DataField="BidPrice" DataFormatString="{0:f2}" />
                <asp:TemplateField HeaderText="操作人">
                    <ItemTemplate>
                        <a href='AdminDetail.aspx?roleid=0&id=<%#Eval("Operator") %>' target="_blank"><%#GetUserName(Eval("Operator", "{0}"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="详细" DataField="Remark" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandName="Edit1" CommandArgument='<%#Eval("ID") %>' runat="server">修改</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    <table id="EditMoney" class="table table-striped table-bordered table-hover" runat="server" visible="false">
        <tr>
            <td style="width: 20%" class="text-right">ID：</td>
            <td><asp:Label ID="UserExpDomPID" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right">操作时间：</td>
            <td>
                <asp:TextBox ID="HisTime" CssClass="form-control" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right">操作金额：</td>
            <td>
                <asp:TextBox ID="Score" CssClass="form-control" runat="server" Text="0"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="^-?\d+\.?\d*$" Display="Dynamic" ControlToValidate="Score" ErrorMessage="只能输入数字" ForeColor="Red" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="Score" ErrorMessage="不能为空!" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right">详细：</td>
            <td>
                <asp:TextBox ID="Detail" Rows="10" TextMode="MultiLine" Width="50%" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="text-align: center;">
            <td colspan="2">
                <asp:Button ID="EditBtn" Text="修改" class="btn btn-primary" OnClick="EditBtn_Click" runat="server" OnClientClick="return confirm('您确认要修改金额吗？这会引起账户平衡的改变，请务必确认新金额的正确。')" />
                <button type="button" onclick="location.href=location.href" class="btn btn-primary">取消</button>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="UserPH" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
