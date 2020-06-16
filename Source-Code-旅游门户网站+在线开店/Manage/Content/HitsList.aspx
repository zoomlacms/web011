<%@ page language="C#" autoeventwireup="true" inherits="manage_Content_HitsList, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html >
<head runat="server">
<title><%=lang.LF("评价列表")%></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script src="../../JS/calendar.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>   
<script type="text/javascript" src="../../JS/DatePicker/WdatePicker.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('100')" title="帮助"></a></div>
  <%} %><%=lang.LF("后台管理")%>&gt;&gt;<%=lang.LF("内容管理")%> &gt;&gt;<%=lang.LF("访问评价")%>&gt;&gt;<%=lang.LF("评价列表")%></div>
</div>
<div style="height:29px;"></div>
    <div style=" margin-left:30px; float:left;"> <%=lang.LF("信息标题")%>： <asp:TextBox ID="txtTitle" ToolTip="支持模糊查询" runat="server" Width="100px" CssClass="l_input"></asp:TextBox>&nbsp;&nbsp;&nbsp;
            <%=lang.LF("月份")%>：<asp:TextBox ID="txtTime" runat="server" Width="100px" CssClass="l_input" onclick="WdatePicker({ dateFmt: 'yyyy-MM' });"   ></asp:TextBox>
            <asp:Button ID="btnSeach" runat="server" class="C_input" Text="查询" Width="80px" onclick="btnSeach_Click" />
    </div>
    <div style=" margin-right:150px; float:right;"><%=lang.LF("IP数统计")%>：<asp:Label ID="txtIpCount" runat="server" ></asp:Label></div>


	<table width="100%" border="0" cellpadding="1" cellspacing="2" class="border" align="center">
    <tbody>
        <tr class="gridtitle" align="center" style="height: 25px;">
        <td width="5%" height="20" align="center"> <strong>选择</strong></td>
        <td width="5%" height="20" align="center"> <strong>ID</strong></td>
        <td width="15%" height="20" align="center"> <strong>时间</strong></td>
        <td width="10%" height="20" align="center"> <strong>访问者</strong></td>
        <td width="20%" height="20" align="center"> <strong>信息标题</strong></td>
        <td width="15%" height="20" align="center"> <strong>来源IP</strong></td>
        <td width="8%" height="20" align="center"> <strong>是否评价</strong></td>
        </tr>
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <tr class="tdbg" style="cursor:pointer;" align="center" onmouseover="this.className='tdbgmouseover '" onmouseout="this.className='tdbg '"     >
              <td width="5%" height="20" align="center"> <asp:CheckBox ID="chkSel" Checked="false" runat="server"  />
              <asp:TextBox ID="txtUserID"  Visible="false"  Text='<%# Eval("Inputer")%>'  runat="server"></asp:TextBox></td>
               <asp:TextBox ID="txtID"  Visible="false"  Text='<%# Eval("ID")%>'  runat="server"></asp:TextBox></td>
              <td width="5%" height="20" align="center"> <%# Eval("ID")%></td>
              <td width="7%" height="20" align="center"><%#  Convert.ToDateTime(Eval("UpdateTime")).ToString("yyyy-MM-dd HH:mm:ss")%></td>
              <td width="7%" height="20" align="center"><%# Eval("UserName")%></td>
              <td width="40%" height="20" align="center"><a href="?title=<%#Eval("Title") %>" > <%# getSubstring(25, Eval("Title"))%></a></td>
              <td width="15%" height="20" align="center"><%#Eval("Ip")%></td>
              <td width="8%" height="20" align="center"><%# GetStatus(Eval("status"))%></td>
              </tr>
              </ItemTemplate>
    </asp:Repeater>
     <tr class="tdbg" style="width:100%;">
            <td height="22" colspan="7" align="center" class="tdbgleft">
               <span style="text-align: center">
                   <%=lang.LF("共")%><asp:Label ID="Allnum" runat="server" Text=""></asp:Label><%=lang.LF("条数据")%>
                            <asp:Label ID="Toppage" runat="server" Text="" />
                            <asp:Label ID="Nextpage" runat="server" Text="" />
                            <asp:Label ID="Downpage" runat="server" Text="" />
                            <asp:Label ID="Endpage" runat="server" Text="" /><%=lang.LF("页次")%>：
                            <asp:Label ID="Nowpage" runat="server" Text="" />/
                            <asp:Label ID="PageSize" runat="server" Text="" /><%=lang.LF("页")%>
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" 
                        class="l_input" Width="16px"  Height="16px" ontextchanged="txtPage_TextChanged"></asp:TextBox> <%=lang.LF("条数据")%>/<%=lang.LF("页")%> <%=lang.LF("转到第")%>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_OnTextChanged"></asp:DropDownList>
                            <%=lang.LF("页")%><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"  ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                     </span>
            </td>
        </tr>
    </tbody>
    </table>
     <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
        Text="全选" />&nbsp;
        <asp:Button ID="btnAudit" CausesValidation="false" Style="width: 110px;" runat="server"
        Text="评价奖励" CssClass="C_input" OnClick="btnShow_Click" OnClientClick="if(!IsSelectedId()){alert('请选择一项项以上');return false;}else{return confirm('你确定要奖励选中项吗？')}" />&nbsp;

</form>
</body>
</html>
