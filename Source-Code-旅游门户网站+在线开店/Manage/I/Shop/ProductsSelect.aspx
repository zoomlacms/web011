<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_ProductsSelect, App_Web_2afsdgkd" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>选择商品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="title">
            <td align="left">
                <b>产品列表：</b></td>
            <td align="right">
                <asp:TextBox ID="TxtKeyWord" class="l_input" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-primary" ID="BtnSearch" runat="server" Text="查找" OnClick="BtnSearch_Click" />
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table class="table table-striped table-bordered table-hover">
                    <tr class="tdbgleft">
                        <td width="5%" height="24" align="center"><strong>ID</strong></td>
                        <td width="10%" height="24" align="center"><strong>商品图片</strong></td>
                        <td width="40%" height="24" align="center"><strong>商品名称</strong></td>
                        <td width="35%" height="24" align="center"><strong>商品零售价</strong></td>
                    </tr>
                    <asp:Repeater ID="Pagetable" runat="server">
                        <ItemTemplate>
                            <tr class="tdbg">
                                <td height="24" align="center"><%#Eval("ID") %></td>
                                <td height="24" align="center"><%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></td>
                                <td height="24" align="left"><span onclick="GetCheckvalue('Pronames<%#Eval("ID") %>','Item<%#Eval("ID") %>')" style="cursor: hand"><u><%#Eval("Proname") %></u></span><input type="hidden" id="Pronames<%#Eval("ID") %>" value="<%#Eval("Proname") %>" /><input type="hidden" id="Item<%#Eval("ID") %>" value="<%#Eval("ID") %>" />
                                </td>
                                <td height="24" align="center"><%#Eval("LinPrice","{0:c}")%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr class="tdbg">
                        <td class="tdbgleft" colspan="6" align="center">共
                            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            条信息 
                            <asp:Label ID="Toppage" runat="server" Text="" />
                            <asp:Label ID="Nextpage" runat="server" Text="" />
                            <asp:Label ID="Downpage" runat="server" Text="" />
                            <asp:Label ID="Endpage" runat="server" Text="" />
                            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
                            <asp:Label ID="pagess" runat="server" Text="" />条信息/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            </asp:DropDownList>页
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
               <%-- <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="添加捆绑" OnClientClick="GetCheckvalue();return false;" />--%>
                <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="取消添加" OnClientClick="window.close();return false;" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function GetCheckvalue(name, itemid) {
            var spanChk = window.document.getElementById(name);
            var itemsid = window.document.getElementById(itemid);

            opener.document.getElementById("Productsname<%=Request.QueryString["act"]%>").value = spanChk.value;
            opener.document.getElementById("HiddenField<%=Request.QueryString["act"]%>").value = itemsid.value;
            window.close();
        }
    </script>
</asp:Content>
