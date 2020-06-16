<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_MailMange, App_Web_wx5dt34e" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>模型管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
    <div class="r_navigation" style="font-size:12px;">
        <div style="float:left;">后台管理&gt;&gt;系统设置 &gt;&gt;<a href="MailManage.aspx">OA邮箱管理</a></div>
        <input type="button" class="C_schmor" style="float:left; margin-top:4px;margin-left:4px;" title="显示扩展搜索" value="" onclick="displayToolbar()" />
        <div class="clear"></div>
    </div>
    <div>
        <table cellpadding="2" border="0" cellspacing="1" style="background: #fff;" class="l_input">
            <tr><td>
                <asp:DropDownList runat="server" ID="SizeStatus_Dp" OnSelectedIndexChanged="SizeStatus_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="All">全部用户</asp:ListItem>
                    <asp:ListItem Value="NoSize">无容量用户</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox runat="server" ID="searchText" placeholder="请输入用户名或工号" BorderColor="#fff" CssClass="l_inpnon" />&nbsp;
                        <asp:Button runat="server" CssClass="C_sch" ID="searchBtn" OnClick="searchBtn_Click" />
            </td></tr></table>
    </div>
    <div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None"
             CellPadding="2" CellSpacing="1"  Width="100%" CssClass="table border" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="UserID" 
             OnRowCommand="EGV_RowCommand" RowStyle-CssClass="tdbg" AllowUserToOrder="true" BackColor="White" EmptyDataText="当前没有类型!!">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="ID" SortExpression="UserID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="会员名">
                    <ItemTemplate>
                        <a href="UserInfo.aspx?id=<%# Eval("UserID") %>"><%# Eval("UserName","{0}") %></a>
                    </ItemTemplate>
                    <HeaderStyle />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="WorkNum" HeaderText="工号" SortExpression="WorkNum">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="会员组">
                    <ItemTemplate>
                        <a href="UserManage.aspx?GroupID=<%#Eval("GroupID","{0}") %>">
                            <%# GetGroupName(Eval("GroupID","{0}")) %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="8%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="邮箱使用状况">
                    <ItemTemplate>
                        <%#GetMailRemind() %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center"/>
            <RowStyle HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
</form>
</body>
</html>