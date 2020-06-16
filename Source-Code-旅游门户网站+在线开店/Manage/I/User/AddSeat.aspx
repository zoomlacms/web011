<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddSeat, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>客服信息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div>
    <table class="table table-striped table-bordered table-hover">
      <tr>
        <td align="center" colspan="2" class="spacingtitle"><b> <%=SeatType %></b></td>
      </tr>
      <tr>
        <td width="25%" align="right" class="tdbgleft" style=" line-height:35px;"><strong>席位名称：</strong></td>
        <td><asp:TextBox ID="txtSeat" runat="server" class="form-control" style="max-width:350px;"></asp:TextBox></td>
      </tr>
      <tr>
        <td width="25%" align="right" class="tdbgleft"style="line-height:35px;"><strong>客服人员：</strong></td>
        <td><asp:DropDownList ID="ddlAdmin" runat="server" DataTextField="AdminName" DataValueField="AdminID" class="btn btn-default dropdown-toggle"> </asp:DropDownList></td>
      </tr>
      <tr>
        <td width="25%" align="right" class="tdbgleft"style="line-height:35px;"><strong>显示位置：</strong></td>
        <td><asp:DropDownList ID="ddlIndex" runat="server" class="btn btn-default dropdown-toggle"> </asp:DropDownList></td>
      </tr>
      <tr>
        <td width="25%" align="right" class="tdbgleft"><strong>默认客服：</strong></td>
        <td>
            <input runat="server" type="checkbox" id="RadioButtonList1" class="switchChk" checked="checked" />
        </td>
      </tr>
      <tr class="tdbg">
        <td colspan="2" align="center"><asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="提 交" OnClick="Button1_Click" />
          <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="取消" CausesValidation="false"  onclick="Button2_Click" /></td>
      </tr>
    </table>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
