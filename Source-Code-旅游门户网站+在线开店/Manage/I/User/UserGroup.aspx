<%@ page language="C#" autoeventwireup="true" inherits="manage_User_RoomManage, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>用户组管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div>
    <table class="table table-striped table-bordered table-hover">
      <tr align="center" class="title">
        <td width="2%"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
        <td width="10%">用户组ID</td>
        <td width="40%">用户组名称</td>
        <td width="48%" class="title">操作</td>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" id="<%#Eval("ID") %>" ondblclick="ShowTabs(this.id)">
            <td height="22" align="center"><input name="Item" type="checkbox" value='<%#Eval("ID") %>' /></td>
            <td align="center"><%#Eval("ID") %></td>
            <td align="center"><%#Eval("UserGroupName")%></td>
            <td height="22" align="center"><a href="UserGroup.aspx?cid=<%#Eval("ID")%>">修改</a> <a href="?menu=delete&cid=<%#Eval("ID")%>" OnClick="return confirm('确实要删除此学员吗？');">删除</a></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr class="tdbg">
        <td height="22" colspan="4" align="center" class="tdbg"> 共
          <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
          条数据
          <asp:Label ID="Toppage" runat="server" Text="" />
          <asp:Label ID="Nextpage" runat="server" Text="" />
          <asp:Label ID="Downpage" runat="server" Text="" />
          <asp:Label ID="Endpage" runat="server" Text="" />
          页次：
          <asp:Label ID="Nowpage" runat="server" Text="" />
          /
          <asp:Label ID="PageSize" runat="server" Text="" />
          页
          <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"  Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
          条数据/页 转到第
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"> </asp:DropDownList>
          页
          <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator></td>
      </tr>
    </table>
    <div>
      <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;display:inline;" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" Text="批量删除" onclick="Button3_Click" />
    </div>
  </div>
  <table>
    <tr align="center">
      <td class="spacingtitle"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
    </tr>
  </table>
  <table class="table table-striped table-bordered table-hover">
    <tbody id="Tabs0">
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" style="width: 20%" align="right"><asp:Label ID="ssjd_txt" runat="server" Text="用户组名称："></asp:Label>
          &nbsp; </td>
        <td class="bqright"><asp:TextBox ID="txt_Regulationame" runat="server" class="form-control" style="max-width:200px;display:inline;" Width="200px"></asp:TextBox>
          &nbsp;<font color="red">*</font>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户组不能为空!" ControlToValidate="txt_Regulationame"></asp:RequiredFieldValidator>
          <asp:HiddenField runat="server" ID="hfid"/></td>
      </tr>
    </tbody>
    <tr class="tdbgbottom">
      <td colspan="2"><asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="添加" runat="server" onclick="EBtnSubmit_Click" /></td>
    </tr>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>