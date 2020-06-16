<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AdminDetail, App_Web_ub3q0ybo" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>管理员预览</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
      <tr align="center">
        <td id="TabTitle0" class="titlemouseover" onclick="ShowTabss(0)"> 基本信息 </td>
        <td id="TabTitle1" class="tabtitle" onclick="ShowTabss(1)"> 角色设置 </td>
        <td id="TabTitle2" class="tabtitle" onclick="ShowTabss(2)"> 审核权限 </td>
      </tr>
    <tr>
      
    <tbody id="Tabs0">
      <tr>
        <td class="tdbgleft" style="width: 25%; height: 23px; text-align:right;" valign="middle"><strong>管理员名：</strong></td>
        <td style="height: 23px" colspan="2"><asp:Label ID="tbdName" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td class="tdbgleft" style="width: 25%; height: 23px; text-align:right;" valign="middle"><strong>真实姓名：</strong></td>
        <td style="height: 23px"colspan="2"><asp:Label ID="txtAdminTrueName" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr>
        <td class="tdbgleft" style="width:25%; text-align:right;" valign="middle"><strong>选项设置：</strong></td>
        <td colspan="2"><asp:Label ID="cb1" runat="server" Text="Label"></asp:Label>
          <asp:Label ID="cb2" runat="server" Text="Label"></asp:Label>
          <asp:Label ID="cb3" runat="server" Text="Label"></asp:Label>
     
    </tbody>
    <tbody id="Tabs1" style=" display:none">
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" style="width:25%; text-align:right;"><strong>&nbsp;管理员角色：</strong></td>
        <td align="left" valign="top" colspan="2"><asp:Label ID="cblRoleList1" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" style="width:25%; text-align:right;"><strong>&nbsp;默认节点控制权限：</strong></td>
        <td align="left" valign="top" colspan="2"><asp:Label ID="DropDownList11" runat="server" Text="Label"></asp:Label></td>
      </tr>
    </tbody>
    <tbody id="Tabs2" style=" display:none">
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" style="width:25%; text-align:right;"><strong>&nbsp;是否前台审核互动：</strong></td>
        <td align="left" valign="top" colspan="2"><asp:Label ID="CheckBox1" runat="server" Text="Label"></asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" style="width:25%; text-align:right;"><strong>&nbsp;发布内容默认状态：</strong></td>
        <td align="left" valign="top" colspan="2"><asp:Label ID="DefaultStart1" runat="server" Text="Label"></asp:Label></td>
      </tr>
    </tbody>
    <tr class="tdbg">
      <td class="tdbgleft" colspan="3" style="height: 23px" align="center"><asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="重新修改" />
        <asp:Button ID="btnAdd" runat="server" class="btn btn-primary" Text="继续添加管理员" onclick="btnAdd_Click" />
        &nbsp;
        <asp:Button ID="btnList" class="btn btn-primary" runat="server" Text="返回列表" OnClientClick="location.href='AdminManage.aspx';return false;" />
        &nbsp;</td>
    </tr>
  </td>
  </tr>
  </table>
  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" language="javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2");
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
            }
        }
    </script>
</asp:Content>
