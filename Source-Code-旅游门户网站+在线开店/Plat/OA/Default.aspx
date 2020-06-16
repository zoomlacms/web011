<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_OA_Default, App_Web_tkqthnmr" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style>
.oaul { margin-top: 5px; }
.oaul li { float: left; display: inline-block; cursor: pointer; list-style-type: none; margin-right: 10px; }
.cdiv { width: 240px; height: 160px; line-height: 160px; padding-left: 60px; }
.cdiv span { color: white; font-size: 1.5em; }
</style>
  <title>OA办公</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <ol class="breadcrumb">
    <li><a href="/Plat/Blog/">能力中心</a></li>
    <li><a href="/Plat/OA/">OA办公</a></li>
  </ol>
  <div>
    <div class="child_head"> <span class="child_head_span1"></span> <span class="child_head_span2">公文流转</span>
      <%--    <a href="javascript:;" data-toggle="modal" data-target="#myModal" class="child_head_a">+创建新群组</a>--%>
    </div>
    <ul id="ul1" class="oaul">
      <li class="col-lg-2 col-md-3 padding5">
        <div style="background: #FE7906;" class="cdiv" title="公文拟稿" onclick="location='Drafting.aspx';"> <span class="glyphicon glyphicon-folder-open" style="margin-right: 10px;"></span><span>公文拟稿</span> </div>
      </li>
      <li class="col-lg-2 col-md-3 padding5">
        <div style="background: #004B9B;" class="cdiv" title="待办公文" onclick="location='AffairsList.aspx?View=1';"> <span class="glyphicon glyphicon-file" style="margin-right: 10px;"></span><span>待办公文</span> </div>
      </li>
      <li class="col-lg-2 col-md-3 padding5">
        <div style="background: #74B512;" class="cdiv" title="已办事务" onclick="location='AffairsList.aspx?View=2';"> <span class="glyphicon glyphicon-folder-close" style="margin-right: 10px;"></span><span>已办事务</span> </div>
      </li>
      <li class="col-lg-2 col-md-3 padding5">
        <div style="background: #A43AE3;" class="cdiv" title="发文管理" onclick="location='SendAffairList.aspx';"> <span class="glyphicon glyphicon-book" style="margin-right: 10px;"></span><span>发文管理</span> </div>
      </li>
      <li class="col-lg-2 col-md-3 padding5">
        <div style="background: #22AFC2;" class="cdiv" title="收文管理" onclick="location='AffairsList.aspx?View=3';"> <span class="glyphicon glyphicon-hdd" style="margin-right: 10px;"></span><span>收文管理</span> </div>
      </li>
    </ul>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
