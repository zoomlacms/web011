<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_BackupRestore, App_Web_gsi5yeuj" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>备份与还原数据</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <uc1:SPwd runat="server" ID="SPwd" Visible="false" />
    <div runat="server" id="maindiv" visible="false">
        <asp:HiddenField ID="HdnPath" runat="server" />
        <div class="Creat_tips" runat="server" id="Creat">
            <div class="alert alert-success fade in" style="margin-bottom: 10px;">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4>提示!</h4>
                <p style="padding-left: 50px; line-height: 40px;">
                    <strong>
                        <span class='glyphicon glyphicon-warning-sign' style='color: #f00; font-size: 18px;'></span>
                        <asp:Label ID="Label1" runat="server" Text="目前没有备份！"></asp:Label>
                    </strong>
                </p>
            </div>
        </div>
        <table class="table table-striped table-bordered table-hover">
            <asp:Repeater ID="RptFiles" runat="server" OnItemCommand="RptFiles_ItemCommand">
                <HeaderTemplate>
                    <tr class="gridtitle" id="table_head" align="center" style="height: 24px">
                        <td>文件名
                        </td>
                        <td style="width: 15%">大小 
                        </td>
                        <td style="width: 20%">创建时间
                        </td>
                        <td style="width: 25%">操作
                        </td>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td align="left">
                            <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<img src='/App_Themes/AdminDefaultTheme/Images/Folder/mfolderclosed.gif'>" : GetShowExtension(Eval("content_type").ToString())%>
                            <% if ((Request.QueryString["Type"] == "video") || (Request.QueryString["Type"] == "music"))
                               { %>
                            <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<a href='CloudManage.aspx?Type="+Request["Type"]+"&Dir=" + Server.UrlEncode(GetPath()) + "'>" + 
Eval("Name").ToString() + "</a>" : "<a href='javascript:open(\""+GetPath()+"\");'>" + Eval("Name").ToString() + "</a>"%>
                            <%}
                               else
                               { %>
                            <%# (Eval("content_type").ToString() == "jpg" || Eval

("content_type").ToString() == "png" || Eval("content_type").ToString() == "gif" || Eval

("content_type").ToString() == "bmp") ? "<a href='javascript:open(\"" + GetPath() + "\");'>" + 

