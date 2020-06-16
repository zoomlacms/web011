<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_StructList, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>组织结构</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script language="javascript" type="text/javascript">
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
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation"> 
 后台管理 &nbsp;&gt;&gt;&nbsp; 企业办公 &nbsp;&gt;&gt;&nbsp; 组织结构  <a href="AddStruct.aspx?type=<%=Request["type"] %>" style="color:red;">[添加组织结构]</a>
</div>

    <div>
     <table width="100%" border="0" cellpadding="0" cellspacing="1" class="border" align="center">
        <tr class="gridtitle" align="center" style="height:25px;">
            <td width="5%" >  <input id="CheckBox1" type="checkbox" name="CheckBox1" onclick="CheckAll(this);" /> </td>
             <td width="5%"><strong>ID</strong></td>
            <td  height="20"><strong>名称</strong></td>
            <td width="10%"><strong>创建人</strong></td> 
            <td width="10%"><strong>创建时间</strong></td> 
            <td width="10%"><strong>开放</strong></td>
            <td width="10%"><strong>状态</strong></td> 
            <td><strong>操作</strong></td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server"  onitemcommand="Repeat1_ItemCommand" OnItemDataBound="Repeat1_DataBound">
            <ItemTemplate>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td align=center height="25"><asp:CheckBox ID="Chck" runat="server" /><asp:Label ID="Lbl" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label></td>
                    <td  align=center><%#Eval("ID") %></td>
                    <td align=center><%#Eval("Name") %></td>
                    <td align=center><%#getName(Eval("UserID").ToString()) %></td>
                    <td align=center><%#Eval("AddTime") %></td> 
                    <td align=center> <%#getOpen(Eval("Opens").ToString()) %> </td> 
                    <td align=center> <%#getStatus(Eval("Status").ToString()) %> </td> 
                    <td align="center">
                      <asp:LinkButton ID="LinkButton2" CommandName="View" CommandArgument='<%#Eval("ID") %>' Text="结构管理" runat="server"></asp:LinkButton>    <asp:LinkButton ID="LinkButton1" CommandName="SubList" CommandArgument='<%#Eval("ID") %>' Text="查看子级" runat="server"></asp:LinkButton>  <asp:LinkButton ID="Add_lbn" CommandName="Add" CommandArgument='<%#Eval("ID") %>' Text="添加子级" runat="server"></asp:LinkButton>  | <asp:LinkButton ID="Edit_lbn" CommandName="Edit" CommandArgument='<%#Eval("ID") %>' Text="修改" runat="server"></asp:LinkButton> | <asp:LinkButton ID="Del_lbn" CommandName="Del" CommandArgument='<%#Eval("ID") %>' Text="删除" runat="server"></asp:LinkButton><img src="/App_Themes/AdminDefaultTheme/images/fancy_title_over.png" onload="ADD_none('<%#Eval("ID") %>')" /> </td>
                </tr>
         </ItemTemplate>
            </asp:Repeater>
         <tr class="tdbg">
      <td height="24" colspan="77" align="center" class="tdbgleft"> 共
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
           <tr> 
 <td height="24" colspan="8">  <asp:Button ID="Button1"  class="C_input" Font-Size="9pt"  Text="批量排除" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('不可恢复性数据,你确定将该成员从此结构中排除吗？');}" onclick="Button1_Click" /></td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
