<%@ page language="C#" autoeventwireup="true" inherits="MIS_Default, App_Web_cmmpujjo" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<title>MIS能力中心-首页</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="JS/FrameTab.js"></script>
<script type="text/javascript" src="/JS/AdminIndex.js"></script>
</head>
<body>
<div id="header" style="position:inherit;">
    <div id="M_top" style=" position:relative;">
    <div class="M_top_t"><div id="Mlogo"><%--<img src="" alt="" />--%> <%Call.Label("{$SiteName/}"); %>  </div>
    <div class="M_top_r_t"><a href="<%=CustomerPageAction.customPath2 %>login.aspx" target="_blank">系统管理</a>
    <a href="#">购买帮助</a>
    <a href="/user/logout.aspx?url=/Mis/">退出</a>
    </div> 
    </div> 
    <div style="">
    <div id="M_top_r"> 
    <div class="M_top_r_b">
    <ul>
    <li><a href="/Mis/" id="hd" ><img src="/App_Themes/UserThem/images/Mis/j_ico_home.fw.png" alt="面板" /><br />面板</a></li>
    <li><a href="javascript:ShowMain1('0','/Plat/');" id="hd0" ><img src="/App_Themes/UserThem/images/Mis/j_ico_comm.png" alt="沟通" /><br />沟通</a></li>
    <li><a href="javascript:ShowMain1('1','/Mis/Target/');" id="hd1"><img src="/App_Themes/UserThem/images/Mis/j_ico_pline.png" alt="目标" /><br />目标</a></li>
    <li><a href="javascript:ShowMain1('2','/Mis/Daily/');" id="hd2"><img src="/App_Themes/UserThem/images/Mis/j_ico_log.png" alt="日志" /><br />日志</a></li>
    <li><a href="javascript:ShowMain1('3','/Mis/Memo/');" id="hd3"><img src="/App_Themes/UserThem/images/Mis/j_ico_memo.png" alt="备忘" /><br />备忘</a></li>
    <li><a href="javascript:ShowMain1('4','/Plat/Blog/DailyPlan.aspx');" id="hd4"><img src="/App_Themes/UserThem/images/Mis/j_ico_plan.png" alt="计划" /><br />计划</a></li>
    <li><a href="javascript:ShowMain1('5','/Plat/Task/');" id="hd5"><img src="/App_Themes/UserThem/images/Mis/j_ico_task.png" alt="任务" /><br />任务</a></li>
    <li><a href="javascript:ShowMain1('6','/Plat/Blog/Project.aspx');" id="hd6"><img src="/App_Themes/UserThem/images/Mis/j_ico_project.png" alt="项目" /><br />项目</a></li>
    <li><a href="javascript:ShowMain1('7','/Mis/Approval/');" id="hd7"><img src="/App_Themes/UserThem/images/Mis/j_ico_approve.png" alt="审批" /><br />审批</a></li>
