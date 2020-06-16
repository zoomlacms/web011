<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.AuditingLink, App_Web_zxhe1krl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ OutputCache Duration="30000" VaryByParam="None" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>OA系统配置</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
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
    $().ready(function () {
        $("#navUL li").addClass("guideli");
        $("#navUL li").mouseover(function () { $(this).removeClass("guideli").addClass("guidelihover") }).mouseout(function () { $(this).removeClass("guidelihover").addClass("guideli") });
    });
    function search()
    {
        var PName = document.getElementById("Pname").value;
        window.open('../WorkFlow/Default.aspx?Pname=' + PName, "main_right");
    }
</script>
</head>
<body id="Guidebody" style="margin: 0px; margin-top: 1px;">
<form id="formGuide" runat="server">
 <div id="Guide_back">
  <ul id="navUL">
    <li id="Li2">
      <div id="Div2">
        <div class="guideexpand" onclick="Switch(this)">OA系统配置</div>
        <div class="guide">
            <ul>
                <li><a href="ModelManage.aspx?ModelType=9" target="main_right">办公模型</a></li>
                <li><a href="../WorkFlow/Default.aspx" target="main_right">流程管理</a></li>
                <li><a href="../WorkFlow/FlowTypeList.aspx" target="main_right">类型管理</a></li>
                <li><a href="../WorkFlow/MisModelManage.aspx" target="main_right">模板管理</a></li>
                <li><a href="../WorkFlow/SignManage.aspx" target="main_right">签章管理</a></li>
                <li><a href="../User/PermissionInfo.aspx" target="main_right">权限管理</a></li>
                <li><a href="../WorkFlow/MailManage.aspx" target="main_right">邮箱管理</a></li>
                <li><a href="../WorkFlow/OAConfig.aspx" target="main_right">系统配置</a></li>
            </ul>
        </div>
      </div>
    </li>
    <li id="Li1">
      <div id="Div1">
        <div class="guideexpand" onclick="Switch(this)">OA文档管理</div>
        <div class="guide">
            <ul>
                <li><a href="../WorkFlow/AffairManage.aspx" target="main_right">公文管理</a></li>
                <li><a href="../WorkFlow/DocManage.aspx" target="main_right">文档管理</a></li>
            </ul>
        </div>
      </div>
    </li>
    <%--<li id="Guide_main">
      <div id="Guide_box">
        <div class="guideexpand" onclick="Switch(this)">状态码管理</div>
        <div class="guide">
            <ul>
                <li><a href="../Content/AuditingState.aspx" target="main_right">审核状态管理</a></li>
                <li><a href="../Content/AddAuditingState.aspx" target="main_right">添加审核状态码</a></li>
            </ul>
        </div>
      </div>
    </li>--%>
  </ul>
 </div>
<div style="margin-top:20px; padding-left:5px;">
    按名称搜索流程：<br />
    <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input">
        <tr>
            <td>
                <input id="Pname"  style="border-color:#fff" class="l_inpnon" runat="server" onkeypress="CheckInfo(this)"/>
                <script type="text/javascript">
                    function CheckInfo(obj) {
                        if (event.keyCode == 13) {
                            //alert(obj.value);
                            search();
                        }
                    }
                </script>
                <input type="button" onclick="search()"  class="C_sch"/>
            </td>
        </tr>
    </table>
</div>
</form>
</body>
</html>