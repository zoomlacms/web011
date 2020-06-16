<%@ page language="C#" autoeventwireup="true" inherits="Plugins_Domain_ViewHave, App_Web_cpqz3j25" masterpagefile="~/Manage/Site/OptionMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<title>已购服务</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 用户中心 >> 浏览已购服务</p></div>
<div id="site_main" style="margin-top:15px;">
                <span>
            <span style="float:left">
        服务搜索：<asp:TextBox runat="server" CssClass="site_input" ID="keyWord"  />
                     <asp:Button runat="server" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" CssClass="site_button"/></span>
            <span>
            <asp:RadioButtonList runat="server" ID="disChk" AutoPostBack="true" OnSelectedIndexChanged="disChk_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem Value="0" Selected="True">显示全部(不包含未付款)</asp:ListItem>
                <asp:ListItem Value="1">生效中</asp:ListItem>
                <asp:ListItem Value="2">已过期</asp:ListItem>
                <asp:ListItem Value="3">未付款</asp:ListItem>
            </asp:RadioButtonList> </span></span>
    <div id="tab3">
        <div id="viewDiv" runat="server">

            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" RowStyle-CssClass="tdbg"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand"
             CellPadding="2" CellSpacing="1" Width="100%" OnRowCancelingEdit="EGV_RowCancelingEdit" PageSize="10"
            GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField HeaderText="序号" DataField="ID" ReadOnly="true" />
                    <asp:TemplateField HeaderText="品名">
                        <ItemTemplate>
                           <%#Eval("ProName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="金额" DataField="AllMoney"/>
                    <asp:BoundField HeaderText="绑定主机" DataField="Internalrecords"/>
                    <asp:TemplateField HeaderText="购买日期">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem,"AddTime", "{0:yyyy年M月d日}") %>
                            <div id="more_div"  class="border more">
                                <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF();">关闭</span>备注信息</div>
                                <%#Eval("OrderMessage") %>
                            </div>
                            <div id="more_div2" class="border more">
                                  <div class="moreTitle"><span class="closeSpan" onclick="HideMoreF();">关闭</span>官方标记</div><%#Eval("Internalrecords") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="到期日期">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem,"EndTime", "{0:yyyy年M月d日}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%#IsExpire(Eval("EndTime")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="备注信息">
                        <ItemTemplate>
                            <div style="width:100px;cursor:pointer;" onclick="ShowMoreF(this,'more_div');"><%#GetMessage(Eval("OrderMessage")) %></div>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="官方标记">
                          <ItemTemplate>
                               <div style="width:100px;cursor:pointer;" onclick="ShowMoreF(this,'more_div2');"><%#GetMessage(Eval("Internalrecords")) %></div>
                          </ItemTemplate>
                          </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="UserRen.aspx?OrderNo=<%#Eval("OrderNo") %>">续费</a>
                            <a href="/Shop.aspx?ID=<%#Eval("ProID") %>" target="_viewDetail">查看详情</a>
                        </ItemTemplate>
                     </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" Visible="false">
                         <ItemTemplate>
                            <a href="/OrderOver.aspx?OrderCode=<%#Eval("OrderNo") %>">完成支付</a>
                            <a href="/Shop.aspx?ID=<%#Eval("ProID") %>" target="_viewDetail">查看详情</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </ZL:ExGridView> </div>
    </div>
    </div>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        .more {width:400px;height:300px;position:absolute;display:none;top:100px;border-radius:3px;}
        .moreTitle {text-align:center;background-color:#08C;font-family:'Microsoft YaHei';font-size:14px;color:white;}
        .closeSpan {float:right;margin-right:10px;cursor:pointer; }
    </style>
    <script type="text/javascript">
        function ShowMoreF(obj,id)//more_div,more_div2
        {
            $(".more").hide();
            $(obj).parent().parent().find("#" + id).show();
        }
        function HideMoreF()
        {
            $(".more").hide();
        }
    </script>
</asp:Content>