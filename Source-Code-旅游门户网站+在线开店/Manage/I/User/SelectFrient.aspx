<%@ page language="C#" autoeventwireup="true" inherits="manage_User_SelectFrient, App_Web_lorqymfm" enableeventvalidation="false" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查找好友</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="TopDiv" runat="server">
        <div class="friends">
            <ul>
                <li></li>
                <li>
                    <asp:RadioButtonList ID="ProClass" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="ProClass_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="2" Selected="True">按ID查找</asp:ListItem>
                        <asp:ListItem Value="3">按昵称查找</asp:ListItem>
                    </asp:RadioButtonList>
                </li>
                <li>
                    <div id="Div2" runat="server">
                        按ID查询&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" class="form-control" style="max-width:150px;" ID="SelectID" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ControlToValidate="SelectID" ErrorMessage="ID必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>
                    </div>
                </li>
                <li>
                    <div id="Div3" runat="server">
                        按昵称查询&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" class="form-control" style="max-width:150px;" ID="SelectName" />
                    </div>
                </li>
                <li>
                    <asp:Button Text="查找好友" class="btn btn-primary" ID="button1" runat="server" OnClick="button1_Click" />
                    &nbsp;&nbsp;
              <input class="btn btn-primary" type="button" value="关闭" id="button2" onclick="cl();" />
                </li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div id="Showdiv" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr align="center" class="title">
                <td style="width: 5%">用户ID</td>
                <td style="width: 5%">姓名</td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr class="tdbg" onclick="selectuser(<%#Eval("UserID") %>)" id='<%#Eval("UserID") %>'>
                        <td height="22" align="center"><%#Eval("UserID")%></td>
                        <td height="22" align="center"><%#Eval("UserName")%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="22" colspan="2" align="center" class="tdbg">
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("UserID")%>' />
                    <asp:Button ID="Button4" Text="添加好友" runat="server" class="btn btn-primary" OnClick="Button4_Click" CausesValidation="false" />
                    共
              <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条数据
              <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：
              <asp:Label ID="Nowpage" runat="server" Text="" />
                    /
              <asp:Label ID="PageSize" runat="server" Text="" />
                    页
              <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    条数据/页 转到第
              <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    页
              <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                    <asp:LinkButton runat="server" Text="返回上页面" OnClick="Unnamed1_Click"></asp:LinkButton></td>
            </tr>
        </table>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="../../JS/Jquery.js"></script>
    <script type="text/javascript">
        function cl() { window.close(); }
    </script>
    <script type="text/javascript">
        $('#friendlist .tdbg').click(function () {
            $('.tdbg').removeClass("tdbgmouseover");
            $(this).addClass('tdbgmouseover');
            var nowid = $(this).attr('id');
        });
        function selectuser(uid) {
            document.getElementById("HiddenField1").value = uid.toString();
        }
  </script>
</asp:Content>
