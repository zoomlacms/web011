<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.AddRole, App_Web_pwpbtctt" title="添加角色" enableeventvalidation="false" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" viewStateEncryptionMode="Never" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加角色</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">  
    <!--<div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>-->
    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
        <asp:HiddenField runat="server" ID="Literal1_Hid" Value="添加角色" />
  <table width="100%" cellspacing="1" cellpadding="0" class="table table-striped table-bordered table-hover" align="center">
    <tr style="display:none;">
      <td align="center" class="spacingtitle" colspan="2" style="height: 22px"><asp:Literal ID="LblTitle" Text="添加角色"  runat="Server"></asp:Literal></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" align="right" style="width:15%" valign="middle"> 角色名：</td>
      <td><asp:TextBox ID="txbRoleName" runat="server" class="form-control" style="max-width:350px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbRoleName"
                    Display="Dynamic" ErrorMessage="角色名不能为空">*</asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvRole" runat="server" ControlToValidate="txbRoleName" Display="Dynamic" ErrorMessage="角色名已经存在" OnServerValidate="CustomValidator1_ServerValidate"  Visible="False">*</asp:CustomValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td align="right" class="tdbgleft" style="width:15%" valign="middle">角色描述：</td>
      <td align="left" style=" valign="middle"><asp:TextBox ID="tbRoleInfo" class="form-control" runat="server" style="max-width:350px;" TextMode="MultiLine"></asp:TextBox></td>
    </tr>
  </table>
<div style="padding-left:15%">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:Button ID="btnSave" runat="server" Text="保存角色"  OnClick="Button2_Click" class="btn btn-primary" />
    <asp:Button ID="btnBack" class="btn btn-primary"  runat="server" Text="返回角色管理"  OnClientClick="location.href='RoleManage.aspx';return false;" />
</div>
        </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>



 
 
