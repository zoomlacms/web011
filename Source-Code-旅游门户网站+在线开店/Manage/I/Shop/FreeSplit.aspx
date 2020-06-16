<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_FreeSplit, App_Web_enu4lwhk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>自由拆分</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
  <tr>
    <td width="5%" align="center" class="title" >选择</td>
    <td width="10%" align="center" class="title">图片</td>
    <td width="18%" align="center" class="title">商品名称</td>
    <td width="6%" align="center" class="title">单位</td>
    <td width="6%" align="center" class="title">数量</td>
    <td width="6%" align="center" class="title">市场价</td>
    <td width="6%" align="center" class="title">实价</td>
    <td width="6%" align="center" class="title">指定价</td>
    <td width="6%" align="center" class="title">金额</td>
    <td width="8%" align="center" class="title">服务期限</td>
    <td width="12%" align="center" class="title">备注</td>
  </tr>
  <asp:Repeater ID="procart" runat="server">
    <ItemTemplate>
        <tr>
           <td align="center"><input name="Item" type="checkbox" value='<%# Eval("ProID")%>' /></td>
            <td height="24" align="center">
            <%#getproimg(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
            </td>
            <td align="center">
            <a href='http://<%#Eval("proname") %>' target='_blank'> 
                <%#Getprotype(Eval("ProID","{0}"))%>
                <%#Eval("proname")%>
                </a>
            </td>
            <td width="6%" align="center">
                <%#Eval("Danwei") %>
            </td>
            <td width="6%" align="center">
                <%#Eval("pronum") %>
            </td>
            <td width="6%" align="center">
                <%#getjiage(Eval("proclass","{0}"),"1", DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
            </td>
            <td width="6%" align="center">
                <%#getshichangjiage(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
            </td>
            <td width="6%" align="center">
                <%#shijia(Eval("proclass", "{0}"), Eval("ProID", "{0}"), DataBinder.Eval(Container, "DataItem.Shijia", "{0}"))%>
            </td>
            <td width="6%" align="center">
                <%#getprojia(Eval("ProID", "{0}"), DataBinder.Eval(Container, "DataItem.ID", "{0}"))%>
            </td>
            <td width="8%" align="center">
                <%#qixian(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
            </td>
            <td align="center">
                <%#beizhu(DataBinder.Eval(Container, "DataItem.ProID", "{0}"))%>
            </td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td height="24" align="center">
                        <%#getproimg(Eval("id","{0}"))%>
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
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </ItemTemplate>
  </asp:Repeater>
</table>
<div>是否保存原订单：<asp:RadioButton ID="CB_Yes" runat="server" GroupName="oldorder"  Text="是"  />
    <asp:RadioButton ID="CB_No" runat="server" GroupName="oldorder" Text="否" Checked="True" />
</div>
  <asp:Button Text="确定" ID="confirm" CssClass="btn btn-primary" runat="server"  onclick="confirm_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>