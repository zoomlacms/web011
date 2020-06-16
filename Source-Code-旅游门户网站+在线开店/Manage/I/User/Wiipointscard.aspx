<%@ page language="C#" autoeventwireup="true" inherits="manage_User_Wiipointscard, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>管理员设置</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation"> <span style="float: right; background: url(../../../Images/ModelIcon/edit.gif) no-repeat left; padding-left: 20px;"></span></div>
  <div>
    <table id="EGV" class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td align="center" colspan="6" class="title" width="100%">点卡管理</td>
      </tr>
      <tr class="tdbg">
        <td align="center" class="tdbgleft" style="height: 24px; width:8%; font-weight:bold">ID</td>
        <td align="center" class="tdbgleft" style="height:24px;  font-weight:bold">使用者</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">点卡号</td>
        <td align="center" class="tdbgleft" style="height: 24px; font-weight: bold">点卡数</td>
        <td align="center" class="tdbgleft" style="height:24px;   font-weight:bold">有效期</td>
        <td align="center" class="tdbgleft" style="height: 24px;  font-weight: bold">操作</td>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <tr>
            <td align="center" style="height: 24px;"><%#Eval("ID")%></td>
            <td align="center" style=" height:24px;"><%#GetName(Eval("UserID","{0}"))%></td>
            <td align="center" style="height: 24px;"><%#Eval("Wiipoincry")%></td>
            <td align="center" style="height: 24px;"><%#Eval("WiipoinNum")%></td>
            <td align="center" style=" height:24px;"><%#Eval("WiipoinTime")%></td>
            <td align="center" style="height: 24px;"><a href="?menu=delete&id=<%#Eval("id")%>" onclick="return confirm('确实要删除此信息吗？');">删除</a></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr class="tdbg">
        <td align="center" class="tdbg" style="height: 24px;" colspan="6"> 共
          <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
          条信息
          <asp:Label ID="Toppage" runat="server" Text="" />
          <asp:Label ID="Nextpage" runat="server" Text="" />
          <asp:Label ID="Downpage" runat="server" Text="" />
          <asp:Label ID="Endpage" runat="server" Text="" />
          页次：
          <asp:Label ID="Nowpage" runat="server" Text="" />
          /
          <asp:Label ID="PageSize" runat="server"
                Text="" />
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
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
 <script>HideColumn("2,3,4");</script>
</asp:Content>
