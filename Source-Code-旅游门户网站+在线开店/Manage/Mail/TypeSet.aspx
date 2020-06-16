<%@ page language="C#" autoeventwireup="true" inherits="manage_Mail_TypeSet, App_Web_0vozbcrl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>类别</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
    <div id="help"> <a onclick="help_show('110')" title="帮助"></a></div>
<%} %>  后台管理&gt;&gt;用户管理&gt;&gt;<a href="../User/MailList.aspx" >邮件发送</a>&gt;&gt;<a href="Mail.aspx">邮箱列表</a>&gt;&gt;类别列表 [<a href="MailSet.aspx">添加邮箱</a>] [<a href="MailType.aspx">添加类别</a>]</div>
        <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr class="gridtitle" align="center" style="height: 25px;"><th>ID</th><th  >类别名称</th><th>操作</th></tr> 
<asp:Repeater ID="Repeater1" runat="server"  OnItemCommand="Lnk_Click" >
<ItemTemplate>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" ondblclick="location.href('MailType.aspx?Type=<%#Eval("ID") %>')" >
    <td align="center" title="双击修改" style="cursor: pointer"><%#Eval("ID") %></td>
    <td align="center" title="双击修改" style="cursor: pointer" width="450"><%#Eval("TypeName") %></a></td>
<td width="450" align="center" title="双击修改" style="cursor: pointer">
    <a href="MailType.aspx?Type=<%#Eval("ID") %>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteAdmin" OnClientClick=" return confirm('将删除类别下的全部邮箱信息！确实要删除此类别吗？');" CommandArgument='<%# Eval("ID")%>'>删除</asp:LinkButton> </td></tr> 
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
        <td style="height: 22px; text-align: center;" colspan="6" class="tdbgleft">
          <span style="text-align: center">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="26px"
                Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </span>
        </td>
      </tr>
</table>
    </form>
</body>
</html>
