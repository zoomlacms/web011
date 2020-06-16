<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_ProductManage, App_Web_gitrjvab" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="btn-group" style="margin-bottom:10px;">
        <a class="btn btn-primary" href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=0">商品列表</a>
        <a class="btn btn-primary" href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=1">推荐商品</a>
        <a class="btn btn-primary" href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=2">团购商品</a>
        <a class="btn btn-primary" href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&type=3">竞拍商品</a>
    </div>
    <asp:Literal ID="lblAddContent" runat="server"></asp:Literal>
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="4" class="text-center">快速查找：
				<asp:DropDownList ID="quicksouch" CssClass="form-control" Width="150" runat="server" AutoPostBack="True" OnSelectedIndexChanged="quicksouch_SelectedIndexChanged">
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
                <td colspan="10" class="text-center">
                    <div class="pull-left">
                        高级查询：
				    <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
                        <asp:ListItem Value="0" Selected="True">请选择</asp:ListItem>
                        <asp:ListItem Value="1">商品名称</asp:ListItem>
                        <asp:ListItem Value="2">商品简介</asp:ListItem>
                        <asp:ListItem Value="3">商品介绍</asp:ListItem>
                        <asp:ListItem Value="4">厂商</asp:ListItem>
                        <asp:ListItem Value="5">品牌/商标</asp:ListItem>
                        <asp:ListItem Value="6">条形码</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <div class="input-group pull-left" style="width: 300px;">
                        <asp:TextBox ID="souchkey" runat="server" class=" form-control" />
                        <span class="input-group-btn">
                            <asp:Button ID="souchok" class="btn btn-primary" runat="server" Text="搜索" OnClick="souchok_Click" />
                        </span>
                    </div>
                </td>
            </tr>
        </table>
        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关信息！！">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="chkSel" title="" value='<%#Eval("ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:TemplateField HeaderText="商品图片">
                    <ItemTemplate>
                        <a href="/Store/Shopinfo.aspx?ItemID=<%# Eval("id") %>" target="_blank"><%#getproimg(Eval("Thumbnails","{0}"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品名称">
                    <ItemTemplate>
                        <a href="/Store/Shopinfo.aspx?ItemID=<%# Eval("id") %>" target="_blank"><%#Eval("ProName")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="店铺名称">
                    <ItemTemplate>
                        <a href="../UserShopManage/StoreEdit.aspx?id=<%# GetShopIDByInputer(GetUsername(Eval("UserID").ToString())) %>"><%#GetShopNameByInputer(GetUsername(Eval("UserID").ToString()))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发布人">
                    <ItemTemplate>
                        <a href="../User/UserInfo.aspx?id=<%# Eval("userid") %>"><%#GetUsername(Eval("UserID").ToString())%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="价格">
                    <ItemTemplate>
                        <%#formatcs(Eval("LinPrice","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="购买方式">
                    <ItemTemplate>
                        <%#formatnewstype(Eval("Colonel").ToString ())%>
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
                        <%#Eval("ColonelNowNum")%>\<%#Eval("ColonelNum")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品属性">
                    <ItemTemplate>
                        <%#forisbest(Eval("isbest","{0}"))%>
                        <%#forishot(Eval("ishot","{0}"))%>
                        <%#forisnew(Eval("isnew","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="销售中">
                    <ItemTemplate>
                        <%#formattype(Eval("Sales","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="ProductAdd.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">修改</a>
                        <asp:LinkButton ID="LinkButton1" CommandName="edit1" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" CommandArgument='<%#Eval("id")%>' runat="server">删除</asp:LinkButton>
                        <a href="ProductManage.aspx?menu=delete&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="14" class="text-center">
                    <asp:Button ID="Button14" CssClass="btn btn-primary" runat="server" Text="开始销售" OnClick="Button1_Click" />
                    <asp:Button ID="Button15" CssClass="btn btn-primary" runat="server" Text="设为热卖" OnClick="Button2_Click" />
                    <asp:Button ID="Button16" CssClass="btn btn-primary" runat="server" Text="设为精品" OnClick="Button6_Click" />
                    <asp:Button ID="Button17" CssClass="btn btn-primary" runat="server" Text="设为新品" OnClick="Button5_Click" />
                    <asp:Button ID="Button18" CssClass="btn btn-primary" runat="server" Text="批量删除" OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
                    <asp:Button ID="Button19" CssClass="btn btn-primary" runat="server" Text="停止销售" OnClick="Button4_Click" />
                    <asp:Button ID="Button20" CssClass="btn btn-primary" runat="server" Text="取消热卖" OnClick="Button7_Click" />
                    <asp:Button ID="Button21" CssClass="btn btn-primary" runat="server" Text="取消精品" OnClick="Button8_Click" />
                    <asp:Button ID="Button22" CssClass="btn btn-primary" runat="server" Text="取消新品" OnClick="Button9_Click" />
                    <asp:Button ID="Button23" CssClass="btn btn-primary" runat="server" Text="批量移动" OnClick="btnMove_Click" UseSubmitBehavior="true" />
                    <asp:Button ID="Button24" CssClass="btn btn-primary" runat="server" Text="批量审核" UseSubmitBehavior="true" OnClick="Button11_Click" />
                    <asp:Button ID="Button25" CssClass="btn btn-primary" runat="server" Text="取消审核" UseSubmitBehavior="true" OnClick="Button12_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="14" class="text-center">
                    <strong>商品属性中的各项含义：</strong><br />
                    <font color="blue">精</font>----推荐精品，<font color="red">热</font>----热门商品，<font color="green">新</font>----推荐新品，<font
                        color="blue">图</font>----有商品缩略图，<font color="maroon">绑</font>----捆绑商品销售
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        function DBClickOpenPage() //双击打开会员信息页面
        {
            window.open("../User/UserInfo.aspx?id=<%# Eval("userid") %>", '_self');
        }
    </script>
</asp:Content>
