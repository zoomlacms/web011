<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="manage_Template_DownTemplate, App_Web_fqozjdfd" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>下载方案</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<link href="../../Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
<link href="../../dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../../Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
<script src="../../dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
            $(".lightbox").lightbox({
                fitToScreen: true,
                imageClickClose: false
            });
        });
         var wida = 0;
         //function getover() {
         //    setwidth();
         //}
         //function setwidth() {
         //    document.getElementById("starttxt").innerHTML = "<font color=green><b>恭喜！下载完毕!</b></font>";
         //}
         //function clickdown() {
         //    document.getElementById("downimg").style.display = "";
         //    document.getElementById("Button1").value = "正在下载方案...请稍候!";
         //    //document.getElementById("Button1").disabled = true; 
         //}
        var interval;
        var actionArr = "getTempP";//下载模板
        function PostToCS(a, v) {
            $.ajax({
                type: "Post",
                url: "DownTemplate.aspx",
                data: { action: a, value: v },
                success: function (data) {
                    $("#downTempDiv").css("width", data + "%");
                    $("#downTempSpan").text(data + "%");
                    if (data == 100) {
                        clearInterval(interval);
                        $("#DownTips").show();
                    }
                },
                error: function (data) {
                }
            });
        }
        //调用其开始循环获取
        function beginCheck(request) { interval = setInterval(function () { PostToCS(request, '') }, 1000); }
        //完成,可以开始安装
        //跳转
        function jump()
        {
            window.location.href = "<%= customPath2%>I/Config/SiteOption.aspx?prodirName=<%=prodirName%>";
        }
</script>
   	<style type="text/css">
	#gallery {
		padding: 10px;
		width: 100%;
	}
	#gallery ul { list-style: none; }
	#gallery ul li { display: inline; }
	#gallery ul img {
		border: 5px solid #3e3e3e;
		border-width: 5px 5px 20px;
	}
	#gallery ul a:hover img {
		border: 5px solid #fff;
		border-width: 5px 5px 20px;
		color: #fff;
	}
	#gallery ul a:hover { color: #fff; }
	</style>
</head>
<body>
<form id="form1" runat="server">    
<div class="r_navigation">后台管理&gt;&gt;系统设置 &gt;&gt;<a href="TemplateSet.aspx">方案管理</a>&gt;&gt;<span> 下载方案</div>
<asp:HiddenField ID="hfIsExist" runat="server" />
<table style="width: 100%; margin: 0 auto;" cellpadding="2" cellspacing="1" class="border">
    <tr align="center" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td colspan="2" class="spacingtitle">
            <asp:Label ID="LblTitle" runat="server" Text="下载方案" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="Panel1" runat="server">[<asp:Literal ID="tempname" runat="server"></asp:Literal>]模版下载中请耐心等待片刻…
                <br />                    
                <div id="gallery">
                    <div class="pull-left"><asp:Literal ID="tempimg" runat="server"></asp:Literal></div>
                    <div id="DownTips" class="bs-example pull-left" style="width:50%; display:none;">
                        <div class="alert alert-success fade in">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4>恭喜！模版下载完成</h4>
                            <p>是否立即前往网站参数配置页面进行设置</p>
                            <p>
                                <button type="button" onclick="jump()" class="btn btn-info">前往设置</button>
                                <asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Text="返回" OnClick="Button2_Click" />
                            </p>
                        </div>
                    </div><!-- /example -->
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server">
                <asp:Literal ID="installstart" runat="server"></asp:Literal>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td >
            <div id="downimg" style="margin-top:20px;width:50%;">
                <div class="progress progress-striped active">
                    <div id="downTempDiv" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                        <span id="downTempSpan" class="sr-only" style="position:relative;"></span>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
</form>
</body>
</html>