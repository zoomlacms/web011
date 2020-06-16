<%@ page language="C#" autoeventwireup="true" inherits="manage_ZoneStyleManage_StoreStyleManage, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>空间模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td width="3%" class="text-center">
                </td>
            <td width="12%" class="text-center"><span>模板缩略图</span></td>
            <td width="12%" class="text-center"><span>模板名称</span></td>
            <td width="7%" class="text-center"><span>模板状态</span></td>
            <td width="8%" class="text-center"><span>操作</span></td>
        </tr>
        <asp:Repeater ID="Productlist" runat="server">
            <ItemTemplate>
                <tr>
                    <td class="text-center">
                        <input name="Item" type="checkbox" value='<%# Eval("ID")%>' /></td>
                    <td class="text-center">
                        <asp:Image ID="img2" runat="server" Width="50" Height="50" ImageUrl='<%#GetImg(DataBinder.Eval(Container.DataItem, "ID").ToString())%>' /></td>
                    <td class="text-center"><%#DataBinder.Eval(Container.DataItem, "StyleName")%></td>
                    <td class="text-center"><%#GetState(DataBinder.Eval(Container.DataItem, "StyleState").ToString())%></td>
                    <td class="text-center">
                        <a href="zoneStyleEdit.aspx?id=<%#Eval("ID")%>">修改</a>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%#Eval("ID")%>' OnClick="Button1_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td colspan="5" class="text-center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
                    <asp:Label ID="pagess" runat="server" Text="" />个/页
                    转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>页
            </td>
        </tr>
        <tr>
            <td style="text-align:center"><input id="Checkall" type="checkbox" onclick="javascript: CheckAll(this);" /></td>
            <td colspan="4">
                <asp:Button ID="SaveBtn" runat="server" class="btn btn-primary" Text="设为启用" CommandName="1" OnClick="SaveBtn_Click" />
                <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="设为停用" CommandName="0" OnClick="SaveBtn_Click" />
                <asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="批量删除" CommandName="5" OnClick="SaveBtn_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
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
    </script>
</asp:Content>
