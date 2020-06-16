<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_LocationReport, App_Web_i0yrs3js" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

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
	<span>后台管理</span>&gt;&gt;<span>商城管理</span> &gt;&gt;<a href="OrderList.aspx">订单管理</a>&gt;&gt;<a href="LocationReport.aspx">省市报表</a>&gt;&gt;<span style="color:Red"> <asp:Label ID="LblGradeLevel" runat="server" Text=""></asp:Label></span>
</div>
<div class="clearbox"></div>
<asp:GridView ID="Gdv" RowStyle-HorizontalAlign="Center" DataKeyNames="code" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" Width="100%" OnRowDataBound="Gdv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" OnRowEditing="Gdv_Editing" EmptyDataText="无相关数据">
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
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DicList" CommandArgument='<%#Eval("code") %>'>地区列表</asp:LinkButton>
                 |
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="CheckList" CommandArgument='<%# Eval("name") %>'>订单列表</asp:LinkButton>
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
        <%--<table width="100%">
        <tr>
            <td class="tdbg">
                <div style="text-align: center">
                    <span style="text-align: center">
                        <%=lang.LF("共")%>
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        <%=lang.LF("条数据")%>
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        <%=lang.LF("页次")%>：
                        <asp:Label ID="Nowpage" runat="server" Text="1" />/
                        <asp:Label ID="PageSize" runat="server" Text="" /><%=lang.LF("页")%>
                        <asp:Label ID="pagess" runat="server" Text="" />
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"
                            Width="30px"></asp:TextBox>
                        <%=lang.LF("条数据/页   转到第")%>
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                        </asp:DropDownList>
                        <%=lang.LF("页")%><asp:RangeValidator ID="RangeValidator1" runat="server"
                            ControlToValidate="txtPage" ErrorMessage="仅支持数字" Type="Integer" MaximumValue="100000"
                            MinimumValue="0"></asp:RangeValidator></span></div>
            </td>
        </tr>
    </table>--%>
                <asp:Button ID="Button1" runat="server" Text="返 回" OnClick="btnBack_Click" class="C_input"/>
        
                <asp:HiddenField ID="HdnGradeID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnParentID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnLastLevel" Value="0" runat="server" />
    
</form>
</body>
</html>