<%@ page language="C#" autoeventwireup="true" inherits="StoreCart, App_Web_ew4ckk0m" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>加入购物车</title>
    <link href="/App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
    <link href="/App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/JS/ajaxrequest.js"></script>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        var ajax = new AJAXRequest();
        function keydo(ids,iid) {
            var num = document.getElementById("num" + ids).value; 
            ajax.get(
            "/prompt/ShopCart/UpdateShopCar.aspx?cid=" + ids + "&num=" + num + "&menu=usercart",
            function (obj) {
                var pri = obj.responseText;
                var price = pri.split('|');
                if (price != null && price.length > 1) {
                    document.getElementById("price" + ids).innerText = price[1];
                    //document.getElementById("allMoney").innerText = price[0];
                    CalcSum();
                }
            }
            );
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main" class="rg_inout">
            <h1>第一步:加入购物车<span>[<asp:Label ID="Label1" runat="server" BorderWidth="0px" ForeColor="Red"></asp:Label>]</span><img src="/user/images/regl1.gif" width="242" height="14" /></h1>
            <asp:Repeater ID="product" runat="server" OnItemDataBound="product_ItemDataBound">
                <ItemTemplate>
                    <div>
                        店铺名称:<asp:Label runat="server" ID="L_Shop"></asp:Label><input type="radio" value='<%#GetUserShopIDByUserID(Eval("UserID","{0}")) %>' style="display:none;" name="ShopID" title="选择店铺" />
                        
                        <div>
                            <asp:Repeater ID="cartinfo" runat="server" EnableViewState="True">
                                <HeaderTemplate>
                                    <div class="cart_lei">
                                        <ul>
                                            <li class="i0">
                                                <input type="radio" name="storeRadio" title="选择店铺" style="position: relative; margin-bottom: -2px;" />
                                                图片</li>
                                            <li class="i1">商品名称</li>
                                            <li class="i8">商品属性</li>    
                                            <li class="i2">单位</li>
                                            <li class="i3">数量</li>
                                            <li class="i4">市场价</li>
                                            <li class="i5">实价</li>
                                            <li class="i6">金额</li>
                                            <li class="i7">操作</li>
                                        </ul>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="cart_con">
                                        <ul>
                                            <li class="i0">
                                                <input type="checkbox" name="idChk" value="<%#Eval("id") %>" style="position: relative;" />
                                                <a href='StoreContent.aspx?itemid=<%#Eval("ProID") %>&ID=<%# GetUserShopID(Eval("ProID","{0}")) %>' target="_blank" style="margin-left: 5px;"><%#getproimg(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%></a>
                                            </li>
                                            <li class="i1"><a href='StoreContent.aspx?itemid=<%#Eval("ProID") %>&ID=<%# GetUserShopID(Eval("ProID","{0}")) %>' target="_blank"><%#Eval("ProName")%></a></li>
                                            <li class="i8"><%#Eval("Attribute")%></li>
                                            <li class="i2"><%#getProUnit(DataBinder.Eval(Container, "DataItem.proid", "{0}"))%></li>
                                            <li class="i3">
                                                <input onkeydown="if(event.keyCode==13){ keydo('<%#Eval("id") %>');return false;}" id='num<%#Eval("id") %>' value='<%#DataBinder.Eval(Container, "DataItem.pronum", "{0}")%>'
                                                    style="width: 30px; height: 20px" onblur="keydo('<%#Eval("id") %>')" /></li>
                                            <li class="i4"><%#getjiage("1",DataBinder.Eval(Container, "DataItem.proid", "{0}"))%></li>
                                            <li class="i5"><%#shijia(DataBinder.Eval(Container, "DataItem.Shijia", "{0}"))%></li>
                                            <li class="i6"><span id='price<%#Eval("ID") %>' class="money">
                                                <%#getprojias(Eval("shijia","{0}"), Eval("pronum","{0}"))%>
                                            </span>
                                            </li>
                                            <li class="i7"><a href="StoreCart.aspx?menu=del&cid=<%#Eval("id")%>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a></li>
                                            <div class="clear"></div>
                                        </ul>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="jia">
                            </div>
                            <br />
                            <hr />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div>
                <ul>
                    <li style="width: 100%; text-align: center;">
                        共
                        <asp:Label ID="Allnum" runat="server"></asp:Label>个商品
                        <asp:Label ID="Toppage" runat="server" />
                        <asp:Label ID="Nextpage" runat="server" />
                        <asp:Label ID="Downpage" runat="server" />
                        <asp:Label ID="Endpage" runat="server" />
                        页次：
                        <asp:Label ID="Nowpage" runat="server" />/
                        <asp:Label ID="PageSize" runat="server" />页
                        <asp:Label ID="pagess" runat="server" />
                        个商品/页  转到第
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>页
                    </li>
                </ul>
                <div style="float: right; margin-right: 10px;">
                    商品积分：<asp:Label ID="allscore" runat="server"></asp:Label>
                    <br />
                    已选中商品合计(不含邮费)：<label id="allMoney" runat="server" style="color: Red; font-size: large"></label>元
                </div>
                <div class="clear"></div>
                <div style="float: right; margin-right: 10px;">
                    <asp:Button ID="Button1" CssClass="i_bottom" runat="server" Text="购买" OnClick="Button1_Click" />
                </div>
            </div>
            <div id="bottom">
                <a href="/">
                    <img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%:Call.SiteName%>" /></a>
            </div>
            <p>
                <script type="text/javascript"> 
<!-- 
    var year="";
    mydate=new Date();
    myyear=mydate.getYear();
    year=(myyear > 200) ? myyear : 1900 + myyear;
    document.write(year); 
    --> 
                </script>
                &copy;&nbsp;Copyright&nbsp;
  <%:Call.SiteName %>
  All rights reserved.
            </p>
            <script type="text/javascript">
                $().ready(function(){
                    $("input[name='storeRadio']").change(function()
                    {
                        //li--ul--div
                        $(".cart_con :checkbox").each(function(){this.checked=false;$(this).attr("disabled","disabled");});
                        $(this).parent().parent().parent().siblings(".cart_con").find(":checkbox").each(function(){$(this).removeAttr("disabled");this.checked=true;});
                        $(this).parent().parent().parent().parent().parent().find(":radio[name=ShopID]").each(function(){this.checked=true;})
                        CalcSum();
                    });
                    $(".cart_con :checkbox").change(function(){ CalcSum();});
                    $($("input[name='storeRadio']")[0]).click();
                    CalcSum();
                });
                function CalcSum()
                {
                    var chkArr=$("[name='idChk']:checked");
                    var sum=0;
                    for (var i = 0; i < chkArr.length; i++) {
                        sum+=parseFloat($(chkArr[i]).parent().parent().find(".money").text());
                    }
                    sum=sum.toFixed(2)
                    $("#allMoney").text(sum);
                }
            </script>
        </div>
    </form>
</body>
</html>
