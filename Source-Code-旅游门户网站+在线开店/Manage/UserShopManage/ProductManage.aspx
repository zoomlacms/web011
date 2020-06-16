<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_ProductManage, App_Web_utg1fhgi" clientidmode="Static" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>商品列表</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        function DBClickOpenPage() //双击打开会员信息页面
        {
            window.open("../User/UserInfo.aspx?id=<%# Eval("userid") %>", '_self');
}
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">后台管理 &gt;&gt; 店铺管理 &gt;&gt; 店铺商品管理 &gt;&gt; 商品列表</div>
        <div class="divline">
            <ul style="cursor:pointer;">
                <li><a href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=0">商品列表</a></li>
                <li><a href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=1">推荐商品</a></li>
                <li><a href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=2">团购商品</a></li>
                <li><a href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=3">竞拍商品</a></li>
            </ul>
        </div>
        <div class="clearbox">
        </div>
        <div class="clearbox">
        </div>
        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
            <tbody id="Tabs">
                <tr class="tdbg">
                    <td width="34%" height="24" align="center" class="title">快速查找：
				<asp:DropDownList ID="quicksouch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="quicksouch_SelectedIndexChanged">
                    <asp:ListItem Value="1">所有商品</asp:ListItem>
                    <asp:ListItem Value="2">正在销售的商品</asp:ListItem>
                    <asp:ListItem Value="3">未销售的商品</asp:ListItem>
                    <asp:ListItem Value="4">正常销售的商品</asp:ListItem>
                    <asp:ListItem Value="5">特价处理的商品</asp:ListItem>
                    <asp:ListItem Value="6">所有热销的商品</asp:ListItem>
                    <asp:ListItem Value="7">所有新品</asp:ListItem>
                    <asp:ListItem Value="8">所有精品商品</asp:ListItem>
                    <asp:ListItem Value="9">有促销活动的商品</asp:ListItem>
                    <asp:ListItem Value="10">实际库存报警的商品</asp:ListItem>
                    <asp:ListItem Value="11">预定库存报警的商品</asp:ListItem>
                    <asp:ListItem Value="12">已售完的商品</asp:ListItem>
                    <asp:ListItem Value="13">所有批发商品</asp:ListItem>
                </asp:DropDownList>
                    </td>
                    <td width="66%" align="center" class="title">高级查询：
				<asp:DropDownList ID="souchtable" runat="server">
                    <asp:ListItem Value="0" Selected="True">请选择</asp:ListItem>
                    <asp:ListItem Value="1">商品名称</asp:ListItem>
                    <asp:ListItem Value="2">商品简介</asp:ListItem>
                    <asp:ListItem Value="3">商品介绍</asp:ListItem>
                    <asp:ListItem Value="4">厂商</asp:ListItem>
                    <asp:ListItem Value="5">品牌/商标</asp:ListItem>
                    <asp:ListItem Value="6">条形码</asp:ListItem>
                </asp:DropDownList>
                        <asp:TextBox ID="souchkey" runat="server" class="l_input" />
                        <asp:Button ID="souchok" class="C_input" runat="server" Text="搜索" OnClick="souchok_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True" EmptyDataText="暂无相关商品！！">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input name="Item" type="checkbox" value='<%# Eval("id")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:TemplateField HeaderText="商品图片">
                    <ItemTemplate>
                        <a href="/Store/Shopinfo.aspx?ItemID=<%# Eval("id") %>&id=<%# GetShopIDByInputer(GetUsername(Eval("UserID").ToString())) %>" target="_blank"><%#getproimg(Eval("Thumbnails","{0}"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品名称">
                    <ItemTemplate>
                        <a href="/Store/Shopinfo.aspx?ItemID=<%# Eval("id") %>&id=<%# GetShopIDByInputer(GetUsername(Eval("UserID").ToString())) %>" target="_blank"><%#Eval("ProName")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="店铺名称">
                    <ItemTemplate>
                        <a href="../UserShopManage/StoreEdit.aspx?id=<%# GetShopIDByInputer(GetUsername(DataBinder.Eval(Container.DataItem,"UserID").ToString())) %>"><%#GetShopNameByInputer(GetUsername(DataBinder.Eval(Container.DataItem,"UserID").ToString()))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发布人">
                    <ItemTemplate>
                        <a href="../User/UserInfo.aspx?id=<%# Eval("userid") %>"><%#GetUsername(DataBinder.Eval(Container.DataItem,"UserID").ToString())%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="价格">
                    <ItemTemplate>
                        <%#formatcs(DataBinder.Eval(Container,"DataItem.LinPrice","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="购买方式">
                    <ItemTemplate>
                        <%#formatnewstype(DataBinder.Eval(Container,"DataItem.Colonel").ToString ())%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="推荐级别">
                    <ItemTemplate>
                        <%#Eval("Dengji")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="结束时间">
                    <ItemTemplate>
                        <%#Eval("ColonelTime")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="人数">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container,"DataItem.ColonelNowNum")%>\<%#DataBinder.Eval(Container,"DataItem.ColonelNum")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品属性">
                    <ItemTemplate>
                        <%#forisbest(DataBinder.Eval(Container,"DataItem.isbest","{0}"))%>
                        <%#forishot(DataBinder.Eval(Container,"DataItem.ishot","{0}"))%>
                        <%#forisnew(DataBinder.Eval(Container,"DataItem.isnew","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="销售中">
                    <ItemTemplate>
                        <%#formattype(DataBinder.Eval(Container,"DataItem.Sales","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="ProductAdd.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">修改</a>
                        <a href="ProductManage.aspx?menu=delete&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="height: 21px">&nbsp;<asp:Button ID="Button1" class="C_input" Style="width: 110px;" runat="server"
                    Text="开始销售" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" class="C_input" Style="width: 110px;" runat="server" Text="设为热卖"
                        OnClick="Button2_Click" />
                    <asp:Button ID="Button6" class="C_input" Style="width: 110px;" runat="server" Text="设为精品"
                        OnClick="Button6_Click" />
                    <asp:Button ID="Button5" class="C_input" Style="width: 110px;" runat="server" Text="设为新品"
                        OnClick="Button5_Click" />
                    <asp:Button ID="Button3" class="C_input" Style="width: 110px;" runat="server" Text="批量删除"
                        OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
                    <asp:Button ID="Button4" class="C_input" Style="width: 110px;" runat="server" Text="停止销售"
                        OnClick="Button4_Click" />
                    <br />
                    &nbsp;<asp:Button ID="Button7" class="C_input" Style="width: 110px;" runat="server"
                        Text="取消热卖" OnClick="Button7_Click" />
                    <asp:Button ID="Button8" class="C_input" Style="width: 110px;" runat="server" Text="取消精品"
                        OnClick="Button8_Click" />
                    <asp:Button ID="Button9" class="C_input" Style="width: 110px;" runat="server" Text="取消新品"
                        OnClick="Button9_Click" />
                    <asp:Button ID="Button10" class="C_input" Style="width: 110px;" runat="server" Text="批量移动"
                        OnClick="btnMove_Click" UseSubmitBehavior="true" />
                    <asp:Button ID="Button11" class="C_input" Style="width: 110px;" runat="server" Text="批量审核"
                        UseSubmitBehavior="true" OnClick="Button11_Click" />
                    <asp:Button ID="Button12" class="C_input" Style="width: 110px;" runat="server" Text="取消审核"
                        UseSubmitBehavior="true" OnClick="Button12_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>商品属性中的各项含义：</strong><br />
                    <font color="blue">精</font>----推荐精品，<font color="red">热</font>----热门商品，<font color="green">新</font>----推荐新品，<font color="blue">图</font>----有商品缩略图，<font color="maroon">绑</font>----捆绑商品销售<br />
                </td>
            </tr>
        </table>
        <script>
            $().ready(function () {
                $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
                //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
                $("#chkAll").click(function () {//EGV 全选
                    selectAllByName(this, "Item");
                });
            })
        </script>
    </form>
</body>
</html>
