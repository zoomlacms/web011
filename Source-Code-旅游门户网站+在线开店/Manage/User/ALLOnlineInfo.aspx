<%@ page language="C#" autoeventwireup="true" inherits="manage_User_ALLOnlineInfo, App_Web_evybsxrg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>VIP卡管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
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

</head>
<body>
<form id="form1" runat="server">
  <div class="r_navigation">后台管理 &gt;&gt; 会话信息查看&nbsp;</div>
  <div style="font-size: 12px;"> &nbsp;
      <div style="float:left;">
    <asp:DropDownList ID="txtbyfilde" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged" CssClass="x_input" runat="server" AutoPostBack="true">
      <asp:ListItem Value="1" Selected="True">按客服人员</asp:ListItem>
      <asp:ListItem Value="2">按时间</asp:ListItem>
      <asp:ListItem Value="3">按关键字</asp:ListItem>
    </asp:DropDownList>
    <span>&nbsp;指定日期：
    <asp:TextBox ID="txtdate" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });" runat="server" class="l_input"></asp:TextBox></span>
      </div>
      <div style="float:left;margin-left:5px;"></div>
<table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 

    <asp:TextBox ID="TextBox1" BorderColor="#fff" CssClass="l_inpnon" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" class="C_sch" Text="" OnClick="Button1_Click" />
    </td></tr></table>
  </div>

  <div style="text-align: center"> </div>
  <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
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
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
        页 </td>
    </tr>
  </table>
  <div>
    <asp:Button ID="Button3" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"  Text="批量删除" OnClick="Button3_Click1" class="C_input" />
    <asp:HiddenField ID="HiddenCSOID" runat="server" />
  </div>
</form>
</body>
</html>