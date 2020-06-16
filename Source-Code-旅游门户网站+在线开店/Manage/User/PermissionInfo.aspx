<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_PermissionInfo, App_Web_evybsxrg" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>角色管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
    function Modify(id) {
        location.href = "Permissionadd.aspx?menu=edit&id=" + id;
     }
</script>
<style>
.border th {height:22px;}
</style>
</head>
<body>
<form id="form1" runat="server">
    <div class="r_navigation">后台管理&gt;&gt; 角色管理&gt;&gt;<a href="PermissionInfo.aspx">角色管理</a>&nbsp;&nbsp;<a href="Permissionadd.aspx" style="color:#f00;">[添加角色]</a></div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False" OnRowDataBound="EGV_RowDataBound" RowStyle-CssClass="tdbg"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="border" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" AllowUserToOrder="true" DataKeyNames="ID">
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
</form>
</body>
</html>