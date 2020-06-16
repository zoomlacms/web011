<%@ page language="C#" autoeventwireup="true" inherits="manage_Profile_UAgent, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>设备管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<script>
function IsSelectedId() {
    var flag = false;
    var s = document.form1.getElementsByTagName("INPUT")
    for (var i = 0; i < s.length; i++) {
        if (s[i].type == "checkbox") {
            if (s[i].checked) {
                flag = true;
                break;
            }
        }
    }
    return flag;
}
function CheckAll(spanChk)//CheckBox全选
{
    var oItem = spanChk.children;
    var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
    xState = theBox.checked;
    elm = theBox.form.elements;
    for (i = 0; i < elm.length; i++)
        if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
            if (i > 9) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
        }
}
function UpadateSite(id)
{
    window.location.href = "AddUAgent.aspx?ID=" + id;
}
</script>
</head>
<body>
<form id="form1" runat="server">  
<div class="r_navigation"><%=lang.LF("后台管理")%>&gt;&gt;<%=lang.LF("系统设置")%>  &gt;&gt;<%=lang.LF("自适配设备")%>&gt;&gt;<a href="AddUAgent.aspx" style="color:#ff0000;" title="添加自适配设备">[<%=lang.LF("添加自适配设备")%>]</a>&nbsp;<a href="../Config/SiteOption.aspx" title="开启设备自适应" style="color:#ff0000;">[开启设备自适配]</a></div>
<div class="clearbox"></div>
<table  width="100%" border="0" cellpadding="2" cellspacing="1"  class="border"> 
<tr class="tdbg" style="color:#E7E7FF;border-style:None;font-weight:bold;text-decoration:none;height:30px;">
<th width="3%"></th>
<th scope="col" style="width:5%;">ID</th>
<th scope="col" style="width:20%;">设备名称</th>
<th scope="col" style="width:20%;">关键字</th>
<th scope="col">状态</th> 
<th scope="col" style="width:20%;">目标地址</th>
</tr>
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
<ItemTemplate>
<tr class="tdbg" onDblClick="UpadateSite('<%#Eval("ID")%>')" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="cursor:pointer;" >
    <td align="center" ><input type="checkbox" <%#retEnab(Convert.ToInt32(Eval("ID"))) %> name="Btchk" id="Btchk" value='<%#Eval("ID")%>'/></td>
    <td align="center" ><%# Eval("ID") %></td>
    <td  align="left" ><%#Eval("Headers") %></td>
    <td align="left"  title="双击修改" ><%#Eval("UserAgent") %> </td>
    <td align="center" ><asp:ImageButton ID="Update_lbk" runat="server" CommandName="Update" CommandArgument='<%#Eval("ID") %>' ImageUrl='<%# "~/Images/" + GetState(Eval("Status", "{0}")) +".gif" %>' OnClick="ImageButton_Click"/></td>
    <td align="left" ><a href="<%#Eval("Url")%>"><%#Eval("Url") %></a></td>
</tr>
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
<td  align="center" class="tdbgleft"><asp:CheckBox ID="cbAll" runat="server" Font-Size="9pt" Text="" onclick="CheckAll(this)" /></td>
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
