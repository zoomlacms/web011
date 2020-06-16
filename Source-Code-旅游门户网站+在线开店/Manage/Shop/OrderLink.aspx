<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.OrderLink, App_Web_3rrk3jrp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=lang.LF("订单管理")%></title>
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
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
            <div id="Guide_toptext"><%=lang.LF("购物订单")%></div>
        </li>
        <li id="Guide_main">
            <div id="Div2">
                <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("订单管理")%></div>                    
                <div class="guide">
                <ul>                        
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="CartManage.aspx" target="main_right"><%=lang.LF("购物车记录")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OrderList.aspx" target="main_right"><%=lang.LF("商城订单")%></a></li>                   
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="UserOrderlist.aspx?type=0" target="main_right"><%=lang.LF("店铺订单")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="/User/Shopfee/OrderList.aspx" target="main_right"><%=lang.LF("代购订单")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OrderSql.aspx" target="main_right"><%=lang.LF("账单管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OtherOrder/Hotel_Order_Manager.aspx" target="main_right"><%=lang.LF("酒店订单管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OtherOrder/Flight_Order_Management.aspx" target="main_right"><%=lang.LF("机票订单管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OtherOrder/TravelOrder_Manager.aspx" target="main_right"><%=lang.LF("旅游订单管理")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OtherOrder/DomainOrder.aspx?OrderType=5" target="main_right">域名订单管理</a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OtherOrder/IDCOrder.aspx?OrderType=7" target="main_right">IDC服务订单</a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="FillOrder.aspx" target="main_right">补订单</a></li>
                    <li>
            <div style="width:185px;margin-left:2px; margin-top:5px;" >
            <div class="input-group input-group-sm" >
                <input type="text" id="order" class="form-control" style="width:140px;" value="请输入IDC订单编号" onfocus="if (this.value == '请输入IDC订单编号') { this.value = ''; this.style.color = 'black';}"
               onblur="if(this.value==''){this.value='请输入IDC订单编号';}" onkeypress="CheckInfo(this)">
        <div style="display:none;">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div> 
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" onclick="search()">搜索</button>
                </span>
            </div><!-- /input-group -->
            </div>
        </li>
                </ul>
                </div>
            </div>
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)">
                    <%=lang.LF("业务分析")%>
                </div>                    
                <div class="guide">
                <ul>                        
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="LocationReport.aspx" target="main_right"><%=lang.LF("省市报表")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="MonthlyReport.aspx" target="main_right"><%=lang.LF("月报表")%></a></li>
                     
                  <%--   <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="StoreOrderlist.aspx" target="main_right"><%=lang.LF("鲜花店铺快速订单")%></a></li>--%>
                    
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="OrderConfi.aspx" target="main_right"><%=lang.LF("订单信息配置")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="SystemOrderModel.aspx?Type=site" target="main_right"><%=lang.LF("网站订单参数")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="SystemOrderModel.aspx?Type=shop" target="main_right"><%=lang.LF("店铺订单参数")%></a></li>
                      
                </ul>
                </div>
            </div>
        </li>
        
     </ul>
</div>
</form>
<script src="../../JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../../dist/js/bootstrap.min.js" type="text/javascript"></script>
<script>
    function CheckInfo(obj) {
        if (event.keyCode == 13) {
            //alert(obj.value);
            search();
        }
    }
    function search()
    {
        var OrderNum = document.getElementById("order").value;
        if (OrderNum == "请输入IDC订单编号") {
            window.open('OtherOrder/IDCOrder.aspx?&OrderType=7', "main_right");
        }
        else {
            window.open('OtherOrder/IDCOrder.aspx?menu=souch&souchtable=1&OrderType=7&souchkey=' + OrderNum, "main_right");
        }
    }
</script>
</body>
</html>
