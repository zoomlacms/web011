<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_Default, App_Web_uaxbugcv" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>信息管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td align="left">&nbsp;<a href="SiteWx.aspx">网站响应</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="AddWx.aspx">预设响应</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a href="AddGraphic.aspx?Type=3">多图文</a>
            </td>
        </tr>
    </table>
    <div class="clearbox">
    </div>
    <table class="table table-striped table-bordered table-hover" id="EGV">
        <tr class="tdbg">
            <th>选择 </th>
            <th>ID</th>
            <th>判断关键字</th>
            <th>消息类别</th>
            <th>接收信息类型</th>
            <th>回复信息类型</th>
            <th>操作</th>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="lbtn_Click">
            <ItemTemplate>
                <tr align="center" ondblclick="javascript:location.href='AddWx.aspx?ID=<%#Eval("ID") %>'" style="cursor: pointer;">
                    <td>
                        <input type="checkbox" /></td>
                    <td><%#Eval("ID") %></td>
                    <td><%#Eval("Keys") %></td>
                    <td><%#GetLabelType(Eval("Type").ToString()) %> </td>
                    <td><%#GetGetType(Eval("GetType").ToString()) %>  
                    </td>
                    <td><%#GetMsgType(Eval("MsgType").ToString()) %>  </td>
                    <td><a href="<%#GetUrl(Eval("Type").ToString(),Eval("Keys").ToString(),Eval("ID").ToString()) %> ">修改 </a>|
                        <asp:LinkButton ID="lbtn" CommandArgument="Del" CommandName='<%#Eval("ID")%>' runat="server" Text="删除"> </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td align="center" class="tdbgleft">

                <asp:CheckBox ID="cbAll" runat="server" Font-Size="9pt" Text="" onclick="CheckAll(this)" /></td>
            <td height="24" colspan="6" align="center" class="tdbgleft">
                <div style="float: left; width: 100px; text-align: left; padding-left: 0.8%;">
                    <asp:Button ID="Button1" class="btn btn-primary" Font-Size="9pt" Text="删除" runat="server" OnClientClick="if(!IsSelectedId()){alert('未选中任何内容');return false;}else{return confirm('你确定要删除选中内容吗？')}" OnClick="Button1_Click" />
                </div>
                共
                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条信息
                <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：
                <asp:Label ID="Nowpage" runat="server" Text="" />
                /
                <asp:Label ID="PageSize" runat="server" Text="" />
                页 <span style="text-align: center">
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                </span>条信息/页  转到第
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                页 </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        HideColumn("4,5");
    </script>
</asp:Content>