<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_PermissionInfo, App_Web_ub3q0ybo" enableviewstate="false" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>角色管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"   EmptyDataText="无数据"
        EnableTheming="False" OnRowDataBound="EGV_RowDataBound" RowStyle-CssClass="tdbg"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" class="table table-striped table-bordered table-hover" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" AllowUserToOrder="true" DataKeyNames="ID">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="角色名称" >
                <ItemTemplate>
                    <a href="Permissionadd.aspx?menu=edit&id=<%#Eval("ID") %>"><%#Eval("RoleName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="角色说明" DataField="info" />
            <asp:BoundField HeaderText="优先级别" DataField="Precedence" />
            <asp:TemplateField HeaderText="是否启用" >
                <ItemTemplate>
                    <%#Eval("IsTrue","{0}")=="True"?"<font color=green>启用</font>":"<font color=red>停用</font>"%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="相关操作">
                <ItemTemplate>
                    <a href="Permissionadd.aspx?menu=edit&id=<%#Eval("ID") %>">修改</a>　<a href="Permissionadd.aspx?menu=del&id=<%#Eval("ID") %>" onclick="return confirm('确实要删除此角色吗？');">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="CompetenceAdd.aspx?id=<%#Eval("ID") %>" >权限设置</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="SelectUserRole.aspx?id=<%#Eval("ID") %>">选择会员</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center"/>
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
    function Modify(id) {
        location.href = "Permissionadd.aspx?menu=edit&id=" + id;
    }
</script>
</asp:Content>


