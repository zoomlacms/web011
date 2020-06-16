<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_OtherOrder_DomainOrder, App_Web_eyqsi3lf" validaterequest="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>域名订单管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td><span class="pull-left">高级查询：
        <asp:DropDownList ID="souchtable" CssClass="form-control" Width="150" runat="server">
          <asp:ListItem Selected="True" Value="1">订单编号</asp:ListItem>
          <asp:ListItem Value="2">客户名称</asp:ListItem>
          <asp:ListItem Value="4">用户名</asp:ListItem>
          <asp:ListItem Value="5">联系地址</asp:ListItem>
        </asp:DropDownList>
        </span> <span class="pull-left" style="padding-top:5px;">
        <asp:RadioButtonList runat="server" ID="dateRadio" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="DateChk_CheckedChanged">
          <asp:ListItem Value="0" Selected="True">全部</asp:ListItem>
          <asp:ListItem Value="1">未到期</asp:ListItem>
          <asp:ListItem Value="2">已到期</asp:ListItem>
        </asp:RadioButtonList>
        </span>
        <div class="input-group pull-left" style="width:300px;">
          <asp:TextBox runat="server" ID="souchkey" class="form-control" placeholder="请输入需要搜索的内容" />
          <span class="input-group-btn">
          <asp:LinkButton runat="server" CssClass="btn btn-default" ID="souchok" OnClick="souchok_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
          </span> </div></td>
    </tr>
  </table>
  <div id="TableList" runat="server">
    <table id="EGV" class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
        <td><span>订单编号</span></td>
        <td><span>用户名</span></td>
        <td><span>下单时间</span></td>
        <td><span>到期时间</span></td>
        <td><span>是否到期</span></td>
        <td><span>实际金额</span></td>
        <td><span>收款金额</span></td>
        <td><span>订单状态</span></td>
        <td><span>付款状态</span></td>
        <td><span>操作</span></td>
      </tr>
      <asp:Repeater ID="Orderlisttable" runat="server" OnItemCommand="Orderlisttable_ItemCommand">
        <ItemTemplate>
          <tr class="tdbg" id='<%#Eval("id") %>' ondblclick="getinfo(this.id)">
            <td><%#Getclickbotton(DataBinder.Eval(Container,"DataItem.id","{0}"))%></td>
            <td><%#getorderno(Eval("id","{0}"))%></td>
            <td><a onclick="opentitle('../../User/Userinfo.aspx?id=<%#Eval("userId") %>','查看会员')" href="###" title="查看会员"> <%#GetUsers(DataBinder.Eval(Container, "DataItem.userId", "{0}"))%></a></td>
            <td><%#Eval("AddTime") %></td>
            <td><%#Eval("EndTime") %></td>
            <td><%#IsExpire(Eval("EndTime")) %>
              <div id="more_div" class="border more">
                <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF();">关闭</span><%#"订单号："+Eval("OrderNo") %></div>
                <%#Eval("OrderMessage") %> </div></td>
            <td><%#getshijiage(DataBinder.Eval(Container, "DataItem.id", "{0}"))%></td>
            <td><%#formatcs(DataBinder.Eval(Container,"DataItem.Receivablesamount","{0:N2}"))%><%#getMoney_sign(Eval("Money_code").ToString())%></td>
            <td><%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%></td>
            <td><%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%></td>
            <td><a href="javascript:;" onclick="ShowMoreF(this);">浏览备注</a>
              <asp:LinkButton ID="LinkButton1" CommandName="edittime" CommandArgument='<%#Eval("ID") %>' runat="server">续费</asp:LinkButton>
              <a href="BountProduct.aspx?id=<%#Eval("id") %>">关联产品</a></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr>
        <td colspan="5" style="text-align: right;">本次查询合计：<br />
          总计金额： </td>
        <td align="right"><asp:Label ID="thisall" runat="server"></asp:Label>
          <br />
          <asp:Label ID="allall" runat="server"></asp:Label></td>
        <td colspan="5"></td>
      </tr>
      <tr class="tdbg">
        <td colspan="11" align="center" class="tdbgleft"><span style="text-align: center">共
          <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
          条数据
          <asp:Label ID="Toppage" runat="server" Text="" />
          <asp:Label ID="Nextpage" runat="server" Text="" />
          <asp:Label ID="Downpage" runat="server" Text="" />
          <asp:Label ID="Endpage" runat="server" Text="" />
          页次：
          <asp:Label ID="Nowpage" runat="server" Text="" />
          /
          <asp:Label ID="PageSize" runat="server" Text="" />
          页
          <asp:Label ID="pagess" runat="server" Text="" />
          <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
          条数据/页 转到第
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
          页
          <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
          </span></td>
      </tr>
      <tr>
        <td colspan="11">说明：“已结清”与“已付款”的订单不允许删除,当订单号码成“灰色”代表此订单已“作废” </td>
      </tr>
      <tr>
        <td colspan="11"><asp:Button ID="Button1" Style="width: 110px" class="btn btn-primary" Text="批量删除" runat="server" OnClick="Button1_Click1" OnClientClick="if(!IsSelectByName('Item')){alert('请选择内容');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" />
          <asp:Button ID="Button2" Style="width: 110px" class="btn btn-primary" Text="设为成功" runat="server" OnClick="Button2_Click" OnClientClick="if(!IsSelectByName('Item')){alert('请选择内容');return false;}else{return confirm('你确定要将订单设为成功吗？')}" /></td>
      </tr>
    </table>
  </div>
  <asp:HiddenField ID="CartID" runat="server" />
  <table width="100%" id="TimeTb" cellpadding="2" cellspacing="1" class="border" style="background-color: white;" runat="server" visible="false">
    <tr class="tdbg">
      <td class="tdbgleft" style="width: 20%;"><strong>订单编号：</strong></td>
      <td><asp:Label ID="OrderNo" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td class="tdbgleft"><strong>用户名：</strong></td>
      <td><asp:Label ID="OrderUser" runat="server"></asp:Label>
        <asp:LinkButton runat="server" ID="logonBtn" Style="color: red;" Text=" >>以该会身份登录，并续费(在新窗口中打开)" OnClick="logonBtn_Click"></asp:LinkButton></td>
    </tr>
    <tr class="tdbg">
      <td class="tdbgleft"><strong>下单时间：</strong></td>
      <td><asp:Label ID="OrderAddTime" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td class="tdbgleft"><strong>到期时间：</strong></td>
      <td><asp:TextBox ID="OrderEndTime" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox></td>
    </tr>
    <tr class="tdbg">
      <td colspan="2" style="height: 40px; text-align: center"><asp:Button ID="EBtnSubmit" Text="保存" class="btn btn-primary" OnClick="EBtnSubmit_Click" runat="server" />
        <button type="button" onclick="location.href=location.href" class="btn btn-primary">取消</button></td>
    </tr>
  </table>
    <div class="modal" id="userinfo_div">
        <div class="modal-dialog" style="width: 600px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong id="title">用户信息</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="user_ifr" style="width:100%;height:400px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
<script>
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
    function getinfo(id) { location.href =<%=CustomerPageAction.customPath2%> +'Shop/Orderlistinfo.aspx?id=' + id; }
    function opentitle(url, title) {
        $("#title").text(title);
        $("#user_ifr").attr("src", url);
        $("#userinfo_div").modal({});
    }
    function ShowMoreF(obj)//more_div,more_div2
    {
        $(".more").hide();
        $(obj).parent().parent().find("#more_div").show();
    }
    function HideMoreF() {
        $(".more").hide();
    }
</script>
<style>
.more { width: 400px; height: 300px; position: absolute; display: none; top: 100px; border-radius: 3px; }
.moreTitle { text-align: center; background-color: #08C; font-family: 'Microsoft YaHei'; font-size: 14px; color: white; height: 30px; padding-top: 5px; }
.closeSpan { float: right; margin-right: 10px; cursor: pointer; }
.border { border: 1px solid #428bca; background-color: #ffffff; }
</style>
</asp:Content>
