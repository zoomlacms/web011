<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_FlowTypeList, App_Web_wx5dt34e" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>类型列表</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation" style="font-size:12px;">
    <div style="float:left;">
        后台管理&gt;&gt;系统设置 &gt;&gt;<a href="FlowTypeList.aspx">类型管理</a><a href="AddWorkFlowType.aspx" style="color:#f00;margin-left:10px;">[添加类型]</a>
    </div>
    <input type="button" class="C_schmor" style="float:left; margin-top:4px;margin-left:4px;" title="显示扩展搜索" value="" onclick="displayToolbar()" />
        <div id="toolbar1" style="display:none;margin-left:8px; float:left;">
            <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input">
                <tr >
                    <td>
                        <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" BorderColor="#fff" CssClass="l_inpnon" />&nbsp;
                        <asp:Button runat="server" CssClass="C_sch" ID="searchBtn" Text="" OnClick="searchBtn_Click"/>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            function displayToolbar() {
                $("#toolbar1").toggle("fast");
            }
            </script>
        <div class="clear"></div>
    <div class="clear"></div>
</div>
<div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%" CssClass="table border" RowStyle-CssClass="tdbg" AllowUserToOrder="true" BackColor="White" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="ID" OnRowDataBound="EGV_RowDataBound" OnRowCommand="EGV_RowCommand"  EmptyDataText="当前没有类型!!">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="类型名称" DataField="TypeName" />
            <asp:BoundField HeaderText="类型描述" DataField="TypeDescribe" />
            <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddWorkFlowType.aspx?ID=<%# Eval("ID") %>">修改</a>
                    <asp:LinkButton ID="LinkButton2" CommandName="Del"  CommandArgument='<%# Eval("ID") %>' runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center"/>
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
</div>
</form>
</body>
</html>
