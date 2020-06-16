<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.ConfigGuide, App_Web_i0yrs3js" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("商城设置")%></title>
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
    <div id="Guide_toptext">
        <%=lang.LF("商城设置")%></div>
</li>
<li id="Guide_main">
<div id="Guide_box">
    <div class="guideexpand" onclick="Switch(this)">
        <%=lang.LF("商城设置")%>
    </div>                    
    <div class="guide">
    <ul>                        
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'" style="display:none"><a href="ShopConfig.aspx"><%=lang.LF("商城参数设置")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="DeliverType.aspx" target="main_right"><%=lang.LF("送货方式设置")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="FreePost.aspx" target="main_right"><%= lang.LF("免邮设置") %></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="ProducerManage.aspx" target="main_right"><%=lang.LF("厂商管理")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="Producer.aspx" target="main_right"><%=lang.LF("添加厂商")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="TrademarkManage.aspx" target="main_right"><%=lang.LF("品牌管理")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="Trademark.aspx" target="main_right"><%=lang.LF("添加品牌")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CardManage.aspx" target="main_right"><%=lang.LF("VIP卡管理")%></a></li>                      
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CashManage.aspx" target="main_right"><%=lang.LF("处理VIP卡提现金")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="ProductCashManage.aspx" target="main_right"><%=lang.LF("厂商提取现金")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="BossSite.aspx" target="main_right"><%=lang.LF("提成比例设置")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="MoneyManage.aspx" target="main_right"><%=lang.LF("货币管理")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../../User/Shopfee/Default.aspx" target="main_right"><%=lang.LF("运费计算")%></a></li>
        <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="InvtoManage.aspx" target="main_right"><%=lang.LF("发票配置")%></a></li>
    </ul>
    </div>
</div>
</li>
</ul>
</div>
</form>
</body>
</html>