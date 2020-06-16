<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Default, App_Web_wp4exovk" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>会员中心</title>
    <style>
	.user_div{ min-height:400px;}
	</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<script type="text/javascript">
$().ready(function(e) {
	if(<%Call.Label("{ZL.Label id=\"抽取登录会员的用户组ID\" /}"); %> < 11) 
		window.location='/User/Info/UserInfo.aspx';
	else{
		$(".user_div").show();	
	}
});
</script>
	<ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/">首页</a></li> 
        <li><a href="/User/">小铺中心</a></li> 
    </ol>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 padding0 user_div" style="display:none;">
    	<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div style="background:#669933; border-radius:6px;" class="user_base">
                <a href="/User/Content/MyContent.aspx?NodeID=71">家政服务</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div style="background:#27a9e3; border-radius:6px;" class="user_base">
                <a href="/User/Content/MyContent.aspx?NodeID=72">创业项目</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div style="background:#c47f3e; border-radius:6px;" class="user_base">
                <a href="/User/Content/MyContent.aspx?NodeID=73">就业岗位</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div style="background:#28b779; border-radius:6px;" class="user_base">
                <a href="/User/Content/MyContent.aspx?NodeID=74">生活咨询</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="text-center">
                <a href="PreViewOrder1.aspx?menu=Orderinfo" class="btn btn-lg btn-info">我的订单</a>
            </div>
        </div>
         <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="text-center">
                <a href="/User/Content/MyContent.aspx" class="btn btn-lg btn-success">信息维护</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 hidden">
            <div style="background:#28b779" class="user_base">
                <a href="MySubscription.aspx">订阅管理</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 hidden">
            <div style="background:#a43ae3" class="user_base">
                <a href="Info/Listprofit.aspx">财务管理</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 hidden">
            <div style="background:#c47f3e" class="user_base">
                <a href="Info/UserInfo.aspx">我的信息</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 hidden">
            <div style="background:#f05033;" class="user_base">
                <a href="UserShop/">我的店铺</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 hidden">
            <div style="background:#669933;">
                <a href="/User/Content/MyContent.aspx?NodeID=69" class="btn btn-primary">内容管理</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 hidden">
            <div style="background:#990066 " class="user_base">
                <a href="Info/DredgeVip.aspx">商城管理</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12 hidden">
            <div style="background:#9999FF " class="user_base">
                <a href="Pages/Default.aspx">黄页管理</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#22afc2" class="user_base">
                <a href="Message/Message.aspx">我的短信</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#f874a4" class="user_base">
                <a href="/Space/SpaceManage.aspx">个人聚合</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#004b9b" class="user_base">
                <a href="CashCoupon/ArriveManage.aspx">抵用券</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#CC3366" class="user_base">
                <a href="Info/DredgeVip.aspx">VIP卡</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#6633FF" class="user_base">
                <a href="UserZone/Default.aspx">社区互动</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#27a9e3" class="user_base">
                <a href="PrintServer/ImageList.aspx">FLEX涂鸦</a> 
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
            <div class="text-center">
                <a href="iServer/FiServer.aspx" class="btn btn-lg btn-warning">有问必答</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#990000" class="user_base">
                <a href="PrintServer/Project/ProjectList.aspx">项目管理</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#999999" class="user_base">
                <a href="Survey/SurveyAll.aspx">问卷投票</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#6699CC" class="user_base">
                <a href="/Try/Default.aspx" target="_blank">在线试戴</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#852b99" class="user_base">
                <a href="/Plugins/Domain/Domname.aspx?Page=7" target="_blank">IDC管理</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#1FA67A" class="user_base">
                <a href="/Mis/" target="_blank">MIS管理系统</a>
            </div>
        </div>
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#E48632" class="user_base">
                <a href="/Mis/OA/" target="_blank">OA办公系统</a>
            </div>
        </div>
         <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 hidden">
            <div style="background:#22afc2" class="user_base">
                <a href="UserFunc/Watermark/" target="_blank">授权证书生成</a>
            </div>
        </div>
    </div>
</asp:Content>