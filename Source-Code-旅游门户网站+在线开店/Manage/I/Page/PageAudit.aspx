<%@ page language="C#" autoeventwireup="true" inherits="manage_Page_PageAudit, App_Web_0fbyacen" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>管理企业黄页</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="usertype" runat="server" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tabs">
            <tr>
                <td>
                    <span class="pull-left">快速查找：
                        <asp:DropDownList ID="quicksouch" CssClass="form-control" Width="150" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="1">所有企业黄页</asp:ListItem>
                            <asp:ListItem Value="2">待审核企业黄页</asp:ListItem>
                            <asp:ListItem Value="3">已审核企业黄页</asp:ListItem>
                        </asp:DropDownList>
                    </span>
                    <span class="pull-left">
                        黄页查询：
                        <asp:DropDownList ID="modefileds" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
                    </span>
                    <div class="pull-left">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="keyword" class="form-control" onkeydown="return GetEnterCode('click','Button7');" placeholder="请输入需要搜索的内容" />
                            <span class="input-group-btn">
                                <asp:Button ID="Button7" runat="server" Text="Button" Style="display: none;" />
                                <asp:LinkButton runat="server" CssClass="btn btn-default" ID="Button1"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                            </span>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr>
                <td align="center" class="title" width="5%">
                    </td>
                <td align="center" class="title" width="10%">
                    <span class="tdbgleft">黄页ID</span></td>
                <td align="center" class="title" width="25%"><span class="tdbgleft">用户名</span></td>
                <td align="center" class="title"><span class="tdbgleft">黄页名称</span></td>
                <td align="center" class="title" width="30%">
                    <span style="background-color: #e0f7e5; width: 30%">操作</span></td>
            </tr>
            <asp:Repeater ID="Pagetable" runat="server">
                <ItemTemplate>
                    <tr id="<%#Eval("ID") %>" ondblclick="getinfo(this.id)">
                        <td height="24" align="center">
                            <input name="Item" type="checkbox" value="<%#Eval("ID")%>" /></td>
                        <td height="24" align="center"><%#Eval("ID")%></td>
                        <td height="24" align="center"><a href="PageTemplate.aspx?id=<%#Eval("ID")%>"><%#Eval("UserName")%></a></td>
                        <td height="24" align="center"><%#Eval("CompanyName")%></td>
                        <td height="24" align="center"><a href="AuditUser.aspx?menu=view&id=<%#Eval("ID") %>">查看资料</a>　<a href="?menu=del&id=<%#Eval("ID") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>　<a href="PageTemplate.aspx?id=<%#Eval("ID")%>">用户栏目管理</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td style="text-align:center"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                <td colspan="11" align="center" class="tdbgleft" style="height: 24px">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条信息 
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged" Width="30px"></asp:TextBox>条信息/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>页
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                </td>
            </tr>
        </tbody>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <asp:DropDownList ID="act" CssClass="form-control" Width="150" runat="server">
                    <asp:ListItem Selected="True" Value="0">选择操作</asp:ListItem>
                    <asp:ListItem Value="1">批量审核</asp:ListItem>
                    <asp:ListItem Value="2">取消审核</asp:ListItem>
                    <asp:ListItem Value="3">批量删除</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button2" class="btn btn-primary" runat="server" OnClick="Button2_Click" Text="执行操作" />
                <asp:HiddenField ID="modelids" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function getinfo(id) {
            location.href = 'PageTemplate.aspx?id=' + id;
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
    </script>
</asp:Content>
