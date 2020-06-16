<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_UserOrderlist, App_Web_2afsdgkd" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>店铺用户订单</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-hover">
        <tr>
            <td><span class="pull-left" style="margin-left: 10px;">快速查找：
                <asp:DropDownList ID="quicksouch" CssClass="form-control" Width="200" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True">请选择查找方式</asp:ListItem>
                    <asp:ListItem Value="2">今天的新订单</asp:ListItem>
                    <asp:ListItem Value="3">所有订单</asp:ListItem>
                    <asp:ListItem Value="5">最近一个月内的新订单</asp:ListItem>
                    <asp:ListItem Value="6">未确认的订单</asp:ListItem>
                    <asp:ListItem Value="7">未付款的订单</asp:ListItem>
                    <asp:ListItem Value="9">未送货的订单</asp:ListItem>
                    <asp:ListItem Value="10">未签收的订单</asp:ListItem>
                    <asp:ListItem Value="12">未开发票的订单</asp:ListItem>
                    <asp:ListItem Value="13">已经作废的订单</asp:ListItem>
                    <asp:ListItem Value="15">已发货的订单</asp:ListItem>
                    <asp:ListItem Value="16">已签收的订单</asp:ListItem>
                    <asp:ListItem Value="17">已结清的订单</asp:ListItem>
                </asp:DropDownList>
            </span>
                <span class="pull-left" style="margin-left: 10px;">高级查询：
                      <asp:DropDownList ID="souchtable" CssClass="form-control" Width="120" runat="server">
                          <asp:ListItem Selected="True" Value="1">订单编号</asp:ListItem>
                          <asp:ListItem Value="2">客户名称</asp:ListItem>
                          <asp:ListItem Value="3">用户名</asp:ListItem>
                          <asp:ListItem Value="4">收货人</asp:ListItem>
                          <asp:ListItem Value="6">联系电话</asp:ListItem>
                          <asp:ListItem Value="7">下单时间</asp:ListItem>
                      </asp:DropDownList>
                </span>
                <div class="input-group pull-left" style="width: 260px; margin-left: 10px;">
                    <asp:TextBox runat="server" ID="souchkey" class="form-control" placeholder="请输入需要搜索的内容" />
                    <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="souchok" OnClick="souchok_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </td>
        </tr>
    </table>
    <div>
        <ul class="nav nav-tabs">
            <li id="tab0" class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)">所有订单</a></li>
            <li id="tab1"><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)">正常订单</a></li>
            <li id="tab2"><a href="#tab2" data-toggle="tab" onclick="ShowTabs(2)">作废订单</a></li>
        </ul>
        <table class="table table-striped table-bordered table-hover">
            <tbody id="Tbody1">
                <tr>
                    <td width="40" align="center" class="title">
                        <input type="checkbox" id="chkAll" />
                    </td>
                    <td width="12%" align="center" class="title">订单编号</td>
                    <td width="10%" align="center" class="title">客户名称</td>
                    <td width="8%" align="center" class="title">用户名</td>
                    <td width="6%" align="center" class="title">店铺用户</td>
                    <td width="14%" align="center" class="title">下单时间</td>
                    <td align="center" class="title" width="6%">实际金额</td>
                    <td width="6%" align="center" class="title">收款金额</td>
                    <td width="6%" align="center" class="title">需要发票</td>
                    <td width="6%" align="center" class="title">已开发票</td>
                    <td width="6%" align="center" class="title">订单状态</td>
                    <td width="7%" align="center" class="title">付款状态</td>
                    <td width="7%" align="center" class="title">物流状态</td>
                    <td width="6%" align="center" class="title">操作</td>
                </tr>
                <asp:Repeater ID="Orderlisttable" runat="server">
                    <ItemTemplate>
                        <tr id="<%#Eval("id") %>" ondblclick="getinfo(this.id)">
                            <td align="center"><%#Getclickbotton(DataBinder.Eval(Container,"DataItem.id","{0}"))%></td>
                            <td align="center"><%#getorderno(Eval("id","{0}"))%></td>
                            <td align="center"><%#GetUser(DataBinder.Eval(Container, "DataItem.Reuser", "{0}"))%></td>
                            <td align="center"><%#GetUsers(DataBinder.Eval(Container, "DataItem.userId", "{0}"))%></td>
                            <td align="center"><%#GetShopUsers(DataBinder.Eval(Container, "DataItem.Sid", "{0}"))%></td>
                            <td align="center"><%#Eval("AddTime") %></td>
                            <td align="center"><%#getshijiage(DataBinder.Eval(Container, "DataItem.id", "{0}"))%></td>
                            <td align="center"><%#formatcs(Eval("ordertype","{0}"),DataBinder.Eval(Container,"DataItem.Receivablesamount","{0:N2}"))%></td>
                            <td align="center"><%#fapiao(DataBinder.Eval(Container,"DataItem.Invoiceneeds","{0}"))%></td>
                            <td align="center"><%#fapiao(DataBinder.Eval(Container, "DataItem.Developedvotes","{0}")) %></td>
                            <td align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%></td>
                            <td align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%></td>
                            <td align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.StateLogistics", "{0}"),"2")%></td>
                            <td align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.StateLogistics", "{0}"),"2")%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="6" align="right">总计金额：<br />
                    </td>
                    <td align="right" style="width: 68px">
                        <asp:Label ID="thisall" runat="server"></asp:Label>
                        <br />
                    </td>
                    <td align="center" style="width: 88px">&nbsp;</td>
                    <td colspan="6" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="14" align="center">共
              <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        条记录
              <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        页次：
              <asp:Label ID="Nowpage" runat="server" Text="" />
                        /
              <asp:Label ID="PageSize" runat="server" Text="" />
                        页
              <asp:TextBox ID="txtPage" runat="server" Width="25px" AutoPostBack="True" OnTextChanged="txtPage_TextChanged1"></asp:TextBox>
                        条记录/页 转到第
              <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                        页
                    </td>
                </tr>
                <tr>
                    <td colspan="13">
                        <asp:Button ID="Button2" Style="width: 110px" class="btn btn-primary" Text="确认订单" runat="server" OnClick="Button2_Click1" OnClientClick="return confirm('是否确认？');" />
                        <asp:Button ID="Button3" Style="width: 110px" class="btn btn-primary" Text="汇款到帐" runat="server" OnClick="Button3_Click1" OnClientClick="return confirm('是否确认？');" />
                        <asp:Button ID="Button1" Style="width: 110px" class="btn btn-primary" Text="删除订单" runat="server" OnClick="Button1_Click1" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
                        *说明：“已结清”与“已付款”的订单不允许删除,当订单号码成“灰色”代表此订单已“作废” </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">

        $().ready(function () {
            var id = '<%=Request.QueryString["type"]%>';
            if (id) {
                $("#tab" + id).addClass("active").siblings("li").removeClass("active");
            }
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "Item");
            });
        });
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
        function getinfo(id) {
            location.href = "Stock.aspx?menu=edit&id=" + id + "";
        }
        function ShowTabs(ID) {
            location.href = 'UserOrderlist.aspx?type=' + ID;
        }
    </script>
</asp:Content>

