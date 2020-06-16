<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_ProductManage, App_Web_5arvbvnz" masterpagefile="~/Manage/Site/OptionMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<title>商品列表</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/Popmenu.js"></script>
<script type="text/javascript" src="../../js/Drag.js"></script>
<script type="text/javascript" src="../../js/Dialog.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
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
    function openurls(url) {
        Dialog.open({ URL: url });
    }
    function open_title(ModelID, NodeID) {
        var diag = new Dialog();
        diag.Width = 800;
        diag.Height = 600;
        diag.Title = "添加" + "[ESC键退出当前操作]";
        diag.URL = "AddProduct.aspx?ModelID=" + ModelID + "&NodeID=" + NodeID;
        diag.show();
    }
    function opentitle(url, title) {
        var diag = new Dialog();
        diag.Width = 800;
        diag.Height = 600;
        diag.Title = title;
        diag.URL = url;
        diag.show();
    }
    function closdlg() {
        Dialog.close();
    }
    function getinfo(id, NodeID, ModelID) {
        location.href = "AddProduct.aspx?menu=edit&ModelID=" + ModelID + "&NodeID=" + NodeID + "&id=" + id + "";
    }
</script>
<style>
#viewtask{float:left;margin-top:5px;display:block; width:16px; height:16px; margin-right:5px;}
</style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 服务管理</p></div>
    <div id="site_main" style="margin-top:2px;">
        <div id="tab3">
    <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <tbody id="Tabs">
            <tr style="height:45px;">
                <td style="width:150px; padding-left: 10px;" colspan="2">
                   <div style=" float: left; ">
                       <b>请选择排列顺序：</b>
                       <asp:DropDownList ID="txtbyfilde" runat="server"></asp:DropDownList>
                       <asp:DropDownList ID="txtbyOrder" runat="server"></asp:DropDownList>
                   </div>
                   <div style=" padding-left:10px;float: left;  ">
                       快速查找：
                       <asp:DropDownList ID="quicksouch" runat="server" AutoPostBack="True">
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
                           <asp:ListItem Value="14">所有捆绑销售商品</asp:ListItem>
                           <asp:ListItem Value="15">所有礼品</asp:ListItem>
                           <asp:ListItem Value="16">已审核商品</asp:ListItem>
                           <asp:ListItem Value="17">待审核商品</asp:ListItem>
                       </asp:DropDownList>
                   </div>
                   <span><asp:Button runat="server" ID="addBtn" Text="添加" CssClass="site_button" OnClick="addBtn_Click"/></span>
               </td>
            </tr>
        </tbody>
    </table>
    <% if (Request.QueryString["isDivImp"] != null && Request.QueryString["isDivImp"] == "1")
       { %>
    <div id="divImp" class="divline" style="padding-left: 10px; display: block">
        导入商城地址：<asp:FileUpload ID="FileUpload1" runat="server" Height="20px" Width="287px" />
        <asp:Button ID="btImport" runat="server" Text="导 入" OnClick="btImport_Click" />
        <asp:LinkButton ID="lbtnSaveTempter" runat="server" OnClick="lbtnSaveTempter_Click" CausesValidation="true">
            <font style="color:#0E529D;">下载[<%=getNodeName()%>]的<%=this.bmode.GetModelById(ZoomLa.Common.DataConverter.CLng(int.Parse(this.Request.QueryString["ModelID"]))).ItemName %>模型CSV导入模板</font>
        </asp:LinkButton>
            (下载后用EXCEL打开从第二行开始按规范填写并保存即可)
    </div>
    <%} %>
    <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <tbody id="Tabss">
            <tr>
                <td width="3%" height="28" align="center"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                <td width="3%" align="center"><span>ID</span></td>
                <td width="12%" align="center"><span>商品图片</span></td>
                <td width="17%" align="center"><span>商品名称</span></td>
                <td width="5%" align="center"><span>录入者</span></td>
                <td width="5%" align="center"><span>服务期限</span></td>
                <td width="5%" align="center"><span>到期提醒</span></td>
                <td width="6%" align="center"><span>价格</span></td>
                <td width="6%" align="center"><span>类型</span></td>
                <td width="5%" align="center"><span>推荐</span></td>
                <td width="6%" align="center"><span>简述</span></td>
                <td width="7%" align="center"><span>排序</span></td>
                <td width="12%" align="center"><span>操作</span></td>
            </tr>
            <asp:Repeater ID="Productlist" runat="server">
                <ItemTemplate>
                    <tr class="tdbg" id='<%#Eval("id")%>' onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" ondblclick="getinfo(this.id,<%#Eval("Nodeid") %>,<%#Eval("ModelID") %>)">
                        <td style="height:24px;" align="center">
                            <input name="Item" type="checkbox" value='<%# Eval("id")%>' />
                        </td>
                        <td style="height:24px;" align="center">
                            <%# Eval("id")%>
                        </td>
                        <td style="height:24px;" align="center" title="单击查看详情">
                            <a href="ShowProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">
                                <%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></a>
                        </td>
                        <td height="17" align="left" title="单击查看详情" style="cursor: pointer">
                            <a href="AddProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>"> <%#Eval("proname")%></a></td>
                        <td style="height:24px;" align="center" ><%#Eval("addUser")%></td>
                        <td style="height:24px;" align="center"><%#GetServerPeriod(Eval("ServerPeriod"),Eval("ServerType"))%></td>
                        <td style="height:24px;" align="center"><%#GetExpRemind(Eval("ExpRemind"))%></td>
                        <td style="height:24px;" align="center"><%#formatcs(DataBinder.Eval(Container, "DataItem.LinPrice", "{0}"), Eval("ProClass", "{0}"), Eval("PointVal","{0}"))%></td>
                        <td style="height:24px;" align="center"><%#formatnewstype(DataBinder.Eval(Container,"DataItem.ProClass","{0}"),Eval("id","{0}"))%></td>
                        <td style="height:24px;" align="center"><%#Eval("Dengji")%></td>
                        <td style="height:24px;" align="center">
                            <%#forisbest(DataBinder.Eval(Container,"DataItem.isbest","{0}"))%>
                            <%#forishot(DataBinder.Eval(Container,"DataItem.ishot","{0}"))%>
                            <%#forisnew(DataBinder.Eval(Container,"DataItem.isnew","{0}"))%>
                        </td>
             <%--           <td style="height:24px;" align="center"><%#formattype(DataBinder.Eval(Container,"DataItem.Sales","{0}"))%></td>--%>
                        <td align="center">
                            <a href="ProductManage.aspx?menu=UpMove&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">上移</a>
                            <a href="ProductManage.aspx?menu=DownMove&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">下移</a>
                        </td>
                        <td style="height:24px;" align="center">
                            <a href="AddProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">修改</a>
                            <a href="ProductManage.aspx?menu=delete&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>" <%#Eval("recycler").ToString()=="False"?" onclick=\"return confirm('不可恢复性删除数据,你确定将该数据删除吗？');\"":"style=\"color:#999999\" onclick=\"return false\"" %>>删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td style="height:24px;" colspan="14" align="center">
                    <div style="text-align: center">
                        <span style="text-align: center">共
                            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                            <asp:Label ID="Toppage" runat="server" Text="" />
                            <asp:Label ID="Nextpage" runat="server" Text="" />
                            <asp:Label ID="Downpage" runat="server" Text="" />
                            <asp:Label ID="Endpage" runat="server" Text="" />页次：
                            <asp:Label ID="Nowpage" runat="server" Text="" />/
                            <asp:Label ID="PageSize" runat="server" Text="" />页
                            <asp:Label ID="pagess" runat="server" Text="" />
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px" Height="16px" OnTextChanged="txtPage_TextChanged" />条数据/页 转到第
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                        </span>
                    </div>
                </td>
            </tr>
        </tbody>
    </table><br />
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td style="height: 21px">
                &nbsp;<asp:Button ID="Button1" runat="server" Text="开始销售" OnClick="Button1_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button2" runat="server" Text="设为热卖" OnClick="Button2_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button6" runat="server" Text="设为精品" OnClick="Button6_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button5" runat="server" Text="设为新品" OnClick="Button5_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button3" runat="server" Style="width: 100px;" Text="批量删除" CssClass="C_input" OnClick="Button3_Click" 
                    OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？'); " />
               &nbsp;<asp:Button ID="Button4" runat="server" Text="停止销售" OnClick="Button4_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button7" runat="server" Text="取消热卖" OnClick="Button7_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button8" runat="server" Text="取消精品" OnClick="Button8_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button9" runat="server" Text="取消新品" OnClick="Button9_Click" CssClass="C_input" Style="width: 100px;" />
                <asp:Button ID="Button10" runat="server" Text="批量移动" OnClick="btnMove_Click" Style="width: 100px;" UseSubmitBehavior="true" CssClass="C_input" />
                <asp:Button ID="Button11" runat="server" Text="批量审核" UseSubmitBehavior="true" OnClick="Button11_Click" class="C_input" Style="width: 100px;" />
                <asp:Button ID="Button12" runat="server" Text="取消审核" UseSubmitBehavior="true" OnClick="Button12_Click" class="C_input" Style="width: 100px;" />
            </td>
        </tr>
        <tr><td>
                <strong>商品属性中的各项含义：</strong><br />
                <span style="color:blue;">精</span>----推荐精品， 
                <span style="color:red;">热</span>----热门商品， 
                <span style="color:green;">新</span>----推荐新品， 
                <span style="color:blue;">图</span>----有商品缩略图， 
                <span style="color:maroon;">绑</span>----捆绑商品销售
            </td></tr>
    </table>
    <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
    </div>
</asp:Content>
