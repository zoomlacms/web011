<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_FillOrder, App_Web_i0yrs3js" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>补订单</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style>
.userlist tr{ height:24px; line-height:24px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
    <span>后台管理</span> &gt;&gt; <a href="OrderList.aspx">订单管理</a> &gt;&gt;  <a href="FillOrder.aspx">补单</a> &gt;&gt; 
    <asp:Label runat="server" ID="stepName" style="color:green;">会员选择</asp:Label>
</div>
<div class="userlist" id="userlist" runat="server">
    <ZL:ExGridView ID="EGV"  runat="server" AutoGenerateColumns="False" PageSize="20"  OnRowCommand="EGV_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" RowStyle-CssClass="tdbg" MouseOverCssClass="tdbgmouseover" GridLines="None" EnableModelValidation="True">
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="UserID" ReadOnly="true" />
            <asp:BoundField DataField="UserName" HeaderText="会员名" />
            <asp:TemplateField HeaderText="会员组">
                <ItemTemplate>
                    <%# GetGroupName(Eval("GroupID","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Purse" HeaderText="资金余额" DataFormatString="{0:F2}" />
            <asp:BoundField DataField="RegTime" HeaderText="注册时间" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="UserExp" HeaderText="积分" />
            <asp:BoundField DataField="LoginTimes" HeaderText="登录次数" />
            <asp:BoundField DataField="LastLockTime" HeaderText="最后登录时间" />
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%# GetStatus(Eval("Status","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="select" CommandArgument='<%#Eval("UserID") %>' runat="server">选择会员</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</div>
<div class="shoplist" id="shoplist" runat="server" visible="false">
    <ZL:ExGridView ID="EGV1"  runat="server" AutoGenerateColumns="False" PageSize="20"  OnRowCommand="EGV1_RowCommand" OnPageIndexChanging="EGV1_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" RowStyle-CssClass="tdbg" MouseOverCssClass="tdbgmouseover" GridLines="None" EnableModelValidation="True">
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="true"/>
            <asp:TemplateField HeaderText="商品图片">
                <ItemTemplate>
                    <%# getproimg(Eval("Thumbnails","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="proname" HeaderText="商品名称" />
            <asp:TemplateField HeaderText="商品类型">
                <ItemTemplate>
                    <%#getshoptype(Eval("ID" ,"{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AddUser" HeaderText="录入者" />
            <asp:TemplateField HeaderText="价格">
                <ItemTemplate>
                    <%#formatcs(Eval("LinPrice","{0}"),Eval("ProClass","{0}"),Eval("PointVal","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("ID") %>' CommandName="select" runat="server">选择商品</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</div>
<div id="orderinfo" class="orderinfo border" runat="server" visible="false">
    <table class="ordertable" style="width:100%;" CellSpacing="1">
        <tr class="tdbg">
            <td colspan="2" class="spacingtitle" align="center"> 填写订单信息 </td>
        </tr>
        <tr class="tdbg">
            <td style="text-align:right;width:50%;">数量：</td>
            <td>
                <asp:TextBox CssClass="l_input" ID="TextBox1" Text="1" runat="server"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" CssClass="C_input" Text="加数量" OnClick="Button2_Click" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="必须为正整数" ForeColor="Red" ControlToValidate="TextBox1" ValidationExpression="^[0-9]*[1-9][0-9]*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr class="tdbg">
            <td style="text-align:right;">是否已付款</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="0">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="tdbg">
            <td colspan="2" align="center" ><asp:Button CssClass="C_input" ID="Button1" runat="server" Text="添加订单" OnClick="Button1_Click" /></td>
        </tr>
    </table>
</div>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="HiddenField2" runat="server" />
</form>
</body>
</html>