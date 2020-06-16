<%@ page language="C#" autoeventwireup="true" inherits="test_chat, App_Web_5avmdgwc" clientidmode="Static" validaterequest="false" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/Controls/B_User.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="chat.css" rel="stylesheet" />
    <style type="text/css">
        .chat_body{height:320px;}
        .form-control {max-width:200px; margin-bottom:10px;}
    </style>
    <title>在线聊天</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 600px; height: 550px; border: 1px solid #ddd; float: left;">
            <div class="list_body" style="float: left; width: 160px;">
                <div class="chat_header">联系人</div>
                <ul style="height:426px;overflow-y:auto;">
                    <asp:Repeater runat="server" ID="GroupRPT" OnItemDataBound="GroupRPT_ItemDataBound">
                        <ItemTemplate>
                                <ul><li class="list_group">
                                    <div class="list_group_title">
                                        <span class="glyphicon glyphicon-chevron-right remindgray"></span>
                                        <span><%#Eval("GroupName")%></span>
                                        <span class="remindgray" style="float:right;margin-right:10px;">
                                            <asp:Label runat="server" ID="MemberNum"></asp:Label>
                                        </span>
                                        <div style="clear:both;height:8px;"></div>
                                    </div>
                                </li>
                                <ul class="list_item_body" <%#Eval("GroupID").ToString().Equals("-1")?"id='visitorlist'":"" %>><asp:Repeater runat="server" ID="UserRPT">
                                        <ItemTemplate>
                                            <li onclick="ChangeTalker(<%#"'"+Eval("UserID")+"','"+Eval("UserName")+"'" %>);" class="list_item" id="list_item_<%#Eval("UserID") %>">
                                                <img src="<%#Eval("UserFace") %>" class="member_face" onerror="this.src='/Images/userface/noface.gif';" />
                                                <p class="member_nick"><%#Eval("UserName") %><br />
                                                    <span id="isonline_<%#Eval("UserID") %>" class="isonline remindgray">(检测中)</span>
                                                    <span id="unread_<%#Eval("UserID") %>" class="badge"></span>
                                                </p>
                                                <div style="clear:both;"></div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </ul>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <div class="chat_container"  style="float:right;">
                <div class="chat_header">
                    <span id="uinfo_name">请先选择用户</span>
                    <span style="float: right; margin-right: 10px;">
                        <span class="glyphicon glyphicon-list-alt opbtn" style="margin-right:5px;" onclick="ShowHistory();" title="历史记录"></span>
                        <span class="glyphicon glyphicon-remove opbtn" onclick="parent.ChatClose();" title="关闭"></span>
                    </span>
                </div>
                <div id="chat_body_list" style="height:320px;"></div>
                <div id="mymsg">
                    <textarea id="content" style="height: 135px;"></textarea>
                    <div style="padding:5px 5px 5px 10px;border-left:1px solid #ddd; background:#fff;">
                         <span class="remindgray">支持Ctrl+Enter快捷键发送信息</span>
                         <input type="button" id="sendbtn" class="btn btn-xs btn-primary" value="发送" disabled="disabled" onclick="SendMsg();" style="float:right;"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="alert alert-info" role="alert" style="width:600px;margin-top:10px;">您可以通过UID来指定聊天对象，如：/Common/Chat/Chat.aspx?uid=1
