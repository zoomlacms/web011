<%@ page language="C#" autoeventwireup="true" inherits="Manage_User_SelectUserRole, App_Web_evybsxrg" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../JS/SelectCheckBox.js"></script>
<title>选择权限</title>
<style>
.border{ margin-bottom:10px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div>
    <div style="padding:5px;">
        <asp:TextBox runat="server" ID="SKey_T" placeholder="输入用户名查询" CssClass="l_input" />
        <asp:Button runat="server" CssClass="C_input" ID="Search_Btn" Text="搜索" OnClick="Search_Btn_Click" />
    </div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" RowStyle-CssClass="tdbg"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="border" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" AllowUserToOrder="true" DataKeyNames="UserID">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" id="Btchk" runat="server" value='<%#Eval("UserID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="UserID" />
            <asp:BoundField HeaderText="用户名" DataField="UserName" />
            <asp:TemplateField>
                <ItemTemplate>
                    <%# GetGroupName(Eval("GroupID","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RegTime" HeaderText="注册时间" SortExpression="RegTime" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate> <%# GetStatus(Eval("Status","{0}")) %> </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center"/>
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
    <input type="checkbox" class="select" name="cbAll" onclick="CheckAll(this)" />全选
    <asp:Button ID="Button1" OnClick="SaveBtn_Click" CssClass="C_input select" runat="server" Text="选择会员" />
    <input type="button" class="C_input" onclick=" window.location.href = 'PermissionInfo.aspx'" value="返回列表" />
</div>
</form>
<script>
function CheckAll(spanChk)//CheckBox全选
{
    var oItem = spanChk.children;
    var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
    xState = theBox.checked;
    elm = theBox.form.elements;
    for (i = 0; i < elm.length; i++)
        if (elm[i].type == "checkbox" && elm[i].id != theBox.id)
        {
            if (elm[i].checked != xState)
                elm[i].click();
        }
}
$().ready(function () {
    var str = '<%= GetUserRole()%>';
    var str1 = str.split(',');
    for (var i = 0; i < str1.length; i++) {
        var checkArr = $("input[type=checkbox][value=" + str1[i] + "]");
        checkArr[0].checked = true;
    }
})
</script>
</body>
</html>
