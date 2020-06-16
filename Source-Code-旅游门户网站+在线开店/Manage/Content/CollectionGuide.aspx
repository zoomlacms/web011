﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.CollectionGuide, App_Web_zxhe1krl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("内容模型管理")%></title>
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
<body id="Guidebody" style="margin: 0px; margin-top: 1px;">
    <form id="formGuide" runat="server">
    <div id="Div1">
        <ul>
            <li id="Guide_top">
                <div id="Guide_toptext"><%=lang.LF("信息采集管理")%></div>
            </li>
            <li id="Guide_main">
                <div id="Guide_box">
                    <div class="guideexpand" onclick="Switch(this)">
                        <%=lang.LF("信息采集管理")%>
                    </div>
                    <div class="guide">
                        <ul>
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CollectionManage.aspx" target="main_right"><%=lang.LF("采集项目管理")%></a></li>
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CollectionStep1.aspx" target="main_right"><%=lang.LF("添加采集项目")%></a></li>
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CollectionStart.aspx" target="main_right"><%=lang.LF("开始采集")%></a></li>
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CollectionStatus.aspx" target="main_right"><%=lang.LF("采集进度")%></a></li>
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CollectionList.aspx" target="main_right"><%=lang.LF("采集历史记录")%></a></li>
                        </ul>
                    </div>
                </div>
            </li>
             <li id="Li1">
                <div id="Div2">
                    <div class="guideexpand" onclick="Switch(this)">
                     <%=lang.LF("内容预审核管理")%>
                    </div>                    
                    <div class="guide">
                    <ul>     
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="AuditManage.aspx" target="main_right"> <%=lang.LF("内容预审核管理")%></a></li>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="AddAudit.aspx" target="main_right"> <%=lang.LF("添加内容预审核")%></a></li>
                    </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    </form>
</body>
</html>