<%@ page language="C#" autoeventwireup="true" inherits="test_Cart, App_Web_1wosuu10" enableviewstatemac="false" masterpagefile="~/Cart/order.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>购物车</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="padding: 20px 0 10px;">
         <a href="/"><img src="<%=Call.LogoUrl %>" style="margin-left: 5px;" /></a>
        <div class="input-group pull-right" style="width: 240px;margin-top:10px;">
            <input type="text" id="skey_t" placeholder="商品搜索" class="form-control" style="width: 190px; float: left;" />
            <span class="input-group-btn">
                <input type="button" value="搜索" class="btn btn-default" onclick="skey();" />
            </span>
        </div>
    </div>
    <table id="EGV" class="table">
            <tr style="background:#f3f3f3;border:1px solid #e9e9e9;">
                <td style="width:60px;"></td>
                <td>商品</td>
                <td runat="server" id="ptype_td">单价</td>
                <td>数量</td>
                <td style="width:100px;">小计</td>
                <td style="width:60px;">操作</td>
            </tr>
            <asp:Repeater runat="server" ID="RPT" OnItemDataBound="RPT_ItemDataBound">
                <ItemTemplate>
                    <tbody style="border:none;">
                        <tr>
                            <td colspan="6" class="storename">
                                <label><input type="checkbox" class="store_chk" name="store_chk" checked="checked" value="<%#Eval("ID") %>" />
                                    <%#Eval("StoreName") %></label></td>
                        </tr>
                        <asp:Repeater runat="server" ID="ProRPT" OnItemCommand="ProRPT_ItemCommand">
                            <ItemTemplate>
                                <tr data-id="<%#Eval("ID") %>">
                                    <td>
                                        <input type="checkbox" name="prochk" checked="checked" value="<%#Eval("ID") %>" /></td>
                                    <td>
                                        <img src="<%#"/"+Eval("Thumbnails")%>" onerror="this.src='/Images/nopic.gif';" class="preimg" />
                                        <%#Eval("ProName") %>
                                    </td>
                                    <td style="line-height:80px;"><%#GetMyPrice() %></td>
                                    <td class="pronum_td">
                                        <div class="input-group" style="margin-top:20px;">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-minus minus"></span></span>
                                            <input type="text" class="form-control pronum_text" id="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-plus add"></span></span>
                                        </div>
                                    </td>
                                    <td style="line-height:80px;"><span id="trprice_<%#Eval("ID") %>" class="trprice"><%#GetPrice() %></span></td>
                                    <td style="line-height:80px;">
                                        <asp:LinkButton CssClass="grayremind" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确定要删除吗?');">删除</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </ItemTemplate>
            </asp:Repeater>
            <tr><td colspan="6">
                <label>
                    <input type="checkbox" checked="checked" onclick="ChkAll(this);" />全选</label>
                    <asp:Button runat="server" ID="BatDel" Text="批量删除" CssClass="btn btn-primary btn-xs" style="margin-left:5px;" OnClick="BatDel_Click" OnClientClick="return confirm('确定要删除吗');" />
                <div class="pull-right">
                    <span>已选择<span class="trprice" id="pronum_span"></span>件商品,总价(不含运费):<span runat="server" id="totalmoney" class="totalmoney">0.00</span></span>
                    <asp:Button runat="server" ID="NextStep" OnClick="NextStep_Click" CssClass="btn btn-danger" OnClientClick="disBtn(this,3000);" Text="去结算" />
                </div>
            </td></tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
            .preimg{width:80px;height:80px;}
            .totalmoney{color:#e4393c;font-size:1.3em;font-weight:700;}
            .trprice{color:#e4393c;font-weight:400;display:inline-block;line-height:30px;}
            .input-group-addon{padding-left:4px;padding-right:4px;}
            .minus{color:gray;font-size:8px;cursor:pointer;}
            .add{color:gray;font-size:8px;cursor:pointer;}
            .pronum_td{width:120px;text-align:center;}
            .pronum_text{text-align:center;}
        </style>
    <script type="text/javascript">
        $(function () {
            ZL_Regex.B_Num(".pronum_text");
            $(".add").click(function () {
                ChangePronum(this, "+");
            });
            $(".minus").click(function () {
                ChangePronum(this, "-");
            });
            $(".pronum_text").change(function () {
                var id = $(this).closest("tr").data("id");
                UpdatePrice(id);
            });
            $("input[name=prochk]").click(function () {
                UpdateTotalPrice();
                UpdateItemNum();
            });
            $(".store_chk").click(function () {
                ChkByStore(this);
                UpdateItemNum();
            });
            UpdateItemNum();
        })
        //更改购买数量
        function ChangePronum(obj, action) {
            var id = $(obj).closest("tr").data("id");
            var $td = $(obj).closest("td");
            var text = $td.find(".pronum_text")[0];
            var v = parseInt(text.value);
            if (!v || v == "" || v < 1) v = 1;
            switch (action) {
                case "-":
                    if (v > 1)--v;
                    text.value = v;
                    break;
                case "+":
                    text.value = ++v;
                    break;
            }
            UpdatePrice(id);
            SetNum(id, v);
        }
        //更新价格(需更为后台获取)
        function UpdatePrice(id) {
            var pronum = $("#pronum_" + id).val();
            var price = $("#price_" + id).text();
            var obj = $("#trprice_" + id);
            obj.text((price * pronum).toFixed(2));
            UpdateTotalPrice();
        }
        //更新总金额
        function UpdateTotalPrice() {
            var $chkarr = $("[name=prochk]:checked");
            var money = 0.00;
            for (var i = 0; i < $chkarr.length; i++) {
                money += parseFloat($("#trprice_" + $chkarr[i].value).text());
            }
            $("#totalmoney").text(money.toFixed(2));
        }
        //--商品数量相关
        function ChkAll(obj) {
            $("#EGV :checkbox").each(function () { this.checked = obj.checked; });
            UpdateItemNum();
        }
        //全选本店商品
        function ChkByStore(obj) {
            $(obj).closest("tbody").find(":checkbox[name=prochk]").each(function () {
                this.checked = obj.checked;
            });
        }
        function UpdateItemNum() {
            var num = $("[name=prochk]:checked").length;
            $("#pronum_span").text(num);
            document.getElementById("NextStep").disabled = (num < 1) ? "disabled" : "";
        }
        //------AJAX
        //更改购买数据
        function SetNum(id, num) {//ZL_Cart主键,数量,后台会验证Cookie中的CartID
            $.post("ordercom.ashx", { action: "setnum", mid: id, pronum: num }, function (data) {
                if (data == "1") {

                }
                else { }

            });
        }
        //------
        function skey()
        {
            var key = $("#skey_t").val();
            window.open("/Search/SearchList.aspx?node=0&keyword="+key);
        }
    </script>
</asp:Content>