<%@ page language="C#" autoeventwireup="true" inherits="manage_User_VideoHall, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加房间</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td align="center" class="title" width="20%"> 大厅名称 </td>
      <td align="center" class="title" width="20%"> 房间数量 </td>
      <td align="center" class="title" width="10%"> 排序编号 </td>
      <td align="center" class="title" width="25%"> 说明 </td>
      <td align="center" class="title" width="30%"> 操作 </td>
    </tr>
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="rptypelist_ItemDataBound">
      <ItemTemplate>
        <tr>
          <td align="center" width="20%"><a style='color:blue' href='VideoRoom.aspx?hid=<%#Eval("Id") %>'><%#Eval("Name") %></a></td>
          <td align="center" width="20%"><%#GetRoomNumByHallId(ZoomLa.Common.DataConverter.CLng( Eval("Id").ToString()))%></td>
          <td align="center" width="5%"><%#Eval("OrderNum")%></td>
          <td align="center" width="25%"><%#Eval("Remark")%></td>
          <td align="center" width="30%"><a href="AddvideoRoom.aspx?hid=<%#Eval("ID") %>">添加房间</a> <a href="AddVideohall.aspx?menu=edit&id=<%#Eval("ID") %>"> 修改</a> <a href="?menu=delete&id=<%#Eval("ID") %>" onclick="return confirm('所属房间也会删除，你确定要删除此大厅:[<%#Eval("Name") %>] 吗？')"> 删除</a></td>
        </tr>
      </ItemTemplate>
    </asp:Repeater>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
