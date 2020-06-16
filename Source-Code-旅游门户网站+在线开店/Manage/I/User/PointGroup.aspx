<%@ page language="C#" autoeventwireup="true" inherits="manage_User_PointGroup, App_Web_2wb0azx5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>用户积分等级</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div class="divbox" id="nocontent" runat="server">暂无积分等级</div>
  <div id="cont" runat="server">
    <table class="table table-striped table-bordered table-hover">
      <tr>
        <td class="text-center" width="10%">选择</td>
        <td class="text-center" width="15%">积分等级</td>
        <td class="text-center" width="15%">所需积分</td>
        <td class="text-center" width="25%">备注</td>
        <td class="text-center" width="15%">图片</td>
        <td class="text-center" width="20%">操作</td>
      </tr>
      <asp:Repeater ID="repter" runat="server" onitemcommand="repter_ItemCommand" >
        <ItemTemplate>
          <tr">
            <td class="text-center"><asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("ID") %>' />
              <asp:CheckBox ID="chkSel" runat="server" /></td>
            <td class="text-center"><%#Eval("GroupName")%></td>
            <td class="text-center"><%#Eval("PointVal")%></td>
            <td class="text-center"><%#Eval("Remark") %></td>
            <td class="text-center"></td>
            <td class="text-center"><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("ID") %>'>修改</asp:LinkButton>
              <asp:LinkButton ID="del" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确认删除？')">删除</asp:LinkButton></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr>
        <td colspan="11">
            <div><span>
            <asp:CheckBox ID="CheckSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckSelectAll_CheckedChanged" Text="全选" />
            <asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClick="BtnDelete_Click" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" Text="批量删除选定内容" Width="134px" />
            </span> <span style="text-align: center"> 共
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
            <asp:Label ID="pagess" runat="server" Text="" />
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"  onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            页
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </span></div></td>
      </tr>
    </table>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
  <%--  <script>
        var a = "<%#Eval("ImgUrl")%>";
        if (a == '') {
            document.write("<img src='/Images/userface/noface.gif' width='20' height='20'>");
        }
        else {
            document.write("<img src='<%#Eval("ImgUrl")%>' name='urlImg' width='20' height='20'/>");
        }
    </script>--%>
</asp:Content>
