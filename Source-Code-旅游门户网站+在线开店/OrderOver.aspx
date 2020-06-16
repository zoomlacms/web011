<%@ page language="C#" autoeventwireup="true" inherits="OrderOver, App_Web_1s3tbu0c" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head>
<title>完成订单提交</title>
<meta http-equiv="Content-Type " content="text/html; charset=utf-8 " />
<link href="../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/Template/Travel/style/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/dist/css/bootstrap.min.js"></script>
<style>
.top{ background:#fff;}
#home_nav .navbar-nav li a{ line-height:44px; }
#num5{ marg in-top:10px;}
.cart_lei{ background:#34A150;}
.home_footer{ position:absolute; bottom:0; width:100%;}
</style>
</head>
<body>
<%Call.Label("{ZL.Label id=\"全站头部\" /}"); %>
<form id="form1" runat="server">
<div id="main" class="rg_inout">
<asp:HiddenField ID="hfResult" runat="server" Value="" />
    <h1>第三步:完成订单提交&nbsp;<img alt="" src="/user/images/regl3.gif" /></h1>
    <div class="cart_lei"></div>
    <div class="rg_ok">
      <asp:Label ID="Label1" runat="server" BorderWidth="0px" ForeColor="Red"></asp:Label><br/>
      <asp:Button ID="Button1" CssClass="i_bottom" runat="server" Text="在线支付" OnClick="Button1_Click" />
      <asp:Button ID="UserPurseBTN" CssClass="i_bottom"  runat="server" Text="余额支付" OnClick="UserPurseBTN_Click" />
      <asp:Button ID="SiverCoin" CssClass="i_bottom"  runat="server" Text="银币支付" onclick="SiverCoin_Click" />
      <asp:Button ID="Button3" CssClass="i_bottom"  runat="server" Visible="false" Text="PayPal支付" OnClick="Button3_Click" />
      <asp:Button ID="Button2" CssClass="i_bottom"  runat="server" OnClientClick="location.href='/';return false;" Text="返回首页" />
    </div>
</div>
<div id="bottom" style="display:none;">
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
<%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>
</body>
</html>
<script type="text/javascript">
//导航手机列表向上定时滚动
$(function(){ 
var $this = $(".renav"); 
var scrollTimer; 
$this.hover(function(){ 
clearInterval(scrollTimer); 
},function(){ 
scrollTimer = setInterval(function(){ 
scrollNews( $this ); 
}, 2000 ); 
}).trigger("mouseout"); 
}); 
function scrollNews(obj){ 
var $self = obj.find("ul:first"); 
var lineHeight = $self.find("li:first").height(); 
$self.animate({ "margin-top" : -lineHeight +"px" },300 , function(){ 
$self.css({"margin-top":"0px"}).find("li:first").appendTo($self); 
}) 
}
</script>