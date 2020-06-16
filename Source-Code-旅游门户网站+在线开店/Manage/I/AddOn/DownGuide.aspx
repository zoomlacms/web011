<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_DownGuide, App_Web_oxnlb5iw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title><%= lang.LF("客户端") %></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 

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
        <div id="Guide_toptext"><%= lang.LF("客户端") %></div>
    </li>
    <li id="Guide_main">
        <div id="Guide_box">
          <div class="guideexpand" onclick="Switch(this)"><%= lang.LF("客户端 管理") %></div>
            <div class="guide">
            <ul>                        
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="Download.aspx" target="main_right"><%= lang.LF("客户端下载") %></a></li>
                <%--<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="AddOn/ProjectSearch.aspx" target="main_right">密钥文件</a></li>--%>
            </ul>
            </div>
        </div>
    </li>
 </ul>
</div>
</form>
</body>
</html>