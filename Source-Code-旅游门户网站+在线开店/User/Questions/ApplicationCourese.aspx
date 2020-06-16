<%@ page language="C#" autoeventwireup="true" inherits="User_Questions_ApplicationCourese, App_Web_ftiv45vt" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>申请课程</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link  rel="stylesheet" type="text/css" href="../../App_Themes/UserThem/bidding.css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<style>
th { background:none #CBE6FC;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo" style="width: 97%">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text=""></asp:Label></a>&gt;&gt; <a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; <a href="ApplicationCourese.aspx">申请课程</a>
</div>
  <div class="s_body" style="width: 100%">
    <div class="s_bleft" style="width: 20%; float: left;">
      <iframe frameborder="0" width="100%" height="800px" src="TreeNode.aspx?Type=2" scrolling="auto" id="I1" name="I1"></iframe>
    </div>
    <div style="width: 80%; float: left">
	  <div class="us_seta" style="margin-top: 5px;">
    <h1 align="center"> 申请课程</h1>
  </div>
      <div class="divbox" id="nocontent" runat="server"> 暂无课程信息</div>
      <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False"  border="0" cellspacing="1" AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging"  AllowSorting="False" EnableTheming="False" Width="100%" RowStyle-CssClass='tdbg' HeaderStyle-Height="28px" EnableModelValidation="True">
        <HeaderStyle Height="28px"></HeaderStyle>
        <RowStyle  Height="35px"></RowStyle>
        <Columns>
        <asp:TemplateField HeaderText="课程名称" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="50%" >
          <ItemTemplate> <%#Eval("CourseName")%> </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50%"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="课时" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="25%" >
          <ItemTemplate> <%#GetClass(Eval("ID", "{0}"))%> </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle" ItemStyle-Width="25%" >
          <ItemTemplate> <%# getStr(Convert.ToInt32(Eval("ID").ToString()))%> </ItemTemplate>
          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="25%"></ItemStyle>
        </asp:TemplateField>
        </Columns>
      </ZL:ExGridView>
    </div>
  </div>
</form>
</body>
</html>