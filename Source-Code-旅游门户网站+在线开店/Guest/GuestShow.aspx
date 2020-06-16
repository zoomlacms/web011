<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="BBS_GuestShow, App_Web_us1oeujg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>阅读留言-<%Call.Label("{$SiteName/}"); %>留言</title>
<link href="../../App_Themes/UserThem/style.css"rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script src="../../Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../../JS/jquery.js" type="text/javascript"></script> 
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
<script>
function CheckDirty() {
	//var oEditor = CKEDITOR.instances.TxtContents;
	var value = Date.now;
	var TxtValidateCode = document.getElementById("TxtValidateCode").value;

	if (value == "" || TxtValidateCode == "") {
		if (value == "") {
			var obj2 = document.getElementById("sp2");
			obj2.innerHTML = "<font color='red'>回复内容不能为空！</font>";
		}
		else {
			var obj2 = document.getElementById("sp2");
			obj2.innerHTML = "";
		}
		if (TxtValidateCode == "") {
			var obj3 = document.getElementById("sp1");
			obj3.innerHTML = "<font color='red'>验证码不能为空！</font>";
		} else {
			var obj3 = document.getElementById("sp1");
			obj3.innerHTML = "";
		}
		return false;
	}
	else {
		var obj = document.getElementById("sp2");
		obj.innerHTML = "";
		var obj3 = document.getElementById("sp1");
		obj3.innerHTML = "";
		return true;
	}
}
</script>
<style>
#divshap{ position:absolute; width:100%; height:100%; background:#ccc;  filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity:0.5;margin:0 auto;text-align:center; line-height:200px;z-index:999px;}
#divshap strong{ z-index:2; font-size:14px; color:#f00;}
.tdbg{ padding-left:5px;}
</style>
</head>
<body>
<div id="Tab"><ul><li><a href="Baike/Default.aspx" >百科</a></li><li  class="hover"><a href="Default.aspx">留言</a></li><li><a href="Ask/Default.aspx">问答</a></li><li><a href="/index" >贴吧</a></li></ul><div class="clear"></div></div>

<form id="form1" runat="server">
        <div class="topnav" id="toptab"> 
		<div class="topright"> 
			<a href="/">返回首页</a>
                <a href="javascript:void(0)" onclick="SetHomepage()">设为首页</a>
                <a href="javascript:void(0)" onclick="addfavorite()">收藏本站</a></div> 
		<span  style="<%=getstyle()%>"> 您好！<a href="/user/" target="_blank"><asp:Label runat="server"  ID="user"></asp:Label></a> 欢迎来<%Call.Label("{$SiteName/}"); %>问答系统！ [<a href="<%=ResolveUrl("~/User/logout.aspx") %>?url=/Guest/Default.aspx">退出登录</a>]</span> 
 <span  style="<%=getstyles()%>">[<a  href="/user/Login.aspx?ReturnUrl=/guest/">请登录</a>] [<a  href="/user/register.aspx?ReturnUrl=/guest/">免费注册</a>]</span>
            </div>
           
    <div class="header">
        <div class="h_top">
            <div class="logo" >
                <a href="/guest/Message/" title="留言系统" target="_top"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>留言系统" /> </a>
            </div>
            <div class="clr"></div>
        </div>
        <div class="h_mid">
            <div class="h_mid_l"> </div>
<div id="tdh" class="h_mid_m">
<ul> 
<li class="on"><a href="Default.aspx" title="留言首页">留言首页</a></li>
<asp:Repeater ID="Repeater2" runat="server"><ItemTemplate> <li  > <%#GetDataItem()%>  </li> </ItemTemplate></asp:Repeater> 
</ul>
 
</div>
<div class="h_mid_r"></div>
</div>
</div>
<div class="content">
<div class="dh">您的位置：<a href="/">网站首页</a>>><a href="/guest/">留言中心</a>>>查看留言</span></div></div>
<div id="main">
 
  <div class="s_body">
    <div id="g_show">
      <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
          <h1><span>[发布者：<%# GetUserName(Eval("UserID","{0}")) %>]</span>留言标题：<%# Eval("Title")%></h1>
          <div class="g_show_txt"><%# Eval("TContent")%><span>发表日期：<%# Eval("GDate")%></span></div>
        </ItemTemplate>
      </asp:Repeater>
    </div>
    <div id="Pager1" runat="server"></div>
    <!--留言分页 -->
      <div id="g_send" class="rg_inout">
          <span id="banAnony" style="color: red; margin-left: 10px;" runat="server" visible="false">你好请先登录，再发布留言!<a href="/user/Login.aspx?ReturnUrl=/guest/" style="color: #133db6;">[点击登录]</a></span>
          <div id="replyDiv" runat="server">
              <h2>发表回复:</h2>
              <div id="g_send_edit">
                  <table width="98%" align="center">
                      <tr><td colspan="2"><textarea cols="80" id="TxtContents" width="580px" height="200px" name="TxtTContent" rows="10" runat="server"></textarea>
                              <span id="sp2"></span>
                              <%=Call.GetUEditor("TxtTContent") %>
                              <input type="hidden" id="txt_Config\" value="" />
                              <asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
                              <asp:HiddenField ID="HdnCateID" runat="server" />
                              <asp:HiddenField ID="HdnGID" runat="server" />
                          </td>
                      </tr>
                      <tr>
                          <td width="10%" align="right">验证码：</td>
                          <td align="left">
                              <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px"
                                  ToolTip="点击刷新验证码" Style="cursor: pointer; line-height: 23px; border: 0; vertical-align: middle;" onclick="this.src='../../Common/ValidateCode.aspx?t='+Math.random()" />
                              <asp:TextBox ID="TxtValidateCode" MaxLength="6" runat="server" Style="width: 70px; border: #CCC solid 1px; height: 20px; line-height: 23px;" autocomplete="off"></asp:TextBox>
                              <span id="sp1"></span></td>
                      </tr>
                      <tr>
                          <td colspan="2" align="center">
                              <asp:Button ID="Button1" CssClass="i_bottom" runat="server" Text="发表回复" OnClick="Button1_Click" OnClientClick="return CheckDirty()" Style="margin-top: 10px;" /></td>
                      </tr>
                  </table>

              </div>
</div><!--replyDiv end-->
</div>

</div>
<div id="bottom">
<a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
<p>
<script language="javascript" type="text/javascript"> 
<!-- 
var year="";
mydate=new Date();
myyear=mydate.getYear();
year=(myyear > 200) ? myyear : 1900 + myyear;
document.write(year); 
--> 
</script>&copy;&nbsp;Copyright&nbsp; <%Call.Label("{$SiteName/}"); %> All rights reserved.</p>
</div>
</form>
</body>
</html>