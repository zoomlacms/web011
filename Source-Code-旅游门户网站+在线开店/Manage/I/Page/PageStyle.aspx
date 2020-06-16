<%@ page language="C#" autoeventwireup="true" inherits="manage.Page.PageStyle, App_Web_0fbyacen" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>黄页模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover" id="EGV">
        <tbody id="Tbody1">
            <tr class="tdbg">
                <td  style="width:20px;"></td>
                <td align="center" class="title" style="width:20px;">ID</td>
                <td width="30%" align="center" class="title">样式名称</td>
                <td width="10%" align="center" class="title">启用状态</td>
                <td width="15%" align="center" class="title">默认状态</td>
                <td width="10%" align="center" class="title">排列顺序</td>
                <td width="25%" align="center" class="title">相关操作</td>
            </tr>
            <asp:Repeater ID="Styleable" runat="server">
                <ItemTemplate>
                    <tr class="tdbg" id="<%#Eval("PageNodeid")%>" ondblclick="getinfo(this.id)">
                        <td style="height: 24px" align="center"><input name="Item" type="checkbox" " /></td>
                        <td height="24" align="center"><%#Eval("PageNodeid")%></td>
                        <td height="24" align="left"><%#Eval("PageNodeName")%></td>
                        <td height="24" align="center"><%#getistrue(Eval("isTrue","{0}"))%></td>
                        <td height="24" align="center"><%#getIsDefault(Eval("IsDefault", "{0}"))%></td>
                        <td height="24" align="center"><%#Eval("Orderid", "{0}")%></td>
                        <td height="24" align="center"><a href="AddPageStyle.aspx?menu=edit&sid=<%#Eval("PageNodeid") %>">修改</a>　<a href="?menu=del&id=<%#Eval("PageNodeid") %>" onclick="return confirm('确实要删除此黄页样式吗？删除该样式后前台黄页将无法使用该样式!');">删除</a>　<a href="PageTemplate.aspx?styleid=<%#Eval("PageNodeid") %>">栏目管理</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td style="text-align:center"><input type="checkbox" id="Checkall" onclick="javascript: CheckAll(this);" runat="server" /></td>
                <td height="24" colspan="6" align="center" class="tdbgleft">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    个样式 
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"
        Width="30px"></asp:TextBox>个样式/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        </asp:DropDownList>页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function getinfo(id) {
            location.href = 'PageTemplate.aspx?styleid=' + id;
        }

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
        HideColumn("3,4,5");
    </script>
</asp:Content>