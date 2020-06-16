<%@ page language="C#" autoeventwireup="true" inherits="test_getOrderInfo, App_Web_1wosuu10" masterpagefile="~/Cart/order.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <title>订单结算</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="padding: 20px 0 10px">
        <a href="/"><img src="<%=Call.LogoUrl %>" style="margin-left: 5px;" /></a>
        <img style="float: right; margin-top: 15px; margin-right: 5px;" src="http://misc.360buyimg.com/purchase/trade/skin/i/step2.png" />
    </div>
    <div class="row" style="border: 1px solid #ddd;">
        <div class="bordered" style="background: #f7f7f7; padding-left: 10px; height: 40px;line-height: 30px; ">
            <span style="color: #333; font-size: 18px; font-weight: 500; font-family: 'Microsoft YaHei';">填写并核对订单信息</span>
        </div>
        <div class="bordered">
            <p><i class="fa fa-pencil-square-o strong"> 收货人信息</i></p>
            <ul class="addresssul indent">
                <asp:Repeater runat="server" ID="AddressRPT">
                    <ItemTemplate>
                        <li id="addli_<%#Eval("ID") %>">
                            <label><input type="radio" name="address_rad" value="<%#Eval("ID") %>" /><%#GetAddress() %></label>
                            <span>
                                <%#GetIsDef() %>
                                <a href="javascript:;" onclick="EditAddress(<%#Eval("ID") %>);">修改</a>
                                <a href="javascript:;" onclick="DelAddress(<%#Eval("ID") %>);">删除</a>
                            </span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div runat="server" id="EmptyDiv" visible="false">你没有收货地址,请先填写收货地址</div>
            <input type="button" value="添加新地址" class="btn btn-primary btn-xs" onclick="AddAddress();" style="margin-left:20px;"/>
        </div>
        <div class="bordered">
            <!--支付方式-->
            <p><i class="fa fa-credit-card strong"> 支付方式</i></p>
            <div class="indent">
                <ul class="methodul">
                    <li runat="server" id="onlinepayli" class="active" title="支付宝,银联等在线支付"><i class="fa fa-rmb"> 在线支付</i><input type="radio" class="hidden" name="method_rad" value="1" /></li>
                    <li runat="server" id="purseli" title="用户余额支付"><i class="fa fa-credit-card"> 余额支付</i><input type="radio" class="hidden" name="method_rad" value="2"/></li>
                    <li runat="server" id="silverli" title="用户银币支付"><i class="fa fa-rouble"> 银币支付</i><input type="radio" class="hidden" name="method_rad" value="3"/></li>
                    <li runat="server" id="scoreli" title="用户积分支付"><i class="fa fa-money"> 积分支付</i><input type="radio" class="hidden" name="method_rad" value="4"/></li>
                </ul>
                <div style="clear:both;"></div>
            </div>
        </div>
        <div class="bordered">
            <p><i class="fa fa-th strong"> 发票信息</i></p>
            <div class="indent">
                <label>
                    <input type="radio" name="invoice_rad" value="0" onclick="$('#invoice_div').hide();" checked="checked"/>不开发票</label>
                <label>
                    <input type="radio" name="invoice_rad" value="1" onclick="$('#invoice_div').show();" />需要发票</label><br />
                <div id="invoice_div">
                    <asp:TextBox runat="server" ID="Invoice_T" TextMode="MultiLine" class="form-control invoice_t" MaxLength="200" placeholder="请输入发票抬头" />
                </div>
            </div>
        </div>
        <div class="bordered">
            <p><i class="fa fa-cubes strong">商品清单</i><a href="cart.aspx" title="返回购物车" style="float:right;padding-right:10px;">返回修改购物车</a></p>
            <div class="indent">
                <table class="table" style="text-align:center;">
                <tr style="background:#eeeeee;"><td>商品</td><td>金额</td><td>优惠</td><td>数量</td><td>库存状态</td></tr>
                    <asp:Repeater runat="server" ID="RPT">
                        <ItemTemplate>
                            <tr>
                                <td class="text-left">
                                    <div class="pull-left"><img src="<%#"/"+Eval("Thumbnails")%>" onerror="this.src='/Images/nopic.gif';" class="preimg" /></div>
                                    <div style="padding-left:50px;"><span><%#Eval("ProName") %></span>
                                    <p class="grayremind"><%#GetAddition() %></p></div>
                                </td>
                                <td style="text-align: right; line-height: 30px;"><i id="payPriceId" class="fa fa-rmb"><%#Eval("AllMoney","{0:F2}") %></i></td>
                                <td></td>
                                <td>x <%#Eval("Pronum") %></td>
                                <td>有货</td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                <tr>
                    <td colspan="5">
                        <div style="text-align: right;">
                            <div><span><span runat="server" id="itemnum_span">1</span>件商品,总商品金额：</span><i class="fa fa-rmb" runat="server" id="totalmoney_span1">0.00</i></div>
                            <div><span>运费：</span><i class="fa fa-rmb" runat="server" id="fare_span">0.00</i></div>
                            <div><span>应付总额：</span><i class="fa fa-rmb" runat="server" id="totalmoney_span2">0.00</i></div>
                        </div>
                    </td>
                </tr>
            </table>
                <ul>
                    <li>
                        <p><a href="javascript:;" onclick="$('#arrive_div').toggle('middle');"><i class="fa fa-plus-circle"> 使用优惠券抵消部分总额</i></a></p>
                        <div style="display:none;" id="arrive_div">
                            <asp:TextBox runat="server" ID="Arrive_T" class="form-control control-md" placeholder="优惠券号" />
                            <asp:TextBox runat="server" ID="Arrive_Pwd" class="form-control control-md" placeholder="密码" />
                            <input type="button" value="检测" class="btn btn-primary" onclick="ArriveCheck();" />
                        </div>
                    </li>
                    <li>
                       <p><a href="javascript:;" onclick="$('#arrive_div').toggle('middle');"><i class="fa fa-plus-circle"> 使用积分抵扣</i></a></p>
                   </li>
                    <li>
                       <p><a href="javascript:;" onclick="$('#arrive_div').toggle('middle');"><i class="fa fa-plus-circle"> 添加订单备注</i></a></p>
                   </li>
                </ul>
            </div>
        </div>
        <div style="text-align: right; background: #f5f5f5; padding: 0px 10px;height:50px;line-height:50px;">
            <span class="total">应付总额：<i runat="server" id="totalmoney_i" class="fa fa-rmb">0.00</i></span><asp:Button runat="server" CssClass="btn btn-danger" ID="AddOrder_Btn" Text="提交订单" OnClientClick="disBtn(this,5000);" OnClick="AddOrder_Btn_Click" />
        </div>
    </div>
    <style type="text/css">
       label{font-weight:normal;}
       #EmptyDiv {color: red;}
       #invoice_div{display:none;}
       .strong{font-weight:600;font-size:14px;}
       .preimg {width: 50px;height: 50px;}
       .indent{padding-left:20px;}
       .invoice_t{resize:none;height:60px;width:400px;}
       .total{padding-right:18px;font-size:14px;font-weight:700;}
       .total i{color:#e4393c;font-size:20px;font-weight:normal;}
       .glyphicon-remove-sign{font-size:20px;}
       /*地址*/
        .addresssul li{margin-bottom:3px;padding-left:5px;}
        .addresssul li:hover{background:#fff4d3;}
        .addresssul .active{background:#fff4d3;}
       /*支付方式*/
       .methodul li{float:left;cursor:pointer;border-radius:7px;background:#428bca;color:#fff;
                margin-right:5px;width:80px;height:43px;text-align:center;line-height:40px;border:2px solid #fff;}
       .methodul .active{background:#57A5CA;border:2px solid #357ebd;}
       .methodul li:hover{background:#57A5CA;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $(function () {
            $(".addresssul li").click(function () {
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
            });
            $(".addresssul li:first").click(); $(":radio[name=address_rad]")[0].checked = true;
            $(".methodul li").click(function () {
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
                $(this).find(":radio")[0].checked = true;
            })
            $(".methodul li:first").click();
        })
        var diag = new ZL_Dialog();
        function AddAddress() {
            diag.title = "添加新地址";
            diag.url = "address.aspx";
            diag.ShowModal();
        }
        function EditAddress(id) {
            diag.title = "修改地址";
            diag.url = "address.aspx?id=" + id;
            diag.ShowModal();
        }
        function DelAddress(myid) {
            if (confirm("确定要删除吗")) {
                $("#addli_" + myid).remove();
                $.post("ordercom.ashx", { action: "deladdress", id: myid }, function () {
                });
            }
        }
    </script>
</asp:Content>