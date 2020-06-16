<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ALLOnlineInfo, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>VIP卡管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <asp:DropDownList ID="txtbyfilde" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged" class="btn btn-default dropdown-toggle" runat="server" AutoPostBack="true">
                    <asp:ListItem Value="1" Selected="True">按客服人员</asp:ListItem>
                    <asp:ListItem Value="2">按时间</asp:ListItem>
                    <asp:ListItem Value="3">按关键字</asp:ListItem>
                </asp:DropDownList>
                <span>&nbsp;指定日期：
    <asp:TextBox ID="txtdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });" runat="server" class="form-control" Style="max-width: 200px; display: inline;"></asp:TextBox></span>

                <div class="input-group nav_searchDiv">
                    <asp:TextBox runat="server" ID="TextBox1" class="form-control" placeholder="请输入需要搜索的内容" />
                    <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="Button1" OnClick="Button1_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>

            </td>
        </tr>
    </table>

    <div style="text-align: center"> </div>
  <table class="table table-striped table-bordered table-hover">
    <tr align="center">
      <td width="8%" class="title"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
      <td width="10%" class="title"> 发送人 </td>
      <td width="10%" class="title"> 接收人 </td>
      <td width="50%" class="title"> 信息 </td>
      <td width="10%" class="title"> 信息发布时间 </td>
      <td width="12%" class="title"> 操作 </td>
    </tr>
    <asp:Repeater ID="gvCard" runat="server">
      <ItemTemplate>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
          <td height="22" align="center"><input name="Item" type="checkbox" value='<%# Eval("CS_ID")%>' /></td>
          <td height="22" align="center"><%# Eval("CS_SendName")%></td>
          <td height="22" align="center"><%# Eval("CS_CtoName")%></td>
          <td height="22" align="center"><%#Eval("CS_Context")%></td>
          <td height="22" align="center"><%#DataBinder.Eval(Container.DataItem, "CS_AddTime", "{0:yyyy-MM-dd}")%></td>
          <td height="22" align="center"><a href="?menu=del&id=<%#Eval("CS_ID") %>&CSOID=<%#Eval("CS_OID")%>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"> 删除</a></td>
        </tr>
      </ItemTemplate>
    </asp:Repeater>
    <tr class="tdbg">
      <td colspan="6" align="center" class="tdbgleft"> 共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
        个信息
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
        个信息/页 转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" class="btn btn-default dropdown-toggle"> </asp:DropDownList>
        页 </td>
    </tr>
  </table>
  <div>
    <asp:Button ID="Button3" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"  Text="批量删除" OnClick="Button3_Click1" class="btn btn-primary"/>
    <asp:HiddenField ID="HiddenCSOID" runat="server" />
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
    <script src="/JS/pacalendar.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
