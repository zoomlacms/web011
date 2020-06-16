<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.User_Register, App_Web_alwjrles" enableviewstatemac="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <title>用户注册-<%:Call.SiteName %></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
 
    <link href="/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/Template/Travel/style/global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .form-control{width:90%;display:inline;}
    </style>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/ajaxrequest.js"></script>
    <script type="text/javascript" src="/JS/PassStrong.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/FrontPage.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var ajax1 = new AJAXRequest;
        function e_get() {
            var url = document.getElementById("hfUrl").value;
            var username = document.getElementById("TxtUserName").value;
            var pass = document.getElementById("TxtPassword").value;
            var mail = document.getElementById("TxtEmail");
            url = url + "?username=" + username + "&pass=" + pass + "&mail=" + mail;
            ajax1.get(
        url,
        function (obj) {
            var index = 1;
            var i = obj.responseText;
            if (i == "[Fail]" && index <= 3) {
                e_get();
            }
        }
            );
        }
        var i = 60;//倒计时
        function TimeClose() { 
            if (i > 0) {
                i--;
                document.getElementById("sendBtn").value="("+i+"秒后)重发验证码";
                document.getElementById("sendBtn").disabled="true";
            }
            else { 
                document.getElementById("sendBtn").value ="重新获取验证码";
                document.getElementById("sendBtn").disabled="false";
            }
            window.setTimeout(function () { TimeClose() }, 1000);
        }
        function code()
        {
            v = $("#SendVcode").val();
            var flag=codeIsRight(v);
            if(!flag)
            {
                $("#SendVcode").focus();
            }
            else
            {
                $("#BtnSubmit").trigger("click");
            }
        }
        function area() {
            $.ajax({
                type: "POST",
                url: "Register.aspx",
                data: "action=area&value=" + $("#selprovince option:selected").val(),
                success: function (msg) {
                    var s = new Array();
                    s = msg.split("|");
                    var str = "";
                    for (var i = 0; i < s.length; i++) {
                        if (s[i] != null && s[i] != "")
														
                            str += "<option>" + s[i] + "</option>"
                    }
                    $("#selcity").html(str);
                    area2();
                },
                Error: function (msg) {
                    alert("地址获取失败");
                }
            });
										
        }
        function area2() {						
            $.ajax({
                type: "POST",
                url: "Register.aspx",
                data: "action=area2&pro="+$("#selprovince option:selected").val()+"&city="+$("#selcity option:selected").val(),
                success: function (msg) {
                    var s = new Array();
                    s = msg.split("|");
                    var str = "";
                    for (var i = 0; i < s.length; i++) {
                        if (s[i] != null && s[i] != "")
                            str += "<option>" + s[i] + "</option>";
															
                    }
                    $("#selcoutry").html(str);
													
                },
                Error: function (msg) {
                    alert("地址获取失败");
                }
            });
										 	
        }				 
    </script>
    <style>
	.glyphicon{ color:#34A150; } 
	.glyphicon-resize-vertical{ color:#fff;} 	 
	.btn-primary{ background:#34A150; border:1px solid #34A150;}
	.btn-primary:hover{ background:#288400; border:1px solid #288400;}
	</style>
    
</head>
<body class="backs">
<%Call.Label("{ZL.Label id=\"全站头部\" /}"); %>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <script type="text/javascript">
            function gotouser() {
                window.setTimeout("gotouserpage()", 5000);
            }
            function gotouserpage() {
                location = document.getElementById("hfReturnUrl").value;
            }
            var ms=5;
            function setTimeShow(){
                document.getElementById("spanTime").innerHTML="还剩"+ms+"秒跳转到登录";
                ms--;
                if(ms<=0){
                    window.location.href="login.aspx";
                }
                window.setTimeout("setTimeShow()", 5000);
            }
        </script>
        <!-- 顶部代码布局 -->
        <!-- 正文布局 -->
        <div class="navbar navbar-fixed-top" style="display:none;">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand hidden-sm" style="color: #fff;" href="/" title="首页">
                        <%:Call.SiteName%>
                    </a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="http://www.zoomla.cn">官网首页</a></li>
                        <li><a href="http://bbs.zoomla.cn/">技术社区</a></li>
                        <li><a href="http://www.zoomla.cn/pub/">下载产品</a></li>
                        <li><a href="http://help.zoomla.cn/">使用帮助</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container" style="padding-top: 20px; margin-top: 20px; margin-bottom:80px;">
            <div id="reg_main">
                <asp:Literal ID="LitControlTreeInfo" runat="server"></asp:Literal>
                <asp:Panel ID="PnlRegStep0" runat="server" Visible="false" Width="100%">未开放注册，请和网站管理员联系！</asp:Panel>
                <asp:Panel ID="PnlRegStep1" runat="server" Visible="false" Width="100%">
                    <h1>第一步：服务条款和声明</h1>
                    <textarea name="textarea" cols="20" rows="2" readonly style="font-weight: normal; font-size: 9pt; width: 99%; line-height: normal; font-style: normal; height: 372px; font-variant: normal"><asp:Literal ID="LitProtocol" runat="server"></asp:Literal>
</textarea>
                    <div class="rsubmit">
                        <asp:Button ID="BtnRegStep1" CssClass="btn btn-primary" runat="server" Text="同意" OnClick="BtnRegStep1_Click" />
                        <asp:Button ID="BtnRegStep1NotApprove"  CssClass="btn btn-primary" runat="server" Text="不同意" OnClick="BtnRegStep1NotApprove_Click"/>
                    </div>
                    <asp:HiddenField ID="hfUrl" runat="server" />
                    <!--第二轮开始 -->
                    <script type="text/javascript">	
<!--
    var secs = 9;
    var wait = secs * 1000;
    var btnId = "BtnRegStep1";
    document.getElementById(btnId).disabled = true;

    function regload() {
        document.getElementById(btnId).value = "我同意[" + secs + "]";
        for (i = 1; i <= secs; i++) {
            window.setTimeout("Update(" + i + ")", i * 1000);
        }
        window.setTimeout("Timer()", wait);
    }

    function Update(num) {
        if (num != secs) {
            printnr = (wait / 1000) - num;
            document.getElementById(btnId).value = "我同意[" + printnr + "]";
        }
    }
    function Timer() {
        document.getElementById(btnId).disabled = false;
        document.getElementById(btnId).value = "我同意";
    }
    function endbtn() {
        document.getElementById(btnId).disabled = false;
    }
    //-->
                    </script>
                </asp:Panel>
                <asp:Panel ID="PnlMRegStep1" runat="server">
                    <div id="MobileRegis" class="reg_sub" runat="server">
                        <h1>第一步：手机验证</h1>
                        <asp:Label ID="lbmob" runat="server"></asp:Label>
                        <ul class="list-unstyled">
                            <li>
                                <div class="form-group">
                                    <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">手机号：</label>
                                    <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 ">
                                        <asp:TextBox ID="TxtMobile1" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                                    </div>
                                    <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 ">
                                        <asp:RequiredFieldValidator ID="rg1" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="手机号码不能为空" SetFocusOnError="false" ControlToValidate="TxtMobile1" />
                                        <asp:RegularExpressionValidator ID="rg4" Display="Dynamic" ForeColor="Red" runat="server" ControlToValidate="TxtMobile1" ErrorMessage="请输入正确的手机号码" ValidationExpression="^1(?:3|5|8)\d{9}$" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">短信验证码：</label>
                                    <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 ">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0 text-left">
                                        <asp:Button ID="sendBtn" runat="server" Text="获取验证码" OnClick="SendMob_Click" CssClass="btn btn-info" />
                                    </div>
                                </div>
                            </li>
                            <li>
                                <asp:Button ID="Button1" runat="server" Text="下一步" OnClick="BtnMRegStep1_Click" CssClass="btn btn btn-primary" Style="margin-top: 10px;" />
                            </li>
                        </ul>
                    </div>
                </asp:Panel>
                <asp:Panel ID="PnlRegStep2" runat="server" Visible="false" Width="100%">
                    <div class="border_right">

                        <script type="text/javascript">
                            var btnId2 = "BtnSubmit";
                            function checkreg(obj) {

                                if (document.getElementById("CheckBox1").checked) {
                                    document.getElementById(btnId2).disabled = false;
                                }
                                else {
                                    document.getElementById(btnId2).disabled = true;
                                }
                            }
                            function dispbtn()
                            {
                                document.getElementById(btnId2).disabled = true;
                            }

                            function PostToCS(a,v,func)
                            {
                                $.ajax({
                                    type:"Post",
                                    data:{action:a,value:v},
                                    success:function(data)
                                    {
                                        func(data);
                                    },
                                    error:function(data)
                                    {
                                        alert("错误"+data);
                                    }
                                });
                            }
                            //----Register User
                            function CheckUser()
                            {
                                var userName = document.getElementById("TxtUserName");
                                var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                checkUserNameMessage.className = "";
                                checkUserNameMessage.innerHTML = "";
                                if(userName.value.toString().replace(" ","")!="")
                                {
                                    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                    checkUserNameMessage.className = "";
                                    checkUserNameMessage.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";        
                                    PostToCS("UserIsExist",userName.value,ReceiveServerData);
                                }
                            } 
                            function ReceiveServerData(result)
                            { 
                                var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                checkUserNameMessage.innerHTML="";
                                if(result == "true")
                                {
                                    checkUserNameMessage.innerHTML = "用户名已经被注册了！";
                                    checkUserNameMessage.className = "d_err";
                                }

                                //if(result == "error01"||result == "Nidtrue2"||result == "Nno"||result == "Nidtrue"||result=="Nyidtrue"||result=="Ncidtrue"||result=="Nxidtrue")
                                //{
                                //    checkUserNameMessage.innerHTML = "用户名不允许纯数字！";//
                                //    checkUserNameMessage.className = "d_err";
                                //}
                                //if(result == "error02")
                                //{
                                //    checkUserNameMessage.innerHTML = "用户名不允许纯英文！";//
                                //    checkUserNameMessage.className = "d_err";
                                //}
                                //if(result == "error03")
                                //{
                                //    checkUserNameMessage.innerHTML = "用户名不允许带有中文！";//
                                //    checkUserNameMessage.className = "d_err";
                                //}

                                //if(result == "error04")
                                //{
                                //    checkUserNameMessage.innerHTML = "用户名不允许带有特殊字符！";//
                                //    checkUserNameMessage.className = "d_err";
                                //}
                                //if(result == "error05")
                                //{
                                //    checkUserNameMessage.innerHTML = "用户名不合法！";//
                                //    checkUserNameMessage.className = "d_err";
                                //}

                                //if(result == "error06")
                                //{
                                //    checkUserNameMessage.innerHTML = "包含不允许注册的词语！";//
                                //    checkUserNameMessage.className = "d_err";
                                //}
                                //if(result == "error07")
                                //{
                                //    checkUserNameMessage.innerHTML = "用户名已经存在！";//
                                //    checkUserNameMessage.className = "d_err";
                                //}
                                if(result == "disabled")
                                {
                                    checkUserNameMessage.innerHTML = "该用户名禁止注册！";
                                    checkUserNameMessage.className = "d_err";
                                }
                                if(result == "false"||result == "Fidtrue2"||result == "Fno"||result == "Fidtrue"||result=="Fyidtrue"||result=="Fcidtrue"||result=="Fxidtrue")
                                {
                                    checkUserNameMessage.innerHTML = "恭喜您，用户名可以使用！";
                                    checkUserNameMessage.className = "d_ok";
                                }
                            }
                            //--------推荐人
                            function CheckParent(sender, args) 
                            {
                                $.ajax({
                                    type:"Post",
                                    async:false,
                                    data:{action:"ParentUser",value:args.Value},//args.Value
                                    success:function(data)
                                    {
                                        if(data==0)
                                            args.IsValid = false;
                                        else
                                            args.IsValid = true;
                                    },
                                    error:function(data)
                                    {
                                        alert("错误"+data);
                                    }
                                });
                            }
                            function CheckParentUser()
                            {
                                var userName = document.getElementById("TxtParentUserID");
                                var checkUserNameMessage = document.getElementById("CheckParentUserMessage");  
                                if(userName!="")
                                {
                                    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
                                    checkUserNameMessage.className = "";
                                    checkUserNameMessage.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";        
                                    PostToCS("ParentUser",userName.value,ReceiveServerDataParent);
                                }
                            }
                            function ReceiveServerDataParent(result)
                            {    
                                var checkcardmsg = document.getElementById("CheckParentUserMessage");
                                if(result == "1")
                                {
                                    checkcardmsg.innerHTML = "该用户存在有效，请继续注册！";
                                    checkcardmsg.className = "d_err";
                                } 
                                else if(result=="0")
                                {
                                    checkcardmsg.innerHTML = "该用户不存在！";
                                    checkcardmsg.className = "";
                                }
                                else if (result == "-1")
                                {
                                    checkcardmsg.innerHTML = "";
                                    checkcardmsg.className = "";
                                }
                            }
                            //--------邀请码
                            function CheckInvite(sender, args)
                            {
                                $.ajax({
                                    type: "Post",
                                    async: false,
                                    data: { action: "InvitCode", value: args.Value },//args.Value
                                    success: function (data) {
                                        if (data == 0)
                                            args.IsValid = false;
                                        else
                                            args.IsValid = true;
                                    },
                                    error: function (data) {
                                        alert("错误" + data);
                                    }
                                });
                            }
                            function CheckInvitCode() {
                                var code = $("#TxtInvitCode").val();
                                var msg_labeel = document.getElementById("InvitCodeMsg");
                                if (code != "") {
                                    $("#InvitCodeMsg").removeClass().html("<img src=\"images/loading.gif\" align=\"absmiddle\" />");
                                    PostToCS("InvitCode", code, ReceiveInvitCode);
                                }
                                else { ReceiveInvitCode("-1"); }
                            }
                            function ReceiveInvitCode(result) {
                                var checkcardmsg = document.getElementById("InvitCodeMsg");
                                switch (result)
                                {
                                    case "1":
                                        checkcardmsg.innerHTML = "邀请码有效！";
                                        checkcardmsg.className = "d_err";
                                        break;
                                    case "0":
                                        checkcardmsg.innerHTML = "邀请码无效！";
                                        checkcardmsg.className = "";
                                        break;
                                    default:
                                        checkcardmsg.innerHTML = "";
                                        checkcardmsg.className = "";
                                        break;
                                }
                                console.log(result);
                            }
                            //--------
                            function  Checkyes()
                            {
                                var idCard = document.getElementById("TxtIDCard");
                                var checkcardmsg=document.getElementById("checkcard");
                                if(idCard.value=="" ||idCard.value == null)
                                {
                                    checkcardmsg.innerHTML = "身份证为空";       
                                    checkcardmsg.className = "d_err";
                                }
                                else
                                {
                                    CallTheServers(idCard.value,"");

                                }
                            }
                            function  CallTheServers(args,context)
                            {
                                var checkcardmsg=document.getElementById("checkcard");
                                checkcardmsg.className = "";
                                checkcardmsg.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";                        
                            }
                            function ReceiveServerDataID(result)
                            {   
                                var checkcardmsg = document.getElementById("checkcard");
                                if(result=="idtrue2"||result=="Nidtrue2"||result=="Fidtrue2")
                                {
                                    checkcardmsg.innerHTML = "请输入正确格式！";
                                    checkcardmsg.className = "d_err";
                                }
                                else if(result == "idtrue"||result == "Nidtrue"||result == "Fidtrue")
                                {
                                    checkcardmsg.innerHTML = "该身份证已被注册！";
                                    checkcardmsg.className = "d_err";
                                } 
                                else if(result=="Fyidtrue"||result=="Nyidtrue"||result=="yidtrue")
                                {
                                    checkcardmsg.innerHTML = "该身份证生日不正确！";
                                    checkcardmsg.className = "d_err";
                                }
                                else if(result=="Fcidtrue"||result=="Ncidtrue"||result=="cidtrue")
                                {
                                    checkcardmsg.innerHTML = "您超过了200岁？-吉尼斯世界纪录最长寿的人是132岁！";
                                    checkcardmsg.className = "d_err";
                                }
                                else if(result=="Fxidtrue"||result=="Nxidtrue"||result=="xidtrue")
                                {
                                    checkcardmsg.innerHTML = "您还没出生吧？";
                                    checkcardmsg.className = "d_err";
                                }
                                else if(result=="Fno"){
                                    checkcardmsg.innerHTML = "该身份证可用！";
                                    checkcardmsg.className = "";
                                } 
                            }
                            function  CallTheServerss(argss,context)
                            {
                                var checkcardmsg=document.getElementById("CheckParentUserMessage");
                                checkcardmsg.className = "";
                                checkcardmsg.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";                        
                            }
                            function SwicthSelectFill()
                            {
                                var selectFill = document.getElementById("TableRegisterSelect");
                                var selectFill2 = document.getElementById("TableRegisterSelect2");
                                if(selectFill.style.display=="none")
                                {
                                    selectFill.style.display="";
                                    selectFill2.style.display="";
                                    $("#disBtn").removeClass("metro").addClass("metroed");
                                }
                                else
                                {
                                    selectFill.style.display="none";
                                    selectFill2.style.display="none";
                                    $("#disBtn").removeClass("metroed").addClass("metro");
                                }
                            }
                            function hidenbtn()
                            {
                                var selectFill = document.getElementById("TableRegisterSelect");
                                var selectFill2 = document.getElementById("TableRegisterSelect2");
                                selectFill.style.display="none";
                                selectFill2.style.display="none";
                                document.getElementById("checkSelectFill").checked=false;
                            }
                            function EndRequestHandler(sender, args)
                                {
                                    if (args.get_error() != undefined){
                                        alert("检测到表单中存在HTML代码！");
                                        args.set_errorHandled(true);
                                    }
                                }
                        </script>
                        <div class="reg_sub"><!--注册用户--补全信息--注册成功(替换为图片形式)-->
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div><div class="col-lg-8 col-md-8 col-sm-8 col-xs-12"><h1><span class="glyphicon glyphicon-user"></span>注册会员</h1></div>
                            <ul class="list-unstyled">
                                <li>
                                    <div class="form-group">
                                        <label class="col-sm-4 col-lg-4 col-md-4 col-xs-12 text-right padding0">用户名：</label>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 ">
                                            <asp:TextBox ID="TxtUserName" CssClass="form-control" runat="server" onblur="CheckUser();" />
                                        </div>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0 ">
                                            <span class="d_err" id="CheckUserNameMessage"></span>
                                            <asp:RequiredFieldValidator ID="ReqTxtUserName" runat="server" ControlToValidate="TxtUserName"
                                                SetFocusOnError="false" ErrorMessage="用户名不能为空" Display="Dynamic" ForeColor="Red" />
                                            <asp:Literal ID="usertip" runat="server"></asp:Literal>
                                            <span runat="server" visible="false">用户名在
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>～<asp:Literal ID="Literal1" runat="server"></asp:Literal>个字符之间</span>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <div class="form-group">
                                        <label class="col-sm-4 col-lg-4 col-md-4 col-xs-12 text-right padding0">密 码：</label>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 ">
                                            <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" CssClass="form-control" onfocus=" focusinput();" onkeyup="f_checkrank();" />
                                        </div>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0 ">
                                            <div id="valPass">
                                                <span class="spantxt"><a id="idshow" class="atxt"></a></span><span class="spantxt"><a id="apass1" class="a_bor"></a><a id="apass2" class="a_bor"></a><a id="apass3" class="a_bor"></a></span><span style="margin-left: 10px;">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="TxtPassword"
                                                        ValidationExpression="[\S]{6,}" ErrorMessage="密码至少6位" Display="Dynamic" ForeColor="Red" />
                                                    <asp:RequiredFieldValidator ID="ReqTxtPassword" runat="server" ControlToValidate="TxtPassword"
                                                        SetFocusOnError="false" ErrorMessage="密码不能为空" Display="Dynamic" ForeColor="Red" />
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <div class="form-group">
                                        <label class="col-sm-4 col-lg-4 col-md-4 col-xs-12 text-right padding0">确认密码：</label>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 ">
                                            <asp:TextBox ID="TxtPwdConfirm" TextMode="Password" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0  text-left">
                                            <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TxtPwdConfirm" SetFocusOnError="false" Display="Dynamic" ErrorMessage="确认密码不能为空" ForeColor="Red" />
                                            <asp:CompareValidator ID="req2" runat="server" ControlToValidate="TxtPwdConfirm" ControlToCompare="TxtPassword"
                                                Operator="Equal" SetFocusOnError="false" ErrorMessage="两次密码输入不一致" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li id="regVcodeRegister" runat="server" visible="false">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">验证码：</label>
                                        <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 ">
                                            <asp:TextBox ID="SendVcode" MaxLength="6" runat="server" CssClass="form-control" autocomplete="off" onkeyup="checkCode(this);" />
                                        </div>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0  text-left">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" ToolTip="点击刷新验证码"
                                                Style="cursor: pointer; border: 0; vertical-align: middle;" onclick="this.src='/Common/ValidateCode.aspx?t='+Math.random()" />
                                            <span id="codeCheck"></span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SendVcode" Display="Dynamic" ErrorMessage="验证码不能为空!" />
                                            <asp:Label ID="Validateinfo" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                       
                            <ul class="list-unstyled">
                                <li class="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">密码问题：</label>
                                        <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 ">
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                <asp:ListItem>最喜欢的运动是什么？</asp:ListItem>
                                                <asp:ListItem>最喜欢的运动员是谁？</asp:ListItem>
                                                <asp:ListItem>我最喜欢的物品的名称？</asp:ListItem>
                                                <asp:ListItem>我最喜欢的歌曲？</asp:ListItem>
                                                <asp:ListItem>我最喜欢的食物？</asp:ListItem>
                                                <asp:ListItem>我最爱的人的名字？</asp:ListItem>
                                                <asp:ListItem>我最爱的电影？</asp:ListItem>
                                                <asp:ListItem>我妈妈的生日？</asp:ListItem>
                                                <asp:ListItem>我的初恋日期？</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li class="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">问题答案：</label>
                                        <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 ">
                                            <asp:TextBox ID="TxtAnswer" runat="server" CssClass="form-control" value="默认答案" />
                                        </div>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0  text-left">
                                            <asp:RequiredFieldValidator ID="ReqAnswer" runat="server" ControlToValidate="TxtAnswer" SetFocusOnError="false" Display="None" ErrorMessage="问题答案不能为空" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li id="regEmail" runat="server">
                                    <div class="form-group">
                                        <label class="col-sm-4 col-lg-4 col-md-4 col-xs-12 text-right padding0">Email：</label>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 ">
                                            <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" />
                                        </div>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 padding0  text-left">
                                            <asp:RequiredFieldValidator ID="ReqTxtEmail" runat="server" ControlToValidate="TxtEmail" ForeColor="Red"
                                                SetFocusOnError="false" Display="Dynamic" ErrorMessage="Email不能为空" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" Display="Dynamic" ForeColor="Red"
                                                ErrorMessage="邮件地址不规范" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li id="regParent" runat="server">
                                    <div class="form-group">
                                    </div>
                                </li>
                            </ul>
                            
                            <h4 style="text-align: left; display:none;"><span class="glyphicon glyphicon-plus-sign"></span>补充丰富资料</h4>
                            <ul class="list-unstyled">
                                <li>
                                    <div class="form-group">
                                        <label class="col-sm-4 col-lg-4 col-md-4 col-xs-12 text-right padding0">用户类型：</label>
                                        <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 text-left">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:RadioButtonList ID="UserGroup" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="UserGroup_SelectedIndexChanged"
                                                        RepeatColumns="4" AutoPostBack="True">
                                                    </asp:RadioButtonList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                                <li>
                                    <div>
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <table id="Table1" style="border-collapse: collapse" cellspacing="1" cellpadding="2" width="100%" border="0">
                                                    <asp:Literal ID="modelhtml" runat="server"></asp:Literal>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </li>
                            </ul>
                            <ul class="list-unstyled">
                                <li>
                                    <table id="TableRegisterMust" runat="server" border="0" cellpadding="2" cellspacing="1"
                                        style="border-collapse: collapse" width="100%">
                                        <tr id="usergroupss" runat="server" style="display: none;">
                                            <td class="tdbgleft" style="width: 20%"></td>
                                        </tr>
                                    </table>
                                </li>
                            </ul>
                            <ul class="list-unstyled" style="display:none;">
                                <li>
                                    <div class="metro btn btn-primary" title="显示选填信息" onclick="SwicthSelectFill();" id="disBtn"><span class="glyphicon glyphicon-resize-vertical"></span>显示用户选填信息 </div>
                                </li>
                            </ul>
                            <ul class="list-unstyled">
                                <li>
                                    <div>
                                        <table style="border-collapse: collapse; display: none;" id="TableRegisterSelect" cellspacing="1" cellpadding="2" width="100%" border="0" runat="server">
                                            <tr>
                                                <td colspan="2">
                                                    <h4 class="text-left"><span class="glyphicon glyphicon-list"></span>用户选填信息</h4>
                                                </td>
                                            </tr>
                                            <tr id="trSwicthSelectFill" runat="server">
                                                <td style="width: 20%" class="tdbgleft" onclick="SwicthSelectFill()"></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <table style="border-collapse: collapse; display: none" id="TableRegisterSelect2"
                                                    name="TableRegisterSelect2" cellspacing="1" cellpadding="2" width="100%" border="0">
                                                    <asp:Label ID="reghtml" runat="server"></asp:Label>
                                                    <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <table style="border-collapse: collapse" cellspacing="1" cellpadding="2" width="100%"
                                            border="0">
                                            <tr class="tdbgleft text-center">
                                                <td><span style="color: #ff0000">以上所有信息除选填项都必须先正确填写后才能成功注册。</span></td>
                                            </tr>
                                            <tr class="tdbgleft text-center">
                                                <td>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" 同意并接受注册协议" onclick="checkreg()" />
                                                    <asp:Button ID="BtnSubmit" runat="server" Text="注册" CssClass="btn btn-primary" OnClick="BtnSubmit_Click" />
                                                    <input id="Reset" type="reset" value=" 重置 " name="Reset" class="btn btn-primary" />
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />
                                                    已有账号？立即<strong><a href="/User/">登录</a></strong>
                                                </td> 
                                            </tr>
                                        </table>
                                        <table style="display: none" id="TableRegister" width="100%" border="0" runat="server">
                                            <tbody>
                                                <tr id="TRParentUserID" runat="server" visible="false">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">推荐人：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtParentUserID" runat="server" CssClass="form-control" onblur="CheckParentUser()"></asp:TextBox>
                                                                <asp:Literal ID="musttrParentUserID" runat="server"></asp:Literal>
                                                                <br />
                                                                <label runat="server" id="CheckParentUserMessage" style="color: red;"></label>
                                                                <asp:CustomValidator runat="server" ID="PUR" ControlToValidate="TxtParentUserID" Display="None" ValidateEmptyText="true" ErrorMessage="推荐人不存在!" ForeColor="Red" SetFocusOnError="true" ClientValidationFunction="CheckParent" />
                                                                <asp:RequiredFieldValidator ID="ReqTxtParentUserID" runat="server" Display="None" ErrorMessage="推荐人不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtParentUserID" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                 <tr id="TRInvitCode" runat="server" visible="false">
                                                    <td colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">邀请码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtInvitCode" runat="server" CssClass="form-control" onblur="CheckInvitCode()"></asp:TextBox>
                                                                <asp:Literal ID="musttrInvitCode" runat="server"></asp:Literal>
                                                                <br />
                                                                <label runat="server" id="InvitCodeMsg" style="color: red;"></label>
                                                                <asp:CustomValidator runat="server" ID="ReqInvitCode" ControlToValidate="TxtInvitCode" Display="None" ValidateEmptyText="true" ErrorMessage="邀请码不存在!" ForeColor="Red" SetFocusOnError="true" ClientValidationFunction="CheckInvite" />
                                                                <asp:RequiredFieldValidator ID="ReqTxtInvitCode" runat="server" Display="None" ErrorMessage="邀请码不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtInvitCode" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trUserSex" runat="server">
                                                    <td class="tdbgleft" colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">性别：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:DropDownList ID="DropSex" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Text="男" Value="1" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Text="女" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Literal ID="musttrUserSex" runat="server"></asp:Literal>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                </tr>
                                                <tr id="trBirthday" runat="server">
                                                    <td class="tdbgleft" colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">出生日期：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtBirthday" runat="server" onclick="setday(this);" CssClass="form-control" Text="1985-05-12" />
                                                                <asp:Literal ID="musttrBirthday" runat="server"></asp:Literal>
                                                                <asp:RequiredFieldValidator ID="ReqTxtBirthday" runat="server" ErrorMessage="出生日期不能为空"
                                                                    SetFocusOnError="false" ControlToValidate="TxtBirthday" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                </tr>
                                                <tr id="trHomepage" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">主页：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtHomepage" runat="server" CssClass="form-control">http://</asp:TextBox>
                                                                <asp:Literal ID="musttrHomepage" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtHomepage" runat="server" ErrorMessage="主页地址不能为空" SetFocusOnError="false" ControlToValidate="TxtHomepage" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </td>
                                                </tr>
                                                <tr id="trQQ" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">QQ号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtQQ" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrQQ" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtQQ" runat="server" ErrorMessage="QQ号码不能为空" SetFocusOnError="false" ControlToValidate="TxtQQ" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trICQ" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">ICQ号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtICQ" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrICQ" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtICQ" runat="server" ErrorMessage="ICQ号码不能为空" SetFocusOnError="false" ControlToValidate="TxtICQ" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trMSN" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">MSN帐号：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtMSN" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrMSN" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtMSN" runat="server" ErrorMessage="MSN帐号不能为空" SetFocusOnError="false" ControlToValidate="TxtMSN" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trYahoo" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">雅虎通帐号：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtYahoo" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrYahoo" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtYahoo" runat="server" ErrorMessage="雅虎通帐号不能为空" SetFocusOnError="false" ControlToValidate="TxtYahoo" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trUC" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">UC帐号：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtUC" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrUC" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtUC" runat="server" ErrorMessage="UC号码不能为空" SetFocusOnError="false" ControlToValidate="TxtUC" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trOfficePhone" runat="server">
                                                    <td class="tdbgleft" colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">办公电话：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtOfficePhone" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrOfficePhone" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtOfficePhone" runat="server" ErrorMessage="办公电话不能为空"
                                                                    SetFocusOnError="false" ControlToValidate="TxtOfficePhone" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>


                                                    </td>
                                                </tr>
                                                <tr id="trHomePhone" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">家庭电话：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtHomePhone" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrHomePhone" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtHomePhone" runat="server" ErrorMessage="家庭电话不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtHomePhone" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trFax" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">传真号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtFax" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrFax" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtFax" runat="server" ErrorMessage="传真号码不能为空" SetFocusOnError="false" ControlToValidate="TxtFax" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trMobile" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">手机号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrMobile" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtMobile" runat="server" ErrorMessage="手机号码不能为空" SetFocusOnError="false" ControlToValidate="TxtMobile" Display="Dynamic" ForeColor="Red" />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtMobile" ErrorMessage="请输入正确的手机号码" ValidationExpression="^1(?:3|5|8)\d{9}$" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trPHS" runat="server">
                                                    <td colspan="2" class="tdbgleft">

                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">小灵通号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtPHS" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrPHS" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtPHS" runat="server" ErrorMessage="小灵通号码不能为空" SetFocusOnError="false" ControlToValidate="TxtPHS" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trAddress" runat="server">
                                                    <td class="tdbgleft" colspan="2">

                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">联系地址：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrAddress" runat="server"></asp:Literal>
                                                                <asp:RequiredFieldValidator ID="ReqTxtAddress" runat="server" ErrorMessage="联系地址不能为空" SetFocusOnError="false"
                                                                    ControlToValidate="TxtAddress" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trZipCode" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">邮政编码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtZipCode" runat="server" MaxLength="6" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrZipCode" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtZipCode" runat="server" ErrorMessage="邮政编码不能为空" SetFocusOnError="false" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtZipCode" />
                                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="请输入正确的邮政编码" ControlToValidate="TxtZipCode" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trTrueName" runat="server">
                                                    <td class="tdbgleft" colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">真实姓名：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtTrueName" runat="server" CssClass="form-control" />
                                                                <asp:Literal ID="musttrTrueName" runat="server"></asp:Literal>
                                                                <asp:RequiredFieldValidator ID="ReqTxtTrueName" runat="server" ControlToValidate="TxtTrueName"
                                                                    ErrorMessage="真实姓名不能为空" SetFocusOnError="false" Display="Dynamic" ForeColor="Red" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trIDCard" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">身份证号码：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtIDCard" runat="server" CssClass="form-control" onblur="Checkyes()"></asp:TextBox>
                                                                <asp:Literal ID="musttrIDCard" runat="server"></asp:Literal>
                                                                <br />
                                                                <label runat="server" id="checkcard" style="color: red;"></label>
                                                                必须18位且未在本系统注册过，不足18位请以X替代
                              <asp:RequiredFieldValidator ID="ReqTxtIDCard" runat="server" Display="None" ErrorMessage="身份证号码不能为空" SetFocusOnError="false" ControlToValidate="TxtIDCard"></asp:RequiredFieldValidator>
                                                                <div style="display: none;">
                                                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="(^\d{15}$)|(^\d{17}([0-9]|X)$)" ControlToValidate="TxtIDCard" ErrorMessage="请输入正确格式"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trUserFace" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">头像地址：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtUserFace" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrUserFace" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtUserFace" runat="server" Display="None" ErrorMessage="头像地址不能为空" SetFocusOnError="false" ControlToValidate="TxtUserFace"></asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr id="trProvince" runat="server">
                                                    <td class="tdbgleft" colspan="2">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">省市县：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <select runat="server" id="selprovince" onchange="javascript:area()"></select>
                                                                <select runat="server" id="selcity" onchange="area2();"></select>
                                                                <select runat="server" id="selcoutry"></select>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trFaceWidth" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">头像宽度：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtFaceWidth" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrFaceWidth" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TxtFaceWidth" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="只能为数字" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                                                                <asp:RequiredFieldValidator ID="ReqTxtFaceWidth" runat="server" Display="None" ErrorMessage="头像宽度不能为空" SetFocusOnError="false" ControlToValidate="TxtFaceWidth"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>


                                                    </td>
                                                </tr>
                                                <tr id="trFaceHeight" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">头像高度：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtFaceHeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrFaceHeight" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="TxtFaceHeight" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="只能为数字" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                                                                <asp:RequiredFieldValidator ID="ReqTxtFaceHeight" runat="server" Display="None" ErrorMessage="头像高度不能为空" SetFocusOnError="false" ControlToValidate="TxtFaceHeight"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </td>

                                                </tr>
                                                <tr id="trSign" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">签名档：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:TextBox ID="TxtSign" runat="server" TextMode="MultiLine" Height="60" CssClass="form-control"></asp:TextBox>
                                                                <asp:Literal ID="musttrSign" runat="server"></asp:Literal>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="ReqTxtSign" runat="server" Display="None" ErrorMessage="签名档不能为空" SetFocusOnError="false" ControlToValidate="TxtSign"></asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trPrivacy" runat="server">
                                                    <td colspan="2" class="tdbgleft">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 col-lg-2 col-md-2 col-xs-12 text-right padding0">隐私设定：</label>
                                                            <div class="col-sm-6 col-lg-6 col-md-6 col-xs-12 text-left">
                                                                <asp:DropDownList ID="DropPrivacy" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Text="公开信息" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="只对好友公开" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="完全保密" Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Literal ID="musttrPrivacy" runat="server"></asp:Literal>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </asp:Panel>
            </div>

            <asp:Panel ID="PnlStep3" runat="server" Visible="false" Width="100%">
                <div class="reg">
                    <h1 class="text-center"><span class="glyphicon glyphicon-user" style="font-size: 2em; margin-right: 10px; color: #00CCFF;"></span><span style="margin-left: 10px;">会员帐号信息</span></h1>
                    <%--<h2>第三步：注册结果<img src="/App_Themes/UserThem/images/regl3.gif" alt="" /></h2>--%>
                    <ul id="userinfo" class="list-unstyled">
                        <li>
                            <asp:Literal ID="LitRegResult" runat="server"></asp:Literal>
                        </li>
                        <li>您的会员名：<span><%= Get(0) %></span></li>
                        <li>您的密码是：<span><%= Get(2) %></span></li>
                        <li>注册邮箱是：<span><%= Get(1) %></span></li>
                        <li>请您妥善保存您的信息，如忘记密码在<a href="/User/GetPassword.aspx" target="_blank">密码找回页</a>凭邮箱找回。</li>
                    </ul>
                </div>
                <div class="reg_title"></div>
            </asp:Panel>
            <div></div>

        </div>
        <asp:HiddenField ID="hfReturnUrl" runat="server" />
        <style type="text/css">
            .d_ok {color:green;}
            .d_err {color:red;}
        </style>
    </form>
    <%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>
</body>
</html>
