<%@ page language="C#" autoeventwireup="true" inherits="manage_User_VideoRoom, App_Web_ub3q0ybo" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加大厅</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered table-hover">
    <tr class="tdbg" style="height: 26px">
      <td align="center" class="title" width="20%"> 房间名称 </td>
      <td align="center" class="title" width="20%"> 大厅名称 </td>
      <td align="center" class="title" width="10%"> 排序编号 </td>
      <td align="center" class="title" width="25%"> 说明 </td>
      <td align="center" class="title" width="30%"> 操作 </td>
    </tr>
    <asp:Repeater ID="Repeater2" runat="server">
      <ItemTemplate>
        <tr class="tdbg" style="height: 26px">
          <td align="center" width="20%"><%#Eval("RoomName")%></td>
          <td align="center" width="20%"><a style='color:Blue' href='VideoHall.aspx?hid=<%#Eval("VideoHallId") %>'><%#GetHallNameByRoomId(ZoomLa.Common.DataConverter.CLng( Eval("ID").ToString()))%></a></td>
          <td align="center" width="5%"><%#Eval("OrderNum")%></td>
          <td align="center" width="25%"><%#Eval("Remark")%></td>
          <td align="center" width="30%"><a href="AddvideoRoom.aspx?menu=edit&id=<%#Eval("id")%>&hid=<%#Eval("VideoHallId") %>">修改</a> <a href="?menu=delete&id=<%#Eval("id") %>" onclick="return confirm('你确定要删除房间:[<%#Eval("RoomName")%>] 吗？')">删除</a></td>
        </tr>
      </ItemTemplate>
    </asp:Repeater>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
