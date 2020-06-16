<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.OrderList, App_Web_2afsdgkd" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>订单列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover hidden-xs">
        <tr>
            <td>
                <span class="pull-left">快速查找：
                    <asp:DropDownList ID="quicksouch" CssClass="form-control" Width="200" runat="server" AutoPostBack="True" OnSelectedIndexChanged="quicksouch_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="0">请选择查找方式</asp:ListItem>
                        <asp:ListItem Value="1">我负责跟踪的订单</asp:ListItem>
                        <asp:ListItem Value="2">今天的新订单</asp:ListItem>
                        <asp:ListItem Value="3">所有订单</asp:ListItem>
                        <asp:ListItem Value="4">最近10天内的新订单</asp:ListItem>
                        <asp:ListItem Value="5">最近一个月内的新订单</asp:ListItem>
                        <asp:ListItem Value="6">未确认的订单</asp:ListItem>
                        <asp:ListItem Value="7">未付款的订单</asp:ListItem>
                        <asp:ListItem Value="8">未付清的订单</asp:ListItem>
                        <asp:ListItem Value="9">未送货的订单</asp:ListItem>
                        <asp:ListItem Value="10">未签收的订单</asp:ListItem>
                        <asp:ListItem Value="11">未结清的订单</asp:ListItem>
                        <asp:ListItem Value="12">未开发票的订单</asp:ListItem>
                        <asp:ListItem Value="13">已经作废的订单</asp:ListItem>
                        <asp:ListItem Value="14">暂停处理的订单</asp:ListItem>
                        <asp:ListItem Value="15">已发货的订单</asp:ListItem>
                        <asp:ListItem Value="16">已签收的订单</asp:ListItem>
                        <asp:ListItem Value="17">已结清的订单</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <span class="pull-left" style="margin-left:10px;margin-right:10px;">
                    高级查询：
                    <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
                        <asp:ListItem Selected="True" Value="1">订单编号</asp:ListItem>
                        <asp:ListItem Value="2">客户名称</asp:ListItem>
                        <asp:ListItem Value="3">用户名</asp:ListItem>
                        <asp:ListItem Value="4">收货人</asp:ListItem>
                        <asp:ListItem Value="5">联系地址</asp:ListItem>
                        <asp:ListItem Value="6">联系电话</asp:ListItem>
                        <asp:ListItem Value="7">下单时间</asp:ListItem>
                        <asp:ListItem Value="8">备注/留言</asp:ListItem>
                        <asp:ListItem Value="9">商品名称</asp:ListItem>
                        <asp:ListItem Value="10">收货人邮箱</asp:ListItem>
                        <asp:ListItem Value="11">发票信息</asp:ListItem>
                        <asp:ListItem Value="12">内部记录</asp:ListItem>
                        <asp:ListItem Value="13">跟单员</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <div class="input-group" style="width:300px; float:left;">
                    <asp:TextBox runat="server" ID="souchkey" class="form-control" placeholder="请输入需要搜索的内容" />
                    <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="souchok" OnClick="souchok_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </td>
        </tr>
    </table>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="id" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无订单信息！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <%#Getclickbotton(DataBinder.Eval(Container,"DataItem.id","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订单编号">
                <ItemTemplate>
                    <%#getorderno(Eval("id","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="客户名称">
                <ItemTemplate>
                    <%#GetUser(DataBinder.Eval(Container, "DataItem.Reuser", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户名">
                <ItemTemplate>
                    <a onclick="opentitle('../User/Userinfo.aspx?id=<%#Eval("userId") %>','查看会员')" href="###" title="查看会员"><%#GetUsers(DataBinder.Eval(Container, "DataItem.userId", "{0}"))%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="下单时间">
                <ItemTemplate>
                    <%#Eval("AddTime") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="实际金额">
                <ItemTemplate>
                    <%#getshijiage(DataBinder.Eval(Container, "DataItem.id", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="收款金额">
                <ItemTemplate>
                    <%#formatcs(Eval("ordertype","{0}"),DataBinder.Eval(Container,"DataItem.Receivablesamount","{0:N2}"))%><%#getMoney_sign(Eval("Money_code").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="需要发票">
                <ItemTemplate>
                    <%#fapiao(DataBinder.Eval(Container, "DataItem.Developedvotes","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订单状态">
                <ItemTemplate>
                    <%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="付款状态">
                <ItemTemplate>
                    <%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="物流状态">
                <ItemTemplate>
                    <%#formatzt(DataBinder.Eval(Container, "DataItem.StateLogistics", "{0}"),"2")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="其他费用">
                <ItemTemplate>
                    <a href="###" onclick='javascript:window.open("/manage/Common/Extra.aspx?OrderID=<%#Eval("id")%>","","width=600,height=450,resizable=0,scrollbars=yes");'>其他费用</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Button2" Style="width: 110px" class="btn btn-primary" Text="确认订单" runat="server" OnClick="Button2_Click1" OnClientClick="return confirm('是否确认？');" />
    <asp:Button ID="Button3" Style="width: 110px" class="btn btn-primary" Text="汇款到帐" runat="server" OnClick="Button3_Click1" OnClientClick="return confirm('是否确认？');" />
    <asp:Button ID="Button1" Style="width: 110px" class="btn btn-primary" Text="删除订单" runat="server" OnClick="Button1_Click1" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" />*说明：“已结清”与“已付款”的订单不允许删除,当订单号码成“灰色”代表此订单已“作废”
    <asp:HiddenField ID="ThisAll_H" runat="server" />
    <asp:HiddenField ID="All_H" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {
                var oItem = this.children;
                var theBox = (this.type == "checkbox") ? this : this.children.item[0];
                xState = theBox.checked;
                elm = theBox.form.elements;
                for (i = 0; i < elm.length; i++)
                    if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                        if (elm[i].checked != xState)
                            elm[i].click();
                    }
            });
            HideColumn("3,4,5,7,10,11");
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=Item]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        $().ready(function () {
            var i = $("#Egv tr").length - 1;
            var thisall = $("#ThisAll_H").val();
            var all = $("#All_H").val();
            var str = "<tr><td colspan=\"6\" style='text-align:right;'>本次查询合计：<br />总计金额：</td><td>" + thisall + "<br >" + all + "</td><td colspan='5'></td></tr>"
            $("#Egv tr:nth-child(" + i + ")").after(str);
        })
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
            location.href = 'Orderlistinfo.aspx?id=' + id;
        }
        function opentitle(url, title) {
            var diag = new ZL_Dialog();
            diag.width = 1000;
            diag.height = 600;
            diag.title = title;
            diag.url = url;
            diag.ShowModal();
        }
    </script>
</asp:Content>

