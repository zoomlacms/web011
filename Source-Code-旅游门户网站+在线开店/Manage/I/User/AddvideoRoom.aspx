<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddvideoRoom, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>多人视频管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
   <asp:HiddenField runat="server" ID="Literal1_Hid" Value="添加房间" />
     <table class="table table-striped table-bordered table-hover">
      <tr>
        <td align="center" class="spacingtitle" colspan="2" style="height: 22px"><asp:Literal ID="LblTitle" Text="添加房间" runat="Server"></asp:Literal></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" align="right" valign="middle" style="width:30%"> 房间名称： </td>
        <td style="width: 100px"><asp:TextBox ID="txt_RoomName" runat="server" class="form-control" style="max-width:200px;"></asp:TextBox></td>
      </tr>
      <tr>
        <td class="tdbgleft" align="right" valign="middle"> 最大人数限制： </td>
        <td style="width: 100px"><asp:TextBox ID="txt_MaxPerson" runat="server" class="form-control" style="max-width:200px;float:left;" Text="0"></asp:TextBox>
          0为无限制 </td>
      </tr>
      <tr >
        <td class="tdbgleft" align="right" valign="middle"> 排列顺序： </td>
        <td style="width: 100px"><asp:TextBox ID="txt_OrderNum" runat="server" class="form-control" style="max-width:200px;" Text="0"></asp:TextBox></td>
      </tr>
      <tr >
        <td class="tdbgleft" align="right" valign="middle"> 是否设置房间密码：</td>
        <td style="width: 100px">
          <asp:RadioButtonList ID="IsPassword" runat="server" RepeatDirection="Horizontal" 
                AutoPostBack="true" onselectedindexchanged="IsPassword_SelectedIndexChanged">
             <asp:ListItem Value="1">是</asp:ListItem>
             <asp:ListItem Selected="True"  Value="0">否</asp:ListItem>
          </asp:RadioButtonList>
        </td>
      </tr>
      <tr class="tdbg" id="password" runat="server" visible="false">
        <td class="tdbgleft" align="right" valign="middle"> 房间密码： </td>
        <td style="width: 100px"><asp:TextBox ID="TxtPassword"  runat="server" class="form-control" style="max-width:200px;"></asp:TextBox><asp:RequiredFieldValidator
                ID="ReqTxtPassword" runat="server" ControlToValidate="TxtPassword" SetFocusOnError="false" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator></td>
      </tr>
      <tr >
        <td class="tdbgleft" align="right" valign="middle"> 视频服务器地址：(不填将使用系统默认服务器) </td>
        <td style="width: 100px"><asp:TextBox ID="txt_VideoServer" runat="server" class="form-control" style="max-width:400px;" ></asp:TextBox></td>
      </tr>
      <tr>
        <td class="tdbgleft" align="right"> 管理员：<font color="red">(多个管理员用逗号,隔开)</font></td>
        <td style="width: 100px"><asp:TextBox ID="txt_Manager" runat="server" class="form-control" style="max-width:400px;"></asp:TextBox></td>
      </tr>
      <tr>
        <td class="tdbgleft" align="right">
          主持人：
          <font color="red">(多个主持人用逗号,隔开)</font>
        </td>
        <td style="width: 100px"><asp:TextBox ID="txt_VideoUser" runat="server" class="form-control" style="max-width:400px;"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="right" class="tdbgleft" style="height: 20px" valign="middle"> 房间描述： </td>
        <td align="left" style="width: 100px; height: 20px" valign="middle"><asp:TextBox ID="txt_Remark" class="form-control" style="max-width:400px;" runat="server" Height="81px" TextMode="MultiLine"></asp:TextBox></td>
      </tr>
      <tr>
        <td align="center" class="tdbgleft" colspan="2"><asp:Button ID="btnSave" runat="server" Text="添加房间" OnClick="Button2_Click" class="btn btn-primary" />
          <asp:Button ID="btnBack" class="btn btn-primary" runat="server" Text="返回房间列表"  OnClientClick="location.href='VideoRoom.aspx';return false;" /></td>
      </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="../../../JS/Dialog.js"></script>
    <script type="text/jscript" language="javascript">
    </script>
</asp:Content>