Eval("Name").ToString() + "</a>" : System.Convert.ToInt32(Eval("type")) == 1 ? "<a href='CloudManage.aspx?Type=" + Request["Type"] + "&Dir=" + Server.UrlEncode(GetPath()) + "'>" + 
Eval("Name").ToString() + "</a>" :  Eval("Name").ToString() %>
                            <%} %>
                        </td>
                        <td align="center">
                            <%# GetSize(Eval("size").ToString())%>
                        </td>
                        <td align="center">
                            <%# Eval("createTime")%>
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton1" CommandName='Down'
                                CommandArgument='<%# Eval("Name")%>' OnClientClick="if(!this.disabled) return confirm('是否继续下载？');" runat="server">[下载]</asp:LinkButton>

                            [<asp:LinkButton ID="LbtnDelList" CommandName='<%# 
System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>'
                                CommandArgument='<%# Eval("Name")%>' OnClientClick="if(!this.disabled) return confirm('确定要删除吗？');" runat="server">删除</asp:LinkButton>]
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <div class="spacingtitle">数据库备份</div>
        <table class="table table-striped table-bordered table-hover">
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">数据库的保存名字：
                </td>
                <td>
                    <div class="input-group" style="width: 300px; float: left;">
                        <input runat="server" id="DatabasePath" class="form-control" />
                        <asp:Label runat="server" class="input-group-addon">.bak</asp:Label>
                    </div>
                    <span style="float: left; margin-top: 0.3em;"> <asp:CheckBox ID="chBackup" runat="server"  /><label for="chBackup" style="font-weight:normal">备份在根目录(默认为temp目录)。</label> </span>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">数据库操作：
                </td>
                <td>
                    <asp:Button ID="Backup" runat="server" Text="备份数据库" class="btn btn-primary" OnClick="Backup_Click" />
                    <asp:Button ID="Restore" runat="server" Text="还原数据库" class="btn btn-primary" OnClick="Restore_Click" />
                </td>
            </tr>
        </table>
        <div class="spacingtitle">全站备份</div>
        <table class="table table-striped table-bordered table-hover">
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">备份名：
                </td>
                <td>
                    <div class="input-group" style="width: 300px; float: left;">
                        <input runat="server" id="SiteText" class="form-control" />
                        <asp:Label runat="server" class="input-group-addon">.rar</asp:Label>
                    </div>
                    <asp:CheckBox runat="server" ID="AllSite_Chk" Style="margin-left: 5px;" /><label for="AllSite_Chk" style="font-weight:normal">全站目录模式</label><span style="margin: 0.3em;">(勾选则包含Temp目录下文件)</span>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">操作：
                </td>
                <td>
                    <asp:Button ID="SiteBackup" runat="server" Text="开始备份" class="btn btn-primary" OnClick="SiteBackup_Click"
                        OnClientClick="if(confirm('要备份全站文件吗?')){setTimeout(function () { document.getElementById('SiteBackup').disabled = true;},50)}else{return false;}" />
                </td>
            </tr>
        </table>
        <div id="progressbar" style="width: 50%; display: none;">
            <div class="progress-label">压缩进度</div>
        </div>
        <div style="color: #f00; line-height: 25px; padding-left: 20px;">
            <asp:Label ID="runResult" runat="server" Visible="false" Text="还原数据库需如下操作：<br />1.断开数据库连接，因数据库有可能正在运行；<br />2.选择还原数据源；<br />3.删除数据库绑定的专属用户；<br />4.重新绑定用户。<br />* *如有问题可联系管理员进行还原。**"></asp:Label>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link type="text/css" href="/Plugins/JqueryUI/ProgressBar/css/jquery.ui.theme.css" rel="stylesheet" />
<link type="text/css" href="/Plugins/JqueryUI/ProgressBar/css/jquery.ui.progressbar.css" rel="stylesheet" />
<script type="text/javascript" src="/js/Common.js"></script>
<script type="text/javascript" src="/Plugins/JqueryUI/ProgressBar/js/jquery-ui.custom.js"></script>
<style type="text/css">
.ui-progressbar {position: relative;top:50%;}
.progress-label {position: absolute;left: 50%;top: 4px;font-weight: bold;text-shadow: 1px 1px 0 #fff;}
</style>
<script>
    
$(function () {
	var progressbar = $("#progressbar"),
		progressLabel = $(".progress-label");

	progressbar.progressbar({//绑定进度条事件
		value: false,
		change: function () {
			progressLabel.text(progressbar.progressbar("value") + "%");
		},
		complete: function () {
			progressLabel.text("操作完成!");
		}
	});

	

	function progress() {
		var val = progressbar.progressbar("value") || 0;
		progressbar.progressbar("value", val + 1);
	}
});
function increase(value) {//后台算出百分比，然后传值前台
	var progressbar = $("#progressbar")
	var val = progressbar.progressbar("value") || 0;
	progressbar.progressbar("value", value);
	//progressbar.progressbar("value", val + 1);//加1位
}
//实时获取进度,后台用异步或线程池
function ajaxPost(obj, a, val) {//this,actionName,要上传的值,回调方法,是否弹出回复窗(true显示,false不显示)
	$.ajax({
		type: "Post",
		url: "BackupRestore.aspx",
		data: { action: a, value: val },
		success: function (data) {
			if (a == "getProgress" && data == "100") {
				increase(parseInt(data));
				clearInterval(interval);
				location = location;
			}
			else {
				increase(parseInt(data));//必须要转换次，否则返回的字符串变量无用为0%
			}
		},
		error: function (data) {
		}
	});
}
var interval;
function beginCheck(request) {
	setTimeout(function () { document.getElementById('SiteBackup').disabled = true; }, 50);
	$("#progressbar").show();
	interval = setInterval(function () { ajaxPost(this, request, '') }, 1000);
}//实时获取后台进度
</script>
</asp:Content>