<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_ConstPassen, App_Web_wp4exovk" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>常用客户管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">常用客户管理<a href="AddConstPassen.aspx">[添加客户]</a></li>
    </ol>
    <table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="7" class="text-center">我的常用客户</td>
        </tr>
        <tr>
            <td width="14%" height="24" align="center">
                <asp:CheckBox ID="CheckBox1" onclick="CheckAll(this)" runat="server" /></td>
            <td align="center" width="14%">姓名 </td>
            <td align="center" width="14%">手机号码/联系电话 </td>
            <td align="center" width="14%">证件类型 </td>
            <td align="center" width="14%">身份证号码 </td>
            <td align="center" width="14%">性别 </td>
            <td width="14%" align="center">操作 </td>
        </tr>
        <asp:Repeater ID="Manufacturerslist" runat="server">
            <ItemTemplate>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                    id="<%#Eval("id") %>" ondblclick="Getinfo(this.id)">
                    <td height="24" align="center">
                        <input name="Item" type="checkbox" value="<%#Eval("id") %>"></td>
                    <td height="24" align="center"><%#Eval("Name")%></td>
                    <td height="24" align="center"><%#Eval("Mobile")%></td>
                    <td height="24" align="center"><%#GetCardType(Eval("CreID","{0}"))%></td>
                    <td height="24" align="center"><%#GetCardCode(Eval("CreID","{0}"))%></td>
                    <td height="24" align="center"><%#Eval("Sex")%></td>
                    <td height="24" align="center"><a href="AddConstPassen.aspx?menu=edit&id=<%#Eval("id") %>">修改</a> <a href="?menu=delete&id=<%#Eval("id") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td height="24" colspan="7" align="center" class="tdbgleft">共
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
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                </span>条信息/页  转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                页 </td>
        </tr>
        <tr>
            <td colspan="7">
                <asp:Button ID="Button1" class="btn btn-primary" Text="批量删除" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？');}" OnClick="Button1_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
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
        function Getinfo(id) {
            location.href = "AddConstPassen.aspx?menu=edit&id=" + id + "";
        }
    </script>
</asp:Content>