</div>
        <div style="float: left; padding-left: 10px;display:none;">
            <input type="button" value="获取在线用户" onclick="GetOnlineList();" />
           <div>
                隐藏DIV仅用于调试
           </div>
            <ul>
                <li>
                    <img src="" id="myfaceimg" style="width: 80px; height: 80px;" onerror="this.src='/Images/userface/noface.gif';" /></li>
                <li>名字:<input type="text" id="myname_t" /></li>
                <li>ID:<input type="text" id="myid_t" /></li>
                <li>
                      在线用户：<textarea id="onlineids_text" style="height: 100px;"></textarea>
                </li>
                <li>
                     与谁聊:<input type="text" id="ReceUser_Hid" />
                    <input type="button" value="测试" onclick="testF();" />
                    <input type="button" value="接收" onclick="GetMsg();" />
                </li>
                <li>获取在线用户:</li>
            </ul>
        </div>
        <%=Call.GetUEditor("content",5) %>
        <div class="modal fade" id="modeldiv" data-backdrop="static" style="top:20%;left:20%;">
            <div class="modal-dialog" style="width: 300px;">
                <div class="modal-content">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab0" data-toggle="tab">用户登录</a></li>
                        <li><a href="#tab1" data-toggle="tab">游客登录</a></li>
                    </ul>
                    <div class="modal-body">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab0">
                                <input type="text" id="uname_t" class="form-control" placeholder="用户名" onkeyup="GetEnterCode('focus','pwd_t');" />
                                <input type="password" id="pwd_t" class="form-control" onkeyup="GetEnterCode('click','ulogin_btn');"/>
                                <input type="button" id="ulogin_btn" value="登录" class="btn btn-primary" onclick="AJAXLogin(); disBtn(this,2000);" />
                                <input type="button" value="注册" class="btn btn-default" onclick="GetToReg();" />
                            </div>
                            <div class="tab-pane" id="tab1">
                                <input type="text" id="visname_t" class="form-control" value="游客" onkeyup="GetEnterCode('click','vlogin_btn');"/>
                                <input type="button" id="vlogin_btn" class="btn btn-primary" value="游客登录" onclick="VisitorLogin(); disBtn(this, 2000);" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      <%--  <asp:HiddenField runat="server" ID="ReceUsers_Hid" Value="1" />--%>
         <script type="text/javascript">
             var buser = new B_User();
             function GetToReg() {
                 if (parent)
                     parent.location = "/User/Register.aspx";
                 else location = "/User/Register.aspx";
             }
             function AJAXLogin() {
                 var u = $("#uname_t").val();
                 var p = $("#pwd_t").val();
                 buser.Login(u, p, function (data) {
                     //将信息填充入隐藏字段用户ID:用户名:用户头像
                     if (data == "" || data == -1) {
                         alert("用户名或密码错误!!");
                     }
                     else {
                         AddOnline();
                     }

                 });
             }
             function VisitorLogin() {
                 var uname = $("#visname_t").val();
                 AddOnline(uname);
             }
             function ShowModal() {
                 $("#modeldiv").modal({ keyboard: false });
             }
             //添加用户进入在线用户
             function AddOnline(uname) {
                 $.ajax({
                     type: "Post",
                     url: ajaxurl,
                     data: { action: "userlogin",name:uname },
                     success: function (data) {
                         $('#modeldiv').modal('hide');//这里之后再getmsg等
                         myinfo = JSON.parse(data);
                         myinfo.CDate = "00:00:00";
                         BeginInit();
                         $("#myfaceimg").attr("src", myinfo.UserFace);
                         $("#myid_t").val(myinfo.UserID);
                         $("#myname_t").val(myinfo.UserName);
                     }
                 });//IsLogged end;
             }
             //仅刷新游客列表,加上新登录的游客,10秒检测一次
             function GetOnlineList() {
                 var onlinetlp = "<li onclick='ChangeTalker(\"@UserID\",\"@UserName\");' class='list_item' id='list_item_@UserID'>"
                           + "<img src='/Images/userface/noface.gif' class='member_face'>"
                           + "<p class='member_nick'>@UserName<br>"
                           + "<span id='isonline_zvpf' class='isonline remindgray'>[在线]</span>"
                           + "<span id='unread_zvpf' class='badge'></span></p>"
                           + "<div style='clear:both;'></div></li>";
                 $.ajax({
                     type: "Post",
                     url: ajaxurl,
                     data: { action: "getonlinelist"},
                     success: function (data) {
                         if (data != "" && data != "[]")
                         {
                             data = JSON.parse(data);//所有在线游客json
                             for (var i = 0; i < data.length; i++) {
                                 if ($("#list_item_" + data[i].UserID).length < 1) {
                                     var tlp = onlinetlp.replace(/@UserID/g, data[i].UserID.replace(/ /g, "")).replace(/@UserName/g, data[i].UserName);
                                     $("#visitorlist").append(tlp);
                                 }//for end;
                             }
                         }
                     }
                 });
             }
             function SetMyInfo(uid,uname,uface)
             {
                 myinfo.UserID = uid;
                 myinfo.UserName = uname;
                 myinfo.UserFace = uface;
                 myinfo.CDate = "00:00:00";
                 $("#myfaceimg").attr("src", myinfo.UserFace);
                 $("#myid_t").val(myinfo.UserID);
                 $("#myname_t").val(myinfo.UserName);
             }
         </script>
        <script type="text/javascript">
            var interval = null;
            var boundary = "------asjdfohponzvnzcvapowtunzafadsfwt";
            var myinfo = { UserID: "", UserName: "", UserFace: "", CDate: "00:00:00" };
            //我说的话模板,别人的模板
            var mytlp = "<div class='mychat'><img src='@UserFace' class='userface myface' onerror='this.src=\"/Images/userface/noface.gif\";' />"
               + "<p class='chat_nick'><span class='remindgray'>(@CDate)</span>@UserName</p>"
               + "<div class='chat_content'>@Content</div></div>";
            var othertlp = "<div class='otherchat'><img src='@UserFace' class='userface otherface' onerror='this.src=\"/Images/userface/noface.gif\";' />"
             + "<p class='other_nick'>@UserName<span class='remindgray'>(@CDate)</span></p>"
             + "<div class='chat_content othercontent'>@Content</div></div>";
            var ajaxurl = "chat.ashx";
            $().ready(function () {
                $(".list_group").click(function () {
                    $(this).parent().find(".list_item_body").toggle("fast");
                })
                setTimeout(function () {
                        UE.getEditor("content").addListener("keydown", function (type, e) {
                            if (e.ctrlKey && e.keyCode == 13)
                            { SendMsg(); }
                        });
                }, 1000);
                $("#uname_t").focus();
            });
            //已登录调用该方法初始化
            function BeginInit() {
                GetOnline();
                //$("#list_item_" + myinfo.UserID).hide(); //隐掉自己
                interval = setInterval(GetMsg, 2000);
                onlineInterval = setInterval(GetOnlineList,10000);
            }
            //------------------------------
            function SendMsg() {
                var msg = UE.getEditor("content").getContent();
                var $curbody = GetCurBody();
                if (msg == "" || $("#ReceUser_Hid").val() == "") { return; }
                $.ajax({
                    type: "Post",
                    url: "chat.ashx",
                    data: { action: "sendmsg", content: msg, rece: $("#ReceUser_Hid").val(), uid: myinfo.UserID },
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (data) {
                    }
                });
                var date = new Date();
                myinfo.CDate = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
                $curbody.append(TlpReplace(mytlp, myinfo, msg));
                $("#content").val("");//必须要清下,否则有换行等Bug
                UE.getEditor("content").setContent("");
                ReturnToBottom();
            }
            //检测有没有我的信息,后期改为长轮循
            function GetMsg() {
                $.ajax({
                    type: "Post",
                    url: "chat.ashx",
                    data: { action: "getmsg", uid: myinfo.UserID, rece: $("#ReceUser_Hid").val() },
                    success: function (data) {
                        GetMsgCallBack(data);
                    },
                    error: function (data) {
                    }
                });
            }
            //返回json数组
            function GetMsgCallBack(data) {
                if (data != "" && data != "[]") {
                    var $curbody = GetCurBody();
                    var arr = data.split(boundary);
                    var json = JSON.parse(arr[0]);
                    for (var i = 0; i < json.length; i++) {
                        var msg = TlpReplace(othertlp, json[i], arr[(i + 3)]);
                        $curbody.append(msg);
                        ReturnToBottom();
                    }
                    UpdateOnline(arr[1]);
                    UpdateUnread(arr[2]);
                }
            }
            function GetOnline() {
                $.ajax({
                    type: "Post",
                    url: ajaxurl,
                    data: { action: "getonline" },
                    success: function (data) {
                        UpdateOnline(data);
                    },
                    error: function (data) {
                    }
                });
            }
            //内容替换
            function TlpReplace(tlp,json,content)
            {
                return tlp.replace("@UserFace", json.UserFace).replace("@UserName", json.UserName)
                           .replace("@CDate", json.CDate).replace("@Content", content);
            }
            //更新在线用户信息
            function UpdateOnline(ids) {
                $(".isonline").text("[不在线]");
                var onlinearr = ids.split(',');
                for (var i = 0; i < onlinearr.length; i++) {
                    if (onlinearr[i] == "") continue;
                    $("#isonline_" + onlinearr[i]).text("[在线]");
                }
                $("#onlineids_text").val(ids);
                //如果没有则加
            }
            //更新是否收到新的消息
            function UpdateUnread(ids) {
                var arr = ids.split(",");
                for (var i = 0; i < arr.length; i++) {
                    if (arr[i] == "" || arr[i] == $("#ReceUser_Hid").val()) continue;
                    $("#unread_" + arr[i]).text("未读");
                }
            }
            //-----工具
            var chat_body_tlp = "<div id='chat_body_@uid' class='chat_body'></div>";
            //获取当前聊天窗体
            function GetCurBody() {
                var uid = $("#ReceUser_Hid").val();
                return $("#chat_body_" + uid);
            }
            //获取指定ID的聊天窗体,如果无则新建
            function GetBodyByID(uid) {
                $chatbody = $("#chat_body_" + uid);
                if ($chatbody.length < 1)//不存在,新建
                {
                    $("#chat_body_list").append(chat_body_tlp.replace("@uid", uid));
                }
                return $chatbody;
            }
            function ChangeTalker(uid,uname)//支持切换
            {
                if (uid == "" || uid == $("#ReceUser_Hid").val()) return;
                $("#sendbtn")[0].disabled = "";
                $("#uinfo_name").text(uname);
                $("#ReceUser_Hid").val(uid);
                $("#unread_" + uid).text("");
                $(".chat_body").hide();
                $chatbody = GetBodyByID(uid);
                $chatbody.show();
                GetMsg();
                //if (interval == null) {
                //    interval = setInterval(GetMsg, 2000);
                //}
                return false;
            }
            function setScollTop() {
                if ($(window).scrollTop() > 1) {
                    $(window).scrollTop($(window).scrollTop() - 30);
                    setTimeout(setScollTop, 1);
                }
            }
            function ReturnToBottom()
            {
                setTimeout(setScrollBottom,1);
            }
            function setScrollBottom() {
                $curbody = GetCurBody();
                if ($curbody.scrollTop() < $curbody[0].scrollHeight - $curbody.height()) {
                    $curbody.scrollTop($curbody.scrollTop() + 30);
                    setTimeout(setScrollBottom, 1);
                }
            }
            function ShowHistory()
            {
                var cuid = $("#ReceUser_Hid").val();
                if (!cuid || cuid == "") { alert("尚未选定用户"); return; }
                window.open("/Common/Chat/ChatHistory.aspx?cuid=" + cuid);
            }
            function GetParam2() {
                var index = location.href.indexOf("#");
                var r = "";
                if (index > -1) {
                    r = location.href.substring((index + 1), location.href.length);
                }
                return r;
            }
            //先AJAX，
            //$(function () {
            //    (function longPolling() {
            //        $.ajax({
            //            url: "chat.aspx",
            //            data: { "timed": new Date().getTime() },
            //            dataType: "text",
            //            timeout: 5000,
            //            error: function (XMLHttpRequest, textStatus, errorThrown) {
            //                $("#state").append("[state: " + textStatus + ", error: " + errorThrown + " ]<br/>");
            //                if (textStatus == "timeout") { // 请求超时
            //                    longPolling(); // 递归调用
            //                    // 其他错误，如网络错误等
            //                } else {
            //                    longPolling();
            //                }
            //            },
            //            success: function (data, textStatus) {
            //                $("#state").append("[state: " + textStatus + ", data: { " + data + "} ]<br/>");

            //                if (textStatus == "success") { // 请求成功
            //                    longPolling();
            //                }
            //            }
            //        });
            //    })();
            //});
        </script>
    </form>
</body>
</html>
