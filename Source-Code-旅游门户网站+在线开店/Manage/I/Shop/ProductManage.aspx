<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.ProductManage, App_Web_2afsdgkd" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>商品列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
   <div id="m_nodes" class="visible-xs visible-sm"></div>
    <script type="text/javascript">
        function SizeCheck() {
            if ((GetCurSize() == "sm" || GetCurSize() == "xs") && $("#m_nodes").html() == "") {
                $("#m_nodes").load("../ASCX/MobileNode.aspx?NodeType=Shop");
            }
        }
        $(window).resize(function () { SizeCheck(); });
        SizeCheck();
    </script>
      <div class="clearfix"></div>
        <div class=" btn-group" style="margin-bottom:10px;margin-top:10px;">
            <a class="btn btn-info" href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&quicksouch=1">商品列表</a>
            <a class="btn btn-info" href="ProductManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&flag=Elite">推荐商品</a>
            <a class="btn btn-info" href="ProductManage.aspx?quicksouch=14">捆绑销售商品</a>
            <a class="btn btn-info" href="ProductManage.aspx?quicksouch=15">所有礼品</a>
            <a class="btn btn-info" href="ProductManage.aspx?quicksouch=16">已审核商品</a>
            <a class="btn btn-info" href="ProductManage.aspx?quicksouch=17">待审核商品</a>
            <a class="btn btn-info" href="ProGroupManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&groupby=1">团购管理</a>
            <a class="btn btn-info" href="PromotionBalance.aspx">推广管理</a>
        </div>
        <div class="clearfix"></div>
    <div style="background: #ddd; padding: 4px 4px 4px 4px; margin-bottom: 6px; border-radius: 15px; line-height: 35px; padding-left: 15px;">
        商品操作：<asp:Literal runat="server" ID="lblAddContent" ></asp:Literal>
        <span class="pull-right visible-xs visible-sm" id="m_span"><input type="button" class="btn btn-success m_modal" data-toggle="modal" data-target="#M_NodeModel" value="节点选择" /></span>
        <span class="pull-right visible-xs visible-sm">
            <input type="button" class="btn btn-success m_modal" data-toggle="modal" data-target="#M_NodeModel" value="节点选择" /></span>
        <div class="pull-right hidden-xs" style="padding-right: 10px;">
            <span><a href="/Class_<%:string.IsNullOrEmpty(Request["NodeID"])?"2":Request["NodeID"] %>/Default.aspx" target="_blank" title="前台浏览"><span class="glyphicon glyphicon-eye-open"></span></a>
                <span onclick="opentitle('<%:Request.QueryString["NodeID"] %>','配置本节点');" class="glyphicon glyphicon-cog" title="配置本节点" style="cursor: pointer; margin-left: 5px;"></span></span></div>
    </div>
        <table class="table table-striped table-bordered table-hover">
            <tbody id="Tabs">
                <tr><td class="hidden-xs hidden-sm"><div>
                <div style="float: left">
                    <asp:DropDownList ID="souchtable" CssClass="form-control" Width="120" runat="server">
                        <asp:ListItem Value="0">请选择</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">商品名称</asp:ListItem>
                        <asp:ListItem Value="2">商品简介</asp:ListItem>
                        <asp:ListItem Value="3">商品介绍</asp:ListItem>
                        <asp:ListItem Value="4">厂商</asp:ListItem>
                        <asp:ListItem Value="5">品牌/商标</asp:ListItem>
                        <asp:ListItem Value="6">条形码</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div style="float: left; margin-left: 5px; margin-right: 10px;">
                    <div class="input-group" style="width:180px;">
                        <asp:TextBox ID="souchkey" runat="server" CssClass="form-control" />
                        <span class="input-group-btn">
                            <asp:Button ID="souchok" runat="server" Text="搜索" class="btn btn-primary" OnClick="souchok_Click" />
                        </span>
                    </div>
                </div>
                <asp:DropDownList ID="SelProvince" runat="server" AutoPostBack="true" CssClass="form-control" Width="120" OnSelectedIndexChanged="SelProvince_SelectedIndexChanged"></asp:DropDownList>
                <asp:DropDownList ID="SelCity" runat="server" AutoPostBack="true" CssClass="form-control" Width="120" OnSelectedIndexChanged="SelCity_SelectedIndexChanged"></asp:DropDownList>
            </div></td>
                    <td class="hidden-xs hidden-sm">
                        <div style="float: left; padding-top: 5px;">
                            <b>请选择排列顺序：</b>
                            <asp:DropDownList ID="txtbyfilde" CssClass="form-control" Width="150" runat="server" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged"></asp:DropDownList>
                            <asp:DropDownList ID="txtbyOrder" CssClass="form-control" Width="150" runat="server" OnSelectedIndexChanged="txtbyOrder_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div style="padding-left: 20px; padding-top: 5px;">
                            <span style="margin-left:15px;">快速查找：</span>
                            <asp:DropDownList ID="quicksouch" style="width:120px;" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="quicksouch_SelectedIndexChanged">
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
                                <asp:ListItem Value="14">所有捆绑销售商品</asp:ListItem>
                                <asp:ListItem Value="15">所有礼品</asp:ListItem>
                                <asp:ListItem Value="16">已审核商品</asp:ListItem>
                                <asp:ListItem Value="17">待审核商品</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    <style type="text/css">
        .divline{padding: 5px; border: 1px solid rgb(221, 221, 221); border-radius: 4px; margin-bottom: 10px;display:none;}
    </style>
    <script type="text/javascript">
        function ShowImport() {
            $("#divImp").show("middle");
        }
    </script>
       <div id="divImp" class="divline">
            导入商城：<asp:FileUpload ID="FileUpload1" runat="server" style="display:inline;"/>
            <asp:Button ID="btImport" runat="server" Text="导 入" OnClick="btImport_Click" class="btn btn-default" />
            <asp:LinkButton ID="lbtnSaveTempter" runat="server" OnClick="lbtnSaveTempter_Click" CausesValidation="true">
            <span style="color:#0E529D;">下载<asp:Label runat="server" ID="NodeName_L1"></asp:Label> 的<asp:Label runat="server" ID="Item_L1"></asp:Label> 模型CSV导入模板</span>
            </asp:LinkButton>(下载后用EXCEL打开从第二行开始按规范填写并保存即可)
        </div>
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="id" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据！！">
            <Columns>
                <asp:TemplateField HeaderStyle-Width="3%">
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value='<%#Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" HeaderStyle-Width="3%" DataField="ID" />
                <asp:TemplateField HeaderText="商品图片">
                    <HeaderStyle Width="15%" />
                    <ItemTemplate>
                        <a href="ShowProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>"><%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品名称">
                    <HeaderStyle Width="17%" />
                    <ItemTemplate>
                        <a href="ShowProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>" ondblclick="javascript:localhost.href('ShowProduct.aspx?menu=edit&ModelID={0}&NodeID={1}&id={2}'),<%#Eval("ModelID") %>,<%#Eval("Nodeid") %>,<%#Eval("id")%>"><%#(Eval("Priority", "{0}") == "1") && (Convert.ToInt32(Eval("Propeid","{0}")) > 0) ? "<font color=maroon>[绑]</font>  " : ""%><%#Eval("proname")%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="录入者" DataField="AddUser" HeaderStyle-Width="5%" />
                <asp:BoundField HeaderText="单位" DataField="ProUnit" HeaderStyle-Width="5%" />
                <asp:TemplateField HeaderText="库存">
                    <HeaderStyle Width="5%" />
                    <ItemTemplate>
                        <%#Stockshow(DataBinder.Eval(Container,"DataItem.id","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="价格">
                    <HeaderStyle Width="6%" />
                    <ItemTemplate>
                        <%#formatcs(DataBinder.Eval(Container, "DataItem.LinPrice", "{0}"), Eval("ProClass", "{0}"), Eval("PointVal","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型">
                    <HeaderStyle Width="6%" />
                    <ItemTemplate>
                        <%#formatnewstype(DataBinder.Eval(Container,"DataItem.ProClass","{0}"),Eval("id","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="推荐" DataField="Dengji" HeaderStyle-Width="5%" />
                <asp:TemplateField HeaderText="商品属性">
                    <HeaderStyle Width="6%" />
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
                <asp:TemplateField HeaderText="排序">
                    <HeaderStyle Width="7%" />
                    <ItemTemplate>
                        <asp:LinkButton ID="UpMove" CommandName="UpMove" CommandArgument='<%# Eval("ID") %>' runat="server" >上移</asp:LinkButton>
                        <asp:LinkButton ID="DownMove" CommandName="DownMove" CommandArgument='<%# Eval("ID") %>' runat="server" >下移</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <HeaderStyle Width="12%" />
                    <ItemTemplate>
                        <asp:LinkButton ID="Standard" runat="server" CommandName="Standard" CommandArgument='<%# Eval("id") %>' ><%# Eval("isStand").ToString()=="0"?"标准商品":"取消标准" %></asp:LinkButton>
                        <a href="/Shop/<%#Eval("ID") %>.aspx" target="_blank" title="预览">预览</a>
                        <a href="AddProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">修改</a>
                        <asp:LinkButton ID="Del1" runat="server" CommandName="Del1" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" >删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="height: 21px">&nbsp;<asp:Button ID="Button1" runat="server" Text="开始销售" OnClick="Button1_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="Button2" runat="server" Text="设为热卖" OnClick="Button2_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="Button6" runat="server" Text="设为精品" OnClick="Button6_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="Button5" runat="server" Text="设为新品" OnClick="Button5_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="Button3" runat="server" Text="批量删除" CssClass="btn btn-primary" OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？'); " />
                    <asp:Button ID="Button4" runat="server" Text="停止销售" OnClick="Button4_Click" CssClass="btn btn-primary" />
                    <div style="height: 10px;"></div>
                    &nbsp;<asp:Button ID="Button7" runat="server" Text="取消热卖" OnClick="Button7_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="Button8" runat="server" Text="取消精品" OnClick="Button8_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="Button9" runat="server" Text="取消新品" OnClick="Button9_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="Button10" runat="server" Text="批量移动" OnClick="btnMove_Click" UseSubmitBehavior="true" CssClass="btn btn-primary" />
                    <asp:Button ID="Button11" runat="server" Text="批量审核" UseSubmitBehavior="true" OnClick="Button11_Click" class="btn btn-primary" />
                    <asp:Button ID="Button12" runat="server" Text="取消审核" UseSubmitBehavior="true" OnClick="Button12_Click" class="btn btn-primary" />
                    <%--<asp:Button ID="MtrlsMrktng" runat="server" class="C_input" Text="商品推广" onclick="MtrlsMrktng_Click"/>--%>
                </td>
            </tr>
            <tr>
                <td>
                <strong>商品属性中的各项含义：</strong>
                <span style="color: blue;">精</span>----推荐精品， 
                <span style="color: red;">热</span>----热门商品， 
                <span style="color: green;">新</span>----推荐新品， 
                <span style="color: blue;">图</span>----有商品缩略图， 
                <span style="color: maroon;">绑</span>----捆绑商品销售
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        $().ready(function () {
            
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=idchk]:checked");
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
        var diag = new ZL_Dialog();
        function opentitle(nid, title) {
            if (!nid||nid == 0) alert("尚未选择节点");
            else {
                var url = "../Content/EditNode.aspx?NodeID=" + nid;
                diag.width = 800;
                diag.height = 500;
                diag.url = url;
                diag.title = title;
                diag.ShowModal();
            }
        }
        HideColumn("1,4,5,6,7,8,9,10,11,12");
    </script>
    <style>
        #viewtask {float: left;margin-top: 5px;display: block;width: 16px;height: 16px; margin-right: 5px;}
        .divline li {float: left;margin-left: 8px;}
        .dropdown-menu{min-width:90px;}
    </style>
</asp:Content>
