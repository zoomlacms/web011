<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_MonthlyReport, App_Web_i0yrs3js" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>省市报表</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
	<span>后台管理</span>&gt;&gt;<span>商城管理</span> &gt;&gt;<a href="OrderList.aspx">订单管理</a>&gt;&gt;<a href="LocationReport.aspx">省市报表</a> &gt;&gt;<span style="color:Red"><asp:Label ID="LblGradeLevel" runat="server" Text=""></asp:Label></span>
</div>
<div class="clearbox"></div>
<asp:GridView ID="Gdv" RowStyle-HorizontalAlign="Center" DataKeyNames="code" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" Width="100%" OnRowCommand="Lnk_Click" EmptyDataText="无相关数据">
    <Columns>                                                                      
        <asp:BoundField DataField="name" HeaderText="省份">
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            <HeaderStyle Width="50%" />
        </asp:BoundField>  
        <asp:TemplateField HeaderText="订单总数">
            <ItemTemplate>
                <%# GetOrderNum(Container.DataItem) %>                                
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="订单总额">
            <ItemTemplate>
                <%# GetOrderAmount(Container.DataItem) %>                                
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        </asp:TemplateField>       
        <asp:TemplateField HeaderText="列表">                
            <ItemTemplate>
              <asp:LinkButton ID="LinkButton3" runat="server" CommandName="CheckList" CommandArgument='<%# Eval("code") %>'>订单列表</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
     <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
     <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
     <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
     <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
     <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />                
</asp:GridView>
    <asp:Label ID="thisall" runat="server"></asp:Label>
        
                <asp:HiddenField ID="HdnGradeID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnParentID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnLastLevel" Value="0" runat="server" />
    
</form>
</body>
</html>