<%--    <li><a href="javascript:ShowMain('','/Mis/Approval/');" id="A1"><img src="/App_Themes/UserThem/images/Mis/j_ico_approve.png" alt="公文" /><br />公文</a></li>--%>
    <li><a href="javascript:void(0)" onClick="showd('t_pop_navli')"><img src="/App_Themes/UserThem/images/Mis/j_ico_more.png" alt="更多" /><br />更多</a></li>
    </ul>
    </div>  
    <div class="t_pop_navli" id="t_pop_navli" style="display:none;"> 
    <div class="bgt"></div>
    <div class="bgm">
    <ul> 
    <li class="j_ico_docu"><a href="javascript:void(0)" onClick="loadPage('Meno', '/Mis/File/')"  ><img src="/App_Themes/UserThem/images/Mis/j_ico_docu.png" alt="文档" /><br />文档</a></li>
    <li class="j_ico_know"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_konw.png" alt="知识" /><br />知识</a></li>
    <li class="j_ico_discuss"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_discuss.png" alt="讨论" /><br />讨论</a></li>
    <li class="j_ico_attent"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_attent.png" alt="关注" /><br />关注</a></li>
    <li class="j_ico_attend"><a href="/Mis/MisAttendance.aspx"><img src="/App_Themes/UserThem/images/Mis/j_ico_attend.png" alt="考勤" /><br />考勤</a></li>
    <li class="j_ico_twitter"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_twitter.png" alt="微博" /><br />微博</a></li> 
    <li class="j_ico_bbs"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_bbs.png" alt="论坛" /><br />论坛</a></li> 
    <li class="j_ico_notice"><a href="javascript:void(0)" onClick="loadPage('Meno', '/Class_76/NodePage.aspx')"><img src="/App_Themes/UserThem/images/Mis/j_ico_notice.png" alt="公告" /><br />公告</a></li> 
    <li class="j_ico_address"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_address.png" alt="通讯录" /><br />通讯录</a></li> 
    <!--<li class="j_ico_exprience"><a href="">工作历程</a></li> -->
    <li class="j_ico_sysremd"><a href="javascript:void(0)" onClick="loadPage('Meno', '/user/Message/Message.aspx')"><img src="/App_Themes/UserThem/images/Mis/j_ico_sysremd.png" alt="系统提醒" /><br />系统提醒</a></li> 
    <li class="j_ico_relacomp"><a href=""><img src="/App_Themes/UserThem/images/Mis/j_ico_relacomp.png" alt="日志" /><br />友好企业</a></li> 
    <li class="j_ico_online"><a href="javascript:window.open('/OnlineService/ShowForm.aspx','','width=640,height=550,top=200,left=300,resizable=yes');void(0);"><img src="/App_Themes/UserThem/images/Mis/j_ico_online.png" alt="在线客服" /><br />在线客服</a></li>   
    <li class="j_ico_site"><a href="/manage/Template/CloudLead.aspx" target="_Blank"><img src="/App_Themes/UserThem/images/Mis/j_ico_site.png" alt="建站通" /><br />建站通</a></li> 
    <li class="j_ico_cloud"><a  href="javascript:void(0)" onClick="loadPage('Meno', '/Class_105/NodePage.aspx')"><img src="/App_Themes/UserThem/images/Mis/j_ico_cloud.png" alt="云盘" /><br />云盘</a></li>
    </ul><div style="clear:both;display:block;"></div>
    </div>
    <div class="bgb"></div>
    </div>  
    <div class="clear"></div>
    </div>
    </div>
    </div>
        <div class="m_tabs" ><!--顶部Tab-->
        <table style="height:100%;width:100%;">
             <tr style="vertical-align: top">
                <td align="left" id="frmRtd">
                    <div class="FrameTabs_bg">
                        <div class="container">
                            <div id="FrameTabs" style="overflow: hidden; width: 100%;">
                        <div class="tab-right" onmouseover="this.className='tab-right tab-right-over'" onmouseout="this.className='tab-right tab-right-disabled'">
                        </div>
                        <div class="tab-left" onmouseover="this.className='tab-left tab-left-over'" onmouseout="this.className='tab-left tab-left-disabled'">
                        </div>
                        <div class="tab-strip-wrap">
                            <ul class="tab-strip pull-left">
                                <li class="current" id="iFrameTab1"><a href="javascript:"><span id="frameTabTitle">我的工作台</span></a><a class="closeTab"><span class="glyphicon glyphicon-minus-sign"></span></a>
                                </li>
                                <li id="newFrameTab"><a title="新选项卡" href="javascript:"><span class="glyphicon glyphicon-plus"></span></a></li>
                            </ul>
                        </div>
                    </div>
                        </div>
                    </div>
                    <!-- 书签结束 -->
                    <div class="container">
                        <div class="thumbnail">
                        <div id="main_right_frame">
                            <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%;" height="100%" name="main_right" src="Index.aspx" frameborder="0" onload="SetTabTitle(this)" tabid="1"></iframe>
                            <div class="clearfix"></div>
                        </div>
                            </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>

</div>
<!--Tab切换条-->
<div id="Meno" style="position:inherit;width:1024px;" >
    <div id="iframeGuideTemplate" style="display: none;">
        <iframe style="z-index: 2; visibility: inherit; width: 100%;" src="about:blank" frameborder="0" tabid="0"></iframe><div class="clearfix"></div>
    </div>
    <div id="iframeMainTemplate" style="display: none">
        <iframe style="z-index: 2; visibility: inherit; overflow-x: hidden; width: 100%;" src="about:blank" frameborder="0" scrolling="yes" onload="SetTabTitle(this)" tabid="0"></iframe><div class="clearfix"></div>
    </div><div class="clearfix"></div>
</div>
<script>
    function showd(obj) {
        var dr = document.getElementById(obj).style.display;
        if (dr == "none") {
            document.getElementById(obj).style.display = "block";
        }
        else {
            document.getElementById(obj).style.display = "none";
        }
    }
    document.getElementById("hd").className = "HidName";

    //setLayout,必须放在main_right之后
    window.onresize = setLayout; //窗口改变大小的时候，调用setLayout方法 
    document.body.scroll = "no";
    function setLayout() {
        document.getElementById("main_right_frame").style.width = document.documentElement.clientWidth - 205;
        document.getElementById("frmRtd").height = document.documentElement.clientHeight - 100;
        document.getElementById("main_right").height = document.getElementById("frmRtd").height - 30;
    }
    setLayout();
</script>
<div class="clearfix"></div>
</body>
</html>

