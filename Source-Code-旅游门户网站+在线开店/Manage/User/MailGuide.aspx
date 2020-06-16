<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_MailGuide, App_Web_dczgtqur" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("邮件订阅")%></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
    function Switch(obj) {
        obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
        var nextDiv;
        if (obj.nextSibling) {
            if (obj.nextSibling.nodeName == "DIV") {
                nextDiv = obj.nextSibling;
            }
            else {
                if (obj.nextSibling.nextSibling) {
                    if (obj.nextSibling.nextSibling.nodeName == "DIV") {
                        nextDiv = obj.nextSibling.nextSibling;
                    }
                }
            }
            if (nextDiv) {
                nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none";
            }
        }
    }
    function OpenLink(lefturl, righturl) {
        if (lefturl != "") {
            parent.frames["left"].location = lefturl;
        }
        try {
            parent.MDIOpen(righturl); return false;
        } catch (Error) {
            parent.frames["main_right"].location = righturl;
        }
    }

    function gotourl(url) {
        try {
            parent.MDILoadurl(url); void (0);
        } catch (Error) {
            parent.frames["main_right"].location = "../" + url; void (0);
        }
    }
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="Div1">
<ul>
  <li id="Guide_top">
    <div id="Guide_toptext"><%=lang.LF("邮件订阅")%></div>
  </li>
  <li id="Guide_main">
    <div id="Div2">
      <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("文章订阅")%>&nbsp;</div>
      <div class="guide">
        <ul>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/SubscriptListManage.aspx?menu=all" target="main_right"><%=lang.LF("订阅管理")%></a></li>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/SubscriptListManage.aspx?menu=audit" target="main_right"><%=lang.LF("订阅审核")%></a></li>
        </ul>
      </div>
    </div>
    <div id="Guide_box">
      <div class="guideexpand" onclick="Switch(this)"> <%=lang.LF("邮件订阅")%>&nbsp;</div>
      <div class="guide">
        <ul>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/EidtMailModel.aspx" target="main_right"><%=lang.LF("邮件模板编辑")%></a></li>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/RegValidateMail.aspx" target="main_right"><%=lang.LF("邮件内容管理")%></a></li>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/SendMailList.aspx" target="main_right"><%=lang.LF("发送邮件管理")%></a></li>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/MailListManage.aspx" target="main_right"><%=lang.LF("邮件列表管理")%></a></li>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/AddMail.aspx" target="main_right"><%=lang.LF("邮件发送")%></a></li>
          <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/User/MailIdiographList.aspx" target="main_right"><%=lang.LF("签名管理")%></a></li>
        </ul>
      </div>
    </div>
  </li>
</ul>
</div>
</form>
</body>
</html>