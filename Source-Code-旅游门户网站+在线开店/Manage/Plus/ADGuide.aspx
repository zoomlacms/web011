<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_ADGuide, App_Web_vhj0440o" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("广告管理")%></title>
<link href="/App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/Main.css" type="text/css" rel="stylesheet" />
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
        try {  parent.frames["main_right"].location = "../" + url; void (0);
            //parent.MDILoadurl(url); void (0);
        } catch (Error) {
            parent.frames["main_right"].location = "../" + url; void (0);
        }
    }
    function search() {
        var LabelCate = "";
        var LabelName = document.getElementById("Lname").value;
        window.open('../i/Plus/ADZoneManage.aspx?lbl='+ LabelName, "main_right");
    }
</script>
</head>
<body id="Guidebody" style="margin: 0px; margin-top: 1px;">
<form id="formGuide" runat="server">
<div id="Div1">
    <ul>
        <li id="Guide_top"><div id="Guide_toptext"><%=lang.LF("广告管理")%></div></li>
        <li id="Guide_main">
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("广告操作")%></div>
                <div class="guide">
                    <ul>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Plus/ADZoneManage.aspx" target="main_right"><%=lang.LF("版位管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Plus/ADManage.aspx" target="main_right"><%=lang.LF("广告管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Plus/JSTemplate.aspx" target="main_right"><%=lang.LF("广告模板")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Plus/ADAdbuy.aspx" target="main_right"><%=lang.LF("广告申请")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Plus/ChartManage.aspx" target="main_right"><%=lang.LF("图表管理")%></a></li>
                    </ul>
                </div>
                <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("三维全景")%></div>
                <div class="guide">
                    <ul>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Panoramic/PanoramicManage.aspx" target="main_right"><%=lang.LF("全景管理")%></a></li>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Panoramic/MusicManage.aspx" target="main_right"><%=lang.LF("音乐库管理")%></a></li>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/AddOn/Maps.aspx" target="main_right"><%=lang.LF("地图管理")%></a></li>
                        <%
                            if (HttpContext.Current.Request.Url.Host == "www.zoomla.cn")
                            {
                        %>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
                            <a href="../i/Panoramic/Managecer.aspx" target="main_right"><%=lang.LF("授权管理")%></a></li>
                        <%
                            }
                        %>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
                            <a href="../i/Magazine/AddMagazine.aspx" target="main_right"><%= lang.LF("电子杂志") %></a></li>
                    </ul>
                </div>
                <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("广告设计")%></div>
                <div class="guide">
                    <ul>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="/i/Plugins/Flex/Default.aspx" target="main_right" onclick="javascript:window.top.switchSysBar()"><%=lang.LF("在线设计")%></a></li>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Flex/MyMaterial.aspx" target="main_right"><%=lang.LF("素材中心")%></a></li>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../i/Flex/MyWork.aspx" target="main_right"><%=lang.LF("我的作品")%></a></li>
                    </ul>
                </div>
             
                <!--<div class="guideexpand" onclick="Switch(this)">FMcold</div>
                <div class="guide">
                    <ul>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
                            <a href="javascript:gotourl('/Print/bin-debug/Default.html');window.top.leftMenuMove();">FM Space</a></li>
                        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
                            <a href="javascript:gotourl('/Print/src/FlexADManage.aspx');">FM Product</a></li>
                    </ul>
                </div>
                -->
            </div>
        </li>
    </ul>
</div>
    <div style="margin-top:20px; padding-left:5px;">
<%=lang.LF("按名称搜索版位")%>：<br />
<table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 

<input id="Lname"  style="border-color:#fff" class="l_inpnon" runat="server"  onkeypress="CheckInfo(this)"/>
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