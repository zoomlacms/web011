<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_StructAnalysis, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>分析结构</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<style> 
     .tdbg td,.tdbgmouseover td {padding-left:5px;padding-right:5px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
 <div class="r_navigation">后台管理&gt;&gt; <a href="StructManage.aspx">组织结构</a>  &gt;&gt; 分析结构 </div>
    <div>
    <table width="100%" cellpadding="0" cellspacing="1" class="border" border="0"  >
       <tbody>  <tr  class="gridtitle" align="center" style="height:25px;">
           <td width="5%">ID</td><td>结构名</td><td>成员数</td><td>查看</td></tr>
    <asp:Repeater ID="Repeater1" runat="server"  onitemcommand="Repeat1_ItemCommand">
            <ItemTemplate>
        <tr  class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
           <td  align="center" height="25" ><%#Eval("ID") %></td>
             <td  align="center" ><A href="<%#getUrl(Eval("Group").ToString(), Eval("ID").ToString()) %>"><%#Eval("Name") %></A> </td>
             <td align="center" ><%#GetNums(Eval("ID").ToString()) %></td>
             <td align="center" ><A href="<%#getUrl(Eval("Group").ToString(), Eval("ID").ToString()) %>">查看</A> </td>
        </tr>
         </ItemTemplate>
            </asp:Repeater>
         <tr class="tdbg">
      <td height="24" colspan="77" align="center" class="tdbgleft"> 共
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
        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" ontextchanged="txtPage_TextChanged"></asp:TextBox>
        </span>条信息/页  转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        页 </td>
    </tr>
           <tr> 
        <tr class="tdbg" > <td colspan="2" align="right">结构总数 </td><td colspan="2"> <asp:Label ID="AllCount" runat="server"></asp:Label></td></tr> 
        <tr class="tdbg" > <td colspan="2" align="right">系统结构总数 </td><td colspan="2"> <asp:Label ID="mAllNum" runat="server"></asp:Label></td></tr> 
        <tr class="tdbg" > <td colspan="2" align="right">用户结构总数 </td><td colspan="2"> <asp:Label ID="uAllNum" runat="server"></asp:Label></td></tr> 
       <tr><td colspan="6"><asp:Button ID="del_btn" Text="一键删除结构" runat="server" CssClass="C_input" OnClick="del_Click"  /></td></tr> 
    </table>
    </div>
    </form>
</body>
</html>
