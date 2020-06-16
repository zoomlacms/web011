<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_Default, App_Web_ckavs3bx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>信息管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
    <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
<div id="help"> <a onclick="help_show('107')" title="帮助"></a></div>
<%} %>后台管理 &gt;&gt; 微信管理  &gt;&gt; <a href="Default.aspx">微信应答</a>  </div>

    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="border">
        <tr class="tdbg">
            <td align="left">
                &nbsp;<a href="SiteWx.aspx">网站响应</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="AddWx.aspx">预设响应</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a href="AddGraphic.aspx?Type=3">多图文</a> 
            </td>
        </tr>
    </table>
<div class="clearbox">
    </div>
<table  width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr  class="tdbg" height="25"><th>选择 </th><th>ID</th><th>判断关键字</th><th>消息类别</th><th>接收信息类型</th><th>回复信息类型</th><th>操作</th></tr>
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="lbtn_Click">
<ItemTemplate>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" align="center" ondblclick="javascript:location.href='AddWx.aspx?ID=<%#Eval("ID") %>'" style="cursor:pointer;" >
<td><input type="checkbox" /></td><td><%#Eval("ID") %></td><td><%#Eval("Keys") %></td><td>  <%#GetLabelType(Eval("Type").ToString()) %> </td>   <td> <%#GetGetType(Eval("GetType").ToString()) %>  
   </td><td> <%#GetMsgType(Eval("MsgType").ToString()) %>  </td> <td> <a href="<%#GetUrl(Eval("Type").ToString(),Eval("Keys").ToString(),Eval("ID").ToString()) %> ">修改 </a> | <asp:LinkButton ID="lbtn" CommandArgument="Del" CommandName='<%#Eval("ID")%>' runat="server" Text="删除" > </asp:LinkButton> </td>
</tr>
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
        <td  align="center" class="tdbgleft">
         
            <asp:CheckBox ID="cbAll" runat="server" Font-Size="9pt" Text="" onclick="CheckAll(this)" /></td>
<td height="24" colspan="6" align="center" class="tdbgleft">
<div style=" float:left; width:100px; text-align:left; padding-left:0.8%;"> 
<asp:Button ID="Button1"  class="C_input" Font-Size="9pt"  Text="删除" runat="server"   OnClientClick="if(!IsSelectedId()){alert('未选中任何内容');return false;}else{return confirm('你确定要删除选中内容吗？')}"  OnClick="Button1_Click"  />
</div>
共
<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
条信息
<asp:Label ID="Toppage" runat="server" Text="" />
<asp:Label ID="Nextpage" runat="server" Text="" />
<asp:Label ID="Downpage" runat="server" Text="" />
<asp:Label ID="Endpage" runat="server" Text="" />
页次：
<asp:Label ID="Nowpage" runat="server" Text="" />
/
<asp:Label ID="PageSize" runat="server" Text="" />
页 <span style="text-align: center">
<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" ontextchanged="txtPage_TextChanged"></asp:TextBox>
</span>条信息/页  转到第
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
页 </td>
</tr>
</table> 
</form>
</body>
</html>
