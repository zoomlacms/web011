<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_OtherOrder_BountProduct, App_Web_q55uxuf1" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>关联产品</title>
<link href="../../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style>
.sitelist tr{ height:24px; line-height:24px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
    <div class="r_navigation">
        <span>后台管理</span> &gt;&gt; <span>商城管理</span> &gt;&gt; <a href="IDCOrder.aspx?OrderType=7">IDC服务订单</a>
        &gt;&gt; <span>绑定产品</span>
    </div>
</div>
<div class="h_27"></div>
    <div class="sitelist">
        <ZL:ExGridView ID="EGV"  runat="server" AutoGenerateColumns="False" PageSize="20" OnRowCommand="EGV_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EmptyDataText="没有任何数据！" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True">
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true" />
                <asp:TemplateField HeaderText="站点ID">
                    <ItemTemplate>
                        <%# Eval("SiteID") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="网站名称">
                    <ItemTemplate>
                        <%#Eval("SiteName")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="生效时间">
                    <ItemTemplate>
                       <%#Eval("CreateDate") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="到期时间">
                    <ItemTemplate>
                        <%#Eval("EndDate") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="绑定的订单">
                    <ItemTemplate>
                        <%#GetBound(DataBinder.Eval(Container,"DataItem.SiteID","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandName="select" CommandArgument='<%#Eval("SiteID") %>' runat="server">绑定</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
</form>
<script type="text/javascript">
    $().ready(function () {
        $("#<%=EGV.ClientID%> tr").mousemove(function () { this.className = 'tdbgmouseover'; }).mouseout(function () { this.className = 'tdbg'; });
    });
</script>
</body>
</html>
