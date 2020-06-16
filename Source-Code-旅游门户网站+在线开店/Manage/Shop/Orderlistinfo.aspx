<%@ page debug="true" language="C#" autoeventwireup="true" inherits="manage_Shop_Orderlistinfo, App_Web_x2y3ex2w" validaterequest="false" enableviewstatemac="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>订单信息</title>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
<script type="text/javascript" src="../../js/Dialog.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">   
function preview()
{location.href="Orderlistinfo.aspx?id="+<%=Request.QueryString["id"] %>+"&menu=print";           
}
function pageload()
{
<%if(Request.QueryString["menu"]=="print"){%>
bdhtml=window.document.body.innerHTML;
sprnstr="<!--startprint-->";
eprnstr="<!--endprint-->";
prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
window.document.body.innerHTML=prnhtml;
window.print();
<%}%>
}
function show(){
var fahuo = document.getElementById("fahuo").style;
var isAlipay=document.getElementById("isAlipay").style;
var noAlipay=document.getElementById("noAlipay").style;
if('<%=PayClass%>'==1)
{
    isAlipay.display="";
    noAlipay.display="none";
}
else
{
    isAlipay.display="none";
    noAlipay.display=""; 
}
if(fahuo.display==""){
    fahuo.display ="none";
}else{
    fahuo.display="";
}
}
function opentitle(url, title) {
var diag = new Dialog();
diag.Width = 600;
diag.Height = 400;
diag.Title = title;
diag.URL = url;
diag.show();
}
$().ready(function () {
    $("#proTable tr").mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") }).mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") });
});
</script>
</head>
<body onload=" pageload(); ">
    <form id="form1" runat="server">
    <div id="nav_box">
    <div class="r_navigation">后台管理&nbsp;&gt;&gt;&nbsp;商城管理&nbsp;&gt;&gt;&nbsp;<a href="CartManage.aspx">订单管理</a>&nbsp;&gt;&gt;&nbsp;订单详情
        <div style="position:relative;top:3px;display:inline;">
        <asp:ImageButton runat="server" ID="btnPre2" ImageUrl="/images/up.gif" OnClick="btnPre_Click" ToolTip="上一张"/>
        <asp:ImageButton runat="server" ID="btnNext2" ImageUrl="/images/down.gif" OnClick="btnNext_Click" ToolTip="下一张"/></div>
    </div>
    </div><div class="h_27"></div>
    <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <tbody id="Tbody1">
            <tr class="tdbg">
                <td colspan="4" align="center" class="title">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;
                </td>
            </tr>
            <tr class="tdbg" >
                <td align="left" style="width: 13%; height: 23px">
                    客户名称：<asp:Label ID="Reuser" runat="server" Text=""></asp:Label>
                </td>
                <td align="left" style="width: 14%; height: 23px">
                    用 户 名：<span id="Rename" runat="server"></span>
                </td>
                <td align="left" style="width: 13%; height: 23px">
                    购买日期：<asp:Label ID="adddate" runat="server"></asp:Label>
                </td>
                <td align="left" style="width: 20%; height: 23px">
                    下单日期：<asp:Label ID="addtime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr class="tdbg" >
                <td align="left" style="width: 13%; height: 12px">
                    需开发票：<asp:Label ID="Invoiceneeds" runat="server"></asp:Label>
                </td>
                <td align="left" style="width: 14%; height: 12px">
                    已开发票：<asp:Label ID="Developedvotes" runat="server"></asp:Label>
                </td>
                <td align="left" style="width: 13%; height: 12px">
                    付款状态：<asp:Label ID="Paymentstatus" runat="server"></asp:Label>
                </td>
                <td align="left" style="width: 20%; height: 12px">
                    物流状态：<asp:Label ID="StateLogistics" runat="server"></asp:Label>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <tbody id="Tbody3">
            <tr class="tdbg">
                <td align="center" style="width: 50%;">
                    <table width="100%" border="0" cellspacing="1" cellpadding="0">
                        <tr >
                            <td width="28%" align="right" class="tdbgleft">
                                收货人姓名：
                            </td>
                            <td width="72%" align="left" class="tdbg">
                                &nbsp;<asp:Label ID="Reusers" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                收货人地址：
                            </td>
                            <td align="left"  class="tdbg">
                                &nbsp;<asp:Label ID="Jiedao" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                收货人邮箱：
                            </td>
                            <td align="left">
                                &nbsp;<asp:Label ID="Email" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft" style="height: 24px">
                                付款方式：
                            </td>
                            <td align="left" style="height: 24px"  class="tdbg">
                                &nbsp;<asp:Label ID="Payment" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                发票信息：
                            </td>
                            <td align="left"  class="tdbg">
                                &nbsp;<asp:Label ID="Invoice" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                缺货处理：
                            </td>
                            <td align="left"  class="tdbg">
                                &nbsp;<asp:Label ID="Outstock" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                订单类型：
                            </td>
                            <td align="left"  class="tdbg">
                                &nbsp;<asp:Label ID="Ordertype" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <% if (PayClass == 1)
                           {%>
                        <tr >
                            <td align="right" class="tdbgleft" style="height: 24px">
                                淘宝交易号：
                            </td>
                            <td align="left" style="height: 24px"> 
                                &nbsp;<asp:Label ID="lbAlipayNO" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <%} %>
                    </table>
                </td>
                <td width="50%" align="center" valign="top">
                    <table width="100%" border="0" cellspacing="1" cellpadding="0">
                        <tr >
                            <td width="28%" align="right" class="tdbgleft">
                                联系电话：
                            </td>
                            <td width="72%" align="left">
                                &nbsp;<asp:Label ID="Phone" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft" style="height: 24px">
                                邮政编码：
                            </td>
                            <td align="left" style="height: 24px">
                                &nbsp;<asp:Label ID="ZipCode" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                收货人手机：
                            </td>
                            <td align="left">
                                &nbsp;<asp:Label ID="Mobile" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                送货方式：
                            </td>
                            <td align="left">
                                &nbsp;<asp:Label ID="Delivery" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                跟单员：
                            </td>
                            <td align="left">
                                &nbsp;<asp:Label ID="AddUser" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft">
                                订单状态：&nbsp;
                            </td>
                            <td align="left">
                                &nbsp;<asp:Label ID="OrderStatus" runat="server"></asp:Label>
                                <asp:Button ID="Button10" runat="server" CssClass="C_input" OnClick="Button10_Click" Text="服务记录" />
                            </td>
                        </tr>
                        <tr >
                            <td align="right" class="tdbgleft" style="height: 24px">
                                要求送货时间：
                            </td>
                            <td align="left" style="height: 24px">
                                &nbsp;<asp:Label ID="Deliverytime" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
        <table style="width:100%;" class="border">
            <tr>
                <td align="right" class="tdbgleft" style="width:130px;">内部记录（<a href="javascript:;" onclick="ShowMore('more_div');" title="编辑内部记录" style="color:#1963aa;">编辑</a>）：</td>
                <td align="left" class="tdbg">
                    <asp:Label ID="Internalrecords" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="tdbgleft">备注留言（<a href="javascript:;" onclick="ShowMore('more_div2');" title="编辑备注留言" style="color:#1963aa;">编辑</a>）：</td>
                <td align="left" class="tdbg">
                    <asp:Label ID="Ordermessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    <br />
    <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <asp:Literal ID="ModelHtml" runat="server"></asp:Literal></table>
    <table id="proTable" width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <tbody id="Tbody2">
            <tr>
                <td align="center" class="title" style="width: 10%;">
                    图片
                </td>
                <td align="center" class="title" style="width: 10%;">
                    商品编号
                </td>
                <td align="center" class="title" style="width: 18%;">
                    商品名称
                </td>
                <td align="center" class="title" style="width: 14%;">
                    商品属性
                </td>
                <td align="center" class="title" style="width: 6%;">
                    市场价
                </td>
                <td align="center" class="title" style="width: 10%;">
                    实价(本店价)
                </td>
                <td align="center" class="title" style="width: 3%;">
                    数量
                </td>
                <td width="3%" align="center" class="title">
                    单位
                </td>
                <td width="6%" align="center" class="title">
                    金额
                </td>
                <td width="8%" align="center" class="title">
                    服务期限
                </td>
                <td width="12%" align="center" class="title">
                    备注
                </td>
            </tr>
            <asp:Repeater ID="procart" runat="server" OnItemDataBound="cartinfo_ItemDataBound">
                <ItemTemplate>
                    <tr class="tdbg" 
                        <%#(Eval("Bindpro","{0}")=="")?"":"style=background-color:#E6E6E6"%>>
                        <td style="height:24px;" align="center">
                            <%#getproimg(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td style="width: 6%;" align="center">
                            <%#Eval("ProCode")%>
                        </td>
                        <td align="center">
                            <a href='ShowProduct.aspx?menu=edit&ModelID=<%#(Eval("ModelID"))%>&NodeID=<%#(Eval("NodeID"))%>&id=<%#(Eval("ID"))%>' target='_blank'>
                                <%#Eval("proname")%></a>
                        </td>
                        <td align="center">
                            <%#Eval("Attribute")%>
                        </td>
                        <!--商品属性 -->
                        <td align="center">
                            <%#getjiage(Eval("proclass","{0}"),"1", DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td align="center">
                            <%#shijia(Eval("proclass", "{0}"), Eval("ProID", "{0}"), DataBinder.Eval(Container, "DataItem.Shijia", "{0}"))%>
                        </td>
                        <td align="center">
                            <%#Eval("pronum") %>
                        </td>
                        <td align="center">
                            <%#Eval("Danwei") %>
                        </td>
                        <td align="center">
                            <%#getprojia(Eval("ProID", "{0}"), DataBinder.Eval(Container, "DataItem.ID", "{0}"))%>
                        </td>
                        <td align="center">
                            <%#qixian(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                        <td align="center">
                            <%#beizhu(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
                        </td>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr class="tdbg" 
                                style="background-color: #F6F6F6;">
                                <td align="center">
                                    <%#getproimg(Eval("id","{0}"))%>+++
                                </td>
                                <td align="center">
                                    <%#Getprotype(DataBinder.Eval(Container, "DataItem.id", "{0}"))%><%#Eval("proname")%>
                                </td>
                                <td width="6%" align="center">
                                    <%#getProUnit(DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td width="6%" align="center">
                                    1
                                </td>
                                <td width="6%" align="center">
                                    <%#getjiage(Eval("proclass", "{0}"), "1", DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td width="6%" align="center">
                                    <%#getjiage(Eval("proclass", "{0}"), "2", DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                                </td>
                                <td width="6%" align="center">
                                    -
                                </td>
                                <td width="6%" align="center">
                                    -
                                </td>
                                <td width="8%" align="center">
                                    -
                                </td>
                                <%--  <td align="center">
                            -
                        </td>--%>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg" >
                <td colspan="8">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </td>
                <td align="left" colspan="3">
                    合计： &nbsp;<asp:TextBox ID="Label2" runat="server" CssClass="l_input" Width="116px" Height="17px"></asp:TextBox>&nbsp;
                    <asp:Button ID="Button8" runat="server" Text="修改" CssClass="C_input" OnClick="Button8_Click" />
                    &nbsp;
                </td>
            </tr>
            <tr class="tdbg" >
                <td colspan="11" style="height: 24px">
                    &nbsp;运费：<asp:Label ID="Label32" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg" >
                <td colspan="11" style="height: 24px">
                    &nbsp;发票税率：<asp:Label ID="lblInv" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg" >
                <td colspan="11">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="50%" align="left" style="height: 19px">
                                &nbsp;实际金额：
                                <asp:Label ID="Label29" runat="server" Text=""></asp:Label>
                                +
                                <asp:Label ID="Label30" runat="server" Text=""></asp:Label>＝<asp:Label ID="Label31" runat="server" Text=""></asp:Label>
                                
                               &nbsp; &nbsp;  <span>赠送积分数</span>：<asp:Label ID="LabScore" runat="server"></asp:Label>分 <font color="blue"><asp:Label ID="ISsend" runat="server"></asp:Label></font>
                            </td>
                            <td width="50%" align="right" style="height: 19px">
                                &nbsp;已付款：<asp:Label ID="Label28" runat="server" Text=""></asp:Label>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="tdbg" >
                <td colspan="11">
                    <span style="color: red;"><asp:Label ID="Label33" runat="server" Text=""></asp:Label></span>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <tr class="tdbg" >
            <td colspan="5" align="center" class="title">
                其他费用
            </td>
        </tr>
        <tr >
            <td>
                合计：<asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            </td>
            <td>
                其他费用：<asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </td>
            <td>
                代购服务费：<asp:Label ID="Label5" runat="server" Text=""></asp:Label>
            </td>
            <td>
                付款状态：<asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                <asp:Button ID="Button1" CssClass="C_input" Style="width: 100px;" runat="server" Text="成功付款"
                    Enabled="false" OnClientClick="return confirm('确定要修改付款状态吗？');" OnClick="Button1_Click" />
                <asp:Button ID="buttonorder" CssClass="C_input" Style="width: 100px;" runat="server"
                    Text="打印签收单" OnClientClick="order(); return false;" />
                <script type="text/javascript">
            function order()
{
    location.href="Chickorder.aspx?id="+<%=Request.QueryString["id"] %>+"&menu=print";
}
                </script>
            </td>
        </tr>
    </table>
    <br />
    <!--endprint-->
    <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;" id="TABLE1">
        <asp:Repeater ID="procart2" runat="server"><ItemTemplate></ItemTemplate></asp:Repeater>
        <tr class="tdbg">
            <td width="20%">
                <asp:Button ID="Button4" CssClass="C_input" Style="width: 100px;" runat="server" Text="确认订单" Width="100px" OnClick="Button4_Click" />
            </td>
            <td width="20%">
                <asp:Button ID="Button2" CssClass="C_input" Style="width: 100px;" runat="server" Text="已经支付" Width="100px" OnClick="Button2_Click" />
            </td>
            <td width="20%">
                <asp:Button ID="Button13" CssClass="C_input" Style="width: 100px;" runat="server" Text="暂停处理" Width="100px" OnClick="Button13_Click" />
            </td>
            <td width="20%">
                <asp:Button ID="Button9" CssClass="C_input" Style="width: 100px;" runat="server" Text="冻结订单" Width="100px" OnClick="Button9_Click" />
            </td>
            <td width="20%" rowspan="3" valign="top" ><asp:Button ID="BT_FreeSplit" 
                    runat="server" CssClass="C_input" Style="width: 100px;" Text="自由拆分" 
                    onclick="BT_FreeSplit_Click" /><br />
              <asp:Button ID="sendScore" class="C_input"  style="width:100px;" runat="server" Text="赠送积分" Width="100px" OnClick="sendScore_Click"  /><br />
              </td>
        </tr>
        <tr class="tdbg">
            <td>
                <asp:Button ID="Button5" CssClass="C_input" Style="width: 100px;" runat="server" Text="取消确认" Width="100px" OnClick="Button5_Click" />
            </td>
            <td>
                <asp:Button ID="Button7" CssClass="C_input" Style="width: 100px;" runat="server" Text="客户已签收"
                    Width="100px" OnClick="Button7_Click" />
            </td>
            <td>
                <asp:Button ID="Button14" CssClass="C_input" Style="width: 100px;" runat="server" Text="恢复正常" Width="100px" OnClick="Button14_Click" />
            </td>
            <td>
                <asp:Button ID="Button11" CssClass="C_input" Style="width: 100px;" runat="server" Text="开发票"
                    Width="100px" OnClick="Button11_Click" />
            </td>
        </tr>
        <tr class="tdbg">
            <td>
                <asp:Button ID="Button3" CssClass="C_input" Style="width: 100px;" runat="server" Width="100px" Text="发货" OnClientClick="show();return false;" />
            </td>
            <td>
                <asp:Button ID="Button6" CssClass="C_input" Style="width: 100px;" runat="server" Text="订单作废" Width="100px" OnClick="Button6_Click" />
            </td>
            <td>
                <input type="button" name="delorder" value="删除订单" onclick="showhide()" class="C_input" style="width: 100px;" />
                <%--<asp:Button ID="Button12" CssClass="C_input" Style="width: 100px;" runat="server" Text="删除订单" Width="100px" OnClick="Button12_Click" />--%>
            </td>
            <td>
                <asp:Button ID="Button15" CssClass="C_input" Style="width: 100px;" runat="server" Text="打印订单" Width="100px" OnClientClick="preview();return false;" />
            </td>
        </tr>

        <tbody id="fahuo" style="display: none">
            <tr class="tdbg">
                <td colspan="5">
                    <table id="isAlipay">
                        <tr>
                            <td align="right">
                                淘宝交易号：
                            </td>
                            <td>
                                <asp:TextBox ID="trade_no" runat="server" CssClass="l_input"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                发货类型：
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Value="EMS">EMS</asp:ListItem>
                                    <asp:ListItem Value="POST">平邮</asp:ListItem>
                                    <asp:ListItem Value="EXPRESS">快递</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                物流公司名称：
                            </td>
                            <td>
                                <asp:TextBox ID="logistics_name" runat="server" CssClass="l_input"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                物流发货单号：
                            </td>
                            <td>
                                <asp:TextBox ID="txtMS" runat="server" CssClass="l_input"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table id="noAlipay">
                        <tr>
                            <td>物流公司：<asp:DropDownList runat="server" ID="DR_Company"  AppendDataBoundItems="True"  onchange="showtxt(this)" >
                            <asp:ListItem Value="0">请选择快递公司</asp:ListItem>
                            <asp:ListItem Value="77">其他</asp:ListItem>
                            </asp:DropDownList>&nbsp;&nbsp; </td>
                            <td><input id="kdgs" class="l_input" style="display:none;" type="text" runat="server"  />
                            </td>
                            <td>
                                快递单号：<asp:TextBox ID="txtMSnoAlipay" runat="server" CssClass="l_input"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="快递单号最少为五位" ControlToValidate="txtMSnoAlipay" ValidationExpression="^.{5,}$"></asp:RegularExpressionValidator>

                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnfahuo" runat="server" OnClick="Button3_Click" Text="发货" CssClass="C_input"></asp:Button>
                </td>
            </tr>
        </tbody>
        <tr>
            <td colspan="5" style="text-align:center; padding-top:5px;">&nbsp;
               <asp:Button ID="btnPre" runat="server" Text="上一个订单" OnClick="btnPre_Click" CssClass="C_input"/> 
                <asp:Button ID="btnNext" runat="server" Text="下一个订单" OnClick="btnNext_Click" CssClass="C_input" />
            </td>
        </tr>
    </table>
    <div style="position:absolute;display:none; width:300px;background:#e8f5ff; margin:auto; top:20%; left:50%; margin-left:-150px;" id="hidediv">
        <div id="HavePay" runat="server">
            <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                <tbody runat="server" id="payed">
                    <tr><td class="tdbgleft" colspan="2" style="text-align:center;">确认删除</td></tr>
                    <tr class="tdbg" style="height:24px;">
                        <td colspan="2" style="text-align:center;color:red;">确认删除该订单？</td>
                    </tr>
                    <tr class="tdbg">
                        <td style="width:80px;" class="tdbgleft">支付方式：</td>
                        <td><asp:Label ID="PayType" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr class="tdbg">
                        <td class="tdbgleft">支付金额：</td>
                        <td><asp:Label ID="PayMoney" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr class="tdbg">
                        <td class="tdbgleft">退还金额：</td>
                        <td><asp:CheckBox ID="ReturnMoney" runat="server" /><span style="color:#F00; margin-left:5px;">*选中后退还金额</span></td>
                    </tr>
                </tbody>
                <tbody id="nopayed" runat="server" visible="false">
                    <tr><td class="tdbgleft" colspan="2" style="text-align:center;">确认删除</td></tr>
                    <tr class="tdbg" style="height:24px;">
                        <td colspan="2" style="text-align:center;">该订单尚未付款，确认删除该订单？</td>
                    </tr>
                </tbody>
                <tr class="tdbg" style="height:40px;">
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="SureDelBtn" CssClass="C_input" Style="width: 100px;" runat="server" Text="确认删除" OnClick="SureDelBtn_Click" />&nbsp;&nbsp;
                        <input type="button" name="back" value="取消" onclick='$("#hidediv").hide("fast");' class="C_input" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
   <%--     <img src="../../App_Themes/AdminDefaultTheme/images/Counter/stat3.jpg" />
        <a href="http://www.baidu.com">详情</a>
        这是你购买的主机--%>
    <style type="text/css">
        .more1 {width:760px;height:680px;position:absolute;display:none;top:100px;border-radius:3px;left:20%;}
        .more {width:400px;height:300px;position:absolute;display:none;top:100px;border-radius:3px;left:30%;}
        .moreTitle {text-align:center;background-color:#08C;font-family:'Microsoft YaHei';font-size:14px;color:white;height:30px;padding-top:5px;}
        .moreBottom {text-align:center;font-family:'Microsoft YaHei';margin-top:-3px;}
        .closeSpan {float:right;margin-right:10px;cursor:pointer; }
        td {height:24px;}
        table a:hover {text-decoration:underline;}
    </style>
        <div id="more_div" class="border more1">
            <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF(this);">关闭</span>内部记录</div>
            <div style="width:300px;height:300px;margin:auto;" class="border" runat="server" id="inter_Div"></div>
            <div class="moreContent">
            <asp:TextBox runat="server" ID="inter_Text"  TextMode="MultiLine"  Style="height: 300px;margin:2px 2px 2px 5px;width:98%;"></asp:TextBox>
            </div>
            <div class="moreBottom">
             <input type="button" onclick="RefreshDiv();" value="刷新预览" class="C_input" style="margin-right:10px;"/>
            <asp:Button runat="server" ID="inter_Save_Btn" Text="修改" OnClick="inter_Save_Btn_Click" class="C_input" /></div>
        </div>

        <div id="more_div2" class="border more">
            <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF(this);">关闭</span>备注信息</div>
            <asp:TextBox runat="server" ID="omg_Text"  TextMode="MultiLine"  Style="width: 99%; height: 100%;" class="l_input"></asp:TextBox>
            <div class="moreBottom">
            <asp:Button runat="server" ID="omg_Save_Btn" Text="修改" OnClick="omg_Save_Btn_Click" class="C_input" />
            </div>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function showtxt(obj) {
        if (obj.options[obj.selectedIndex].value == "77") {
            var txt = document.getElementById("kdgs");
            txt.style.display = "";
            
        } else {
            var txt = document.getElementById("kdgs");
            txt.style.display = "none"; 
        }
    }
    function showhide()
    {
        $("#hidediv").toggle("fast");
    }
    function ShowMore(id)
    {
        $("#more_div").hide();
        $("#more_div2").hide();
        $("#" + id).show();
    }
    function HideMoreF(obj)
    {
        $(obj).parent().parent().hide();
    }
    function RefreshDiv()
    {
        v = $("#inter_Text").val();
        $("#inter_Div").html(v);
    }
</script>