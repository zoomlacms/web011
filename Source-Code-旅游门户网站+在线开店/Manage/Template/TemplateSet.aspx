<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="manage_Template_TemplateSet, App_Web_fx1qjkh2" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>方案设置</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script src="../../Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
<%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
  <div id="help"> <a onclick="help_show('19')" title="帮助"></a></div>
<%} %>  后台管理&gt;&gt;系统设置 &gt;&gt;<a href="TemplateSet.aspx">方案设置</a>&nbsp;<a href="AddtemplateSet.aspx" style="color:#f00;">[发布当前方案]</a> <span class="red"><a href="CloudLead.aspx" title="从云端免费获取站点方案">[从云端免费获取全站方案]</a></span></div>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" class="border" align="center">
    <tr class="gridtitle" align="center" style="height: 25px;">
      <td width="100%" colspan="4" style="cursor: pointer" onclick="clicklocal()">本地方案列表↓</td>
    </tr>
    <tr>
      <td id="localtb" name="localtb"><table width="100%" border="0" cellpadding="0" cellspacing="1">
          <asp:Label ID="tempclientlist" runat="server" Text=""></asp:Label>
          <tr class="tdbg" align="center" style="height: 25px;">
            <td width="25%" colspan="4"></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
<script type="text/javascript">
    $(document).ready(function () {
        base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
        $(".lightbox").lightbox({
            fitToScreen: true,
            imageClickClose: false
        });
    });
</script>
</body>
</html>