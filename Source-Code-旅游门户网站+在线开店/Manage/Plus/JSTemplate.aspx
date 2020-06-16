<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.JSTemplate, App_Web_ka5t45ft" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>广告管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/Main.css" type="text/css" rel="stylesheet" />
<script src="../../JS/Common.js" type="text/javascript"></script>
<script src="../../JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">
  <div class="r_navigation">
  <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('30')" title="帮助"></a></div>
  <%} %> 后台管理 &gt;&gt; 扩展功能&gt;&gt; <a href="ADZoneManage.aspx" title="广告版位管理">版位管理</a>&gt;&gt; 广告模板管理</div>
  
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" OnRowCommand="GridView1_RowCommand" CssClass="border" DataKeyNames="JSTemplateID" onrowdatabound="GridView1_RowDataBound">
    <Columns>
    <asp:BoundField DataField="JSTemplateID" HeaderText="类型ID" >
      <ItemStyle  HorizontalAlign="Center"  />
    </asp:BoundField>
    <asp:BoundField DataField="JSTemplateName" HeaderText="版块类型名称"  >
      <ItemStyle  HorizontalAlign="Center"  />
    </asp:BoundField>
    <asp:BoundField DataField="JSTemplatePath" HeaderText="版块文件所在路径" >
      <ItemStyle  HorizontalAlign="Center"  />
    </asp:BoundField>
    <asp:BoundField DataField="JSTemplateSize" HeaderText="版块大小">
      <ItemStyle  HorizontalAlign="Center"/>
    </asp:BoundField>
    <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" >
      <ItemTemplate>
        <asp:LinkButton ID="LinkButton1"  runat="server" CommandName="Modify" CommandArgument='<%# Eval("JSTemplateID")%>'>修改模板</asp:LinkButton>
      </ItemTemplate>
      <ItemStyle CssClass="tdbg" HorizontalAlign="Center"/>
    </asp:TemplateField>
    </Columns>
    <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
    <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
    <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="" PreviousPageText="" Visible="False" />
  </asp:GridView>
</form>
</body>
</html>