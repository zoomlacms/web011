<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Default, App_Web_kvow1qcj" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=Call.SiteName %>_OA系统</title>
    <link type="text/css" href="CSS/zlOA.css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script src="../../JS/calendar-brown.js" type="text/javascript"></script>
    <link href="/App_Themes/UserThem/calendar-brown.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function writeDate() {
            var week;
            if (new Date().getDay() == 0) week = "星期日"
            if (new Date().getDay() == 1) week = "星期一"
            if (new Date().getDay() == 2) week = "星期二"
            if (new Date().getDay() == 3) week = "星期三"
            if (new Date().getDay() == 4) week = "星期四"
            if (new Date().getDay() == 5) week = "星期五"
            if (new Date().getDay() == 6) week = "星期六"
            document.write(new Date().getFullYear() + "年" + (new Date().getMonth() + 1) + "月" + new Date().getDate() + "日 " + week);
        }
        function hiddendiv() {
            $("#toolbar1").toggle("fast");
            var obj = document.getElementById("switchPoint");
            if (obj.alt == "关闭左栏") {
                obj.alt = "打开左栏";
                obj.src = "/MIS/OA/Images/butOpen.gif";
            }
            else {
                obj.alt = "关闭左栏";
                obj.src = "/MIS/OA/Images/butClose.gif";
            }
        }
        function hiddendiv1() {
            $("#toolbar1").css("display", "none");
            var obj = document.getElementById("switchPoint");
            obj.alt = "打开左栏";
            obj.src = "/MIS/OA/Images/butOpen.gif";
        }
    </script>
    <style>
        .switchPoint:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="OAtop">
            <div id="OAtop_l">
                <div id="logo"><a href="/MIS/OA/">
                    <img src="<%=ZoomLa.Components.OAConfig.OALogo %>" alt="南昌大学第二附属医院" onerror="this.onerror=null;this.src='<%=Call.Logo %>'" /></a></div>
                <div class="logo_tip"><span>OA办公系统</span></div>
                <div class="informtion">
                    <p><%:groupBll.GetByID(buser.GetLogin().GroupID).GroupName + "|" + buser.GetLogin().UserName%>
                    <script type="text/javascript">writeDate();</script>
                    </p>
                </div>
            </div>
            <div id="OAtop_r">
                <div class="set">
                    <ul>
                        <li class="setli"><a href="javascript:;" onclick="showMain('UserConfig.aspx');">个人设置</a></li>
                        <li class="useli"><a href="javascript:;">使用反馈</a></li>
                        <li class="helpli"><a href="javascript:;">使用帮助</a></li>
                        <li class="logout"><a href="<%=ResolveUrl("~/User/logout.aspx") %>">退出系统</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="naver">
            <div id="nav">
                <ul>
                    <li class="navhome"><a href="Default.aspx" title="OA首页">OA首页</a></li>
                    <li class="navtong"><a href="javascript:;" onclick="showMain('Mail/Message.aspx?view=1');" title="沟通">沟通</a></li>
                    <li class="navhui"><a href="javascript:;" onclick="showMain('/user/Usertalk/TalkIndex.aspx');" title="会议">会议</a></li>
                    <li class="navgong"><a href="javascript:;" onclick="showMain('main.aspx');" title="工作台">工作台</a></li>
                    <li class="navuser"><a href="/User/Default.aspx" target="_blank">会员</a></li>
                    <li class="navnus"><a href="javascript:;" title="护理">护理</a></li>
                    <li class="navtask"><a href="javascript:;" onclick="showMain('/Mis/Task/');" title="任务管理">任务管理器</a></li>
                    <li class="navsign"><a href="javascript:;" onclick="showMain('/Mis/OA/Sched/PBManage.aspx');" title="排班">排班</a></li>
                    <li class="navsign"><a href="javascript:;" onclick="showMain('/Mis/MisAttendance.aspx');" title="签到">签到</a></li>
                </ul>
            </div>
        </div>
        <div class="oamain">
            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                <tr>
                    <td id="toolbar1" style="width: 260px; height: auto; background-image: none; background-attachment: scroll; background-repeat: repeat; background-position-x: 0%; background-position-y: 0%; background-size: auto; background-origin: padding-box; background-clip: border-box;" valign="top">
                        <div class="oamain_left pull-left" style="float: left;">
                            <div class="left_user">
                                <div class="userimg pull-left">
                                    <img src="images/userimg.jpg" alt="" runat="server" id="faceImg" /></div>
                                <div class="userinfo " style="margin-right: 15px;">
                                    <span><strong>用户名称：<asp:Label runat="server" ID="userNameL" /></strong></span><br />
                                    <span>所属部门：<asp:Label runat="server" ID="userGNL" /></span><br />
                                    <span>会员编号：<asp:Label runat="server" ID="userIDL" /></span>
                                </div>
                                <div class="clearfix"></div>
                                <div id="calendarDiv" runat="server">
                                    <script type="text/javascript">
                                        function dateChanged(calendar) {
                                            if (calendar.dateClicked) {
                                                var y = calendar.date.getFullYear();
                                                var m = calendar.date.getMonth();
                                                var d = calendar.date.getDate();
                                                window.open("/Mis/Daily/AddDaily.aspx?name=admin&Date=" + y + "-" + (m + 1) + "-" + d, "main_right");
                                            }
                                        };
                                        Calendar.setup(
                                        {
                                            flat: "calendarDiv",
                                            flatCallback: dateChanged
                                        });
                                    </script>
                                </div>
                                <div class="clearfix"></div>
                                <div class="duty" runat="server" id="leftChk2">
                                    <div class="duty_t">
                                        <div class="duty_tp">
                                            <span class="fork" onclick="closeDiv(this);"></span>
                                            <span class="oaarrow" onclick="hideC(this);"></span>
                                            <span class="oaarrowDown" style="display: none;" onclick="showC(this);"></span>
                                            <strong>医院值班</strong>
                                        </div>
                                    </div>
                                    <div class="content duty_c">
                                        <span>今日：<script type="text/javascript">writeDate();</script></span><br />
                                        <span>院领导：[领导名字]</span><br />
                                        <span>总值班：张锦鹏</span><br />
                                        <span>夜查房：胡小明  李小风 张小宇</span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="commonuser" runat="server" id="leftChk3">
                                <div class="common_t">
                                    <div class="duty_tp">
                                        <span class="fork" onclick="closeDiv(this);"></span>
                                        <span class="oaarrow" onclick="hideC(this);" style="display: none;"></span>
                                        <span class="oaarrowDown" onclick="showC(this);"></span><strong>常用联系人</strong>
                                    </div>
                                </div>
                                <div class="content common_c" style="display: none;">
                                    <ul style="margin-bottom: 0;">
                                        <li><a href="#" style="display: block; width: 40px; height: 40px; float: left;">
                                            <img src="images/cuser.jpg" alt="" /></a><a class="name" href="#">暴风杨立东</a></li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            </div>
                            <div class="ask" runat="server" id="leftChk4">
                                <ul style="margin-bottom: 0;">
                                    <li style="border-bottom: 1px solid #35358A;"><a href="#">职工问卷</a></li>
                                    <li><a href="#">医院网站</a></li>
                                </ul>
                            </div>
                            <div class="commonuser" runat="server" id="leftChk5">
                                <div class="history_t">
                                    <div class="duty_tp">
                                        <span class="fork" onclick="closeDiv(this);"></span>
                                        <span class="oaarrow" onclick="hideC(this);"></span>
                                        <span class="oaarrowDown" style="display: none;" onclick="showC(this);"></span><strong>便捷访问</strong>
                                    </div>
                                </div>
                                <div class="content history_c">
                                    <ul style="margin-bottom: 0;">
                                        <li><a href="javascript:;" onclick="showMain('Office/Default.aspx');">发文管理</a></li>
                                        <li><a href="javascript:;" onclick="showMain('AffairsList.aspx?view=1');">待办事务</a></li>
                                        <li><a href="javascript:;" onclick="showMain('Mail/MessageSend.aspx');">写邮件</a></li>
                                        <li><a href="javascript:;" onclick="showMain('Mail/Message.aspx');">收邮件</a></li>
                                        <li><a href="javascript:;" onclick="showMain('../MisAttendance.aspx');">签到</a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </td>
                    <td class="switchPoint" style="width: 10px; background: #ececff;" onclick="hiddendiv()">
                        <img id="switchPoint" src="/MIS/OA/Images/butClose.gif" alt="关闭左栏" />
                    </td>
                    <td valign="top">
                        <iframe id="main_right" style="z-index: 2; visibility: inherit; width: 100%;" name="main_right" src="/Mis/OA/Main.aspx" frameborder="0"></iframe>
                    </td>
                </tr>
            </table>
            <div id="TimeDiv" class="pop_box panel panel-primary " style="display: none; height: 200px; width: 300px; margin-top: -30px; margin-bottom: 0; position: fixed; _position: absolute; _bottom: auto; _top: expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0))); right: 0px; bottom: -200px;">
                <div class="panel-heading"><span class="m_close" onclick="HideDiv('TimeDiv')" title="关闭"></span><%=Call.SiteName%>_OA助手提示</div>
                <div class="panel-body" style="height: 165px;">
                    <div id="warnContent" style="padding-left: 20px; padding-top: 30px;">
                        <%--  <div style="float:left; margin-right:20px; height:40px;">上班：<asp:Label ID="lblBegin" runat="server"></asp:Label>
                        <asp:Button ID="BtnBegin" Text="签到" CssClass="btn btn-primary" Width="50" runat="server" /></div>
                    <div style="height:40px;">下班：<asp:Label ID="lblEnd" runat="server"></asp:Label> <asp:Button ID="BtnEnd" Text="签退" CssClass="btn btn-primary" Width="50" runat="server" />--%>
                        <div id="contentDiv"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        var IO = document.getElementById('nav'), Y = IO, H = 0, IE6;
        IE6 = window.ActiveXObject && !window.XMLHttpRequest;
        while (Y) { H += Y.offsetTop; Y = Y.offsetParent };
        if (IE6)
            IO.style.cssText = "position:absolute;top:expression(this.fix?(document" +
                ".documentElement.scrollTop-(this.javascript||" + H + ")):0)";
        window.onscroll = function () {
            var d = document, s = Math.max(d.documentElement.scrollTop, document.body.scrollTop);
            if (s > H && IO.fix || s <= H && !IO.fix) return;
            if (!IE6) IO.style.position = IO.fix ? "" : "fixed";
            IO.fix = !IO.fix;
        };
        try { document.execCommand("BackgroundImageCache", false, true) } catch (e) { };
        //]]>
        function ShowDiv(div_id) {
            var div_obj = $("#" + div_id);
            div_obj.animate({ opacity: "show", right: 0, bottom: 0, width: div_obj.width, height: div_obj.height }, 1000);
        }
        function HideDiv(div_id) {
            var div_obj = $("#" + div_id);
            div_obj.animate({ opacity: "hide", right: 0, bottom: 0, width: div_obj.width, height: div_obj.height }, 1000);
        }
        function showMain(url) {
            $("#main_right").attr("src", url);
        }
        function hideC(obj) {
            $(obj).hide().siblings().show();
            $p = $(obj).parent().parent().parent();
            $p.find("div.content").hide("fast");
        }
        function showC(obj) {
            $(obj).hide().siblings().show();
            $p = $(obj).parent().parent().parent();
            $p.find("div.content").show("fast");
        }
        function closeDiv(obj) {
            $p = $(obj).parent().parent().parent();
            $p.hide("fast");
        }

        //-------未读邮件
        function GetUnreadMail() {
            a = "GetUnreadMail";
            $.ajax({
                type: "Post",
                url: "/Mis/OA/OAajax.ashx",
                dataType: "json",
                data: { action: a },
                success: function (data) {
                    if (data != 0) {///mis/oa/Mail/Message.aspx?view=1
                        var str = "你当前有" + data.num + "封邮件未读,<a href='javascript:;' onclick='showMain(\"/Mis/OA/Mail/Message.aspx?view=1\");'>点击阅读</a>";
                        $("#contentDiv").append(str);
                        ShowDiv('TimeDiv');
                    }
                },
                error: function (data) { }
            });
        }
        //-------
        setTimeout('GetUnreadMail()', 1000);
        function printpage(id) {
            window.open("/Common/PrintPage?appID=" + id);
            location.href = "ViewDrafting.aspx?ID=" + id;
        }
    </script>
</body>
</html>
