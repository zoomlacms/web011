<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_DomName, App_Web_5arvbvnz" masterpagefile="~/Manage/Site/SiteMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
</style>
<link rel="stylesheet" href="/Plugins/Domain/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="/Plugins/Domain/css/css.css" type="text/css" />
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/Plugins/Domain/Site.js"></script>
<style type="text/css">
/*上右下左*/
.redStar {color: #ff0000;padding: 0 0 0 3px;}
#site_nav .site10 a {background: url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}
.border_line{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_bg.jpg) repeat-x; height:43px;}
.nochoose, .choose{	width: 100px;height: 22px;padding-bottom: 1px;padding-left: 1px;padding-right: 1px;padding-top: 1px;font-weight: normal;cursor: pointer;/*line-height: 120%;*/ font-size:14px;}
.nochoose { color: #ffffff;}
.choose{ background:#03a1f0;color: #ffffff; font-weight:bold;}
#leftDiv {font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;width:15%;float:left;border:solid;border-width:1px;border-color:grey;margin-top:5px;border-style:solid solid none solid;}
#leftDiv span:hover{text-decoration:underline;}
#leftDiv a:active{ text-decoration:none;}
#rightDiv {width:84%;float:right; margin-top:5px;}
.topOption {background-color:#08C;color:#FFF;height:30px;width:100%;font-size:14px;cursor:pointer;border:solid;border-width:1px;border-color:grey;border-style:none none solid none;}
.topWord {display:block;height:30px;line-height:30px;padding-left:8px;}
.oneOption { background-color:#DFDFDF;color:#7E7E7E;height:30px;width:100%;font-size:14px;cursor:pointer;border:solid;border-width:1px;border-color:grey; border-style:none none solid none;}
.oneWord {display:block;height:30px;line-height:30px;padding-left:24px; }
.twoOption {height:30px;width:100%;font-size:14px;cursor:pointer;border:solid;border-width:1px;border-color:grey; border-style:none none solid none;}
.twoWord {color:#039DC2;display:block;height:30px;line-height:30px;padding-left:40px; }
.optionChoose {background:#F2FBFD;}
</style>
<script type="text/javascript">
    $().ready(function () {
        $("div[class='twoOption']").mousemove(function () { $(this).addClass("optionChoose"); }).mouseout(function () { $(this).removeClass("optionChoose"); });
    });
    function frameInit(obj, name) {
        if (obj.height == "")
        {
            obj.height = window.frames[name].document.body.scrollHeight+700;
        }
    }
    function ShowTabs(obj, id) {//Div切换
        $("#" + id).show().siblings().hide();
        $("#<%=dataField.ClientID%>").val(obj.id);
    }
    $().ready(function () {
        id = $("#<%=dataField.ClientID%>").val();
        if (id != "") {
            $("#" + id).trigger("click");
        }
    });
    function openFrame(url)
    {
        $("#tab1Frame").attr("src",url);
    }
</script>
<title>域名注册</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div id="m_site"><p style="float:left;"> 站群中心 >> 域名注册</p></div>
<div id="site_main" style="margin-top:15px;">
    <div id="leftDiv">
    <div class="topOption"><span class="topWord">域名管理</span></div>
    <div class="oneOption"><span class="oneWord">域名管理</span></div>
   <%-- <div class="twoOption"><a href="javascript:;" onclick="openFrame('DomTempMange.aspx')"><span class="twoWord">模板管理</span></a></div>--%>
    <div class="twoOption"><a href="javascript:;" onclick="openFrame('DomPrice.aspx')"><span class="twoWord">域名定价</span></a></div>
    <div class="twoOption"><a href="javascript:;" onclick="openFrame('DomManage.aspx')"><span class="twoWord">域名管理</span></a></div>
    <div class="twoOption"><a href="javascript:;" onclick="openFrame('DNSManage.aspx')"><span class="twoWord">DNS管理</span></a></div>
    <div class="twoOption"><a href="javascript:;" onclick="openFrame('ProductManage.aspx')"><span class="twoWord">服务管理</span></a></div>
    <div class="twoOption"><a href="javascript:;" onclick="openFrame('SiteConfig.aspx?remote=true')"><span class="twoWord">全局配置</span></a></div>
    </div>
    <div id="rightDiv">
    <div id="tab1">
     <iframe id="tab1Frame" onload="frameInit(this,'tab1Frame');" src="DomTempMange.aspx" style="width:98%;" frameborder=0 scrolling=no></iframe>
    </div>
    
    </div><!--rightDiv End-->
    <asp:HiddenField runat="server" ID="addUrl" />
<br />
<asp:HiddenField runat="server" ID="dataField" />
</div>
</asp:Content>