<%@ page language="C#" autoeventwireup="true" inherits="User_Questions_MyMarks, App_Web_ftiv45vt" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>系统试题管理</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link  rel="stylesheet" type="text/css" href="../../App_Themes/UserThem/bidding.css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript">
    function OpenSelect2(obj) {
    window.open('/User/Questions/ExamViewLX.aspx?id='+obj,'','width=600,height=450,resizable=1,scrollbars=yes');
    return false;
}
</script> 
<style>
th { background:none #CBE6FC;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo" style="width: 97%">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text=""></asp:Label></a>&gt;&gt; <a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a>&gt;&gt;<a href="MyMarks.aspx">我的考试</a>
</div>
  <div style="width: 85px; height: 184px; float:left">
    <asp:TreeView ID="tvNav" runat="server" ExpandDepth="0" ShowLines="True" EnableViewState="False"  NodeIndent="10" Height="197px" Width="147px">
      <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
      <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
      <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
      <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
    </asp:TreeView>
  </div>
    <div style="width: 80%; float: right">
	  <div class="us_seta" style="margin-top: 5px;">
    <h1 align="center">我的考试</h1>
  </div>
  <div class="divbox"  id="nocontent" runat="server" style="display: none;float:right; width:78%">暂无试卷信息</div>
  <div  style="float:right; width:100%">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging" class="border" AllowSorting="true" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" GridLines="None" Width="100%" RowStyle-CssClass='tdbg' HeaderStyle-Height="28px">
      <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
      <Columns>
      <asp:TemplateField HeaderText="试卷名称" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" >
        <ItemTemplate> <%# Eval("p_name")%> </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="考试时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" >
        <ItemTemplate> <%# Eval("p_UseTime")%>分钟 </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="有效时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
        <ItemTemplate> <%#DataBinder.Eval(Container.DataItem, "p_BeginTime", "{0:yyyy-MM-dd}")%> 至 <%#DataBinder.Eval(Container.DataItem, "p_endTime", "{0:yyyy-MM-dd}")%> </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="参加考试" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
        <ItemTemplate> <a href="javascript:void(0)" onclick="javascript:window.open('/User/Questions/ExamViewLX.aspx?id=<%#Eval("id") %>','','width=600,height=450,resizable=1,scrollbars=yes');">参加考试</a> </ItemTemplate>
      </asp:TemplateField>
      </Columns>
    </ZL:ExGridView>
  </div>
  </div>
</form>
</body>
</html>