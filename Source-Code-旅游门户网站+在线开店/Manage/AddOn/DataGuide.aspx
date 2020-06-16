<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_DataGuide, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%= lang.LF("开发中心") %></title>
<link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/main.css" />
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
        <div id="Guide_toptext"><%= lang.LF("开发中心") %></div>
    </li>
    <li id="Guide_main">
        <div id="Guide_box">
            <div class="guideexpand" onclick="Switch(this)"><%= lang.LF("系统概况") %></div>
            <div class="guide">
                <ul>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
                        <a href="../i/Config/DatalistProfile.aspx" target="main_right"><%= lang.LF("系统全库概况") %></a>              
                    </li>                                  
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/BackupRestore.aspx" %>" target="main_right"><%= lang.LF("备份还原数据") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/Optimization.aspx" %>" target="main_right"><%= lang.LF("数据索引优化") %></a></li>                     
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/SystemFinger.aspx" %>" target="main_right"><%= lang.LF("服务器信息总览") %></a></li>
                </ul>
            </div>
            <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("数据维护")%></div>
            <div class="guide">
                <ul>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/DataSearch.aspx" %>" target="main_right"><%= lang.LF("全库数据检索") %></a></li> 
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/SQLManage.aspx" %>" target="main_right"><%= lang.LF("计划任务") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/CreateTable.aspx" %>" target="main_right"><%= lang.LF("快速建表") %></a></li>    
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/RunSql.aspx" %>" target="main_right"><%=lang.LF("执行SQL语句")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/DataAssert.aspx" %>" target="main_right"><%=lang.LF("表内容批处理")%></a></li>
                   <%-- <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/DevelopmentCenter.aspx" target="main_right"><%=lang.LF("自动流程应用")%></a></li>--%>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/EmptyData.aspx" %>" target="main_right"><%= lang.LF("清空测试数据") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="<%:customPath2+"I/Config/ViewList.aspx" %>" target="main_right"><%= lang.LF("视图管理") %></a></li>                
                </ul>
            </div>
        </div>
    </li>
</ul>
</div>
</form>
</body>
</html>