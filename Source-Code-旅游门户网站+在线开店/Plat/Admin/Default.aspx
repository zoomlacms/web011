<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_Default, App_Web_dgtaygb0" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
.oaul { margin-top: 5px; }
.oaul li { float: left; display: inline-block; cursor: pointer; list-style-type: none; margin-right: 10px; }
.cdiv { width: 240px; height: 160px; line-height: 160px; padding-left: 60px; }
.cdiv span { color: white; font-size: 1.5em; }
</style>
<title>管理中心</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a href="/Plat/Blog/">能力中心</a></li>
<li><a href="/Plat/Admin/">管理中心</a></li>
</ol>
<ul id="ul1" class="oaul">
<li>
  <div style="background: #FE7906;" class="padding5 cdiv" title="用户管理" onclick="location='UserManage.aspx';"> <span class="glyphicon glyphicon-folder-open" style="margin-right: 10px;"></span><span>用户管理</span> </div>
</li>
<li>
  <div style="background: #004B9B;" class="padding5 cdiv" title="角色权限" onclick="location='UserRole.aspx';"> <span class="glyphicon glyphicon-file" style="margin-right: 10px;"></span><span>角色权限</span> </div>
</li>
<li>
  <div style="background: #74B512;" class="padding5 cdiv" title="公司信息" onclick="location='/Plat/Group/CompDetail.aspx';"> <span class="glyphicon glyphicon-folder-close" style="margin-right: 10px;"></span><span>公司信息</span> </div>
</li>
<li>
  <div style="background: #A43AE3;" class="padding5 cdiv" title="部门管理" onclick="location='/Plat/Admin/GroupAdmin.aspx';"> <span class="glyphicon glyphicon-book" style="margin-right: 10px;"></span><span>部门管理</span> </div>
</li>
<li>
  <div style="background: #22AFC2;" class="padding5 cdiv" title="文库管理"> <span class="glyphicon glyphicon-hdd" style="margin-right: 10px;"></span><span>文库管理</span> </div>
</li>
</ul>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>