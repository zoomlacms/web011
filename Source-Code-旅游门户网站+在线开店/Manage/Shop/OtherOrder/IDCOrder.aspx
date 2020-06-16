<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_OtherOrder_DomainOrder, App_Web_blndaylf" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>域名订单管理</title>
<link href="../../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
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

    function getinfo(id) {
        location.href =<%=CustomerPageAction.customPath2%> +'Shop/Orderlistinfo.aspx?id=' + id;
    }

    function opentitle(url, title) {
        var diag = new Dialog();
        diag.Width = 600;
        diag.Height = 400;
        diag.Title = title;
        diag.URL = url;
        diag.show();
    }

</script>
<style>
.l_inpnon{ border:1px solid #8ec1ee;}
.sbtn { width: 18px; height: 18px; border: 0px; text-indent: -99999px; cursor: pointer; background: url("/App_Themes/AdminDefaultTheme/images/frame/sbtn.gif") no-repeat; }
#TimeTb .tdbg{ height:30px;}
#TimeTb .tdbgleft{ text-align:right; padding-right:10px;}
</style>
</head>
<body>   
    <form id="form1" runat="server">
    <div class="r_navigation">
        <div style="float:left;">
        <span>后台管理</span> &gt;&gt; <span>商城管理</span> &gt;&gt; <a href="IDCOrder.aspx?OrderType=7">IDC服务订单</a>
        &gt;&gt; <span>订单列表</span>
        <span style="margin-left:5px;">
            高级查询：
                    <asp:DropDownList ID="souchtable" runat="server">
                        <asp:ListItem Selected="True" Value="1">订单编号</asp:ListItem>
                        <asp:ListItem Value="2">客户名称</asp:ListItem>
                        <asp:ListItem Value="4">用户名</asp:ListItem>
                        <asp:ListItem Value="5">联系地址</asp:ListItem>
                    </asp:DropDownList>
            <asp:TextBox ID="souchkey" runat="server" Height="18" CssClass="l_inpnon" />
            <asp:Button ID="souchok" runat="server" Text="" class="sbtn" OnClick="souchok_Click" />
        </span>

        </div>
        <asp:RadioButtonList runat="server" ID="dateRadio" RepeatDirection="Horizontal"  AutoPostBack="true" OnSelectedIndexChanged="DateChk_CheckedChanged">
                <asp:ListItem Value="0" Selected="True">全部</asp:ListItem>
                <asp:ListItem Value="1">未到期</asp:ListItem>
                <asp:ListItem Value="2">已到期</asp:ListItem>
            </asp:RadioButtonList>
            <div class="clearbox"></div>  
    </div>
        <div id="TableList" runat="server">
            <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                    <tr class="tdbg">
                        <td width="20" height="24" align="center" class="title"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /> </td>
                        <td width="145" align="center" class="title"><span>订单编号</span></td>
                        <td width="65" align="center" class="title"><span>用户名</span></td>
                        <td width="150" align="center" class="title"><span>下单时间</span></td>
                        <td width="150" align="center" class="title"><span>到期时间</span></td>
                        <td width="100" align="center" class="title"><span>是否到期</span></td>
                        <td style="width: 68px;text-align:center;" class="title"><span>实际金额</span></td>
                        <td width="65" align="center" class="title"><span>收款金额</span></td>
                        <td width="75" align="center" class="title"><span>订单状态</span></td>
                        <td width="75" align="center" class="title"><span>付款状态</span></td>
                        <td style="width:120px;" align="center" class="title"><span>操作</span></td>
                    </tr>
                    <asp:Repeater ID="Orderlisttable" runat="server" OnItemCommand="Orderlisttable_ItemCommand">
                        <ItemTemplate>
                            <tr class="tdbg" id='<%#Eval("id") %>' onmouseover="this.className='tdbgmouseover'"
                                ondblclick="getinfo(this.id)" onmouseout="this.className='tdbg'">
                                <td height="24" align="center"><%#Getclickbotton(DataBinder.Eval(Container,"DataItem.id","{0}"))%></td>
                                <td height="24" align="center"><%#getorderno(Eval("id","{0}"))%></td>
                                <td height="24" align="center">
                                  <a onclick="opentitle('../../User/Userinfo.aspx?id=<%#Eval("userId") %>','查看会员')" href="###" title="查看会员">
                                  <%#GetUsers(DataBinder.Eval(Container, "DataItem.userId", "{0}"))%></a></td>
                                <td height="24" align="center"><%#Eval("AddTime") %></td>
                                <td height="24" align="center"><%#Eval("EndTime") %></td>
                                <td height="24" align="center"><%#IsExpire(Eval("EndTime")) %>
                                     <div id="more_div"  class="border more">
                                <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF();">关闭</span><%#"订单号："+Eval("OrderNo") %></div>
                                <%#Eval("OrderMessage") %></div>
                                </td>
                                <td height="24" align="center"><%#getshijiage(DataBinder.Eval(Container, "DataItem.id", "{0}"))%></td>
                                <td height="24" align="center"><%#formatcs(DataBinder.Eval(Container,"DataItem.Receivablesamount","{0:N2}"))%><%#getMoney_sign(Eval("Money_code").ToString())%>
                                </td>
                                <td height="24" align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.OrderStatus", "{0}"),"0")%></td>
                                <td height="24" align="center"><%#formatzt(DataBinder.Eval(Container, "DataItem.Paymentstatus", "{0}"),"1")%></td>
                                <td height="24" align="center">
                                    <a href="javascript:;" onclick="ShowMoreF(this);">浏览备注</a>
                                    <asp:LinkButton ID="LinkButton1" CommandName="edittime" CommandArgument='<%#Eval("ID") %>' runat="server">续费</asp:LinkButton>
                                    <a href="BountProduct.aspx?id=<%#Eval("id") %>" >关联产品</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td height="24" colspan="5" align="right">
                            本次查询合计：<br />
                            总计金额：
                        </td>
                        <td height="24" align="right" style="width: 68px">
                            <asp:Label ID="thisall" runat="server"></asp:Label><br />
                            <asp:Label ID="allall" runat="server"></asp:Label>
                        </td>
                        <td height="24" colspan="5" align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="tdbg">
                        <td height="24" colspan="11" align="center" class="tdbgleft">
                            <span style="text-align: center">
                            共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                                <asp:Label ID="Toppage" runat="server" Text="" />
                                <asp:Label ID="Nextpage" runat="server" Text="" />
                                <asp:Label ID="Downpage" runat="server" Text="" />
                                <asp:Label ID="Endpage" runat="server" Text="" />页次：
                                <asp:Label ID="Nowpage" runat="server" Text="" />/
                                <asp:Label ID="PageSize" runat="server" Text="" />页
                                <asp:Label ID="pagess" runat="server" Text="" />
                                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox> 条数据/页 转到第
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                             </span>
                        </td>
                    </tr>
                    <tr>
                        <td height="24" colspan="11">
                            说明：“已结清”与“已付款”的订单不允许删除,当订单号码成“灰色”代表此订单已“作废”
                        </td>
                    </tr>
                    <tr>
                         <td height="24" colspan="11">
                            <asp:Button ID="Button1" Style="width: 110px" class="C_input" Text="批量删除" runat="server" OnClick="Button1_Click1" OnClientClick="if(!IsSelectByName('Item')){alert('请选择内容');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" />
                               <asp:Button ID="Button2" Style="width: 110px" class="C_input" Text="设为成功" runat="server" OnClick="Button2_Click" OnClientClick="if(!IsSelectByName('Item')){alert('请选择内容');return false;}else{return confirm('你确定要将订单设为成功吗？')}" />
                        </td>
                    </tr>
            </table>
        </div>
        <asp:HiddenField ID="CartID" runat="server" />
        <table  width="100%" id="TimeTb" cellpadding="2" cellspacing="1" class="border" style="background-color: white;" runat="server" visible="false">
            <tr class="tdbg">
                <td class="tdbgleft" style="width:20%;"><strong>订单编号：</strong></td>
                <td><asp:Label ID="OrderNo" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>用户名：</strong></td>
                <td>
                    <asp:Label ID="OrderUser" runat="server"></asp:Label>
                    <asp:LinkButton runat="server" ID="logonBtn" style="color:red;" Text=" >>以该会身份登录，并续费(在新窗口中打开)" OnClick="logonBtn_Click"></asp:LinkButton>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>下单时间：</strong></td>
                <td><asp:Label ID="OrderAddTime" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>到期时间：</strong></td>
                <td><asp:TextBox ID="OrderEndTime" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" ></asp:TextBox></td>
            </tr>
            <tr class="tdbg">
                <td colspan="2" style="height:40px; text-align:center">
                    <asp:Button ID="EBtnSubmit" Text="保存" class="C_input"  OnClick="EBtnSubmit_Click" runat="server" />
                    <button type="button" onclick="location.href=location.href" class="C_input" >取消</button>
                </td>
            </tr>
        </table>
    <style type="text/css">
        .more {width:400px;height:300px;position:absolute;display:none;top:100px;border-radius:3px;}
        .moreTitle {text-align:center;background-color:#08C;font-family:'Microsoft YaHei';font-size:14px;color:white;height:30px;padding-top:5px;}
        .closeSpan {float:right;margin-right:10px;cursor:pointer; }
    </style>
        <script type="text/javascript">
            //function ShowMore(obj)
            //{
            //    $(obj).parent().parent("tr").siblings(".more").toggle("fast");
            //}
            //function SaveFunc(id,a)
            //{
            //    v = $("#txt_content" + id).val();
            //    $.ajax({
            //        type: "Post",
            //        data: {oid:id,action: a, value: v },
            //        success: function (data)
            //        {
            //            if (data == 1) { alert("修改成功");}
            //        },
            //        error: function () { alert("修改失败"); }
            //    });
            //}

            function ShowMoreF(obj)//more_div,more_div2
            {
                $(".more").hide();
                $(obj).parent().parent().find("#more_div").show();
            }
            function HideMoreF() {
                $(".more").hide();
            }
        </script>
    </form>
</body>
</html>
