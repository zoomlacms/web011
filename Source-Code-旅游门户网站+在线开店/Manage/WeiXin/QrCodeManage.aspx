<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_QrCodeManage, App_Web_ckavs3bx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>二维码管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<script type="text/javascript">
    function UpadateSite(id,type) {
        location.href = "UpdateCode.aspx?ID=" + id + "&Type="+type;
        }
</script>
</head>
<body>
    <script type="text/javascript">
        function checkAll()
        {
            xstatus = document.getElementById("cbAll").checked;
            var checkBoxs = document.getElementsByName("Btchk");
            for (i = 0; i < checkBoxs.length; i++)
            {
                checkBoxs[i].checked = xstatus;
            }

        }

        function isAnyOneChecked()
        {
            var checkBoxs = document.getElementsByName("Btchk");
            for (i = 0; i < checkBoxs.length; i++)
            {
                if (checkBoxs[i].checked) return true;
            }
        }
    </script>
<form id="form1" runat="server">
<div class="r_navigation">后台管理 &gt;&gt; <a href="wxApi.aspx">微信管理</a> &gt;&gt; <a href="QrCodeManage.aspx">二维码管理</a> <a href="QrCode.aspx" style="color:#ff0000;">[生成二维码]</a></div>  
<div>
<table  width="100%" border="0" cellpadding="2" cellspacing="1"  class="border"> 
<tr class="tdbg" style="color:#E7E7FF;border-style:None;font-weight:bold;text-decoration:none;height:30px;">
<th> </th>
<th>ID</th>
<th>类型</th>
<th>名称</th>
<th>创建时间</th>
<th>操作</th>
</tr>
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" >
<ItemTemplate>
<tr class="tdbg" ondblClick="UpadateSite('<%#Eval("ID") %>','<%#Eval("Type")%>')"  onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="cursor:pointer;" >
<td align="center" ><input type="checkbox" name="Btchk" id="Btchk" value='<%# Eval("ID") %>' /></td>
<td align="center"><%#Eval("ID") %></td>
<td align="center"><%#getType(Convert.ToInt32(Eval("Type"))) %></td>
<td align="left"><a href="UpdateCode.aspx?ID=<%#Eval("ID")%>&Type=<%#Eval("Type")%>"><%#getTit(Convert.ToInt32(Eval("Type")),Eval("CodeContents").ToString()) %></a></td>
<td align="center"><%#Eval("CreateTime") %></td>
<td align="center"><a href="UpdateCode.aspx?ID=<%#Eval("ID") %>&Type=<%#Eval("Type") %>">修改</a>  
 <asp:LinkButton ID="linkBtn" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del"  OnClientClick=" return confirm('你确定要删除吗');">删除</asp:LinkButton> </td> 
</tr>
</ItemTemplate>
</asp:Repeater>
    <tr class="tdbg">
<td  align="center" class="tdbgleft"><asp:CheckBox ID="cbAll" runat="server" Font-Size="9pt" Text="" onclick="javascript:checkAll()"/></td>
<td height="24" colspan="5" align="center" class="tdbgleft">
<div style=" float:left; width:100px; text-align:left; padding-left:0.8%; height: 24px;"> 
<asp:Button ID="Button1"  class="C_input" Font-Size="9pt"  Text="删除" runat="server"   OnClientClick="if(!isAnyOneChecked()){alert('未选中任何内容');return false;}else{return confirm('你确定要删除选中内容吗？')}"  OnClick="Button1_Click"  />
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
<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px"  ontextchanged="txtPage_TextChanged"></asp:TextBox>
</span>条信息/页  转到第
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
页 </td>
</tr>
</table>
</div>
    
</form>
</body>
</html>
