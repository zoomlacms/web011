<%@ page language="C#" autoeventwireup="true" inherits="manage_User_UserCart, App_Web_evybsxrg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>用户信誉值管理</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">后台管理 &gt;&gt; 用户管理 &gt;&gt; 会员管理 &gt;&gt; <a href='UserManage.aspx'>会员列表</a> &gt;&gt; 会员信誉值操作</div>
        <div id="UserPDiv" runat="server">
            <table width="100%" border="0" cellpadding="5" cellspacing="1" class="border">
                <tr align="center">
                    <td colspan="2" class="spacingtitle">
                        <asp:Label ID="Lbl_t" runat="server" Text="会员资金操作"></asp:Label></td>
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" style="width: 20%" align="right">会员名：</td>
                    <td class="bqright">
                        <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                        <asp:LinkButton ID="lbUserName" runat="server" PostBackUrl='~/manage/User/Userinfo.aspx?id=<%=Request.QueryString("UserID") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" style="width: 20%" align="right">会员信誉值：</td>
                    <td class="bqright">
                        <asp:Label ID="lblPurse" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" style="width: 20%" align="right">信誉值操作：</td>
                    <td class="bqright">
                        <asp:RadioButtonList ID="rblPurse" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1" Selected="True">加信誉值</asp:ListItem>
                            <asp:ListItem Value="2">减信誉值</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" style="width: 20%" align="right">信誉值：</td>
                    <td class="bqright">
                        <asp:TextBox ID="TxtScore" runat="server" CssClass="l_input">0</asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^[0-9]\d*|0$" ControlToValidate="TxtScore" ErrorMessage="只能输入非0整数"></asp:RegularExpressionValidator></td>
                    <asp:RequiredFieldValidator ID="ScoreVa" runat="server" Display="Dynamic" ControlToValidate="TxtScore" ErrorMessage="不能为空!" />
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" style="width: 20%" align="right">备注：</td>
                    <td class="bqright">
                        <asp:TextBox ID="TxtDetail" runat="server" Rows="10" TextMode="MultiLine" Width="50%" CssClass="x_input"></asp:TextBox></td>
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" style="width: 20%" align="right">同时扣减会员：</td>
                    <td class="bqright">
                        <asp:TextBox ID="SourceMem" runat="server" CssClass="x_input" /></td>
                </tr>
                <tr class="tdbgbottom">
                    <td colspan="2">
                        <asp:HiddenField ID="Hdn_t" runat="server" />
                        <asp:HiddenField ID="HdnUserID" runat="server" />
                        <asp:Button ID="EBtnSubmit" Text="确 认" OnClick="EBtnSubmit_Click" OnClientClick="" runat="server" class="C_input" />
                        <asp:Button ID="Button1" Text="取 消" runat="server" class="C_input" CausesValidation="false" OnClick="Button1_Click" /></td>
                </tr>
            </table>
            <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-Height="22" />
                    <asp:BoundField HeaderText="操作时间" DataField="HisTime" />
                    <asp:BoundField HeaderText="操作金额" DataField="UserCarit" DataFormatString="{0:f2}" />
                    <asp:TemplateField HeaderText="操作人">
                        <ItemTemplate>
                            <a href='AdminDetail.aspx?roleid=0&id=<%#Eval("Operator") %>' target="_blank"><%#GetUserName(Eval("Operator", "{0}"))%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="详细" DataField="Detail" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CommandName="Edit1" CommandArgument='<%#Eval("ID") %>' runat="server">修改</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
        <table width="100%" id="EditMoney" cellpadding="2" cellspacing="1" class="border" style="background-color: white;" runat="server" visible="false">
            <tr class="tdbg" style="height: 24px;">
                <td class="tdbgleft" style="width: 20%" align="right">ID：</td>
                <td>
                    <asp:Label ID="UserExpDomPID" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr class="tdbg" style="height: 24px;">
                <td class="tdbgleft" style="width: 20%" align="right">操作时间：</td>
                <td>
                    <asp:TextBox ID="HisTime" CssClass="l_input" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox></td>
            </tr>
            <tr class="tdbg" style="height: 24px;">
                <td class="tdbgleft" style="width: 20%" align="right">操作金额：</td>
                <td>
                    <asp:TextBox ID="Score" CssClass="l_input" runat="server" Text="0"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ValidationExpression="^-?([0-9]\d*|0)$" Display="Dynamic" ControlToValidate="Score" ErrorMessage="只能输入数字" ForeColor="Red" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="Score" ErrorMessage="不能为空!" ForeColor="Red" />
                </td>
            </tr>
            <tr class="tdbg" style="height: 24px;">
                <td class="tdbgleft" style="width: 20%" align="right">详细：</td>
                <td>
                    <asp:TextBox ID="Detail" Rows="10" TextMode="MultiLine" Width="50%" CssClass="x_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg" style="text-align: center; height: 30px;">
                <td colspan="2">
                    <asp:Button ID="EditBtn" Text="修改" class="C_input" OnClick="EditBtn_Click" runat="server" OnClientClick="return confirm('您确认要修改金额吗？这会引起账户平衡的改变，请务必确认新金额的正确。')" />
                    <button type="button" onclick="location.href=location.href" class="C_input">取消</button>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="UserPH" runat="server" />
    </form>
</body>
</html>
