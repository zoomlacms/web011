<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_ProductList, App_Web_ldgzaw0x" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>商品列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">账户管理</a></li>
        <li class="active">销量统计</li>
    </ol>
    <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <asp:Label ID="lblAddContent" runat="server" Text=""></asp:Label>
    <div class="us_topinfo" style="margin-top: 10px;">
        <table class="table table-bordered">
            <tbody id="Tabs">
                <tr class="tdbg">
                    <td width="34%" align="center">快速查找：
                        <asp:DropDownList ID="quicksouch" CssClass="form-control" runat="server" AutoPostBack="True">
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
                            <asp:ListItem Value="14">团购商品</asp:ListItem>
                            <asp:ListItem Value="15">竞拍商品</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width="66%" align="center">高级查询：
                        <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
                            <asp:ListItem Value="0" Selected="True">请选择</asp:ListItem>
                            <asp:ListItem Value="1">商品名称</asp:ListItem>
                            <asp:ListItem Value="2">商品简介</asp:ListItem>
                            <asp:ListItem Value="3">商品介绍</asp:ListItem>
                            <asp:ListItem Value="4">厂商</asp:ListItem>
                            <asp:ListItem Value="5">品牌/商标</asp:ListItem>
                            <asp:ListItem Value="6">条形码</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="souchkey" CssClass="form-control" runat="server" />
                        <asp:Button ID="souchok" CssClass="btn btn-primary" runat="server" Text=" 搜索 " OnClick="souchok_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#Tabs4" onclick="ShowTabs(0)" data-toggle="tab">正常销售</a></li>
                <li><a href="#Tabs14" onclick="ShowTabs(1)" data-toggle="tab">团购</a></li>
                <li><a href="#Tabs15" onclick="ShowTabs(2)" data-toggle="tab">竞拍</a></li>
            </ul>
            <table class="table table-striped table-bordered table-hover">
                <tbody id="Tabss">
                    <tr>
                        <td align="center">
                            <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
                        </td>
                        <td align="center"><span>ID</span></td>
                        <td align="center"><span>商品图片</span></td>
                        <td align="center"><span>商品名称</span></td>
                        <td align="center"><span>单位</span></td>
                        <td align="center"><span>库存</span></td>
                        <td align="center"><span>价格</span></td>
                        <td align="center"><span>购买方式</span></td>
                        <td align="center"><span>推荐级别</span></td>
                        <td align="center"><span>结束时间</span></td>
                        <td align="center"><span>人数</span></td>
                        <td align="center"><span>销售中</span></td>
                        <td align="center"><span>操作</span></td>
                    </tr>
                    <asp:Repeater ID="Productlist" runat="server" OnItemCommand="Productlist_ItemCommand"
                        OnItemDataBound="Productlist_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td align="center">
                                    <input name="Item" type="checkbox" value='<%# Eval("id")%>' />
                                </td>
                                <td align="center"><%# Eval("id")%></td>
                                <td align="center"><%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></td>
                                <td align="center"><a href="/Store/StoreContent.aspx?Itemid=<%# Eval("ID") %>&id=<%#GetGeneralID() %>" target="_blank"><%#Eval("proname")%></a></td>
                                <td align="center"><%#Eval("ProUnit")%></td>
                                <td align="center"><%#Stockshow(DataBinder.Eval(Container,"DataItem.id","{0}"))%></td>
                                <td align="center"><%#formatcs(DataBinder.Eval(Container,"DataItem.LinPrice","{0}"))%></td>
                                <td align="center"><%#formatnewstype(DataBinder.Eval(Container,"DataItem.Colonel").ToString ())%></td>
                                <td align="center"><%#Eval("Dengji")%></td>
                                <td align="center"><%#Getttypetime(Eval("id", "{0}"))%></td>
                                <td align="center"><%#DataBinder.Eval(Container,"DataItem.ColonelNowNum")%>/<%#DataBinder.Eval(Container,"DataItem.ColonelNum")%></td>
                                <td align="center"><%#formattype(DataBinder.Eval(Container,"DataItem.Sales","{0}"))%></td>
                                <td align="center">
                                    <asp:HiddenField ID="hfuserid" runat="server" Value='<%#Eval("UserID") %>' />
                                    <asp:HiddenField ID="hfPrid" runat="server" Value='<%#Eval("ID") %>' />
                                    <asp:LinkButton ID="up" runat="server" CommandName="upd" CommandArgument='<%#Eval("ID") %>'>修改</asp:LinkButton>
                                    <asp:LinkButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>'>删除</asp:LinkButton>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr class="tdbg">
                        <td colspan="13" align="center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            个商品 
                        <asp:Label ID="Toppage" runat="server" Text="" />
                            <asp:Label ID="Nextpage" runat="server" Text="" />
                            <asp:Label ID="Downpage" runat="server" Text="" />
                            <asp:Label ID="Endpage" runat="server" Text="" />
                            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
                        <asp:Label ID="pagess" runat="server" Text="" />个商品/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        </asp:DropDownList>页</td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td class="text-center">
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="开始销售" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="设为热卖" OnClick="Button2_Click" />
                        <asp:Button ID="Button6" CssClass="btn btn-primary" runat="server" Text="设为精品" OnClick="Button6_Click" />
                        <asp:Button ID="Button5" CssClass="btn btn-primary" runat="server" Text="设为新品" OnClick="Button5_Click" />
                        <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" Text="批量删除" OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
                        <asp:Button ID="Button4" CssClass="btn btn-primary" runat="server" Text="停止销售" OnClick="Button4_Click" />
                        <asp:Button ID="Button7" CssClass="btn btn-primary" runat="server" Text="取消热卖" OnClick="Button7_Click" />
                        <asp:Button ID="Button8" CssClass="btn btn-primary" runat="server" Text="取消精品" OnClick="Button8_Click" />
                        <asp:Button ID="Button9" CssClass="btn btn-primary" runat="server" Text="取消新品" OnClick="Button9_Click" /></td>
                </tr>
                <tr>
                    <td><strong>商品属性中的各项含义：</strong><br />
                        <font color="blue">精</font>----推荐精品，<font color="red">热</font>----热门商品，<font color="green">新</font>----推荐新品，<font color="blue">图</font>----有商品缩略图
                    <br />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script language="javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        var arrTabs = new Array("1", "14", "15");
        function ShowTabs(ID) {
            var ddlgradelevel = document.getElementById("quicksouch");
            var cc = 0;
            for (var i = 0; i < ddlgradelevel.options.length; i++) {
                if (ddlgradelevel.options[i].value == arrTabs[ID]) {
                    ddlgradelevel.options[i].selected = true;
                    if (ID == 0) {
                        cc = 4;
                    }
                    else {
                        cc = ddlgradelevel.options[i].value;
                    }
                    location.href = 'ProductList.aspx?type=<%=Request.QueryString["type"] %>&id=' + ID + '&quicksouch=' + cc;
                }
            }
        }
        function pload() {
            var ID = '<%=Request.QueryString["id"]%>';
            if (ID != tID) {
                $(arrTabTitle[tID].toString()).addClass("tabtitle");
                $(arrTabTitle[ID].toString()).addClass("titlemouseover");
                tID = ID;
            }
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
        $().ready(function () {
            pload();
            if (getParam("quicksouch")) {
                $("li a[href='#Tabs" + getParam("quicksouch") + "']").parent().addClass("active").siblings("li").removeClass("active");;
            }
        })
    </script>
</asp:Content>
