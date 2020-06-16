<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_OthersGuide, App_Web_oxnlb5iw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("其他管理")%></title>
<link href="/App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
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
    function search() {
        var key = document.getElementById("Lname").value;
        window.open('AuthorManage.aspx?key=' + key, "main_right");
    }
</script>
</head>
<body id="Guidebody" style="margin: 0px; margin-top: 1px;">
    <form id="formGuide" runat="server">
    <div id="Div1">
        <ul>
            <li id="Guide_top"><div id="Guide_toptext"><%=lang.LF("内容参数")%></div></li>
            <li id="Guide_main">
                <div id="Guide_box">
                    <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("内容参数")%></div>
                    <div class="guide">
                        <ul>
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="SourceManage.aspx" target="main_right"><%=lang.LF("来源管理")%></a></li>
                           <!-- 这里是添加来源-->
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="AuthorManage.aspx" target="main_right"><%=lang.LF("作者管理")%></a></li>
                            <!-- 这里是添加作者-->
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="KeyWordManage.aspx" target="main_right"><%=lang.LF("关键字管理")%></a></li>
                             <!-- 这里是添加关键字-->
                            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CorrectManage.aspx" target="main_right"><%=lang.LF("纠错管理")%></a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
        <div style="margin-top:20px; padding-left:5px;">
     按名字搜索作者：<br />
<table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 
<input id="Lname"  style="border-color:#fff" class="l_inpnon" runat="server" onkeypress="CheckInfo(this)"/>
<script type="text/javascript">
    function CheckInfo(obj) {
        if (event.keyCode == 13) {
            //alert(obj.value);
            search();
        }
    }
        </script>
<input type="button" onclick="search()"  class="C_sch"/>
</td></tr></table>
</div>
    </form>
</body>
</html>