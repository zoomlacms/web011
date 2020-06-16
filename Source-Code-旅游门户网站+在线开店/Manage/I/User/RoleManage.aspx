<%@ page language="C#" title="角色管理" autoeventwireup="true" inherits="User.RoleManage, App_Web_ub3q0ybo" enableeventvalidation="false" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>角色管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:GridView ID="EGV" runat="server" AllowPaging="True" class="table table-striped table-bordered table-hover"
        Width="100%" ForeColor="#333333" AutoGenerateColumns="False" DataKeyNames="RoleID"
        PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="LnkModify_Click" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="RoleID" HeaderText="ID">
                <HeaderStyle Width="10%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="RoleName" HeaderText="角色名">
                <HeaderStyle Width="10%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="描述">
                <HeaderStyle Width="50%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="Userlist" CommandName="ListRolelist" CommandArgument='<%# Eval("RoleID")%>' runat="server">成员管理</asp:LinkButton>
                    <asp:LinkButton ID="LinkEdit" CommandName="ModifyRole" CommandArgument='<%# Eval("RoleID")%>' runat="server">修改</asp:LinkButton>
                    <asp:LinkButton ID="LnkDel" CommandName="Del" Enabled='<%# Returnuser(Eval("RoleID").ToString()) %>' CommandArgument='<%# Eval("RoleID")%>' OnClientClick="return confirm('您确认删除该记录吗?')" runat="server">删除</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" Enabled='<%# Returnuser(Eval("RoleID").ToString()) %>' CommandName="ModifyPower" CommandArgument='<%# Eval("RoleID")%>' runat="server">权限设置</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
        <SelectedRowStyle Font-Bold="True" ForeColor="White" />
        <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
        <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
    </asp:GridView>
    <div class="clearbox"></div>
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td class="tdbgleft">
                <img src="/Images/notice.gif" align="absmiddle" />&nbsp;<b>说明：超级管理员拥有最高的权限，不能修改其权限，删除该组！</b></td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
