<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_CreateSQLmod, App_Web_dpasokpb" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>插件管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="" src="/js/jquery.js"></script>

</head>
<body>
<form id="form1" runat="server"> 
<div class="r_navigation">后台管理 &gt;&gt; 扩展功能 &gt;&gt; 数据维护 &gt;&gt;<a href="DevelopmentCenter.aspx">开发中心</a>&gt;&gt;  添加插件 </div>
<table width="100%" cellpadding="5" cellspacing="1" class="border">
<tr class="tdbg">
    <td class="tdbgleft" align="right" style="width: 150px"><strong>插件名称：</strong></td>
    <td>
        <asp:TextBox ID="txtName" runat="server" class="l_input" Width="156" MaxLength="20"></asp:TextBox>
    </td>
</tr>
    <tr class="tdbg">
    <td class="tdbgleft" align="right" style="width: 150px"><strong>创建的数据表名：</strong></td>
    <td>
        ZL_my_<asp:TextBox ID="txtTableName" runat="server" class="l_input"  Width="113"></asp:TextBox>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" align="right" ><strong>项目单位：</strong><br />例如：篇、个、张、件</td>
    <td>
          <asp:TextBox ID="txtUnit" runat="server" class="l_input" Width="156" MaxLength="20" ></asp:TextBox>
    </td>
</tr>
      
<tr class="tdbg">
    <td class="tdbgleft" align="right" ><strong>项目图标：</strong></td>
    <td>
          <asp:TextBox ID="txtIcon" runat="server"  class="l_input" Width="156" MaxLength="20"></asp:TextBox>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" align="right" ><strong>项目描述：</strong></td>
    <td>
          <asp:TextBox ID="txtExplain" runat="server" class="l_input" Width="156" MaxLength="20"></asp:TextBox>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" align="right" ><strong>可执行次数：</strong></td>
    <td>
          <asp:TextBox ID="txtRunNum" runat="server" class="l_input" Width="156" MaxLength="20"></asp:TextBox>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" align="right" ><strong>关联负责人：</strong></td>
    <td>
          <asp:TextBox ID="txtUserName" runat="server" class="l_input" Width="156" MaxLength="20"></asp:TextBox>
        <asp:HiddenField ID="TxtUserID" runat="server" />
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" align="right"><strong>按钮名称：</strong></td>
    <td>
          <asp:TextBox ID="txtBtnName" runat="server" class="l_input" Width="156" MaxLength="20"></asp:TextBox>
    </td>
</tr>
<tr class="tdbg">
    <td class="tdbgleft" align="right" ><strong>附加文件：</strong></td>
    <td>
          <asp:TextBox ID="txtSqlUrl" runat="server" class="l_input" Width="156" MaxLength="20"></asp:TextBox>
    </td>
</tr>      

<tr class="tdbg">
    <td class="tdbgleft" align="right" ><strong>自动计划：</strong></td>
    <td>
          <asp:TextBox ID="txtRunTime" runat="server" class="l_input" Width="156" MaxLength="20"></asp:TextBox>
    </td> 
    </tr>
    <tr class="tdbg">
        <td ></td><td><asp:Button ID="CreateBtn" runat="server" text="添加" OnClick="CreateBtn_Click" class="C_input" /></td> 
    </tr>
</table> 
</form>
    <script>

    </script>
</body>
</html>
