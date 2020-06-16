<%@ page language="C#" autoeventwireup="true" inherits="Manage_Content_SohuChatManage, App_Web_zxhe1krl" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>畅言评论管理</title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<link type="text/css" href="../../dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function disDiv(v) {
        switch (v) {
            case 1:
                $("#configDiv").show();
                $("#onlineDiv").hide();
                $("#regHref").show();
                $("#configHref").hide();
                break;
            case 2:
                $("#configDiv").hide();
                $("#onlineDiv").show();
                $("#regHref").hide();
                $("#configHref").show();
        }
    }
    function setRadio(v)
    {
        $(":radio[name='codeRadio'][value='" + v + "']").attr("checked",true);
    }
</script>
</head>
<body>
<form id="form1" runat="server">
    <div id="nav_box"><div class="r_navigation">
            <%=lang.LF("后台管理")%> &gt;&gt; <span><a href="CommentManage.aspx">评论管理</a></span> &gt;&gt; <span>畅言评论管理<a href="javascript:disDiv(1);void(0);" style="color: green; margin-left: 5px; font-size: 13px;" id="configHref">[修改配置]</a> 
                <a href="javascript:disDiv(2);void(0);" id="regHref" style="color: green; margin-left: 5px; font-size: 13px;display:none;">[注册管理畅言]</a>
                                                                                                                         </span>
        </div></div>
    <div style="clear:both;height:30px;" ></div>
    <div id="main">
    <div id="onlineDiv">
        <iframe src="http://changyan.sohu.com/login" style="width: 98%; height: 960px;" frameborder="0"></iframe>
    </div>
    <div id="configDiv" style="display:none;">
        <div class="panel panel-primary" style="width:50%;float:left; margin-left:20px;" id="addDiv">
            <div class="panel-heading"><h3 class="panel-title">畅言配置</h3></div>
            <div class="panel-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <td style="width: 80px; line-height:35px;" >APP_ID：</td>
                            <td><asp:TextBox runat="server" ID="chat_AppIDT" class="form-control"/></td>
                        </tr>
                        <tr>
                            <td style="width: 80px;line-height:35px;" >APP_Key：</td>
                            <td><asp:TextBox runat="server" ID="chat_AppKeyT" class="form-control" /></td>
                        </tr>
                         <tr>
                            <td style="width: 80px;line-height:35px;" >前台代码：</td>
                            <td><span style="position:relative;bottom:-8px;">
                                <input type="radio" name="codeRadio" value="1" title="可能有兼容问题,建议先测试" id="radio0" checked="checked"/><label for="label0">高速版</label> 
                                <input type="radio" name="codeRadio" value="2" title="加载速度慢于高速版" id="radion1" /><label for="radion1">兼容版</label>
                            </span></td>
                        </tr>
                        <tr><td style="line-height:35px;">操作：</td>
                            <td>
                                <asp:Button runat="server" CssClass="btn btn-primary" ID="Button1" Text="保存" OnClick="saveBtn_Click" />
                                <input type="button" class="btn btn-primary" id="Button2" value="返回" onclick="disDiv(2);"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="panel panel-primary pull-left" style="width:45%; margin-left:20px;">
            <div class="panel-heading"><h3 class="panel-title">前台输出（拷贝下方代码到模板中即可<span class="glyphicon glyphicon-arrow-down"></span>）：</h3></div>
            <div class="panel-body">
                <asp:TextBox runat="server" CssClass="thumbnail" ID="frontJS" TextMode="MultiLine" Width="100%" Height="300" Enabled="false"/>
            </div>
        </div>
    </div>
    </div>
</form>
</body>
</html>
