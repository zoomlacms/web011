<%@ page language="C#" autoeventwireup="true" inherits="manage_User_VideoUserManage, App_Web_ub3q0ybo" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>用户管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div>
    <table width="100%" cellspacing="1" cellpadding="0" class="border table-striped table-bordered table-hover ">
      <tr class="tdbg">
        <td align="center" class="tdbgleft" style="height: 24px; width:8%; font-weight:bold">ID</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">用户名</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">用户积分</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">用户经验</td>
        <td align="center" class="tdbgleft" style="height:24px;   font-weight:bold">用户等级</td>
        <td align="center" class="tdbgleft" style="height:24px;   font-weight:bold">用户人气</td>
        <td align="center" class="tdbgleft" style="height:24px;   font-weight:bold">时间</td>
        <td align="center" class="tdbgleft" style="height: 24px;  font-weight: bold">操作</td>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="center" style="height: 24px;"><%#Eval("id")%></td>
            <td align="center" style="height: 24px;"><a href="Userinfo.aspx?id=<%# Eval("UserID") %>"><%#GetUserName(Eval("UserID","{0}"))%></a></td>
            <td align="center" style="height: 24px;"><%#Eval("Score")%></a></td>
            <td align="center" style="height: 24px;"><%#Eval("Experience")%></td>
            <td align="center" style=" height:24px;"><%#GetUserType(Eval("UserID", "{0}"))%></td>
            <td align="center" style=" height:24px;"><%#Eval("UserFall")%></td>
            <td align="center" style=" height:24px;"><%#Eval("GradeEndTime")%></td>
            <td align="center" style="height: 24px;"><a href="?menu=delete&id=<%#Eval("id")%>" onclick="return confirm('确实要删除此信息吗？');">删除</a></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr class="tdbg">
        <td align="center" class="tdbg" style="height: 24px;" colspan="8"> 共
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
          页
          <asp:Label ID="pagess" runat="server" Text="" />
          条信息/页 转到第
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
          页 </td>
      </tr>
    </table>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
</asp:Content>


