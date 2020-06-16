<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddVideohall, App_Web_ub3q0ybo" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>多人视频管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField runat="server" ID="Literal1_Hid" Value="" />
  <table class="table table-striped table-bordered table-hover">
    <tr  style="display:none;">
      <td align="center" class="spacingtitle" colspan="2" style="height: 22px"><asp:Literal ID="LblTitle" Text="添加大厅" runat="Server"></asp:Literal></td>
    </tr>
    <tr>
      <td class="leftwidth" align="right" width="25%"> 大厅名称： </td>
      <td style="width: 100px"><asp:TextBox ID="txt_Name" runat="server" class="form-control" Width="196px"></asp:TextBox></td>
    </tr>
    <tr>
      <td class="leftwidth" align="right"> 大厅类别： </td>
      <td style="width: 100px">
      <asp:DropDownList runat="server" ID="HallType">
        <asp:ListItem Value="0">综艺区</asp:ListItem>
        <asp:ListItem Value="1">情感区</asp:ListItem>
        <asp:ListItem Value="2">官方专区</asp:ListItem>
        <asp:ListItem Value="3">财经区</asp:ListItem>
        <asp:ListItem Value="4">游戏区</asp:ListItem>
        <asp:ListItem Value="5">网络教育</asp:ListItem>
        <asp:ListItem Value="6">VIP专区</asp:ListItem>
      </asp:DropDownList>
      </td>
    </tr>
    <tr>
      <td class="leftwidth" align="right"> 最大人数限制(0为无限制)： </td>
      <td style="width: 100px"><asp:TextBox ID="txt_MaxPerson" runat="server" class="form-control" Text="0" Width="76px"></asp:TextBox>
        &nbsp;</td>
    </tr>
    <tr>
      <td class="leftwidth" align="right"> 排序： </td>
      <td style="width: 100px"><asp:TextBox ID="txt_OrderNum" runat="server" class="form-control" Text="0" Width="76px"></asp:TextBox></td>
    </tr>
    <tr>
      <td align="right" class="leftwidth" style="line-height:80px;"> 大厅描述： </td>
      <td align="left" style="width: 100px; height: 20px" valign="middle"><asp:TextBox ID="txt_Remark" class="form-control" style="max-width:450px;" runat="server" Height="100px" TextMode="MultiLine" ></asp:TextBox></td>
    </tr>
    <tr>
      <td align="center" class="tdbgleft" colspan="2"><asp:Button ID="btnSave" runat="server" Text="添加大厅" Width="95px" OnClick="Button2_Click" class="btn btn-primary"/>
        <asp:Button ID="btnBack" class="btn btn-primary" runat="server" Text="返回大厅列表" Width="100px" OnClientClick="location.href='VideoHall.aspx';return false;" /></td>
    </tr>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
