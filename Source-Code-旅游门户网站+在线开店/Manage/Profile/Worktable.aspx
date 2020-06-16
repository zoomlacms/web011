<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa_WebSite_Manages_Worktable, App_Web_hgre3m2j" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<title><%=lang.LF("我的工作台")%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/ICMS/alt.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<link type="text/css" href="/App_Themes/ICMS/V3.css" rel="stylesheet" />
<style type="text/css">
Input { font-family: verdana; font-size: 9pt; text-decoration: none; background-color: #fff; height: 20px; border: 1px solid #666666; color: #000; }
.Title { font-family: verdana; font-size: 11pt; font-weight: normal; height: 28px; text-align: center; color: #333; text-decoration: none; background-color: #A4B9D7; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: 1px; border-top-color: #999; border-right-color: #999; border-bottom-color: #999; border-left-color: #999; }
.litd { text-align: center; padding: 10px; float: left; }
</style>
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container-fluid">
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<ol class="breadcrumb navbar-fixed-top hidden-sm hidden-xs" runat="server" id="BreadNav">
  <li><a href="../I/Main.aspx" style="color: #428bca;">工作台</a></li>
  <li class="active">版本信息&nbsp;&nbsp; <%=lang.LF("欢迎")%><strong>
    <asp:Literal runat="server" ID="litUserName"></asp:Literal>
    </strong>&nbsp;<%=lang.LF("今天是")%>:
    <asp:Literal runat="server" ID="litDate"></asp:Literal>
    <span id="times" name="times"></span><a href="../../Common/SelectChinaDay.html">[<%=lang.LF("万年历")%>]</a> </li>
  <%= Call.GetHelp(1) %>
</ol>
</div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 padding_l_r0">
  <div class="panel panel-info" style="margin-top:3em;margin-bottom:0.5em;">
    <div class="panel-heading"><%=lang.LF("欢迎进入")%><%:Call.SiteName %>
      <%=lang.LF("后台管理系统")%>，
      <asp:Label ID="Version" runat="server"></asp:Label>。</div>
    <div class="panel-body">
      <ul style="list-style-type:none;">
        <li class="litd"><a href="../I/Config/SiteInfo.aspx"><img src="/App_Themes/AdminDefaultTheme/Images/System1.png" alt="网站配置" /></a><br />
          <a href="../I/Config/SiteInfo.aspx" target="_self"><%=lang.LF("网站配置")%></a></li>
        <li class="litd"><a href="../I/Content/ModelManage.aspx?ModelType=1"><img src="/App_Themes/AdminDefaultTheme/images/System2.png" alt="内容模型" /></a><br />
          <a href="../I/Content/ModelManage.aspx?ModelType=1" target="_self"><%=lang.LF("内容模型")%></a></li>
        <li class="litd"><a href="../I/Content/NodeManage.aspx"><img src="/App_Themes/AdminDefaultTheme/Images/System3.png" alt="节点设置" /></a><br />
          <a href="../I/Content/NodeManage.aspx" target="_self"><%=lang.LF("节点设置")%></a></li>
        <li class="litd"><a href="../I/Template/LabelManage.aspx"><img src="/App_Themes/AdminDefaultTheme/Images/System4.png" alt="标签设置" /></a><br />
          <a href="../I/Template/LabelManage.aspx" target="_self"><%=lang.LF("标签设置")%></a></li>
        <li class="litd"><a href="../I/Template/TemplateSet.aspx"><img src="/App_Themes/AdminDefaultTheme/Images/System5.png" alt="模板设置" /></a><br />
          <a href="../I/Template/TemplateSet.aspx" target="_self"><%=lang.LF("模板设置")%></a></li>
        <li class="litd"><a href="../I/User/AdminManage.aspx"><img src="/App_Themes/AdminDefaultTheme/Images/System8.png" alt="安全设定" /></a><br />
          <a href="../I/User/AdminManage.aspx" target="_self"><%=lang.LF("安全设定")%></a></li>
        <li class="litd"><a href="../I/Content/ContentManage.aspx"><img src="/App_Themes/AdminDefaultTheme/Images/system13.png" alt="内容管理" /></a><br />
          <a href="../I/Content/ContentManage.aspx" target="_self"><%=lang.LF("内容管理")%></a></li>
      </ul>
    </div>
  </div>
  </div>
  
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 padding_l0">
<table class="table table-striped table-bordered">
  <tr class="title" style="height:41px;">
    <td class="text-left" colspan="2">&nbsp;<b><%=lang.LF("浏览信息")%></b> <a href="../I/Common/SystemFinger.aspx" title="服务器信息总览" style="float: right;">信息总览</a></td>
  </tr>
  <tr class="sysinfo">
    <td style="padding-top:16px;"><iframe id="showiframe" src="../BrowserCheck.aspx" marginwidth="1" marginheight="1" scrolling="no" frameborder="0" style="border-style: none; border-color: inherit; border-width: medium; width: 100%; height: 282px;"></iframe></td>
  </tr>
</table>
</div>
  
<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 padding_l_r0">
<div class="panel panel-default">
  <div class="panel-heading text-center">
    <asp:Label ID="Label1" runat="server" Font-Bold="True"><%=lang.LF("备忘录")%></asp:Label>
  </div>
  <div class="panel-body" style="height: 310px;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
        <asp:TextBox ID="TbRemmber" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="11" Style="height: 243px; max-width: 100%;" Columns="50" AutoPostBack="true" OnTextChanged="AutoSave"></asp:TextBox>
      </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <span class="hidden-sm hidden-xs">提示：记录随Cookies删除而消失，重要信息请进入<a href="../AddOn/ProjectAffairsCenter.aspx">[事务中心]</a>进行记录</span> <span class="visible-sm visible-xs">提示：记录随Cookies删除而消失</span> <br />
  </div>
</div>
</div>

</div>
</div>
<script>
    $('#element').popover('hide');
    function ShowAD() {
        parent.ShowAD();
    }
</script>
</form>
</body>
</html>