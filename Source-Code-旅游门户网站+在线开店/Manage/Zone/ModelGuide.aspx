<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ZoneModelGuide, App_Web_muuicuqm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("空间模型管理")%></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">    
function Switch(obj)
{
    obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
    var nextDiv;
    if (obj.nextSibling)
    {
        if(obj.nextSibling.nodeName=="DIV")
        {
            nextDiv = obj.nextSibling;
        }
        else
        {
            if(obj.nextSibling.nextSibling)
            {
                if(obj.nextSibling.nextSibling.nodeName=="DIV")
                {
                    nextDiv = obj.nextSibling.nextSibling;
                }
            }
        }
        if(nextDiv)
        {
            nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none"; 
        }
    }
}
function OpenLink(lefturl,righturl)
{
    if(lefturl!="")
    {
        parent.frames["left"].location =lefturl;
    }
    try {
        parent.MDILoadurl(righturl); return false;
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
<body id="Guidebody" style="margin: 0px; margin-top:1px;">
<form id="formGuide" runat="server">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext">SNS <%=lang.LF("空间模型管理")%></div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)">SNS <%=lang.LF("空间模型管理")%> </div>                    
                <div class="guide">
                <ul>     
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/ZoneConfig.aspx" target="main_right"><%=lang.LF("会员空间配置")%></a></li>                   
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/ZoneManage.aspx" target="main_right"><%=lang.LF("会员空间管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/ZoneApplyManage.aspx" target="main_right"><%=lang.LF("审核用户空间")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/ZoneStyleManage.aspx" target="main_right"><%=lang.LF("空间模板管理")%></a></li>
                    
                    <%--<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Zone\BannerManage.aspx" target="main_right">栏目管理</a></li>--%>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/FriendSearchManage.aspx" target="main_right"><%=lang.LF("搜索好友管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/ProductManage.aspx" target="main_right"><%=lang.LF("虚拟商品管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/CarManage.aspx" target="main_right"><%=lang.LF("抢车位车辆管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/LargessMoney.aspx" target="main_right"><%=lang.LF("赠送游戏币")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/GSManage.aspx" target="main_right"><%=lang.LF("空间族群管理")%></a></li>               
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/UnitConfig.aspx" target="main_right"><%=lang.LF("空间信息设置")%></a></li>                   
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/SnsSchool.aspx" target="main_right"><%=lang.LF("学校信息管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/SnsClassRoom.aspx" target="main_right"><%=lang.LF("班级信息管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'" style="display:none"> <a href="../Zone/SnsStudentModel.aspx" target="main_right"><%=lang.LF("学校会员模型")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/LabelHelp.aspx" target="main_right"><%=lang.LF("标签说明")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Zone/Mtit.aspx" target="main_right"><%=lang.LF("插件管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"> <a href="../I/Component/Component.aspx" target="main_right"><%=lang.LF("组件列表")%></a></li>
                </ul>
                </div>
            </div>
        </li>
     </ul>
</div>
</form>
</body>
</html>

