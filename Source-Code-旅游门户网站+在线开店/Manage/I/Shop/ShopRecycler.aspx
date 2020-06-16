<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_ShopRecycler, App_Web_enu4lwhk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品回收站</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="id" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据！！">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle Width="3%" />
                <ItemTemplate>
                    <input name="Item" type="checkbox" value='<%# Eval("id")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" HeaderStyle-Width="3%" DataField="ID" />
            <asp:TemplateField HeaderText="商品图片">
                <HeaderStyle Width="12%" />
                <ItemTemplate>
                    <a href="AddProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>"> <%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品名称">
                <HeaderStyle Width="22%" />
                <ItemTemplate>
                    <a href="AddProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>"> <%#(Eval("Priority", "{0}") == "1") && (Convert.ToInt32(Eval("Propeid","{0}")) > 0) ? "<font color=maroon>[绑]</font>  " : ""%><%#Eval("proname")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="单位" >
                <HeaderStyle Width="7%" />
                <ItemTemplate>
                    <%#Eval("ProUnit")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="库存">
                <HeaderStyle Width="7%" />
                <ItemTemplate>
                    <%#Stockshow(DataBinder.Eval(Container,"DataItem.id","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="价格">
                <HeaderStyle Width="6%" />
                <ItemTemplate>
                    <%#formatcs(DataBinder.Eval(Container,"DataItem.LinPrice","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型">
                <HeaderStyle Width="6%" />
                <ItemTemplate>
                    <%#formatnewstype(DataBinder.Eval(Container,"DataItem.ProClass","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="推荐" HeaderStyle-Width="5%" DataField="Dengji" />
            <asp:TemplateField HeaderText="商品属性">
                <HeaderStyle Width="8%" />
                <ItemTemplate>
                    <%#forisbest(DataBinder.Eval(Container,"DataItem.isbest","{0}"))%>
                    <%#forishot(DataBinder.Eval(Container,"DataItem.ishot","{0}"))%>
                    <%#forisnew(DataBinder.Eval(Container,"DataItem.isnew","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="销售中">
                <HeaderStyle Width="6%" />
                <ItemTemplate>
                    <%#formattype(DataBinder.Eval(Container,"DataItem.Sales","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle Width="7%" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="ReStore" CommandArgument='<%# Eval("ID") %>' runat="server">还原</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" CommandName="Del1" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div class="btn-group">
        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="批量还原" OnClick="Button1_Click" />
        <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="批量删除" OnClick="Button2_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" />
        <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="全部还原" OnClick="Button3_Click" />
        <asp:Button ID="Button4" class="btn btn-primary" runat="server" Text="清空回收站" OnClick="Button4_Click" OnClientClick="return confirm('你确定要清空回收站吗')" />
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
                selectAllByName(this, "Item");
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=Item]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>