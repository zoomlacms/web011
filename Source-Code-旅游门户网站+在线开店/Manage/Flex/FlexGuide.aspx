<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_Default, App_Web_rk4a05z0" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>Flex <%=lang.LF("管理系统")%></title>
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
<body id="Guidebody" style="margin: 0px; margin-top:1px;">
<form id="formGuide" runat="server">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext">Flex <%=lang.LF("管理系统")%></div>
        </li>
        <li id="Li1">
            <div id="Div2">
                <div class="guideexpand" onclick="Switch(this)">Flex <%=lang.LF("产品管理")%></div>                    
                <div class="guide">
                <ul>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="productManage.aspx" target="main_right"><%=lang.LF("产品管理")%></a></li>                        
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="Addproduct.aspx" target="main_right"><%=lang.LF("添加产品")%></a></li>
                </ul>
                </div>
            </div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)">Flex <%=lang.LF("模板分类")%></div>                    
                <div class="guide">
                <ul>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="ClassManage.aspx" target="main_right"><%=lang.LF("模板分类管理")%></a></li>                        
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="Addclass.aspx" target="main_right"><%=lang.LF("添加模板分类")%></a></li>
                    
                </ul>
                </div>
            </div>
        </li>

        <li id="Li2">
            <div id="Div3">
                <div class="guideexpand" onclick="Switch(this)">Flex <%=lang.LF("礼品管理")%></div>                    
                <div class="guide">
                <ul>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="FlexTemplate.aspx" target="main_right">Flex <%=lang.LF("礼品管理")%></a></li>                        
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="AddTemplate.aspx" target="main_right"><%=lang.LF("添加Flex礼品")%></a></li>
                    
                </ul>
                </div>
            </div>
        </li>

<li id="Li3">
            <div id="Div4">
                <div class="guideexpand" onclick="Switch(this)">Flex <%=lang.LF("页面管理")%>                </div>                    
                <div class="guide">
                <ul>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="FlexItemManage.aspx" target="main_right"><%=lang.LF("礼品页面管理")%></a></li>                        
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="AddItempage.aspx" target="main_right"><%=lang.LF("添加礼品页面")%></a></li>                    
                </ul>
                </div>
            </div>
        </li>
     </ul>
</div>
</form>
</body>
</html>