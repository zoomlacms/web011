<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.index, App_Web_xjztgbsf" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html lang="zh">
<head id="Head1" runat="server">
<meta charset="utf-8">
<title><%=Call.SiteName%>--后台管理</title>
<link type="text/css" rel="stylesheet" href="~/App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="~/App_Themes/AdminDefaultTheme/Default.css" />
<link type="text/css" rel="stylesheet" href="~/App_Themes/AdminDefaultTheme/PromptSkin/ymPrompt.css" id='skin' />
<script type="text/javascript" src="../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../JS/Popmenu.js"></script>
<script type="text/javascript" src="../../JS/AJAXRequest.js"></script>
<script type="text/javascript" src="../../JS/ManageJS.js"></script>
<script type="text/javascript" src="../../JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="../../js/Drag.js"></script>
<script type="text/javascript" src="../../js/Dialog.js"></script>
<script type="text/javascript" src="../../js/FrameTab.js"></script>
<script type="text/javascript" src="../../js/AdminIndex.js"></script>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script type="text/javascript" src="../../js/alt.js"></script>
<style type="text/css">#tranDiv { background-color: #1C6297; } </style>
<script type="text/javascript">
    function modalDialog(url, name, width, height) {
        if (width == undefined) {
            width = 600;
        }
        if (height == undefined) {
            height = 500;
        }

        if (window.showModalDialog) {
            window.showModalDialog(url, name, 'dialogWidth=' + (width) + 'px; dialogHeight=' + (height + 5) + 'px; status=off');
        }
        else {
            x = (window.screen.width - width) / 2;
            y = (window.screen.height - height) / 2;

            window.open(url, name, 'height=' + height + ', width=' + width + ', left=' + x + ', top=' + y + ', toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, modal=yes');
        }
    }

    var ajax = new AJAXRequest;
    function tipMes() {
        ajax.get("/User/mess.aspx?c=show", function (obj) {
            var tip = obj.responseText; //获得返回信息
            var tips = tip.split("|");
            if (tips.length > 1 && tips[0] != 0) {
                var content = "<a href='javascript:void(0)' hidefocus='true' onclick='top.OpenOnline()'><FONT color=#ff0000>点击查看</FONT></a><br/>";
                showmsg("您有" + tips[0] + "条新信息", content);
            }
        });
    }
    function showmsg(tip, content) {
        var MSG = new CLASS_MSN_MESSAGE("aa", 200, 120, "短消息提示：", tip, content);
        MSG.speed = 10;
        MSG.step = 2;
        MSG.show();
    }

    function OpenOnline() {
        //            var diag = new Dialog();
        //            diag.Modal = false;
        //            diag.Width = 640;
        //            diag.Height = 490;
        //            diag.Title = "逐浪在线客服系统服务控制台<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        //            diag.URL = "../OnlineService/ShowForm.aspx?type=0";
        //            diag.show();
        //window.open("../../Common/SelectStyle.htm", "", "width=600,height=400")
        ymPrompt.win("../OnlineService/ShowForm.aspx?type=0", 650, 580, "逐浪在线客服系统服务控制台<span style='font-weight:normal'>[ESC键退出当前操作]", null, null, null, true);
        //ymPrompt.win('../OnlineService/ShowForm.aspx?type=0',500,300,'逐浪在线客服系统服务控制台',handler,null,null,true)" 
    }

    function Installtemp(url) {
        var diag = new Dialog();
        diag.Modal = false;
        diag.Width = 640;
        diag.Height = 490;
        diag.Title = "系统安装风格窗口<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = url;
        diag.show();
    }

    function openwin(title, url) {
        var diag = new Dialog();
        diag.Width = 640;
        diag.Height = 520;
        diag.Title = title + "<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = url;
        diag.show();
    }

    function openclent(url) {
        var diag = new Dialog();
        diag.Modal = false;
        diag.Width = 640;
        diag.Height = 490;
        diag.Title = "逐浪在线客服系统服务控制台<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = url; // "../OnlineService/ShowForm.aspx?type=0";
        diag.show();
        //window.open("../../Common/SelectStyle.htm", "", "width=600,height=400")
    }

    //后台短消息提示
    if ('<%=IsSMSTipsShow %>') 
    {
        window.setInterval("tipMes()", 20000);
    }

    //设置Cookies
    function setCookie(obj) {
        if (!navigator.cookieEnabled) {
            alert('不允许设置Cookie项!');
        } else {

            var date = new Date();
            date.setTime(date.getTime() + 60000 * 10);
            document.cookie = "SetLock=" + escape(obj) + ";expires=" + date.toGMTString() + ";path=/" + ";domaim=zgdsc.cn" + ":secure";
        }
    }

    //获取Cookies
    function getCookie(cookie_name) {
        var allcookies = document.cookie;
        var cookie_pos = allcookies.indexOf(cookie_name);
        // 如果找到了索引，就代表cookie存在，
        // 反之，就说明不存在。  
        if (cookie_pos != -1) {
            // 把cookie_pos放在值的开始，只要给值加1即可。   
            cookie_pos += cookie_name.length + 1;
            var cookie_end = allcookies.indexOf(";", cookie_pos);
            if (cookie_end == -1) {
                cookie_end = allcookies.length;
            }
            var value = unescape(allcookies.substring(cookie_pos, cookie_end));
        }
        return value;
    }

    window.onload = function () {
        if (getCookie("SetLock") == "1") {
            showWindow('Lockin.aspx',900, 460);
        }
        var css = document.getElementById("skin");
        css.href = "/App_Themes/AdminDefaultTheme/PromptSkin/ymPrompt.css";
        //SelectIndexChange("Content")
    }

    function showWindow(url,width, height) {
        setCookie('1');
        var windowstr = "<p align=center><iframe src='"+url+"' width='900px' height='460px' scrolling='no' frameborder='0'></iframe></p>";
        document.getElementById("infoDiv").innerHTML = windowstr;
        document.getElementById("infoDiv").style.left = (((document.body.clientWidth - width) > 0 ? (document.body.clientWidth - width) : 0) / 2) + "px";
        document.getElementById("infoDiv").style.top = (((document.body.clientHeight - height) > 0 ? (document.body.clientHeight - height) : 0) / 2) + "px";
        document.getElementById("infoDiv").style.width = "1000px";
        document.getElementById("infoDiv").style.height = "460px";
        document.getElementById("tranDiv").style.height = document.body.clientHeight + "px";
        document.getElementById("tranDiv").style.width = document.body.clientWidth + "px";
        document.getElementById("tranDiv").style.display = "";
        document.getElementById("tranDivBack").style.display = "";
        document.getElementById("infoDiv").style.display = "";
        document.getElementById("frameBar").style.display = "none";
    }

    autoResize = function (width, height) {
        document.getElementById("tranDivBack").style.width = document.body.clientWidth > document.body.scrollWidth ? document.body.clientWidth : document.body.scrollWidth;
        document.getElementById("tranDivBack").style.height = document.body.clientHeight > document.body.scrollHeight ? document.body.clientHeight : document.body.scrollHeight;
        document.getElementById("tranDiv").style.width = document.body.clientWidth;
        document.getElementById("tranDiv").style.height = document.body.clientHeight;
        document.getElementById("infoDiv").style.left = ((document.body.clientWidth - width) > 0 ? (document.body.clientWidth - width) : 0) / 2 + "px";
        document.getElementById("infoDiv").style.top = ((document.body.clientHeight - height) > 0 ? (document.body.clientHeight - height) : 0) / 2 + "px";
        document.getElementById("infoDiv").style.width = width < document.body.clientWidth ? width : document.body.clientWidth;
        document.getElementById("infoDiv").style.height = height < document.body.clientHeight ? height : document.body.clientHeight;
    }
	
    // 添加Cookie
 function setcloud(c_name,value,expiredays)
{
var exdate=new Date()
exdate.setDate(exdate.getDate()+expiredays)
 document.cookie=c_name+ "=" +escape(value)+
((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
 }

function getcloud(c_name)
 {
if (document.cookie.length>0)
  { 
   c_start=document.cookie.indexOf(c_name + "=")
  if (c_start!=-1)
    { 
     c_start=c_start + c_name.length+1; 
    c_end=document.cookie.indexOf(";",c_start); 
	
    if (c_end==-1) c_end=document.cookie.length; 
 document.getElementById("ball").style.display="none";
  }
   }
return ""
 
}
function closeed(){
document.getElementById("ball").style.display="none"; 	}
</script>
<script type="text/javascript">
     function search()
     {
         var LabelCate = "";
         var LabelName = document.getElementById("Lname").value;
         window.open('Page.aspx?name=' + LabelName, "main_right");
     }
 </script>

<%
if (ZoomLa.Components.SiteConfig.SiteOption.Desk != "")
{
string desk = ZoomLa.Components.SiteConfig.SiteOption.Desk;
if (desk != null && desk.IndexOf("|") > -1)
{
string[] deskarr = desk.Split('|');
showtype = deskarr[0];
Response.Write("<script>\r\n      var showtype='" + showtype + "';\r\n");
for (int i = 1; i < deskarr.Length; i++)
{
	Response.Write("      var value" + i + "='" + deskarr[i] + "';\r\n");
}
if (showtype == "Content" || showtype == "Shop" || showtype == "Page" || showtype == "Forum" || showtype == "OA")
{
	WorkTable = deskarr[1].ToString();
}
if (showtype == "All")
{
	string contentcfg = deskarr[1];//内容管理
	string shopcfg = deskarr[2];//商城管理
	string pagecfg = deskarr[3];//黄页系统
	string forumcfg = deskarr[4];//教育模块
	string oacfg = deskarr[5];//智能办公
	string configcfg = deskarr[6];//配置场景
	//我的工作台
	int showin = ZoomLa.Common.DataConverter.CLng(contentcfg.Substring(0, 1));
	int showin1 = ZoomLa.Common.DataConverter.CLng(shopcfg.Substring(0, 1));
	int showin2 = ZoomLa.Common.DataConverter.CLng(pagecfg.Substring(0, 1));
	int showin3 = ZoomLa.Common.DataConverter.CLng(forumcfg.Substring(0, 1));
	int showin4 = ZoomLa.Common.DataConverter.CLng(oacfg.Substring(0, 1));
	if ((showin == 1) || (showin1 == 1) || (showin2 == 1) || (showin3 == 1) || (showin4 == 1))
	{
		WorkTable = "1";
	}
	//内容管理
	showContent = ZoomLa.Common.DataConverter.CLng(contentcfg.Substring(1, 1));
	//商城管理
	ShowShop = ZoomLa.Common.DataConverter.CLng(shopcfg.Substring(1, 1));
	//企业黄页
	ShowPage = ZoomLa.Common.DataConverter.CLng(pagecfg.Substring(1, 1));
	//用户社区
	int user1 = ZoomLa.Common.DataConverter.CLng(contentcfg.Substring(2, 1));
	int user2 = ZoomLa.Common.DataConverter.CLng(shopcfg.Substring(2, 1));
	int user3 = ZoomLa.Common.DataConverter.CLng(pagecfg.Substring(2, 1));
	int user4 = ZoomLa.Common.DataConverter.CLng(oacfg.Substring(1, 1));
	int user5 = ZoomLa.Common.DataConverter.CLng(configcfg.Substring(0, 1));
	if (user1 == 1 || user2 == 1 || user3 == 1 || user4 == 1 || user5 == 1)
	{
		ShowUser = 1;
	}
	//扩展功能
	int showp1 = ZoomLa.Common.DataConverter.CLng(contentcfg.Substring(3, 1));
	int showp2 = ZoomLa.Common.DataConverter.CLng(shopcfg.Substring(3, 1));
	int showp3 = ZoomLa.Common.DataConverter.CLng(pagecfg.Substring(3, 1));
	int showp4 = ZoomLa.Common.DataConverter.CLng(forumcfg.Substring(1, 1));
	int showp5 = ZoomLa.Common.DataConverter.CLng(configcfg.Substring(1, 1));
	if (showp1 == 1 || showp2 == 1 || showp3 == 1 || showp4 == 1 || showp5 == 1)
	{
		ShowPlub = 1;
	}
	//系统配置
	int sys1 = ZoomLa.Common.DataConverter.CLng(contentcfg.Substring(4, 1));
	int sys2 = ZoomLa.Common.DataConverter.CLng(shopcfg.Substring(4, 1));
	int sys3 = ZoomLa.Common.DataConverter.CLng(pagecfg.Substring(4, 1));
	int sys4 = ZoomLa.Common.DataConverter.CLng(configcfg.Substring(2, 1));
	if (sys1 == 1 || sys2 == 1 || sys3 == 1 || sys4 == 1)
	{
		Showsys = 1;
	}
	ShowForum = ZoomLa.Common.DataConverter.CLng(forumcfg.Substring(2, 1));
	//BI应用
	int bi1 = ZoomLa.Common.DataConverter.CLng(shopcfg.Substring(5, 1));
	int bi2 = ZoomLa.Common.DataConverter.CLng(pagecfg.Substring(5, 1));
	int bi3 = ZoomLa.Common.DataConverter.CLng(forumcfg.Substring(3, 1));
	int bi4 = ZoomLa.Common.DataConverter.CLng(oacfg.Substring(2, 1));
	if (bi1 == 1 || bi2 == 1 || bi3 == 1 || bi4 == 1)
	{
		ShowBI = 1;
	}
}

if (showtype == "Content")
{
	string cd = deskarr[1];//我的工作台
	string cn = deskarr[2];//内容管理
	string cu = deskarr[3];//用户社区
	string ck = deskarr[4];//扩展功能
	string cx = deskarr[5];//系统配置
	#region 全局显示
	WorkTable = cd;
	if (cn.IndexOf('1') == -1)
		showContent = 0;
	else
		showContent = 1;
	if (cu.IndexOf('1') == -1)
		ShowUser = 0;
	else
		ShowUser = 1;
	if (ck.IndexOf('1') == -1)
		ShowPlub = 0;
	else
		ShowPlub = 1;
	if (cx.IndexOf('1') == -1)
		Showsys = 0;
	else
		Showsys = 1;
	#endregion
	for (int i = 0; i < cn.Length; i++)
	{
		showContentArr[i] = cn.Substring(i, 1);
	}
	for (int i = 0; i < cu.Length; i++)
	{
		ShowUserArr[i] = cu.Substring(i, 1);
	}
	for (int i = 0; i < ck.Length; i++)
	{
		ShowPlubArr[i] = ck.Substring(i, 1);
	}
	for (int i = 0; i < cx.Length; i++)
	{
		ShowsysArr[i] = cx.Substring(i, 1);
	}
}
if (showtype == "Shop")
{
	string sd = deskarr[1];//我的工作台
	string ss = deskarr[2];//商城管理
	string su = deskarr[3];//用户社区
	string sk = deskarr[4];//扩展功能
	string sx = deskarr[5];//系统配置
	string sbi = deskarr[6];//BI应用
	#region 全局显示
	WorkTable = sd;
	if (ss.IndexOf('1') == -1)
		ShowShop = 0;
	else
		ShowShop = 1;
	if (su.IndexOf('1') == -1)
		ShowUser = 0;
	else
		ShowUser = 1;
	if (sk.IndexOf('1') == -1)
		ShowPlub = 0;
	else
		ShowPlub = 1;
	if (sx.IndexOf('1') == -1)
		Showsys = 0;
	else
		Showsys = 1;
	if (sbi.IndexOf('1') == -1)
		ShowBI = 0;
	else
		ShowBI = 1;
	#endregion
	for (int i = 0; i < ss.Length; i++)
	{
		ShowShopArr[i] = ss.Substring(i, 1);
	}
	for (int i = 0; i < su.Length; i++)
	{
		ShowUserArr[i] = su.Substring(i, 1);
	}
	for (int i = 0; i < sk.Length; i++)
	{
		ShowPlubArr[i] = sk.Substring(i, 1);
	}
	for (int i = 0; i < sx.Length; i++)
	{
		ShowsysArr[i] = sx.Substring(i, 1);
	}
	for (int i = 0; i < sbi.Length; i++)
	{
		ShowBIArr[i] = sbi.Substring(i, 1);
	}
}
if (showtype == "Page")
{
	string pd = deskarr[1];//我的工作台
	string pp = deskarr[2];//企业黄页
	string pu = deskarr[3];//用户社区
	string pb = deskarr[4];//扩展功能
	string ps = deskarr[5];//系统配置
	string pbi = deskarr[6];//BI应用
	#region 全局显示
	WorkTable = pd;
	if (pp.IndexOf('1') == -1)
		ShowPage = 0;
	else
		ShowPage = 1;
	if (pu.IndexOf('1') == -1)
		ShowUser = 0;
	else
		ShowUser = 1;
	if (pb.IndexOf('1') == -1)
		ShowPlub = 0;
	else
		ShowPlub = 1;
	if (ps.IndexOf('1') == -1)
		Showsys = 0;
	else
		Showsys = 1;
	if (pbi.IndexOf('1') == -1)
		ShowBI = 0;
	else
		ShowBI = 1;
	#endregion
	for (int i = 0; i < pp.Length; i++)
	{
		ShowPageArr[i] = pp.Substring(i, 1);
	}
	for (int i = 0; i < pu.Length; i++)
	{
		ShowUserArr[i] = pu.Substring(i, 1);
	}
	for (int i = 0; i < pb.Length; i++)
	{
		ShowPlubArr[i] = pb.Substring(i, 1);
	}
	for (int i = 0; i < ps.Length; i++)
	{
		ShowsysArr[i] = ps.Substring(i, 1);
	}
	for (int i = 0; i < pbi.Length; i++)
	{
		ShowBIArr[i] = pbi.Substring(i, 1);
	}
}
if (showtype == "Forum")
{
	string fpd = deskarr[1];//我的工作台
	string fb = deskarr[2];//扩展功能
	string ff = deskarr[3];//教育模块
	string fbi = deskarr[4];//BI应用
	#region 全局显示
	WorkTable = fpd;
	if (fb.IndexOf('1') == -1)
		ShowPlub = 0;
	else
		ShowPlub = 1;
	if (ff.IndexOf('1') == -1)
		ShowForum = 0;
	else
		ShowForum = 1;
	if (fbi.IndexOf('1') == -1)
		ShowBI = 0;
	else
		ShowBI = 1;
	#endregion
	for (int i = 0; i < fb.Length; i++)
	{
		ShowPlubArr[i] = fb.Substring(i, 1);
	}
	for (int i = 0; i < ff.Length; i++)
	{
		ShowForumArr[i] = ff.Substring(i, 1);
	}
	for (int i = 0; i < fbi.Length; i++)
	{
		ShowBIArr[i] = fbi.Substring(i, 1);
	}
}
if (showtype == "OA")
{
	string od = deskarr[1];//我的工作台
	string ou = deskarr[2];//用户社区
	string obi = deskarr[3];//BI应用
	#region 全局显示
	WorkTable = od;
	if (ou.IndexOf('1') == -1)
		ShowUser = 0;
	else
		ShowUser = 1;
	if (obi.IndexOf('1') == -1)
		ShowBI = 0;
	else
		ShowBI = 1;
	#endregion
	for (int i = 0; i < ou.Length; i++)
	{
		ShowUserArr[i] = ou.Substring(i, 1);
	}
	for (int i = 0; i < obi.Length; i++)
	{
		ShowBIArr[i] = obi.Substring(i, 1);
	}
}
if (showtype == "Config")
{
	string ccu = deskarr[1];//用户社区
	string cp = deskarr[2];//扩展功能
	string ccx = deskarr[3];//系统配置
	#region 全局显示
	if (ccu.IndexOf('1') == -1)
		ShowUser = 0;
	else
		ShowUser = 1;
	if (cp.IndexOf('1') == -1)
		ShowPlub = 0;
	else
		ShowPlub = 1;
	if (ccx.IndexOf('1') == -1)
		Showsys = 0;
	else
		Showsys = 1;
	#endregion
	for (int i = 0; i < ccu.Length; i++)
	{
		ShowUserArr[i] = ccu.Substring(i, 1);
	}
	for (int i = 0; i < cp.Length; i++)
	{
		ShowPlubArr[i] = cp.Substring(i, 1);
	}
	for (int i = 0; i < ccx.Length; i++)
	{
		ShowsysArr[i] = ccx.Substring(i, 1);
	}
}
if (showtype == "Safe")
{
	string ccu = deskarr[1];//用户社区
	string cp = deskarr[2];//扩展功能
	string ccx = deskarr[3];//系统配置
	#region 全局显示
	if (ccu.IndexOf('1') == -1)
		ShowUser = 0;
	else
		ShowUser = 1;
	if (cp.IndexOf('1') == -1)
		ShowPlub = 0;
	else
		ShowPlub = 1;
	if (ccx.IndexOf('1') == -1)
		Showsys = 0;
	else
		Showsys = 1;
	#endregion
	for (int i = 0; i < ccu.Length; i++)
	{
		ShowUserArr[i] = ccu.Substring(i, 1);
	}
	for (int i = 0; i < cp.Length; i++)
	{
		ShowPlubArr[i] = cp.Substring(i, 1);
	}
	for (int i = 0; i < ccx.Length; i++)
	{
		ShowsysArr[i] = ccx.Substring(i, 1);
	}
}
Response.Write("</script>");
}
}        
%>
</head>
<body id="Indexbody" style="overflow: hidden; width: 100%" runat="server">
<%
if (ConfigurationManager.AppSettings["ShowedAD"].ToString() == "false" || Request.QueryString["ShowCaculator"] == "true")
{ %>
<div id="wbg1">
</div>
<div id="img1">
<a href="javascript:void(0);" onclick="document.getElementById('wbg1').style.display='none';document.getElementById('img1').style.display='none'"
style="color: #535353; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
line-height: 150%; position: absolute; z-index: 800; display: block; right: 16px;
top: 14px; height: 20px; width: 60px; font-size: 14px; text-align: center; cursor: pointer;
color: #7D7D7D;">关闭</a>
<%--        <div id="oDIV11" style="border: 1px solid #014995; background-color: #FFFFFF; width: 800px;
height: 500px; ">
<iframe src="../Common/SelectChinaDay.html" height="90%" width="100%" frameborder="0" scrolling="no" style="margin-top:40px;"></iframe>
</div>--%>
</div>
<%} %>
<%
if (ConfigurationManager.AppSettings["ShowedAD"].ToString() == "false" || Request.QueryString["ShowConfig"] == "true")
{ %>
<div id="wbg">
</div>

<div id="img">
<a href="javascript:void(0);" onclick="document.getElementById('wbg').style.display='none';document.getElementById('img').style.display='none'"
style="color: #535353; font-family: Arial, Helvetica, sans-serif; font-size: 14px;
line-height: 150%; position: absolute; z-index: 800; display: block; right: 16px;
top: 14px; height: 20px; width: 60px; font-size: 14px; text-align: center; cursor: pointer;
color: #7D7D7D;">关闭</a>
<div id="oDIV1" style="border: 1px solid #014995; background-color: #FFFFFF; width: 800px;
height: 500px">
<form action="" method="get" name="form1">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
	<tr>
		<td style="height: 41px">
		</td>
	</tr>
	<tr>
		<td style="height: 41px">
		</td>
	</tr>
	<tr>
		<td style="height: 422px" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td style="height: 24px; background-color: #2177c2; font-size: 14px; font-weight: bold; color: #FFF">
						&nbsp;第一步：选择场景
					</td>
				</tr>
				<tr>
					<td style="height: 24px">
						<input name="Radio1" id="Allradio" type="radio" value="1" checked="checked" style="display: none" />
						<input name="Radio1" id="Contentradio" type="radio" value="1" style="display: none" />
						<input name="Radio1" id="Shopradio" type="radio" value="1" style="display: none" />
						<input name="Radio1" id="Pageradio" type="radio" value="1" style="display: none" />
						<input name="Radio1" id="Forumradio" type="radio" value="1" style="display: none" />
						<input name="Radio1" id="OAradio" type="radio" value="1" style="display: none" />
						<input name="Radio1" id="Configradio" type="radio" style="display: none" />
						<input name="Radio1" id="Saferadio" type="radio" style="display: none" />
						<table width="100%" border="0" cellspacing="10" cellpadding="0">
							<tr>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="AllIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/AllIco/Show1.png"
													onclick="SelectConfig(this.id)"  title="全部显示" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												全部显示
											</td>
										</tr>
									</table>
								</td>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="ContentIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/ContentIco/Show1.png"
													onclick="SelectConfig(this.id)" title="内容管理" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												内容管理
											</td>
										</tr>
									</table>
								</td>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="ShopIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/ShopIco/Show1.png"
													onclick="SelectConfig(this.id)" title="商城管理" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												商城管理
											</td>
										</tr>
									</table>
								</td>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="PageIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/PageIco/Show1.png"
													onclick="SelectConfig(this.id)" title="黄页系统" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												黄页系统
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="ForumIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/ForumIco/Show1.png"
													onclick="SelectConfig(this.id)" title="教育模块" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												教育模块
											</td>
										</tr>
									</table>
								</td>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="OAIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/OAIco/Show1.png"
													onclick="SelectConfig(this.id)" title="智能办公" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												智能办公
											</td>
										</tr>
									</table>
								</td>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="ConfigIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/ConfigIco/Show1.png"
													onclick="SelectConfig(this.id)" title="配置场景" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												配置场景
											</td>
										</tr>
									</table>
								</td>
								<td align="center" valign="middle">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
										<tr>
											<td align="center" valign="middle">
												<img alt="" id="SafeIco" src="../App_Themes/AdminDefaultTheme/images/ControlPanel/SafeIco/Show1.png"
													onclick="SelectConfig(this.id)" title="安全维护" style="cursor: pointer" />
											</td>
										</tr>
										<tr>
											<td align="center" valign="middle" style="line-height: 30px">
												安全维护
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="height: 37px" align="center" valign="top">
			<input id="noshow" name="noshow" type="checkbox" checked="checked" /><label for="noshow">以后不再显示</label>
			<input id="Button0" type="button" value="下一步" class="C_input" onclick="Showtools(0);" />
		</td>
	</tr>
</table>
</form>
</div>
<div id="oDIV2" style="border: 1px solid #014995; background-color: #FFFFFF; width: 800px;
height: 500px; display: none">
<form action="" method="get" name="form1">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
	<tr>
		<td style="height: 41px">
		</td>
	</tr>
	<tr>
		<td style="height: 422px" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td style="height: 24px; background-color: #2177c2; font-size: 14px; font-weight: bold;
						color: #FFF">
						&nbsp;第二步：场景配置<span id="ScanName"></span>
					</td>
				</tr>
				<tr>
					<td style="height: 24px">
						<table style="width: 100%; display: none" id="AllTable">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;内容管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="c1" type="checkbox" checked="checked" />我的工作台
										<input id="c2" type="checkbox" checked="checked" />内容管理
										<input id="c3" type="checkbox" checked="checked" />用户社区
										<input id="c4" type="checkbox" checked="checked" />扩展功能
										<input id="c5" type="checkbox" checked="checked" />系统配置
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;商城管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="s1" type="checkbox" checked="checked" />我的工作台
										<input id="s2" type="checkbox" checked="checked" />商城管理
										<input id="s3" type="checkbox" checked="checked" />用户社区
										<input id="s4" type="checkbox" checked="checked" />扩展功能
										<input id="s5" type="checkbox" checked="checked" />系统配置
										<input id="s6" type="checkbox" checked="checked" />BI应用
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;黄页系统
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="p1" type="checkbox" checked="checked" />我的工作台
										<input id="p2" type="checkbox" checked="checked" />企业黄页
										<input id="p3" type="checkbox" checked="checked" />用户社区
										<input id="p4" type="checkbox" checked="checked" />扩展功能
										<input id="p5" type="checkbox" checked="checked" />系统配置
										<input id="p6" type="checkbox" checked="checked" />BI应用
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;教育模块
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="f1" type="checkbox" checked="checked" />我的工作台
										<input id="f2" type="checkbox" checked="checked" />扩展功能
										<input id="f3" type="checkbox" checked="checked" />教育模块
										<input id="f4" type="checkbox" checked="checked" />BI应用
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;智能办公
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="o1" type="checkbox" checked="checked" />我的工作台
										<input id="o2" type="checkbox" checked="checked" />用户社区
										<input id="o3" type="checkbox" checked="checked" />BI应用
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;配置场景
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="d1" type="checkbox" checked="checked" />用户社区
										<input id="d2" type="checkbox" checked="checked" />扩展功能
										<input id="d3" type="checkbox" checked="checked" />系统配置
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
							id="ContentShow">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;我的工作台
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="cd1" type="checkbox" checked="checked" />我的工作台
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;内容管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="cn1" name="cContent" type="checkbox" checked="checked" />按栏目管理信息
										<input id="cn2" name="cContent" type="checkbox" checked="checked" />按专题管理信息
										<input id="cn3" name="cContent" type="checkbox" checked="checked" />生成发布
										<input id="cn4" name="cContent" type="checkbox" checked="checked" />评论管理
										<input id="cn5" name="cContent" type="checkbox" checked="checked" />互动模块
										<input id="cn6" name="cContent" type="checkbox" checked="checked" />信息采集
										<input id="cn7" name="cContent" type="checkbox" checked="checked" />打印输出
										<input id="cn8" name="cContent" type="checkbox" checked="checked" />回收站<br />&nbsp;
										<input id="cn9" name="cContent" type="checkbox" checked="checked" />内容参数
										<input id="cn10" name="cContent" type="checkbox" checked="checked" />百科问答
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;用户管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="cu1" name="cUser" type="checkbox" checked="checked" />会员管理
										<input id="cu2" name="cUser" type="checkbox" checked="checked" />管理员管理
										<input id="cu3" name="cUser" type="checkbox" checked="checked" />用户角色
										<input id="cu4" name="cUser" type="checkbox" checked="checked" />信息发送
										<input id="cu5" name="cUser" type="checkbox" checked="checked" />订阅中心
										<input id="cu6" name="cUser" type="checkbox" checked="checked" />人才招聘
										<input id="cu7" name="cUser" type="checkbox" checked="checked" />社区(SNS)模块
										<input id="cu8" name="cUser" type="checkbox" checked="checked" />微博管理<br />&nbsp;
										<input id="cu9" name="cUser" type="checkbox" checked="checked" />Nite视频面试管理
										<input id="cu10" name="cUser" type="checkbox" checked="checked" />多人视频管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;扩展功能<!--内容管理场景-->
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="ck1" name="cPlub" type="checkbox" checked="checked" />广告管理
										<input id="ck2" name="cPlub" type="checkbox" checked="checked" />访问统计
										<input id="ck3" name="cPlub" type="checkbox" checked="checked" />日志管理
										<input id="ck4" name="cPlub" type="checkbox" checked="checked" />问卷调查和投票
										<input id="ck5" name="cPlub" type="checkbox" checked="checked" />百科问答
										<input id="ck6" name="cPlub" type="checkbox" checked="checked" />文件管理
										<input id="ck7" name="cPlub" type="checkbox" checked="checked" />数据字典管理
										<input id="ck8" name="cPlub" type="checkbox" checked="checked" />其他管理<br />&nbsp;
										<input id="ck9" name="cPlub" type="checkbox" checked="checked" />其他功能
										<input id="ck10" name="cPlub" type="checkbox" checked="checked" />开发中心
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;系统配置
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="cx1" name="cSytem" type="checkbox" checked="checked" />网站配置
										<input id="cx2" name="cSytem" type="checkbox" checked="checked" />模型管理
										<input id="cx3" name="cSytem" type="checkbox" checked="checked" />节点管理
										<input id="cx4" name="cSytem" type="checkbox" checked="checked" />工作流配置
										<input id="cx5" name="cSytem" type="checkbox" checked="checked" />流程管理
										<input id="cx6" name="cSytem" type="checkbox" checked="checked" />专题管理
										<input id="cx7" name="cSytem" type="checkbox" checked="checked" />模板风格
										<input id="cx8" name="cSytem" type="checkbox" checked="checked" />标签管理
										<input id="cx9" name="cSytem" type="checkbox" checked="checked" />在线支付平台
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
							id="ShopShow">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;我的工作台
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="sd1" type="checkbox" checked="checked" />我的工作台
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;商城管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="ss1" name="Shop" type="checkbox" checked="checked" />商品管理
										<input id="ss2" name="Shop" type="checkbox" checked="checked" />库存管理
										<input id="ss3" name="Shop" type="checkbox" checked="checked" />订单管理
										<input id="ss5" name="Shop" type="checkbox" checked="checked" />明细记录
										<input id="ss6" name="Shop" type="checkbox" checked="checked" />销售统计
										<input id="ss7" name="Shop" type="checkbox" checked="checked" />促销优惠
										<input id="ss9" name="Shop" type="checkbox" checked="checked" />加盟商管理<br />
										&nbsp;&nbsp;<input id="ss10" name="Shop" type="checkbox" checked="checked" />商城回收站
										<input id="ss11" name="Shop" type="checkbox" checked="checked" />店铺管理
										<input id="ss12" name="Shop" type="checkbox" checked="checked" />礼品管理
										<input id="ss13" name="Shop" type="checkbox" checked="checked" />竞拍管理
										<input id="ss14" name="Shop" type="checkbox" checked="checked" />推广返利
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;用户管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="su1" name="sUser" type="checkbox" checked="checked" />会员管理
										<input id="su2" name="sUser" type="checkbox" checked="checked" />管理员管理
										<input id="su3" name="sUser" type="checkbox" checked="checked" />用户角色
										<input id="su4" name="sUser" type="checkbox" checked="checked" />信息发送
										<input id="su5" name="sUser" type="checkbox" checked="checked" />订阅中心
										<input id="su6" name="sUser" type="checkbox" checked="checked" />人才招聘
										<input id="su7" name="sUser" type="checkbox" checked="checked" />社区(SNS)模块
										<input id="su8" name="sUser" type="checkbox" checked="checked" />微博管理
										<input id="su9" name="sUser" type="checkbox" checked="checked" />Nite视频面试管理
										<input id="su10" name="sUser" type="checkbox" checked="checked" />多人视频管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;扩展功能
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="sk1" name="sPlub" type="checkbox" checked="checked" />广告管理
										<input id="sk2" name="sPlub" type="checkbox" checked="checked" />访问统计
										<input id="sk3" name="sPlub" type="checkbox" checked="checked" />日志管理
										<input id="sk4" name="sPlub" type="checkbox" checked="checked" />问卷调查和投票
										<input id="sk5" name="sPlub" type="checkbox" checked="checked" />百科问答
										<input id="sk6" name="sPlub" type="checkbox" checked="checked" />文件管理
										<input id="sk7" name="sPlub" type="checkbox" checked="checked" />数据字典
										<input id="sk8" name="sPlub" type="checkbox" checked="checked" />其他管理<br />
										<input id="sk9" name="sPlub" type="checkbox" checked="checked" />其他功能
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;系统配置
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="sx1" name="sSystem" type="checkbox" checked="checked" />网站配置
										<input id="sx2" name="sSystem" type="checkbox" checked="checked" />模型管理
										<input id="sx3" name="sSystem" type="checkbox" checked="checked" />节点管理
										<input id="sx4" name="sSystem" type="checkbox" checked="checked" />工作流配置
										<input id="sx5" name="sSystem" type="checkbox" checked="checked" />流程管理
										<input id="sx6" name="sSystem" type="checkbox" checked="checked" />专题管理
										<input id="sx7" name="sSystem" type="checkbox" checked="checked" />模板风格
										<input id="sx8" name="sSystem" type="checkbox" checked="checked" />标签管理
										<input id="sx9" name="sSystem" type="checkbox" checked="checked" />在线支付平台管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;BI应用
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="sbi1" name="sBI" type="checkbox" checked="checked" />项目管理
										<input id="sbi2" name="sBI" type="checkbox" checked="checked" />CRM管理
										<input id="sbi3" name="sBI" type="checkbox" checked="checked" />有问必答
									   <%-- <input id="sbi4" name="sBI" type="checkbox" checked="checked" />选 号系统--%>
										<input id="sbi5" name="sBI" type="checkbox" checked="checked" />客服通
										<input id="sbi6" name="sBI" type="checkbox" checked="checked" />工作统计
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
							id="PageShow">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;我的工作台
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="pd1" type="checkbox" checked="checked" />我的工作台
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;企业黄页
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="pp1" name="pPage" type="checkbox" checked="checked" />黄页申请设置
										<input id="pp2" name="pPage" type="checkbox" checked="checked" />黄页审核与管理
										<input id="pp3" name="pPage" type="checkbox" checked="checked" />黄页用户栏目管理
										<input id="pp4" name="pPage" type="checkbox" checked="checked" />黄页内容管理
										<input id="pp5" name="pPage" type="checkbox" checked="checked" />黄页模型管理
										<input id="pp6" name="pPage" type="checkbox" checked="checked" />黄页样式管理
										<input id="pp7" name="pPage" type="checkbox" checked="checked" />黄页风格管理
										<input id="pp8" name="pPage" type="checkbox" checked="checked" />黄页标签管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;用户管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="pu1" name="pUser" type="checkbox" checked="checked" />会员管理
										<input id="pu2" name="pUser" type="checkbox" checked="checked" />管理员管理
										<input id="pu3" name="pUser" type="checkbox" checked="checked" />用户角色
										<input id="pu4" name="pUser" type="checkbox" checked="checked" />信息发送
										<input id="pu5" name="pUser" type="checkbox" checked="checked" />订阅中心
										<input id="pu6" name="pUser" type="checkbox" checked="checked" />人才招聘
										<input id="pu7" name="pUser" type="checkbox" checked="checked" />社区(SNS)模块
										<input id="pu8" name="pUser" type="checkbox" checked="checked" />微博管理
										<input id="pu9" name="pUser" type="checkbox" checked="checked" />Nite视频面试管理
										<input id="pu10" name="pUser" type="checkbox" checked="checked" />多人视频管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;扩展功能
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="pb1" name="pPlub" type="checkbox" checked="checked" />广告管理
										<input id="pb2" name="pPlub" type="checkbox" checked="checked" />访问统计
										<input id="pb3" name="pPlub" type="checkbox" checked="checked" />日志管理
										<input id="pb4" name="pPlub" type="checkbox" checked="checked" />问卷调查和投票
										<input id="pb5" name="pPlub" type="checkbox" checked="checked" />百科问答
										<input id="pb6" name="pPlub" type="checkbox" checked="checked" />文件管理
										<input id="pb7" name="pPlub" type="checkbox" checked="checked" />数据字典
										<input id="pb8" name="pPlub" type="checkbox" checked="checked" />其他管理<br />
										<input id="pb9" name="pPlub" type="checkbox" checked="checked" />其他功能
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;系统配置
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="ps1" name="pSystem" type="checkbox" checked="checked" />网站配置
										<input id="ps2" name="pSystem" type="checkbox" checked="checked" />模型管理
										<input id="ps3" name="pSystem" type="checkbox" checked="checked" />节点管理
										<input id="ps4" name="pSystem" type="checkbox" checked="checked" />工作流配置
										<input id="ps5" name="pSystem" type="checkbox" checked="checked" />流程管理
										<input id="ps6" name="pSystem" type="checkbox" checked="checked" />专题管理
										<input id="ps7" name="pSystem" type="checkbox" checked="checked" />模板风格
										<input id="ps8" name="pSystem" type="checkbox" checked="checked" />标签管理
										<input id="ps9" name="pSystem" type="checkbox" checked="checked" />在线支付平台
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;BI应用
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="pbi1" name="pBI" type="checkbox" checked="checked" />项目管理
										<input id="pbi2" name="pBI" type="checkbox" checked="checked" />CRM管理
										<input id="pbi3" name="pBI" type="checkbox" checked="checked" />有问必答
									   <%-- <input id="pbi4" name="pBI" type="checkbox" checked="checked" />选 号系统--%>
										<input id="pbi4" name="pBI" type="checkbox" checked="checked" />客服通
										<input id="pbi5" name="pBI" type="checkbox" checked="checked" />工作统计
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
							id="ForumShow">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;我的工作台
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="fpd1" type="checkbox" checked="checked" />我的工作台
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;扩展功能
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="fb1" name="fPlub" type="checkbox" checked="checked" />广告管理
										<input id="fb2" name="fPlub" type="checkbox" checked="checked" />访问统计
										<input id="fb3" name="fPlub" type="checkbox" checked="checked" />日志管理
										<input id="fb4" name="fPlub" type="checkbox" checked="checked" />问卷调查和投票
										<input id="fb5" name="fPlub" type="checkbox" checked="checked" />百科问答
										<input id="fb6" name="fPlub" type="checkbox" checked="checked" />文件管理
										<input id="fb7" name="fPlub" type="checkbox" checked="checked" />数据字典管理
										<input id="fb8" name="fPlub" type="checkbox" checked="checked" />其他管理<br />
										<input id="fb9" name="fPlub" type="checkbox" checked="checked" />其他功能
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;教育模块
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="ff1" name="fForum" type="checkbox" checked="checked" />组卷管理
										<input id="ff2" name="fForum" type="checkbox" checked="checked" />考试管理
										<input id="ff3" name="fForum" type="checkbox" checked="checked" />班级管理
										<input id="ff4" name="fForum" type="checkbox" checked="checked" />学员管理
										<input id="ff5" name="fForum" type="checkbox" checked="checked" />培训资源库
										<input id="ff6" name="fForum" type="checkbox" checked="checked" />财务管理
										<input id="ff7" name="fForum" type="checkbox" checked="checked" />阅卷中心
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;BI应用
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="fbi1" name="fBI" type="checkbox" checked="checked" />项目管理
										<input id="fbi2" name="fBI" type="checkbox" checked="checked" />CRM管理
										<input id="fbi3" name="fBI" type="checkbox" checked="checked" />有问必答
										<input id="fbi4" name="fBI" type="checkbox" checked="checked" />客服通
										<input id="fbi5" name="fBI" type="checkbox" checked="checked" />工作统计
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
							id="OAShow">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;我的工作台
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="od1" type="checkbox" checked="checked" />我的工作台
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;用户管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="ou1" name="oUser" type="checkbox" checked="checked" />会员管理
										<input id="ou2" name="oUser" type="checkbox" checked="checked" />管理员管理
										<input id="ou3" name="oUser" type="checkbox" checked="checked" />用户角色
										<input id="ou4" name="oUser" type="checkbox" checked="checked" />信息发送
										<input id="ou5" name="oUser" type="checkbox" checked="checked" />订阅中心
										<input id="ou6" name="oUser" type="checkbox" checked="checked" />人才招聘
										<input id="ou7" name="oUser" type="checkbox" checked="checked" />社区(SNS)模块
										<input id="ou8" name="oUser" type="checkbox" checked="checked" />微博管理
										<input id="ou9" name="oUser" type="checkbox" checked="checked" />Nite视频面试管理
										<input id="ou10" name="oUser" type="checkbox" checked="checked" />多人视频管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;BI应用
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="obi1" name="oBI" type="checkbox" checked="checked" />项目管理
										<input id="obi2" name="oBI" type="checkbox" checked="checked" />CRM管理
										<input id="obi3" name="oBI" type="checkbox" checked="checked" />有问必答
										<input id="obi4" name="oBI" type="checkbox" checked="checked" />客服通
										<input id="obi5" name="oBI" type="checkbox" checked="checked" />工作统计
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
							id="ConfigShow">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;用户管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="ccu1" name="ccUser" type="checkbox" checked="checked" />会员管理
										<input id="ccu2" name="ccUser" type="checkbox" checked="checked" />管理员管理
										<input id="ccu3" name="ccUser" type="checkbox" checked="checked" />用户角色
										<input id="ccu4" name="ccUser" type="checkbox" checked="checked" />信息发送
										<input id="ccu5" name="ccUser" type="checkbox" checked="checked" />订阅中心
										<input id="ccu6" name="ccUser" type="checkbox" checked="checked" />人才招聘
										<input id="ccu7" name="ccUser" type="checkbox" checked="checked" />社区(SNS)模块
										<input id="ccu8" name="ccUser" type="checkbox" checked="checked" />微博管理
										<input id="ccu9" name="ccUser" type="checkbox" checked="checked" />Nite视频面试管理
										<input id="ccu10" name="ccUser" type="checkbox" checked="checked" />多人视频管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;扩展功能
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="cp1" name="cPlub" type="checkbox" checked="checked" />广告管理
										<input id="cp2" name="cPlub" type="checkbox" checked="checked" />访问统计
										<input id="cp3" name="cPlub" type="checkbox" checked="checked" />日志管理
										<input id="cp4" name="cPlub" type="checkbox" checked="checked" />问卷调查和投票
										<input id="cp5" name="cPlub" type="checkbox" checked="checked" />百科问答
										<input id="cp6" name="cPlub" type="checkbox" checked="checked" />文件管理
										<input id="cp7" name="cPlub" type="checkbox" checked="checked" />数据字典
										<input id="cp8" name="cPlub" type="checkbox" checked="checked" />其他管理<br />
										<input id="cp9" name="cPlub" type="checkbox" checked="checked" />其他功能
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;系统配置
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="ccx1" name="ccSystem" type="checkbox" checked="checked" />网站配置
										<input id="ccx2" name="ccSystem" type="checkbox" checked="checked" />模型管理
										<input id="ccx3" name="ccSystem" type="checkbox" checked="checked" />节点管理
										<input id="ccx4" name="ccSystem" type="checkbox" checked="checked" />工作流配置
										<input id="ccx5" name="ccSystem" type="checkbox" checked="checked" />流程管理
										<input id="ccx6" name="ccSystem" type="checkbox" checked="checked" />专题管理
										<input id="ccx7" name="ccSystem" type="checkbox" checked="checked" />模板风格
										<input id="ccx8" name="ccSystem" type="checkbox" checked="checked" />标签管理
										<input id="ccx9" name="ccSystem" type="checkbox" checked="checked" />在线支付平台
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
							id="SafeShow">
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;用户管理
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="Sacu1" name="SacUser" type="checkbox" checked="checked" />会员管理
										<input id="Sacu2" name="SacUser" type="checkbox" checked="checked" />管理员管理
										<input id="Sacu3" name="SacUser" type="checkbox" checked="checked" />用户角色
										<input id="Sacu4" name="SacUser" type="checkbox" checked="checked" />信息发送
										<input id="Sacu5" name="SacUser" type="checkbox" checked="checked" />订阅中心
										<input id="Sacu6" name="SacUser" type="checkbox" checked="checked" />人才招聘
										<input id="Sacu7" name="SacUser" type="checkbox" checked="checked" />社区(SNS)模块
										<input id="Sacu8" name="SacUser" type="checkbox" checked="checked" />微博管理
										<input id="Sacu9" name="SacUser" type="checkbox" checked="checked" />Nite视频面试管理
										<input id="Sacu10" name="SacUser" type="checkbox" checked="checked" />多人视频管理
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;扩展功能
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="sap1" name="SaPlub" type="checkbox" checked="checked" />广告管理
										<input id="sap2" name="SaPlub" type="checkbox" checked="checked" />访问统计
										<input id="sap3" name="SaPlub" type="checkbox" checked="checked" />日志管理
										<input id="sap4" name="SaPlub" type="checkbox" checked="checked" />问卷调查和投票
										<input id="sap5" name="SaPlub" type="checkbox" checked="checked" />百科问答
										<input id="sap6" name="SaPlub" type="checkbox" checked="checked" />文件管理
										<input id="sap7" name="SaPlub" type="checkbox" checked="checked" />数据字典
										<input id="sap8" name="SaPlub" type="checkbox" checked="checked" />其他管理<br />
										<input id="sap9" name="SaPlub" type="checkbox" checked="checked" />其他功能
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">
										&nbsp;系统配置
									</td>
								</tr>
								<tr>
									<td style="height: 24px; font-size: 12px">
										&nbsp;
										<input id="sacx1" name="sacSystem" type="checkbox" checked="checked" />网站配置
										<input id="sacx2" name="sacSystem" type="checkbox" checked="checked" />模型管理
										<input id="sacx3" name="sacSystem" type="checkbox" checked="checked" />节点管理
										<input id="sacx4" name="sacSystem" type="checkbox" checked="checked" />工作流配置
										<input id="sacx5" name="sacSystem" type="checkbox" checked="checked" />流程管理
										<input id="sacx6" name="sacSystem" type="checkbox" checked="checked" />专题管理
										<input id="sacx7" name="sacSystem" type="checkbox" checked="checked" />模板风格
										<input id="sacx8" name="sacSystem" type="checkbox" checked="checked" />标签管理
										<input id="sacx9" name="sacSystem" type="checkbox" checked="checked" />在线支付平台
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="height: 37px" align="center" valign="top">
			<input id="noshow2" name="noshow" type="checkbox" checked="checked" /><label for="noshow">以后不再显示</label>
			<input id="Button2" type="button" value="上一步" class="C_input" onclick="Showtoolsup(1)" />
			<input id="Button3" type="button" value="保存配置" class="C_input" onclick="Showtools(1);disableBtn(this);" />
		</td>
	</tr>
</table>
</form>
</div>
</div>
<%} %>  
<form id="form1" runat="server">
<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tbody>
<tr>
	<td colspan="3" valign="top" align="left">
		<div id="Announce">
			<img src="<%=Call.Logo%>" alt="<%=Call.SiteName%>_后台管理系统" class="logoAdmin"  />
			<p>
				<%--<span><a onclick="OpenOnline()" href="javascript:void(0)">在线客服</a></span>--%>
				<a href="javascript:void(0)" onclick="OpenNewWin('/')" title="网站首页">
				  <%= lang.LF("网站首页")%></a>
				<a href="Site/SiteConfig.aspx" title="站群模式"><%=lang.LF("站群模式")%></a>
				<a href="I/Default.aspx" title="响应模式"><%=lang.LF("响应模式")%></a>
				<a href="javascript:ShowMain('Config/ConfigGuide.aspx','Config/SiteOption.aspx')" title="中英文切换">
					<!-- 语言切换 -->
					<%= lang.LF("语言切换")%></a> <a href="?ShowConfig=true" title="场景切换">
						<%--场景切换--%>  <%= lang.LF("场景切换")%></a> <a href="javascript:modalDialog('/Common/calc.html', 'calculator', 400, 300)">
							<%--计算器--%>  <%= lang.LF("计算器")%></a> <a href="javascript:void(0)" onclick="OpenNewWin('http://help.zoomla.cn')"
								title="在线帮助">
								<%--在线帮助--%>  <%= lang.LF("在线帮助")%></a> <a href="SignOut.aspx" title="安全退出">
									<%--安全退出--%>  <%= lang.LF("安全退出")%></a> <a href="/user/" target="_target" title="ALT+U进入会员中心">
										<img alt="" src="../App_Themes/AdminDefaultTheme/images/manage_user.jpg" style="vertical-align: middle;" /></a>
				<a href="javascript:void(0)" style="cursor: pointer;" title='Alt+Q锁定屏幕' onclick="showWindow('Lockin.aspx',900,460);">
					<img alt="" src="../App_Themes/AdminDefaultTheme/images/lock_closed.jpg" style="vertical-align: middle;" onload="getcloud('cloud')" /></a>
			</p>
		</div>
		<div id="content" class="pos_relat">
		   <%if (ZoomLa.Components.SiteConfig.SiteOption.CloudLeadTips == "1")
			 {
%> <span id="ball"><a href="javascript:ShowMain('Profile/QuickLinks.aspx','Template/CloudLead.aspx')"><%--云端推送--%>  <%= lang.LF("云端推送")%></a><strong><a href="javascript:void(0)" onClick="setcloud('cloud','2','232');closeed()"  title="不再提示">×</a></strong></span>
<% } %>
					  <ul id="ChannelMenuItems">
				<%if (WorkTable == "1")
				  {%>
				<li id="Main_1" class="Main_2" onclick="ShowHideLayer(1,0);">
				   <%:lang.LF("我的工作台") %></li>
				<%} if (showContent == 1)
				  {%>
				<li id="Main_2" class="Main_1" onclick="ShowHideLayer(2,0)">
					<%--内容管理<--%>  <%= lang.LF("内容管理")%></li>
				<%} if (ShowShop == 1)
				  {%>
				<li id="Main_4" class="Main_1" onclick="ShowHideLayer(4,0)">
					<%--商城管理--%>  <%= lang.LF("商城管理")%></li>
				<%} if (ShowPage == 1)
				  {%>
				<li id="Main_6" class="Main_1" onclick="ShowHideLayer(6,0)">
					<%--企业黄页--%>  <%= lang.LF("企业黄页")%></li>
				<%} if (ShowForum == 1)
				  {%>
				<li id="Main_13" class="Main_1" onclick="ShowHideLayer(13,0)">
					<%--教育模块--%>  <%= lang.LF("教育模块")%></li>
				<%} if (ShowUser == 1)
				  {%>
				<li id="Main_3" class="Main_1" onclick="ShowHideLayer(3,0)">
					<%--用户管理--%>  <%= lang.LF("用户管理")%></li>
				<%} if (ShowPlub == 1)
				  {%>
				<li id="Main_9" class="Main_1" onclick="ShowHideLayer(9,0)">
					<%--扩展功能--%>  <%= lang.LF("扩展功能")%></li>
				<%} if (Showsys == 1)
				  {%>
				<li id="Main_8" class="Main_1" onclick="ShowHideLayer(8,0)">
					<%--系统配置--%>  <%= lang.LF("系统配置")%></li>
				<%} if (showtype == "All")
				  {%>
				<%=SiteServer%>
				<%} if (ShowBI == 1)
				  {%>
				<li id="Main_5" class="Main_1" onclick="ShowHideLayer(5,0)">
					<%=UC_BIs%></li>
				<%} %>
			</ul>
		</div>
		<div id="SubMenu">
			<!-- 我的工作台 -->
			<div id="Menu_1" style="width: 100%;">
				<ul>
					<li><a href="javascript:ShowMain('Profile/QuickLinks.aspx','Profile/Worktable.aspx')">
						<%--工作台首页--%>  <%= lang.LF("工作台首页")%></a></li>
					<li><a href="javascript:ShowMain('Search/SearchGuide2.aspx','Search/SearchFunc.aspx')">
						<%--便捷导航--%>  <%= lang.LF("便捷导航")%></a></li> 
					<li><a href="javascript:ShowMain('','Profile/ModifyPassword.aspx')">
						<%--修改密码--%>  <%= lang.LF("修改密码")%></a></li>
					<li><a href="SignOut.aspx"><span class="SignOut">
						<%--安全退出--%>  <%= lang.LF("安全退出")%></span></a></li>
					<li style="display: none;"><a href="javascript:ShowMain('','MessageBoard.aspx')">
						<%--站长留言--%>  <%= lang.LF("站长留言")%></a></li>
				  <li style="float: right; background-image: none; padding-right:20px;">
						<asp:TextBox ID="Lname" runat="server"  class="l_inpnon" style="color:#666; width:150px; height:20px; float:left; margin-top:2px;line-height:20px; margin-right:5px;"
Text="请输入功能名称" onfocus="if (this.value == '请输入功能名称') { this.value = ''; this.style.color = 'black';}" onkeypress="CheckInfo(event)" onkeydown="CheckInfo(event)" ></asp:TextBox>
<script type="text/javascript">
function CheckInfo(evt)
{
	evt = (evt) ? evt : ((window.event) ? window.event : "") 
	keyCode = evt.keyCode ? evt.keyCode : (evt.which ? evt.which : evt.charCode); 
	if (keyCode == 13) 
	{ 
		search();//搜索事件 
	} 
}
</script>
					  <div style="display:none;">
						  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
					  </div>
						<input type="button" onclick="search()" value="" class="sbtn" Style="margin-top:2px;"/>

					</li>
				</ul>
			</div>
			<!-- 内容管理 -->
			<div id="Menu_2" style="width: 100%; display: none;">
				<ul>
					<%if (showContentArr[0].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Content/NodeTree.aspx','Content/ContentManage.aspx')">
						<%--按栏目管理--%>  <%= lang.LF("按栏目管理")%></a></li>
					<%}
					  if (showContentArr[1].ToString() == "1")
					  {%>
					<li><a href="javascript:ShowMain('Content/SpecTree.aspx','Content/SpecContent.aspx')">
						<%--按专题管理--%>  <%= lang.LF("按专题管理")%></a></li>
					<%
						}       
					%>
					<%=sitetype%>
					<script type="text/javascript">
					commentChild="<div class=menuitems><a onclick=ShowMain('Content/NodeTree.aspx?t=1','Content/CommentManage.aspx') href='javascript:void(0)' >评论管理</a></div>";
					commentChild+="<div class=menuitems><a onclick=ShowMain('Content/NodeTree.aspx?t=1','Content/SohuChatManage.aspx') href='javascript:void(0)' >畅言评论管理</a></div>";
					commentChild+="<div class=menuitems><a onclick=ShowMain('Content/NodeTree.aspx?t=1','Content/SohuChatManage.aspx?show=2') href='javascript:void(0)' >畅言评论配置</a></div>";
					</script>
					<%if (showContentArr[2].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Content/NodeTree.aspx?t=1','Content/CommentManage.aspx');"  onmouseover="showmenu(event,commentChild)">
						<%--评论管理--%>  <%= lang.LF("评论管理")%></a></li>
					<%}
					  if (showContentArr[4].ToString() == "1")
					  { %>
					<li><a href="javascript:void(0);" onclick="ShowMain('Pub/PubGuide.aspx','Pub/pubmanage.aspx')" onmouseover="showmenu(event,'<div class=menuitems><%= lang.LF("添加互动模块")%></a></div><div class=menuitems><a onclick=open_title(\'pub/pubmanage.aspx\',\'互动模块管理\') href=\'javascript:void(0)\'><%= lang.LF("互动模块管理")%></a></div><div class=menuitems><a onclick=open_title(\'pub/pubmanage.aspx\',\'互动信息管理\') href=\'javascript:void(0)\'><%= lang.LF("互动信息管理")%></a></div><div class=menuitems><a onclick=open_title(\'Content/ModelManage.aspx?ModelType=7\',\'互动模型管理\') href=\'javascript:void(0)\'><%= lang.LF("互动模型管理")%></a></div><div class=menuitems><a onclick=open_title(\'pub/PubRecycler.aspx\',\'存档管理\') href=\'javascript:void(0)\'><%= lang.LF("存档管理")%></a></div>')">
						<%=lang.LF("互动模块")%></a> </li>
					<%
						}
					  if (showContentArr[5].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Content/CollectionGuide.aspx','Content/CollectionManage.aspx')"
						onmouseover="showmenu(event,'<div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'Content/CollectionManage.aspx\',\'采集项目管理\')><%--采集项目管理--%><%= lang.LF("采集项目管理")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'Content/CollectionStep1.aspx\',\'添加采集项目\')><%--添加采集项目--%><%= lang.LF("添加采集项目")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'Content/CollectionStart.aspx\',\'开始采集\')><%--开始采集--%><%= lang.LF("开始采集")%></a></div><div class=menuitems><a href=\'javascript:void(0)\'><%--采集进度--%><%= lang.LF("采集进度")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'Content/CollectionList.aspx\',\'采集历史记录\')><%--采集历史记录--%><%= lang.LF("采集历史记录")%></a></div>')">
						<%--信息采集--%><%= lang.LF("信息采集")%></a> </li>
					<%
						}
						if (showContentArr[6].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('Content/Print_Server.aspx','Plus/Doc.aspx')">
						<%--打印输出--%><%= lang.LF("打印输出")%></a></li>
					<%
					  }
					  if (showContentArr[7].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Content/CreateLink.aspx','Content/CreateHtmlContent.aspx')">
						<%--生成发布--%><%= lang.LF("生成发布")%></a></li>
					<%}
					  if (showContentArr[7].ToString() == "1")
					  {  
					%>
					<li><a href="javascript:ShowMain('Content/NodeTree.aspx?t=2','Content/ContentRecycle.aspx')">
						<%--回收站--%><%= lang.LF("回收站")%></a></li>
					<%}
						if (showContentArr[10] as string == "1")
					{ %>
					<li><a href="javascript:ShowMain('Guest/BbsGuide.aspx','Guest/GuestCateMana.aspx')">
						<%--百科问答--%><%= lang.LF("百科问答")%></a></li>
					<%}
					if (showContentArr[8].ToString() == "1")
					{ %>
					<li><a href="javascript:ShowMain('AddOn/OthersGuide.aspx','AddOn/SourceManage.aspx')">
						<%--内容参数--%><%= lang.LF("内容参数")%></a></li>
					<%}
					if (showContentArr[8].ToString() == "1")
					{ %>
					<li><a href="javascript:ShowMain('Content/HitsGuide.aspx','Content/HitsList.aspx')">
						<%--访问评价--%><%= lang.LF("访问评价")%></a></li>
					<%}
					  if (showContentArr[10].ToString() == "1")
					  {%>
					<%}%>
				</ul>
			</div>
			<!-- 用户社区 -->
			<div id="Menu_3" style="display: none;">
				<ul>
					<%
						if (ShowUserArr[0].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('User/UserGuide.aspx','I/User/UserManage.aspx')">
						<%--会员管理--%><%= lang.LF("会员管理")%></a></li>
					<%
						}
						if (ShowUserArr[1].ToString() == "1")
						{ 
					%>
					<li><a href="javascript:ShowMain('User/AdminLink.aspx','I/User/AdminManage.aspx')">
						<%--管理员管理--%><%= lang.LF("管理员管理")%></a></li>
					<%}
						if (ShowUserArr[2].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('User/PermissionGuide.aspx','I/User/PermissionInfo.aspx') ">
						<%--用户角色--%><%= lang.LF("用户角色")%></a></li>
					<% 
						} if (ShowUserArr[3].ToString() == "1")
						{%>
					<li><a href="javascript:ShowMain('User/MessageLink.aspx','I/User/MessageSend.aspx')">
						<%--信息发送--%><%= lang.LF("信息发送")%></a> </li>
					<%}
						if (ShowUserArr[4].ToString() == "1")
						{ %><li><a href="javascript:void(0);" onclick="ShowMain('User/MailGuide.aspx','I/User/RegValidateMail.aspx')"
							onmouseover="showmenu(event,'<div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'I/User/EidtMailModel.aspx  \')><%= lang.LF("邮件模板编辑")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'I/User/RegValidateMail.aspx\')><%--邮件内容管理--%><%= lang.LF("邮件内容管理")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'I/User/SendMailList.aspx\')><%--发送邮件管理--%><%= lang.LF("发送邮件管理")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'I/User/MailListManage.aspx\')><%--邮件列表管理--%><%= lang.LF("邮件列表管理")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'I/User/SubscribeTypeList.aspx\')><%--订阅管理--%><%= lang.LF("订阅管理")%></a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=open_title(\'I/User/AddMail.aspx\')><%--邮件发送--%><%= lang.LF("邮件发送")%></a></div><div class=menuitems><a href=\'javascript:ShowMain(\'I/User/MailIdiographList.aspx\')><%--签名管理--%><%= lang.LF("签名管理")%></a></div>')">
							<%--订阅中心--%><%= lang.LF("订阅中心")%></a></li><%}
						if (ShowUserArr[5].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('User/JobsGuide.aspx','I/Content/ModelManage.aspx?ModelType=3')">
						<%--人才招聘--%><%= lang.LF("人才招聘")%></a> </li>
					<%}
						if (ShowUserArr[6].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('zone/ModelGuide.aspx','I/zone/zoneManage.aspx')">
						<%--社区(SNS)模块--%><%= lang.LF("社区(SNS)模块")%></a> </li>
					<%}
					  
						if (ShowUserArr[7].ToString() == "1")
						{  %>
					
					<%}
				   
					%>
				</ul>
			</div>
			<!-- 商城管理 -->
			<div id="Menu_4" style="width: 100%; display: none;">
				<ul>
					<%
						if (ShowShopArr[0].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('Shop/ShopNodeTree.aspx','Shop/ProductManage.aspx')">
						<%--商品管理--%><%= lang.LF("商品管理")%></a></li>
					<%}
						if (ShowShopArr[1].ToString() == "1")
						{%>
					<li><a href="javascript:ShowMain('Shop/StockGuid.aspx','Shop/StockManage.aspx')">
						<%--库存管理--%><%= lang.LF("库存管理")%></a></li>
					<%}
						if (ShowShopArr[3].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('Shop/OrderLink.aspx','Shop/OrderList.aspx')">
						<%--订单管理--%><%= lang.LF("订单管理")%></a></li>
					<%}
						if (ShowShopArr[4].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('Shop/ListGuide.aspx','Shop/BankRollList.aspx')">
						<%--明细记录--%><%= lang.LF("明细记录")%></a></li>
					<%}
						if (ShowShopArr[5].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('Shop/StatisticLink.aspx','Shop/TotalSale.aspx')">
						<%--销售统计--%><%= lang.LF("销售统计")%></a></li>
					<%}
						if (ShowShopArr[6].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('Shop/PromotionGuide.aspx','Shop/PresentProject.aspx')">
						<%--促销优惠--%><%= lang.LF("促销优惠")%></a> </li>
					<%}
						if (ShowShopArr[8].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('Shop/ConfigGuide.aspx','Shop/DeliverType.aspx')">
						<%--商城配置--%><%= lang.LF("商城配置")%></a></li>
					<%}
					if (ShowShopArr[9].ToString() == "1")
					{ %>
					<li><a href="javascript:ShowMain('Shop/ConfigGuide.aspx','boss/Bosstree.aspx')">
						<%--加盟商管理--%><%= lang.LF("加盟商管理")%></a></li>
					<%}
					if (ShowShopArr[10].ToString() == "1")
					{ %>
					<li><a href="javascript:ShowMain('Shop/RecyclerNodeTree.aspx','Shop/ShopRecycler.aspx')">
						<%--商品回收站--%><%= lang.LF("商品回收站")%></a> </li>
					<%}
					if (ShowShopArr[12].ToString() == "1")
					{ %>
					<li><a href="javascript:ShowMain('Flex/FlexGuide.aspx','Flex/ClassManage.aspx')">
						<%--礼品管理--%><%= lang.LF("礼品管理")%></a></li>
					<%}
					if (ShowShopArr[13].ToString() == "1")
					{ %>
					<li><a href="javascript:ShowMain('Shop/BidManage/CompleteGuid.aspx','Shop/BidManage/BidComplete_Manage.aspx')">
						<%--竞拍管理--%><%= lang.LF("竞拍管理")%></a></li>
					<%}
					if (ShowShopArr[14].ToString() == "1")
					{ %>
					<li><a href="javascript:ShowMain('Shop/profile/ProfileGuide.aspx','Shop/profile/StatisticsBriefing.aspx')">
						<%--推广返利--%><%= lang.LF("推广返利")%></a></li>
					<%}
					if (ShowShopArr[11].ToString() == "1")
					{ %>
					<li><a href="javascript:void(0);" onclick="ShowHideLayer(11,4)" onmouseover="showmenu(event,'<div class=menuitems><a href=javascript:void(0) onclick=open_title(\'Content/ModelManage.aspx?ModelType=6\',\'店铺申请与审核\')><%= lang.LF("店铺申请与审核")%></a></div><div class=menuitems><a href=javascript:void(0) onclick=open_title(\'UserShopManage/StoreStyleManage.aspx\',\'商家店铺模板管理\')><%= lang.LF("商家店铺模板管理")%></a></div><div class=menuitems><a href=javascript:void(0) onclick=open_title(\'UserShopManage/ProductManage.aspx\',\'商家商品管理\')><%= lang.LF("商家商品管理")%></a></div><div class=menuitems><a href=javascript:void(0) onclick=open_title(\'Content/ModelManage.aspx?ModelType=5\',\'店铺模型管理\')><%= lang.LF("店铺模型管理")%></a></div><div class=menuitems><a href=javascript:void(0) onclick=open_title(\'UserShopManage/ShopinfoManage.aspx\',\'店铺配置\')><%= lang.LF("店铺配置")%></a></div>')"
						style="font-weight: bold">
						<%--店铺管理--%><%= lang.LF("店铺管理")%></a> </li>
					<%} %>
				</ul>
			</div>
			<!-- 微博管理 -->
			
			<!-- SiteServer -->
			<div id="Menu_10" style="width: 100%; display: none;">
				<ul>
					<li><a href="javascript:ShowMain('SiteServer/FGuide.aspx','SiteServer/FManage.aspx')">
						<%--共享池管理--%><%= lang.LF("共享池管理")%></a> </li>
					<li><a href="javascript:ShowMain('SiteServer/FinanceGuide.aspx','SiteServer/Todaydetail.aspx')">
						<%--财务管理--%><%= lang.LF("财务管理")%></a></li>
					<li><a href="javascript:ShowMain('SiteServer/LogGuid.aspx','SiteServer/LogManage.aspx')">
						<%--日志管理--%><%= lang.LF("日志管理")%></a> </li>
				</ul>
			</div>
			<!-- 项目管理 -->
			<div id="Menu_5" style="width: 100%; display: none;">
				<ul>

					<% if (ShowsysArr[3].ToString() == "1")
					   {  %>
					<li><a href="javascript:ShowMain('Content/AuditingLink.aspx','WorkFlow/Default.aspx')">
						<%--工作流配置--%><%= lang.LF("工作流配置")%></a></li>
					<%}
					   if (ShowBIArr[0].ToString() == "1")
					   { %>
					<li><a href="javascript:ShowMain('AddOn/StructGuide.aspx','AddOn/StructManage.aspx')">
						<%--组织结构--%><%= lang.LF("组织结构")%></a></li>
					<%}
					 if (ShowBIArr[1].ToString() == "1")
					 { %>
					<li><a href="javascript:ShowMain('AddOn/ProjectGuide.aspx','AddOn/ManageProjects.aspx')">
						<%--项目管理--%><%= lang.LF("项目管理")%></a></li>
					<%}
					 if (ShowBIArr[2].ToString() == "1")
					 { %>
					<li><a href="javascript:ShowMain('AddCRM/Customer.aspx','AddCRM/CustomerList.aspx?usertype=0')">
						<%--CRM管理--%><%= lang.LF("CMR管理")%></a></li>
					<%}
					  if (ShowBIArr[2].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('User/CustomerGuide.aspx','iServer/BiServer.aspx?num=-3&strTitle=')"><%--有问必答--%><%= lang.LF("有问必答")%></a>
						<%-- <a href="javascript:ShowMain('AddCRM/Customer.aspx','AddCRM/CustomerList.aspx?usertype=0')">
						<%= lang.LF("CMR管理")%></a>--%> <%--CRM管理--%></li>
					<%}  
					 
					  if (ShowBIArr[3].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('User/CustomerGuide.aspx','User/ServiceSeat.aspx')"
						onmouseover="showmenu(event,'<div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMain(\'User/CustomerGuide.aspx\',\'User/ServiceSeat.aspx\')><%--客服管理--%><%= lang.LF("客服管理")%></a></div> <div class=menuitems><a href=\'javascript:void(0)\' onclick=\'open_title();\'><%--开启客服--%><%= lang.LF("开启客服")%></a></div>')">
						<%--客服通--%><%= lang.LF("客服通")%></a></li>
					<%}
					  if (ShowBIArr[4].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Workload/WorkloadGuide.aspx','Workload/Subject.aspx?Type=subject')">
						<%= lang.LF("工作统计")%></a></li>
					<%}
						if (ShowBIArr[5].ToString() == "1")
					 { %>
					<li><a href="javascript:ShowMain('Plus/LogGuide.aspx','Plus/LogManage.aspx')">
						<%--日志管理--%><%= lang.LF("日志管理")%></a></li>
					<%}
					%>
				</ul>
			</div>
			<!-- 企业黄页 -->
			<div id="Menu_6" style="width: 100%; display: none;">
				<ul>
					<%
						if (ShowPageArr[0].ToString() == "1")
						{ %>
					<li><a href="javascript:ShowMain('page/PageregGuide.aspx','page/UserModelManage.aspx')">
						<%--黄页申请设置--%><%= lang.LF("黄页申请设置")%></a></li>
					<%}
						if (ShowPageArr[1].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('page/PageGuide.aspx','page/PageManage.aspx')">
						<%--黄页审核与管理--%><%= lang.LF("黄页审核与管理")%></a></li>
					<%}
						if (ShowPageArr[2].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('page/CorporationGuide.aspx','page/PageTemplate.aspx')">
						<%--黄页用户栏目管理--%><%= lang.LF("黄页用户栏目管理")%></a></li>
					<%}
						if (ShowPageArr[3].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('page/NodeTree.aspx','page/PageContent.aspx')">
						<%--黄页内容管理--%><%= lang.LF("黄页内容管理")%></a></li>
					<%} if (ShowPageArr[4].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('page/ModelGuide.aspx','Content/ModelManage.aspx?ModelType=4')">
						<%--黄页模型管理--%><%= lang.LF("黄页模型管理")%></a></li>
					<%}
						if (ShowPageArr[5].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('page/PageStyleGuide.aspx','page/PageStyle.aspx')">
						<%--黄页样式管理--%><%= lang.LF("黄页样式管理")%></a></li>
					<%}
						if (ShowPageArr[6].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('page/SheetStyleGuide.aspx','page/SheetStyleManage.aspx')">
						<%--黄页标签管理--%><%= lang.LF("黄页标签管理")%></a></li>
					<%} %>
				</ul>
			</div>
			<%-- 考试管理--%>
			<div id="Menu_13" style="width: 100%; display: none;">
				<ul>
					<%if (ShowForumArr[1].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Exam/QuestionGuide.aspx','i/Exam/Papers_System_Manage.aspx')">
						<%--考试管理--%><%= lang.LF("考试管理")%></a></li>
					<%}
					  if (ShowForumArr[6].ToString() == "1")
					  {  %>
					<li><a href="javascript:ShowMain('Exam/AttendanceGuide.aspx','i/Exam/ToScore.aspx')">
						<%--阅卷中心--%><%= lang.LF("阅卷中心")%></a></li>
					<%}
					  if (ShowForumArr[2].ToString() == "1")
					  {  %>
					<li><a href="javascript:ShowMain('Exam/ClassGuide.aspx','i/Exam/ClassManage.aspx')">
						<%--班级管理--%><%= lang.LF("班级管理")%></a></li>
					<%}
					  if (ShowForumArr[3].ToString() == "1")
					  {  %>
					<li><a href="javascript:ShowMain('Exam/TrainGuide.aspx','i/Exam/Audit.aspx')">
						<%--学员管理--%><%= lang.LF("学员管理")%></a></li>
					<%}
					  if (ShowForumArr[4].ToString() == "1")
					  {  %>
					<li><a href="javascript:ShowMain('Exam/ResourceLibaryGuide.aspx','i/Exam/ExTeacherManage.aspx')">
						<%--培训资源库--%><%= lang.LF("培训资源库")%></a></li>
					<%}
					  if (ShowForumArr[5].ToString() == "1")
					  {  %>
					<li><a href="javascript:ShowMain('Exam/FinanceGuide.aspx','i/Shop/OrderList.aspx')">
						<%--财务管理--%><%= lang.LF("财务管理")%></a></li>
					<%}
					  if (ShowForumArr[0].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Question/QuestionGuide.aspx','i/Exam/Papers_System_Manage.aspx')">
						<%--组卷管理--%><%= lang.LF("组卷管理")%></a></li>
					<%}%>
				</ul>
			</div>
			<!-- 店铺管理 -->
			<div id="Menu_11" style="width: 100%; display: none;">
				<ul>
					<li><a href="javascript:ShowMain('UserShopManage/ApplySetTree.aspx','UserShopManage/StoreManage.aspx')">
						<%--店铺申请与审核--%><%= lang.LF("店铺申请与审核")%></a> </li>
					<li><a href="javascript:ShowMain('UserShopManage/StoreStyleTree.aspx','UserShopManage/StoreStyleManage.aspx')">
						<%--商家店铺模板管理--%><%= lang.LF("商家店铺模板管理")%></a> </li>
					<li><a href="javascript:ShowMain('UserShopManage/ShopNodeTree.aspx','UserShopManage/ProductManage.aspx')">
						<%--商家商品管理--%><%= lang.LF("商家商品管理")%></a> </li>
					<li><a href="javascript:ShowMain('UserShopManage/TreeModel.aspx','Content/ModelManage.aspx?ModelType=5')">
						<%--店铺模型管理--%><%= lang.LF("店铺模型管理")%></a> </li>
					<li><a href="javascript:ShowMain('UserShopManage/UspManageGuide.aspx','UserShopManage/ShopinfoManage.aspx')">
						<%--店铺配置--%><%= lang.LF("店铺配置")%></a> </li>
					<li><a href="javascript:void(0);" onclick="ShowHideLayer(4,0)" style="font-weight: bold">
						<%--返回菜单--%><%= lang.LF("返回菜单")%></a> </li>
				</ul>
			</div>
			<!-- 系统配置 -->
			<div id="Menu_8" style="width: 100%; display: none;">
				<ul>
					<%
						if (ShowsysArr[0].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('Config/ConfigGuide.aspx','I/Config/SiteInfo.aspx')">
						<%--网站配置--%><%= lang.LF("网站配置")%></a></li>
					<%}
						if (ShowsysArr[1].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('Content/ModelGuide.aspx','Content/ModelManage.aspx?ModelType=1')">
						<%--模型管理--%><%= lang.LF("模型管理")%></a></li>
					<%}
						if (ShowsysArr[2].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('Content/SetNodeTree.aspx','Content/NodeManage.aspx')">
						<%--节点管理--%><%= lang.LF("节点管理")%></a></li>
					<%}
						if (ShowsysArr[4].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('Content/FlowLink.aspx?type=1','Content/FlowManager.aspx')">
						<%--流程管理--%><%= lang.LF("流程管理")%></a></li>
					<%}
						if (ShowsysArr[5].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('Content/SpecLink.aspx','Content/SpecialManage.aspx')">
						<%--专题管理--%><%= lang.LF("专题管理")%></a></li>
					<%}
						if (ShowsysArr[6].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('Template/TemplateLink.aspx','Template/TemplateSet.aspx')">
						<%--模板风格--%><%= lang.LF("模板风格")%></a></li>
					<%}
						if (ShowsysArr[7].ToString() == "1")
						{  %>
					<li><a href="javascript:ShowMain('Template/TemplateLink.aspx','Template/LabelManage.aspx')">
						<%--标签管理--%><%= lang.LF("标签管理")%></a></li>
					<%}
					if (ShowsysArr[8].ToString() == "1")
					{  %>
					<li><a href="javascript:ShowMain('AddOn/PayPlatLink.aspx','AddOn/PayPlatManage.aspx')">
						<%--在线支付平台--%><%= lang.LF("在线支付平台")%></a></li>
					<%}
						%>
					<%--  if (ShowsysArr[9].ToString() == "1")
					{  %>
					<li><a href="javascript:ShowMain('AddOn/UAgentLink.aspx','AddOn/UAgent.aspx')">
					   自适配设备<%= lang.LF("自适配设备")%> </a></li>
					<%}--%>
				</ul>
			</div>
			<!-- 附件管理 -->
			<div id="Menu_9" style="width: 100%; display: none;">
				<ul>
					<%
						if (ShowPlubArr[9].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('AddOn/DataGuide.aspx','i/Config/DatalistProfile.aspx')">
						<%--开发中心--%><%= lang.LF("开发中心")%></a></li>
						 <%} 
						   
						if (ShowPlubArr[0].ToString() == "1")
					  {  %>
					<li><a href="javascript:ShowMain('Plus/ADGuide.aspx','i/Plus/ADZoneManage.aspx')">
						<%--广告管理--%><%= lang.LF("广告管理")%></a></li>
					<%}
					  if (ShowPlubArr[1].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('Counter/PageLeft.aspx','i/Counter/Counter.aspx')">
						<%--访问统计--%><%= lang.LF("访问统计")%></a></li>
					<%}
					  if (ShowPlubArr[2].ToString() == "1")
						  { %> 
					<li><a href="javascript:ShowMain('Plus/SurveyGuide.aspx','i/Plus/SurveyManage.aspx')">
						<%--问卷调查和投票--%><%= lang.LF("问卷调查和投票")%></a></li>
					 <%}
					 
					  if (ShowPlubArr[3].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('File/FileGuide.aspx','i/File/UploadFile.aspx')">
						<%--文件管理--%><%= lang.LF("文件管理")%></a></li>
					<%}
					  if (ShowPlubArr[4].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('AddOn/DictionaryGuide.aspx','i/AddOn/DictionaryManage.aspx')">
						<%--数据字典--%><%= lang.LF("数据字典")%></a></li>
					<%}
					  if (ShowPlubArr[5].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('File/Addlinkname.aspx','i/File/Addlinkhttp.aspx')">
						<%--站内链接--%><%= lang.LF("站内链接")%></a></li>
					<%}
					  if (ShowPlubArr[6].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('AddOn/DownGuide.aspx','i/AddOn/Download.aspx')">
						<%--客户端--%><%= lang.LF("客户端")%></a></li>
					<%} 
					 if (ShowPlubArr[7].ToString() == "1")
					  { %>
					<li><a href="javascript:ShowMain('WeiXin/wxApiGuide.aspx','i/WeiXin/wxApi.aspx')">
					 <%--微信App--%><%= lang.LF("微信App")%></a></li>
						 <%} 
					   if (ShowPlubArr[8].ToString() == "1")
					   { %>
					<li><a href="javascript:void(0);" onclick="ShowMain('Pub/PubGuide.aspx','Pub/pubmanage.aspx')"
						onmouseover="showmenu(event,'<div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMain(\'Iplook/IplookGuide.aspx\',\'i/Iplook/IPManage.aspx\') ><%--IP识别系统--%><%= lang.LF("IP识别系统")%></a></div><div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMain(\'Search/SearchGuide.aspx\',\'i/Search/DirectoryManage.aspx\')><%--全文检索--%><%= lang.LF("全文检索")%></a></div><div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMain(\'AddOn/FileseeGuide.aspx\',\'i/AddOn/FileseeManage.aspx\')><%--文件比较--%><%= lang.LF("文件比较")%></a></div>')">
						<%--其它功能--%><%= lang.LF("其他功能")%></a> </li>
					<%} 
						%>
					<!--<li><a href="javascript:void(0);" onclick="ShowMainsgourl('Pub/PubGuide.aspx','Pub/pubmanage.aspx')" onmouseover="showmenu(event,'<div class=menuitems><a href=\'javascript:void(0);\' target=_blank onclick=ShowMainsgourl(\'GuessGame/GuessGameGuide.aspx\',\'GuessGame/GuessGameManage.aspx\') >竞猜游戏管理</a></div><div class=menuitems><a href=\'javascript:void(0);\' target=_blank onclick=ShowMainsgourl(\'Iplook/IplookGuide.aspx\',\'Iplook/IPManage.aspx\') >IP识别系统</a></div><div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMainsgourl(\'File/Addlinkname.aspx\',\'File/Addlinkhttp.aspx\')>站内链接</a></div><!--<div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMainsgourl(\'AddOn/OnlineKillGuide.aspx\',\'AddOn/OnlineKillManage.aspx\')>在线查(杀)毒</a></div><div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMainsgourl(\'Search/SearchGuide.aspx\',\'Search/DirectoryManage.aspx\')>全文检索</a></div><div class=menuitems><div class=menuitems><a href=\'javascript:void(0);\' onclick=ShowMainsgourl(\'AddOn/FileseeGuide.aspx\',\'AddOn/FileseeManage.aspx\')>文件比较</a></div>')">其他功能</a> </li>-->
					<%--onclick=ShowMainsgourl(\'Iplook/IplookGuide.aspx\',\'Iplook/IPManage.aspx\')--%>
				</ul>
			</div>
		</div>
		<!-- 子菜单结束 -->
	</td>
</tr>
<tr style="vertical-align: top">
	<td id="frmTitle" align="left" style="width: 195px;background: #CFE8FE;">
		<iframe id="left" style="z-index: 2; visibility: inherit; width: 195px;" name="left"
			src="Profile/QuickLinks.aspx" frameborder="0" tabid="1"></iframe>
	</td>
	<td class="but" onclick="switchSysBar();" style="width: 12px" align="left">
		<img id="switchPoint" style="border-right: 0px; border-top: 0px; border-left: 0px;
			width: 12px; border-bottom: 0px" alt="关闭左栏" src="/images/butClose.gif" />
	</td>
	<td align="left" id="frmRtd">
		<div id="FrameTabs" style="overflow: hidden; width: 100%;">
			<div class="tab-right" onmouseover="this.className='tab-right tab-right-over'" onmouseout="this.className='tab-right tab-right-disabled'">
			</div>
			<div class="tab-left" onmouseover="this.className='tab-left tab-left-over'" onmouseout="this.className='tab-left tab-left-disabled'">
			</div>
			<div class="tab-strip-wrap">
				<ul class="tab-strip" style="float: left">
					<li class="current" id="iFrameTab1"><a href="javascript:"><span id="frameTabTitle">我的工作台</span></a><a
						class="closeTab"><img alt="" src="/images/tab-close.gif" style="border: 0;" /></a>
					</li>
					<li id="newFrameTab"><a title="新选项卡" href="javascript:"></a></li>
				</ul>
			</div>
		</div>
		<!-- 书签结束 -->
		<div id="main_right_frame">
			<iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;
				width: 100%;"  name="main_right" src="Profile/Worktable.aspx" frameborder="0"
				onload="SetTabTitle(this)" tabid="1"></iframe>
			<div class="clearbox2">
			</div>
		</div>
	</td>
</tr>
</tbody>
</table>
<div id="iframeGuideTemplate" style="display: none">
<iframe style="z-index: 2; visibility: inherit; width: 195px;" src="about:blank" frameborder="0" tabid="0"></iframe>
</div>
<div id="iframeMainTemplate" style="display: none">
<iframe style="z-index: 2; visibility: inherit; overflow-x: hidden; width: 100%;" src="about:blank" frameborder="0" scrolling="yes" onload="SetTabTitle(this)"
tabid="0"></iframe>
</div>

<script type="text/javascript" language="javascript">
//setLayout
window.onresize = setLayout; //窗口改变大小的时候，调用setLayout方法 
document.body.scroll = "no";
function setLayout() {

document.getElementById("main_right_frame").style.width = document.documentElement.clientWidth - 205;
document.getElementById("frmRtd").height = document.documentElement.clientHeight - 100;
document.getElementById("main_right").height = document.getElementById("frmRtd").height - 30;
document.getElementById("left").height = document.documentElement.clientHeight - 100;
}
setLayout();

function souched(seld, souchopton, keyword) {
switch (seld) {
	case "User":
		MDIOpen('User/UserManage.aspx?souchtype=' + souchopton + '&keyword=' + keyword); return false;
		break;
	case "Content":
		MDIOpen('Content/ContentManage.aspx?type=' + souchopton + '&title=' + keyword); return false;
		break;
	case "Search":
		MDIOpen('Search/SearchFunc.aspx?' + souchopton + '=' + keyword); return false;
		break;
}
}
function closdlg() {
Dialog.close();
}
function SelectIndexChange(val) {
switch (val) {
	case "User":
		var select1 = document.getElementById("souchoption");
		select1.innerHTML = "";
		var newOption1 = new Option("<%=lang.LF("选择查询")%>", "");
		select1.options.add(newOption1);
		var newOption2 = new Option("<%=lang.LF("按用户名")%>", "4");
		select1.options.add(newOption2);
		var newOption3 = new Option("<%=lang.LF("按用户ID")%>", "3");
		select1.options.add(newOption3);
		var newOption4 = new Option("<%=lang.LF("按Email")%>", "5");
		select1.options.add(newOption4);
		break;
	case "Content":
		var select1 = document.getElementById('souchoption');
		select1.innerHTML = "";
		var newOption1 = new Option("<%=lang.LF("选择查询")%>", "");
		select1.options.add(newOption1);
		var newOption2 = new Option("<%=lang.LF("按内容标题")%>", "0");
		select1.options.add(newOption2);
		var newOption3 = new Option("<%=lang.LF("按内容ID")%>", "1");
		select1.options.add(newOption3);
		var newOption4 = new Option("<%=lang.LF("按内容作者")%>", "2");
		select1.options.add(newOption4);
		break;
	case "Search":
		var select1 = document.getElementById('souchoption');
		select1.innerHTML = "";
		var newOption1 = new Option("<%=lang.LF("模糊搜索")%>", "name");
		select1.options.add(newOption1);
		var newOption2 = new Option("<%=lang.LF("按名称")%>", "name");
		select1.options.add(newOption2);
		var newOption3 = new Option("<%=lang.LF("按文件名称ID")%>", "fileUrl");
		select1.options.add(newOption3);
		break;
	default:
		var select1 = document.getElementById('souchoption');
		select1.innerHTML = "";
		var newOption1 = new Option("<%=lang.LF("选择查询")%>", "");
		select1.options.add(newOption1);
		break;
}
}
setTimeout("onContentLoad();", 10);
document.onclick = onclickME;
//main_right.document.onkeydown = "alert('ok');"; //.window.document.onkeydown = "alert('ok');";
//main_right.contentWindow.document.addEventListener("keydown", "alert('huo');", true);
</script>
<!--这里是实际输出层 -->
<div style="position: absolute; left: 0px; top: 0px; z-index: 1; text-align: center;"
id="infoDiv">
</div>
<div style="position: absolute; display: none; left: 0px; top: 0px; z-index: 0" id="tranDiv"
class="insbox">
<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; filter: alpha(Opacity=20)"
id="tranDivBack">
</div>
</div> 
<div id="cbox" class="cboxClass">
<div id="cli_off" class="cli_onSpan" ><a href="javascript:void(0)"><span></span></a></div>
<div id="common_box"> 
<div class="ct" >
<div class="hd"><div id="cli_on" class="cli_offSpan"><a href="javascript:void(0)"><span></span></a></div>
<p>   <asp:Literal runat="server" ID="litDate"></asp:Literal></p></div>
<div tabindex="-1" class="bd js-bd"  id="chigh" style="overflow-y:auto;" >
<ul> 
<li><a href="Content/ContentManage.aspx" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/images/System17.png" alt="内容管理" /></a> <span><a href="Content/ContentManage.aspx" target="main_right">内容管理</a></span></li><li><a href="Shop/ProductManage.aspx" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/Images/system14.png" alt="商品管理" /></a> <span><a href="Shop/ProductManage.aspx" target="main_right">商品管理</a></span></li>
<li><a href="Shop/OrderList.aspx" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/Images/system15.png" alt="订单管理" /></a> <span><a href="Shop/OrderList.aspx" target="main_right">订单管理</a></span></li>
<li><a href="mobile/Default.aspx" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/Images/system16.png" alt="移动管理" /></a> <span><a href="mobile/Default.aspx" target="main_right">移动管理</a></span></li>
<li><a href="User/UserManage.aspx" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/Images/System6.png" alt="用户管理" /></a> <span><a href="User/UserManage.aspx" target="main_right">用户管理</a></span></li>
<li><a href="iServer/BiServer.aspx?num=-3&strTitle=" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/Images/System9.png" alt="客服中心" /></a> <span><a href="iServer/BiServer.aspx?num=-3&strTitle=" target="main_right">客服中心</a></span></li>
<li><a href="Template/TemplateSet.aspx" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/Images/System5.png"  alt="模板管理" /></a> <span><a href="Template/TemplateSet.aspx" target="main_right">模板管理</a></span></li>
<li><a href="Template/LabelManage.aspx" target="main_right" class="cliimg"><img src="../../App_Themes/AdminDefaultTheme/Images/System4.png"  alt="标签管理" /></a><span> <a href="Template/LabelManage.aspx" target="main_right">标签管理</a></span></li>
<li  style="height:150px;">  </li> 
</ul>
</div>
</div> 
<div id="cboxbot"> <iframe src="http://zoomla.cn/NodeElite.aspx?NodeID=19" scrolling="no" frameborder="0" width="150" height="140" ></iframe></div>
</div> 
</div>

<script type="text/javascript"> 
    if (!window.ActiveXObject)//如果非IE，则清除上面的Iframe，避免兼容性问题
    {
        document.getElementById("cboxbot").innerHTML="";
    }

    var combox = document.getElementById("common_box");
    var cboxbot = document.getElementById("cboxbot"); 
    var cli_on = document.getElementById("cli_on");
    var cli_off = document.getElementById("cli_off");
    var chigh = document.getElementById("chigh");
    var flag = false, timer = null, initime = null, r_len = 0;
    var h=document.documentElement.offsetHeight; 
    if(h<800)
    {
        h=800;
    } 
    //展开
    function slideright() {
        if (r_len <= -180) {
            clearInterval(timer);
            flag = !flag;
            return false;
        } else {
            r_len -= 5;
            combox.style.right = r_len + 'px'; 
            cboxbot.style.right = r_len + 'px';

            combox.style.height= (h-150) +'px'; 
            chigh.style.height=(h-170)+'px';
            // cli_on.className='cli_onSpan'; 
            combox.style.background='#fff';
            cboxbot.style.top=(h-145)+'px'; 
        } 
    }

    //收缩
    function slideleft() {
        if (r_len >= 0) {
            clearInterval(timer);
            flag = !flag;
            return false;
        } else {
            r_len += 5;
            combox.style.right = r_len + 'px'; 
            cboxbot.style.right = r_len + 'px';

            combox.style.height= h +'px';
            chigh.style.height=(h-170)+'px';
            //  cli_on.className='cli_offSpan';
            combox.style.background='#fff';
            cboxbot.style.top=(h-145)+'px';
        }
    }
  
    cli_on.onclick = function () { 
        clearTimeout(initime);
        //根据状态flag执开展开收缩 
            r_len = 0;
            timer = setInterval(slideright, 10); 
        //加载后3秒页面自动收缩
        // initime = setTimeout("cli_on.click()", 3000);
    }
    cli_off.onclick = function () { 
        clearTimeout(initime);
        //根据状态flag执开展开收缩 
            r_len = -180;
            timer = setInterval(slideleft, 10); 
    } 
    function disableBtn(o){setTimeout(function () { o.disabled = true; }, 50)}
</script>
</form>
</body>
</html>