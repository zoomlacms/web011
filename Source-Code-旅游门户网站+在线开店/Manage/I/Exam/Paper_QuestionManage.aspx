<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Paper_QuestionManage, App_Web_fk1hbgsf" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>系统试卷大题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div align="center">
        <asp:Literal ID="lipaper" runat="server"></asp:Literal></div>
    <table class="table table-striped table-bordered table-hover">
        <tr align="center" class="title">
            <td width="5%">
                <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
            </td>
            <td width="20%">大题标题</td>
            <td width="20%">大题序号</td>
            <td width="20%">题型</td>
            <td width="40%" class="title">操作</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td height="22" align="center">
                        <input name="Item" type="checkbox" value='<%#Eval("ID") %>' />
                    </td>
                    <td height="22" align="center">
                        <%#Eval("QuestionTitle")%>
                    </td>
                    <td height="22" align="center"><%#Eval("OrderBy")%></td>
                    <td height="22" align="center">
                        <%#GetQuesType(Eval("QuestionType","{0} "))%>
                    </td>
                    <td height="22" align="center">
                        <%-- <a href="Paper_Subject_Manage.aspx?pid=<%=Request.QueryString["pid"] %>">试题管理</a>--%>
                        <a href="AddPaperQuestion.aspx?id=<%#Eval("ID")%>&pid=<%=Request.QueryString["pid"] %>">修改</a> <a href="?menu=delete&id=<%#Eval("ID")%>&pid=<%=Request.QueryString["pid"] %>" onclick="return confirm('确实要删除此题吗？');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td height="22" colspan="9" align="center" class="tdbg">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                        <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" />页
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                条数据/页 转到第
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                    ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
    </table>
    <div>
        <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"
            Text="批量删除" OnClick="Button3_Click" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>