<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Main, App_Web_kvow1qcj" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="CSS/ZLOA.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/jquery-ui.min.js"></script>
    <style type="text/css">
        /*a img {border:2px solid white}
        a img:hover {border:2px solid #C4E4FF;}*/
    </style>
    <script>
        $(function () {
            $("#sortable").sortable(
                {
                    stop: sortCallBack//拖动结束后回调方法
                });
            $("#sortable").disableSelection();
        });
        function sortCallBack() {
            var s = "";
            $("#sortable li").each(function () { s += $(this).attr("id") + "," });
            setCookie("sortli", s);
        }
        $().ready(function () {
            var s2 = getCookie("sortli");
            if (s2) {
                liArr = s2.split(',');
                for (var i = 0; i < liArr.length; i++) {
                    $li = $("#" + liArr[i]).remove();
                    $("#sortable").append($li);
                }
            }
            $().ready(function () {
                $(".table_mouse tr").addClass("tdbg");
                $(".table_mouse tr").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
                $(".table_mouse tr").dblclick(function () { v = $(this).find("#chkID").val(); location = "ViewContent.aspx?Gid=" + v; });
            });

            //获取事务等的信息数
            setTimeout(function () { GetInfo(); }, 1000);
        });
        function GetInfo() {
            a = "GetAffir";
            $.ajax({
                type: "Post",
                url: "/Mis/OA/OAajax.ashx",
                dataType: "json",
                data: { action: a },
                success: function (data) {
                    $("#affairSpan").text("（" + data.affair + "）");
                    $("#affairSpan2").text("（" + data.affair2 + "）");
                },
                error: function (data) {

                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul id="sortable" style="width: 100%;">
                <li class="ui-state-default" runat="server" id="mainChk1">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Document.gif') no-repeat;">
                            <div class="duty_tp">
                                <span class="fork" onclick="closeDiv(this);"></span>
                                <span class="oaarrow" onclick="coll(this);"></span>
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
                                <strong>医院行政公文</strong>
                            </div>
                        </div>

                        <div class="content templatelist">
                            <div class="inContent executive">
                                <table class="myTable threeTr">
                                    <tr class="hover_hander">
                                        <td><a href="Drafting.aspx">
                                            <img src="Images/Main/official.gif" /><div>公文拟稿</div>
                                        </a></td>
                                        <td>
                                            <a href="AffairsList.aspx?view=1">
                                                <img src="Images/Main/wait.gif" /><div title="点击进入">待办公文<span id="affairSpan" style="color: red;"></span></div>
                                            </a></td>
                                        <td><a href="AffairsList.aspx?view=2">
                                            <img src="Images/Main/done.gif" /><div>已办事务</div>
                                        </a></td>
                                    </tr>
                                    <tr class="hover_hander">
                                        <td><a href="Office/Default.aspx">
                                            <img src="Images/Main/post.gif" /><div>发文管理</div>
                                        </a></td>
                                        <td><a href="AffairsList.aspx?view=3">
                                            <img src="Images/Main/Receipt.gif" /><div>收文管理</div>
                                        </a></td>
                                        <td><a href="Office/DocManage.aspx">
                                            <img src="Images/Main/Circulated.gif" /><div>传阅管理</div>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: right;"><a href="#">More...</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </li>
                <li class="ui-state-default" runat="server" id="mainChk2">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Branch.gif') no-repeat;">
                            <div class="duty_tp">
                                <span class="fork" onclick="closeDiv(this);"></span>
                                <span class="oaarrow" onclick="coll(this);"></span>
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
                                <strong>部门行政办公</strong>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent office">
                                <table class="myTable threeTr">
                                    <tr class="hover_hander">
                                        <td><a href="AffairDrafting.aspx">
                                            <img src="Images/Main/draft.gif" /><div title="点击进入">事务起草</div>
                                        </a></td>
                                        <td><a href="AffairsList.aspx?view=1&DocType=1">
                                            <img src="Images/Main/Awaiting.gif" /><div title="点击进入">
                                                待批事务
                                    <span id="affairSpan2" style="color: red;"></span>
                                            </div>
                                        </a></td>
                                        <td><a href="AffairsList.aspx?view=2&DocType=1">
                                            <img src="Images/Main/down.gif" /><div title="点击进入">已批事物</div>
                                        </a></td>
                                    </tr>
                                    <tr class="hover_hander">
                                        <td><a href="Office/Default.aspx">
                                            <img src="Images/Main/ziyuan.gif" /><div title="点击进入">资源预约</div>
                                        </a></td>
                                        <td><a href="AffairsList.aspx?view=3&DocType=1">
                                            <img src="Images/Main/form.gif" /><div title="点击进入">表单管理</div>
                                        </a></td>
                                        <td><a href="AffairsList.aspx?view=4&DocType=1">
                                            <img src="Images/Main/schedule.gif" /><div title="点击进入">日程安排</div>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: right;"><a href="#">More...</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default" runat="server" id="mainChk3">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Notice.gif') no-repeat;">
                            <div class="duty_tp">
                                <span class="fork" onclick="closeDiv(this);"></span>
                                <span class="oaarrow" onclick="coll(this);"></span>
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
                                <strong>医院部门公告</strong>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent notice">
                                <table class="myTable">
                                    <tr class="hover_hander">
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("党办")%>">
                                            <img src="Images/Main/Party.gif" /></a></td>
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("院办")%>">
                                            <img src="Images/Main/hospital.gif" /></a></td>
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("纪检")%>">
                                            <img src="Images/Main/Discipline.gif" /></a></td>
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("人事")%>">
                                            <img src="Images/Main/affairs.gif" /></a></td>
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("财务")%>">
                                            <img src="Images/Main/Finance.gif" /></a></td>
                                    </tr>
                                    <tr class="hover_hander">
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("科教")%>">
                                            <img src="Images/Main/Science.gif" /></a></td>
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("医务")%>">
                                            <img src="Images/Main/Medical.gif" /></a></td>
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("护理")%>">
                                            <img src="Images/Main/Nurse.gif" /></a></td>
                                        <td><a href="ContentManage.aspx?NodeID=<%=OACommon.GetNodeID("信息")%>">
                                            <img src="Images/Main/Information.gif" /></a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="text-align: right;"><a href="ContentManage.aspx">More...</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default" runat="server" id="mainChk4">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Myemail.gif') no-repeat;">
                            <div class="duty_tp">
                                <span class="fork" onclick="closeDiv(this);"></span>
                                <span class="oaarrow" onclick="coll(this);"></span>
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
                                <strong>我的邮箱管理</strong>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent email">
                                <table class="myTable threeTr">
                                    <tr class="hover_hander">
                                        <td><a href="Mail/MessageSend.aspx">
                                            <img src="Images/Main/writemail.gif" /><div>写邮件</div>
                                        </a></td>
                                        <td><a href="Mail/Message.aspx?view=1">
                                            <img src="Images/Main/recivemail.gif" /><div>收邮件</div>
                                        </a></td>
                                        <td><a href="Mail/MessageOutbox.aspx?view=2">
                                            <img src="Images/Main/sendmail.gif" /><div>发件箱</div>
                                        </a></td>
                                    </tr>
                                    <tr class="hover_hander">
                                        <td><a href="Mail/MessageDraftbox.aspx">
                                            <img src="Images/Main/draftmail.gif" /><div>草稿箱</div>
                                        </a></td>
                                        <td><a href="Mail/MessageGarbagebox.aspx?view=3">
                                            <img src="Images/Main/rubbishmali.gif" /><div>垃圾箱</div>
                                        </a></td>
                                        <td><a href="Mail/Contact.aspx">
                                            <img src="Images/Main/contact.gif" /><div>通迅录</div>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: right;"><a href="#">More...</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default" runat="server" id="mainChk5">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Newest.gif') no-repeat;">
                            <div class="duty_tp">
                                <span class="fork" onclick="closeDiv(this);"></span>
                                <span class="oaarrow" onclick="coll(this);"></span>
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
                                <strong>医院最新通知</strong>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent">
                                <table class="table_li table_mouse">
                                    <asp:Repeater runat="server" ID="noticeR1">
                                        <ItemTemplate>
                                            <tr title="双击阅读">
                                                <td><a class="bbstitle" href="/Item/<%#Eval("GeneralID") %>.aspx" target="_blank" title="<%#Eval("Title") %>"><%#Eval("Title") %></a>
                                                    <input type="checkbox" id="chkID" value="<%#Eval("GeneralID") %>" style="display: none;" /></td>
                                                <td><%#Eval("Inputer") %></td>
                                                <td class="text-right wid180"><%# DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy年M月d日 HH:mm}")%></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                                <div class="more"><a href="/Class_<%=OACommon.GetNodeID("医院最新通知") %>/Default.aspx" target="_blank">More...</a></div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default" runat="server" id="mainChk6">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Bbs.gif') no-repeat;">
                            <div class="duty_tp">
                                <span class="fork" onclick="closeDiv(this);"></span>
                                <span class="oaarrow" onclick="coll(this);"></span>
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
                                <strong>医院论坛交流</strong>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent">
                                <table class="table_li table_mouse">
                                    <asp:Repeater runat="server" ID="noticeR2">
                                        <ItemTemplate>
                                            <tr title="双击阅读">
                                                <td><a class="bbstitle" href="ViewContent.aspx?gid=<%#Eval("GeneralID") %>" title="<%#Eval("Title") %>"><%#Eval("Title") %></a>
                                                    <input type="checkbox" id="chkID" value="<%#Eval("GeneralID") %>" style="display: none;" /></td>
                                                <td><%#Eval("Inputer") %></td>
                                                <td class=" text-right wid180"><%# DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy年M月d日 HH:mm}")%></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                                <div class="more"><a href="/Class_<%=OACommon.GetNodeID("医院论坛交流") %>/Default.aspx" target="_blank">More...</a></div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <script type="text/javascript">
            function coll(obj) {
                $p = $(obj).closest('li');
                $p.find(".content").hide("fast");
                $(obj).hide().siblings().show();
            }
            function coll2(obj) {
                $p = $(obj).closest('li');
                $p.find(".content").show("fast");
                $(obj).hide().siblings().show();
            }
            function closeDiv(obj) {
                $p = $(obj).closest('li');
                //$p.hide("fast");
                $li = $p.remove();
            }
            var obj = parent.document.getElementById("main_right"); //取得父页面IFrame对象
            obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度
        </script>
    </form>
</body>
</html>
