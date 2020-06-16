<%@ page language="C#" autoeventwireup="true" inherits="manage_Template_appTemp, App_Web_fx1qjkh2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>预览</title> 
<link href="../../App_Themes/AdminDefaultTheme/default.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/perfectDrag.js"></script>
<script type="text/javascript">
    var oTimer = null;
    var iSpeed = 0;
    var iNow = 0;

    window.onload = function () {
        var oUl = document.getElementById('wrap').getElementsByTagName('ul')[0];

        var iStartX;

        new MiaovPerfectDrag
        (
            oUl,
            function () {
                return { x: oUl.offsetLeft, y: oUl.offsetTop };
            },
            function (x, y) {
                oUl.style.left = x + 'px';
                //oUl.style.top=y+'px';
            },
            function () {
                stopMove();
                iStartX = oUl.offsetLeft;
            },
            function ()	//当拖拽结束
            {
                if (Math.abs(oUl.offsetLeft - iStartX) >= 50) {
                    if (oUl.offsetLeft > iStartX) {
                        iNow--;
                        if (iNow < 0) {
                            iNow = 0;
                        }
                    }
                    else {
                        iNow++;
                        if (iNow >= oUl.getElementsByTagName('li').length) {
                            iNow = oUl.getElementsByTagName('li').length - 1;
                        }
                    }
                }
                startMove(-iNow * oUl.getElementsByTagName('li')[0].offsetWidth);
            }
        );
    };

    function startMove(iTarget) {
        if (oTimer) {
            clearInterval(oTimer);
        }

        oTimer = setInterval("doMove(" + iTarget + ")", 30);
    }

    function doMove(iTarget) {
        var oUl = document.getElementById('wrap').getElementsByTagName('ul')[0];
        var l = oUl.offsetLeft;
        iSpeed += (iTarget - oUl.offsetLeft) / 5;
        iSpeed *= 0.7;
        l += iSpeed;

        if (Math.abs(iTarget - oUl.offsetLeft) < 1 && Math.abs(iSpeed) < 1) {
            clearInterval(oTimer);
            oTimer = null;
            l = iTarget;
        }

        oUl.style.left = l + 'px';
    }

    function stopMove() {
        if (oTimer) {
            clearInterval(oTimer);
        }
    }
    function getback() {
        var oUl = document.getElementById('wrap').getElementsByTagName('ul')[0];
        startMove(0);
    }
    function getone() {
        var oUl = document.getElementById('wrap').getElementsByTagName('ul')[0];
        startMove(-272);
    }

</script> 
</head>
<body>
    <form id="form1" runat="server">
     <div id="wrap" class="wclDiv<%=Request["d"] %>">
		<ul>
			<li title="首页"><div id="clDiv1"><span class="head_icon pa0<%=Request["dtype"] %>" onclick="javascript:getone()">  </span><span class="nav-tit">首页</span></div>
               <div class="mymeu">我的信息</div>
                 <div class="mycon"><p>
                    华夏互联专业主机与建站服务<br />
新站群门户时代到来-2012年站<br />
2012华夏互联名师互动系列活动</p></div>
			</li>
			<li title="导航"><div class="back-btn" data-action="go-back"><span class="header-icon"  onclick="getback()"></span></div> 
               <div class="nav-site<%=Request["dtype"] %>" >   	 
                <span class="back-btn head_icon"></span>    <span class="nav-tit">导航大全</span>      
         </div>   
         <div class="nav-site3-body" id="allNavContent" style="height: 889px; overflow-x: hidden; overflow-y: hidden; ">
               <span class="navi" onclick="getback()">首页</span> 
              <span class="navi" onclick="javascript:window.open('http://help.zoomla.cn');" >帮助</span> 
             <span class="navi" onclick="getback()" >应用</span> 
             <span class="navi"  onclick="javascript:window.open('http://www.zoomla.cn');" >官网</span> 
             <span class="navi"  onclick="javascript:window.open('http://bbs.zoomla.cn');" >逐浪助手</span>
               <span class="navi" onclick="javascript:window.open('http://www.hx008.com');" > 华夏互联 </span></div>    </li>
            </ul>
        </div>
    </form>
</body>
</html>
