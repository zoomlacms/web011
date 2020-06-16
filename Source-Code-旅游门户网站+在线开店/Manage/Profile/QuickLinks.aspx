<%@ page language="C#" autoeventwireup="true" inherits="manage_Profile_QuickLinks, App_Web_hgre3m2j" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ OutputCache Duration="6000" VaryByParam="*" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("工作台导航")%></title>
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
    function OpenLink(lefturl, righturl)
    {
        if(lefturl!="")
        {
            parent.frames["left"].location = lefturl; 
        }

        try {
            parent.MDIOpen(righturl);void (0);
        } catch (Error) {
        parent.frames["main_right"].location = "../" + righturl; ; void (0);
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
            <div id="Guide_toptext"><%=lang.LF("工作台")%></div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)">
                    <%=lang.LF("工作台快捷导航")%>
                </div>                    
                <div class="guide">
                <ul>                
                   <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Shop/ProductManage.aspx" target="main_right"><%=lang.LF("商品管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Shop/OrderList.aspx" target="main_right"><%=lang.LF("订单管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Content/ModelManage.aspx?ModelType=1" target="main_right"><%=lang.LF("模型管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Content/NodeManage.aspx" target="main_right"><%=lang.LF("节点管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/TemplateManage.aspx" target="main_right"><%=lang.LF("模板管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Template/LabelManage.aspx" target="main_right"><%=lang.LF("标签管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/UserManage.aspx" target="main_right"><%=lang.LF("会员管理")%></a></li> 
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Content/CreateHtmlContent.aspx" target="main_right"><%=lang.LF("生成发布")%></a></li>  
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/SiteInfo.aspx" target="main_right"><%=lang.LF("网站配置")%></a></li>
                     <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../mobile/Default.aspx" target="_top">移动管理 </a></li>
                </ul>
                </div>
            </div>
        </li>
     </ul>
</div>
</form>
</body>
</html>