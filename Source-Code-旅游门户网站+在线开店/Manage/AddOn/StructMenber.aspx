<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_StructMenber, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>结构成员</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理&gt;&gt; <a href="StructManage.aspx" target="main_right">组织结构</a> &gt;&gt;  <asp:Label ID="Label1" runat="server" Text=""></asp:Label> 成员列表&nbsp;<a href="../User/AddManage.aspx" style="color:red;">[添加管理员]</a></div>
 
<ZL:ExGridView ID="Egv" runat="server" AllowPaging="True"   AutoGenerateColumns="False" CssClass="border" DataKeyNames="AdminID"  OnRowEditing="Egv_RowEditing" OnPageIndexChanging="Egv_PageIndexChanging" 
        OnRowCommand="Lnk_Click" OnRowDataBound="Egv_RowDataBound" Width="100%" border="0" cellpadding="0" cellspacing="1" >
     <Columns>
    <asp:TemplateField HeaderText="选择">
      <ItemTemplate>
        <asp:CheckBox ID="chkSel" runat="server" />
      </ItemTemplate>
      <ItemStyle  HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:BoundField DataField="AdminId" HeaderText="ID">
      <ItemStyle  HorizontalAlign="Center" />
    </asp:BoundField>
  
    <asp:BoundField HeaderText="账号"　DataField="AdminName" ItemStyle-HorizontalAlign="Center">
      <ItemStyle  HorizontalAlign="Center" />
    </asp:BoundField> 
    <asp:BoundField DataField="AdminTrueName" HeaderText="姓名"  ItemStyle-HorizontalAlign="Center"/>
    <asp:TemplateField HeaderText="单位" ItemStyle-HorizontalAlign="Center">
         <ItemTemplate><%#GetStruct(Eval("StructureID").ToString()) %> </ItemTemplate>
      <ItemStyle  HorizontalAlign="Center" />
    </asp:TemplateField>
        <asp:TemplateField HeaderText="角色" ItemStyle-HorizontalAlign="Center">
         <ItemTemplate><%#GetRole(Eval("AdminRole").ToString()) %> </ItemTemplate>
      <ItemStyle  HorizontalAlign="Center" />
    </asp:TemplateField>
   <asp:TemplateField HeaderText="多人登录" ItemStyle-HorizontalAlign="Center">
      <ItemTemplate> <%# ZoomLa.Common.DataConverter.CBool(DataBinder.Eval(Container, "DataItem.EnableMultiLogin", "{0}")) ? "<span stytle='color:red;'>允许</span>" : "不允许"%> </ItemTemplate>
      <ItemStyle  HorizontalAlign="Center" />
    </asp:TemplateField>
      <asp:TemplateField HeaderText="管理员状态" ItemStyle-HorizontalAlign="Center">
      <ItemTemplate> <%# ZoomLa.Common.DataConverter.CBool(DataBinder.Eval(Container, "DataItem.IsLock", "{0}")) ? "<span stytle='color:red;'>锁定</span>" : "正常"%> </ItemTemplate>
      <ItemStyle  HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" >
      <ItemTemplate>
       <!-- <asp:LinkButton ID="LnkModify" CommandName="ModifyAdmin" CommandArgument='<%# Eval("AdminId")%>' runat="server">修改</asp:LinkButton>-->
        <asp:LinkButton ID="LnkDelete"  runat="server" CommandName="DeleteAdmin" OnClientClick="if(!this.disabled) return confirm('确实要从本架构删除吗？');" CommandArgument='<%# Eval("AdminId")%>'>从本架构删除</asp:LinkButton>
        <%--<asp:LinkButton ID="LnkCancel" CommandName="CancelAdmin" CommandArgument='<%# Eval("AdminId")%>' runat="server" OnClick="LnkCancel_Click">取消</asp:LinkButton>    --%>
      </ItemTemplate>
      <ItemStyle  HorizontalAlign="Center" />
    </asp:TemplateField>
    </Columns>
    <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
    <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
    <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
  </ZL:ExGridView>
  <div class="clearbox"></div>
  <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" onclick="CheckAll(this)" Text="全选" />
  <!--<asp:Button ID="Button1" class="C_input" runat="server" Font-Size="9pt" Text="取消" OnClick="Button1_Click" />-->
  <asp:Button ID="Button2" class="C_input" runat="server" Font-Size="9pt" Text="批量删除" OnClick="Button2_Click"  OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" />
</form>
</body>
