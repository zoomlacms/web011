<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Scence, App_Web_aayv3uag" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>场景切换</title>
<style type="text/css">
.checkDiv { width: 70px; height: 70px; background: red; background-color: #27a9e3; border-radius: 5px; text-align: center; line-height: 25px; font-size: 1em; float: left; margin: 0 5px 5px 0; cursor: pointer;}
.checkDiv:hover { background-color: #28b779;}
.checkDiv input { width: 30px; height: 30px;}
.headtip{padding:5px;margin-bottom:5px;}
</style>
<script type="text/javascript">
$().ready(function () {
	$(".checkDiv").click(function () {
		obj = $(this).find(":checkbox")[0];
		obj.checked = !obj.checked;
		if (!obj.checked) {//未选中则背景色改变
			$(this).css("background-color", "orange");
		}
		else
			$(this).css("background-color", "#27a9e3");
	});
	$(".checkDiv :checkbox").click(function () { $(this).parent().click(); });//取消默认单击事件
});
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="img">
<div id="oDIV1">
<form action="" method="get" name="form1">
<table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
<tr>
<td style="height: 422px" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td ><div class="alert alert-success headtip" role="alert">第一步：选择场景</div>&nbsp;
</td>
</tr>
<tr>
<td style="height: 24px">
<input name="Radio1" id="Allradio" type="radio" value="1" checked="checked" style="display: none" />
<input name="Radio1" id="Contentradio" type="radio" value="1" style="display: none" />
<input name="Radio1" id="Shopradio" type="radio" value="1" style="display: none" />
<input name="Radio1" id="Pageradio" type="radio" value="1" style="display: none" />
<input name="Radio1" id="Forumradio" type="radio" value="1" style="display: none" />
<input name="Radio1" id="OAradio" type="radio" value="1" style="display: none" />
<input name="Radio1" id="Configradio" type="radio" style="display: none" />
<input name="Radio1" id="Saferadio" type="radio" style="display: none" />
<table width="100%" border="0" cellspacing="10" cellpadding="0">
	<tr>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="AllIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/AllIco/Show0.png" onclick="SelectConfig(this.id)" title="全部显示" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">全部显示
					</td>
				</tr>
			</table>
		</td>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="ContentIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/ContentIco/Show1.png"
							onclick="SelectConfig(this.id)" title="内容管理" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">内容管理
					</td>
				</tr>
			</table>
		</td>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="ShopIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/ShopIco/Show1.png"
							onclick="SelectConfig(this.id)" title="商城管理" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">商城管理
					</td>
				</tr>
			</table>
		</td>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="PageIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/PageIco/Show1.png"
							onclick="SelectConfig(this.id)" title="企业黄页" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">企业黄页
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="ForumIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/ForumIco/Show1.png"
							onclick="SelectConfig(this.id)" title="教育模块" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">教育模块
					</td>
				</tr>
			</table>
		</td>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="OAIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/OAIco/Show1.png"
							onclick="SelectConfig(this.id)" title="智能办公" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">智能办公</td>
				</tr>
			</table>
		</td>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="ConfigIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/ConfigIco/Show1.png"
							onclick="SelectConfig(this.id)" title="配置场景" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">配置场景
					</td>
				</tr>
			</table>
		</td>
		<td align="center" valign="middle">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
				<tr>
					<td align="center" valign="middle">
						<img alt="" id="SafeIco" src="/App_Themes/AdminDefaultTheme/images/ControlPanel/SafeIco/Show1.png"
							onclick="SelectConfig(this.id)" title="安全维护" style="cursor: pointer" />
					</td>
				</tr>
				<tr>
					<td align="center" valign="middle" style="line-height: 30px">安全维护
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td style="height: 37px" align="center" valign="top">
<span style="display: none;">
<input id="noshow" name="noshow" type="checkbox" checked="checked" /><label for="noshow">以后不再显示</label>
</span>
<input id="Button0" type="button" value="下一步" class="btn btn-primary" onclick="Showtools(0);" />
</td>
</tr>
</table>
</form>
</div>
<div id="oDIV2" style="height: 500px; display: none; width: 100%;">
<form action="" method="get" name="form1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td style="height: 422px" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td><div class="alert alert-success headtip" role="alert">第二步：场景配置<span id="ScanName"></span></div>
	</td>
</tr>
<tr>
	<td style="height: 24px">
		<table style="width: 100%; display: none" id="AllTable">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold;">&nbsp;内容管理</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
						<div class="checkDiv">我的工作台<input id="c1" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">内容管理<input id="c2" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户社区<input id="c3" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">扩展功能<input id="c4" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">系统配置<input id="c5" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;商城管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">我的工作台<input id="s1" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">商城管理<input id="s2" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户社区<input id="s3" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">扩展功能<input id="s4" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">系统配置<input id="s5" type="checkbox" checked="checked" /></div>
						<div class="checkDiv" style="display: none;">BI应用<input id="s6" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;企业黄页
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">我的工作台<input id="p1" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">企业黄页<input id="p2" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户社区<input id="p3" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">扩展功能<input id="p4" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">系统配置<input id="p5" type="checkbox" checked="checked" /></div>
						<div class="checkDiv" style="display: none;">BI应用<input id="p6" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;教育模块
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">我的工作台<input id="f1" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">扩展功能<input id="f2" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">教育模块<input id="f3" type="checkbox" checked="checked" /></div>
						<div class="checkDiv" style="display: none;">BI应用<input id="f4" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;智能办公
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">我的工作台<input id="o1" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户社区<input id="o2" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">企业办公<input id="o3" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;配置场景
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">用户社区<input id="d1" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">扩展功能<input id="d2" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">系统配置<input id="d3" type="checkbox" checked="checked" /></div>

					</td>
				</tr>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
			id="ContentShow">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;我的工作台
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">
						我的工作台
						<input id="cd1" type="checkbox" checked="checked" />
						</div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;内容管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">按栏目管理<input id="cn1" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">按专题管理<input id="cn2" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">生成发布<input id="cn3" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">评论管理<input id="cn4" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">互动模块1<input id="cn5" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">信息采集<input id="cn6" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">打印输出<input id="cn7" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-回收站-<input id="cn8" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">内容参数<input id="cn9" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">百科问答<input id="cn10" type="checkbox" checked="checked" /></div>
						<%-- <input id="cn1" name="cContent" type="checkbox" checked="checked" />按栏目管理信息
					<input id="cn2" name="cContent" type="checkbox" checked="checked" />按专题管理信息
					<input id="cn3" name="cContent" type="checkbox" checked="checked" />生成发布
					<input id="cn4" name="cContent" type="checkbox" checked="checked" />评论管理
					<input id="cn5" name="cContent" type="checkbox" checked="checked" />互动模块
					<input id="cn6" name="cContent" type="checkbox" checked="checked" />信息采集
					<input id="cn7" name="cContent" type="checkbox" checked="checked" />打印输出
					<input id="cn8" name="cContent" type="checkbox" checked="checked" />回收站<br />&nbsp;
					<input id="cn9" name="cContent" type="checkbox" checked="checked" />内容参数
					<input id="cn10" name="cContent" type="checkbox" checked="checked" />百科问答--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;用户管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">会员管理<input id="cu1" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">管理员管理<input id="cu2" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户角色<input id="cu3" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">信息发送<input id="cu4" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">订阅中心<input id="cu5" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">人才招聘<input id="cu6" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">社区模块<input id="cu7" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">微博管理<input id="cu8" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-3D地带-<input id="cu9" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">视频面试<input id="cu10" name="cUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">多人视频<input id="cu11" name="cUser" type="checkbox" checked="checked" /></div>
						<%--   <input id="cu1" name="cUser" type="checkbox" checked="checked" />会员管理
					<input id="cu2" name="cUser" type="checkbox" checked="checked" />管理员管理
					<input id="cu3" name="cUser" type="checkbox" checked="checked" />用户角色
					<input id="cu4" name="cUser" type="checkbox" checked="checked" />信息发送
					<input id="cu5" name="cUser" type="checkbox" checked="checked" />订阅中心
					<input id="cu6" name="cUser" type="checkbox" checked="checked" />人才招聘
					<input id="cu7" name="cUser" type="checkbox" checked="checked" />社区(SNS)模块
					<input id="cu8" name="cUser" type="checkbox" checked="checked" />微博管理
					<input id="cu9" name="cUser" type="checkbox" checked="checked" />-3D地带-<br />&nbsp;
					<input id="cu10" name="cUser" type="checkbox" checked="checked" />Nite视频面试管理
					<input id="cu11" name="cUser" type="checkbox" checked="checked" />多人视频管理--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;扩展功能<!--内容管理场景-->
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">广告管理<input id="ck1" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">访问统计<input id="ck2" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">日志管理<input id="ck3" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">日志管理<input id="ck4" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">问卷调查<input id="ck5" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">百科问答<input id="ck6" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">文件管理<input id="ck7" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">数据字典<input id="ck8" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他管理<input id="ck9" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">开发中心<input id="ck10" name="cPlub" type="checkbox" checked="checked" /></div>
						<%-- <input id="ck1" name="cPlub" type="checkbox" checked="checked" />广告管理
					<input id="ck2" name="cPlub" type="checkbox" checked="checked" />访问统计
					<input id="ck3" name="cPlub" type="checkbox" checked="checked" />日志管理
					<input id="ck4" name="cPlub" type="checkbox" checked="checked" />问卷调查和投票
					<input id="ck5" name="cPlub" type="checkbox" checked="checked" />百科问答
					<input id="ck6" name="cPlub" type="checkbox" checked="checked" />文件管理
					<input id="ck7" name="cPlub" type="checkbox" checked="checked" />数据字典
					<input id="ck8" name="cPlub" type="checkbox" checked="checked" />其他管理<br />&nbsp;
					<input id="ck9" name="cPlub" type="checkbox" checked="checked" />其他功能
					<input id="ck10" name="cPlub" type="checkbox" checked="checked" />开发中心--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;系统配置
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">网站配置<input id="cx1" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模型管理<input id="cx2" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">节点管理<input id="cx3" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">工作流配置<input id="cx4" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">流程管理<input id="cx5" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">专题管理<input id="cx6" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模板风格<input id="cx7" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">标签管理<input id="cx8" name="cSytem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">支付平台<input id="cx9" name="cSytem" type="checkbox" checked="checked" /></div>
						<%--  <input id="cx1" name="cSytem" type="checkbox" checked="checked" />网站配置
					<input id="cx2" name="cSytem" type="checkbox" checked="checked" />模型管理
					<input id="cx3" name="cSytem" type="checkbox" checked="checked" />节点管理
					<input id="cx4" name="cSytem" type="checkbox" checked="checked" />工作流配置
					<input id="cx5" name="cSytem" type="checkbox" checked="checked" />流程管理
					<input id="cx6" name="cSytem" type="checkbox" checked="checked" />专题管理
					<input id="cx7" name="cSytem" type="checkbox" checked="checked" />模板风格
					<input id="cx8" name="cSytem" type="checkbox" checked="checked" />标签管理
					<input id="cx9" name="cSytem" type="checkbox" checked="checked" />在线支付平台--%>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
			id="ShopShow">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;我的工作台
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
						 <div class="checkDiv">
							 我的工作台
							 <input id="sd1" type="checkbox" checked="checked" />
						</div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;商城管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					  <div class="checkDiv">
						  商品管理
						  <input id="ss1" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							库存管理
							<input id="ss3" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							订单管理
							<input id="ss4" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							明细记录
							<input id="ss5" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							销售统计
							<input id="ss6" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							促销优惠
							<input id="ss7" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							加盟商管理
							<input id="ss8" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							商城回收站
							<input id="ss9" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							商品管理
							<input id="ss10" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							商品管理
							<input id="ss11" name="Shop" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							商品管理
							<input id="ss12" name="Shop" type="checkbox" checked="checked" />
						</div>
						<%--<input id="ss1" name="Shop" type="checkbox" checked="checked" />商品管理
					<input id="ss2" name="Shop" type="checkbox" checked="checked" />库存管理
					<input id="ss3" name="Shop" type="checkbox" checked="checked" />订单管理
					<input id="ss5" name="Shop" type="checkbox" checked="checked" />明细记录
					<input id="ss6" name="Shop" type="checkbox" checked="checked" />销售统计
					<input id="ss7" name="Shop" type="checkbox" checked="checked" />促销优惠
					<input id="ss9" name="Shop" type="checkbox" checked="checked" />加盟商管理<br />
					&nbsp;&nbsp;<input id="ss10" name="Shop" type="checkbox" checked="checked" />商城回收站
					<input id="ss11" name="Shop" type="checkbox" checked="checked" />店铺管理
					<input id="ss12" name="Shop" type="checkbox" checked="checked" />礼品管理
					<input id="ss13" name="Shop" type="checkbox" checked="checked" />竞拍管理
					<input id="ss14" name="Shop" type="checkbox" checked="checked" />推广返利--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;用户管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					   <div class="checkDiv">会员管理<input id="su1" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">管理员管理<input id="su2" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户角色<input id="su3" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">信息发送<input id="su4" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">订阅中心<input id="su5" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">人才招聘<input id="su6" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">社区模块<input id="su7" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">视频面试<input id="su8" name="sUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">多人视频<input id="su9" name="sUser" type="checkbox" checked="checked" /></div>
						<%--<input id="su1" name="sUser" type="checkboxsu3 checked="checked" />会员管理
					<input id="su2" name="sUser" type="checkbox" checked="checked" />管理员管理
					<input id="su3" name="sUser" type="checkbox" checked="checked" />用户角色
					<input id="su4" name="sUser" type="checkbox" checked="checked" />信息发送
					<input id="su5" name="sUser" type="checkbox" checked="checked" />订阅中心
					<input id="su6" name="sUser" type="checkbox" checked="checked" />人才招聘
					<input id="su7" name="sUser" type="checkbox" checked="checked" />社区(SNS)模块
					<input id="su8" name="sUser" type="checkbox" checked="checked" />微博管理
					<input id="su9" name="sUser" type="checkbox" checked="checked" />-3D地带-<br />&nbsp;&nbsp;
					<input id="su10" name="sUser" type="checkbox" checked="checked" />Nite视频面试管理
					<input id="su11" name="sUser" type="checkbox" checked="checked" />多人视频管理--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;扩展功能
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					  <div class="checkDiv">广告管理<input id="sk1" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">访问统计<input id="sk2" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">日志管理<input id="sk3" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">问卷调查<input id="sk4" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">百科问答<input id="sk5" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">文件管理<input id="sk6" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">数据字典<input id="sk7" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他管理<input id="sk8" name="sPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他功能<input id="sk9" name="sPlub" type="checkbox" checked="checked" /></div>
						<%--<input id="sk1" name="sPlub" type="checkbox" checked="checked" />广告管理
					<input id="sk2" name="sPlub" type="checkbox" checked="checked" />访问统计
					<input id="sk3" name="sPlub" type="checkbox" checked="checked" />日志管理
					<input id="sk4" name="sPlub" type="checkbox" checked="checked" />问卷调查和投票
					<input id="sk5" name="sPlub" type="checkbox" checked="checked" />百科问答
					<input id="sk6" name="sPlub" type="checkbox" checked="checked" />文件管理
					<input id="sk7" name="sPlub" type="checkbox" checked="checked" />数据字典
					<input id="sk8" name="sPlub" type="checkbox" checked="checked" />其他管理<br />
					<input id="sk9" name="sPlub" type="checkbox" checked="checked" />其他功能--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;系统配置
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">网站配置<input id="sx1" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模型管理<input id="sx2" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">节点管理<input id="sx3" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">工作流配置<input id="sx4" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">流程管理<input id="sx5" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">专题管理<input id="sx6" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模板风格<input id="sx7" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">标签管理<input id="sx8" name="sSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">支付平台<input id="sx9" name="sSystem" type="checkbox" checked="checked" /></div>
						<%--  <input id="sx1" name="sSystem" type="checkbox" checked="checked" />网站配置
					<input id="sx2" name="sSystem" type="checkbox" checked="checked" />模型管理
					<input id="sx3" name="sSystem" type="checkbox" checked="checked" />节点管理
					<input id="sx4" name="sSystem" type="checkbox" checked="checked" />工作流配置
					<input id="sx5" name="sSystem" type="checkbox" checked="checked" />流程管理
					<input id="sx6" name="sSystem" type="checkbox" checked="checked" />专题管理
					<input id="sx7" name="sSystem" type="checkbox" checked="checked" />模板风格
					<input id="sx8" name="sSystem" type="checkbox" checked="checked" />标签管理
					<input id="sx9" name="sSystem" type="checkbox" checked="checked" />在线支付平台管理--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;BI应用
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">项目管理<input id="sbi1" name="sBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">项目管理<input id="sbi2" name="sBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">项目管理<input id="sbi3" name="sBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">项目管理<input id="sbi4" name="sBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">项目管理<input id="sbi5" name="sBI" type="checkbox" checked="checked" /></div>
						<%-- <input id="sbi1" name="sBI" type="checkbox" checked="checked" />项目管理
					<input id="sbi2" name="sBI" type="checkbox" checked="checked" />CRM管理
					<input id="sbi3" name="sBI" type="checkbox" checked="checked" />有问必答
					<input id="sbi5" name="sBI" type="checkbox" checked="checked" />客服通
					<input id="sbi6" name="sBI" type="checkbox" checked="checked" />工作统计--%>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
			id="PageShow">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;我的工作台
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<input id="pd1" type="checkbox" checked="checked" />我的工作台
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;企业黄页
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">黄页申请<input id="pp1" name="pPage" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">黄页审核<input id="pp2" name="pPage" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户栏目<input id="pp3" name="pPage" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">内容管理<input id="pp4" name="pPage" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模型管理<input id="pp5" name="pPage" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">样式管理<input id="pp6" name="pPage" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">风格管理<input id="pp7" name="pPage" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">标签管理<input id="pp8" name="pPage" type="checkbox" checked="checked" /></div>
						<%--  <input id="pp1" name="pPage" type="checkbox" checked="checked" />黄页申请设置
					<input id="pp2" name="pPage" type="checkbox" checked="checked" />黄页审核与管理
					<input id="pp3" name="pPage" type="checkbox" checked="checked" />黄页用户栏目管理
					<input id="pp4" name="pPage" type="checkbox" checked="checked" />黄页内容管理
					<input id="pp5" name="pPage" type="checkbox" checked="checked" />黄页模型管理
					<input id="pp6" name="pPage" type="checkbox" checked="checked" />黄页样式管理
					<input id="pp7" name="pPage" type="checkbox" checked="checked" />黄页风格管理
					<input id="pp8" name="pPage" type="checkbox" checked="checked" />黄页标签管理--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;用户管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">会员管理<input id="pu1" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">管理员管理<input id="pu2" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户角色<input id="pu3" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">信息发送<input id="pu4" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">订阅中心<input id="pu5" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">人才招聘<input id="pu6" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">社区模块<input id="pu7" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">微博管理<input id="pu8" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-3D地带-<input id="pu9" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">视频面试<input id="pu10" name="pUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">多人视频<input id="pu11" name="pUser" type="checkbox" checked="checked" /></div>
						<%-- <input id="pu1" name="pUser" type="checkbox" checked="checked" />会员管理
					<input id="pu2" name="pUser" type="checkbox" checked="checked" />管理员管理
					<input id="pu3" name="pUser" type="checkbox" checked="checked" />用户角色
					<input id="pu4" name="pUser" type="checkbox" checked="checked" />信息发送
					<input id="pu5" name="pUser" type="checkbox" checked="checked" />订阅中心
					<input id="pu6" name="pUser" type="checkbox" checked="checked" />人才招聘
					<input id="pu7" name="pUser" type="checkbox" checked="checked" />社区(SNS)模块
					<input id="pu8" name="pUser" type="checkbox" checked="checked" />微博管理
					<input id="pu9" name="pUser" type="checkbox" checked="checked" />-3D地带-<br />
					&nbsp;&nbsp;<input id="pu10" name="pUser" type="checkbox" checked="checked" />Nite视频面试管理
					<input id="pu11" name="pUser" type="checkbox" checked="checked" />多人视频管理--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;扩展功能
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">广告管理<input id="pb1" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">访问统计<input id="pb2" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">日志管理<input id="pb3" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">问卷调查<input id="pb4" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">百科问答<input id="pb5" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">文件管理<input id="pb6" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">数据字典<input id="pb7" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他管理<input id="pb8" name="pPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他功能<input id="pb9" name="pPlub" type="checkbox" checked="checked" /></div>
						<%-- <input id="pb1" name="pPlub" type="checkbox" checked="checked" />广告管理
					<input id="pb2" name="pPlub" type="checkbox" checked="checked" />访问统计
					<input id="pb3" name="pPlub" type="checkbox" checked="checked" />日志管理
					<input id="pb4" name="pPlub" type="checkbox" checked="checked" />问卷调查和投票
					<input id="pb5" name="pPlub" type="checkbox" checked="checked" />百科问答
					<input id="pb6" name="pPlub" type="checkbox" checked="checked" />文件管理
					<input id="pb7" name="pPlub" type="checkbox" checked="checked" />数据字典
					<input id="pb8" name="pPlub" type="checkbox" checked="checked" />其他管理<br />
					<input id="pb9" name="pPlub" type="checkbox" checked="checked" />其他功能--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;系统配置
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">
						 网站配置
						 <input id="ps1" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							模型管理
							<input id="ps2" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							节点管理
							<input id="ps3" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							工作流配置
							<input id="ps4" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							流程管理
							<input id="ps5" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							专题管理
							<input id="ps6" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							模板风格
							<input id="ps7" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							标签管理
							<input id="ps8" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<div class="checkDiv">
							支付平台
							<input id="ps9" name="pSystem" type="checkbox" checked="checked" />
						</div>
						<%--<input id="ps1" name="pSystem" type="checkbox" checked="checked" />网站配置
					<input id="ps2" name="pSystem" type="checkbox" checked="checked" />模型管理
					<input id="ps3" name="pSystem" type="checkbox" checked="checked" />节点管理
					<input id="ps4" name="pSystem" type="checkbox" checked="checked" />工作流配置
					<input id="ps5" name="pSystem" type="checkbox" checked="checked" />流程管理
					<input id="ps6" name="pSystem" type="checkbox" checked="checked" />专题管理
					<input id="ps7" name="pSystem" type="checkbox" checked="checked" />模板风格
					<input id="ps8" name="pSystem" type="checkbox" checked="checked" />标签管理
					<input id="ps9" name="pSystem" type="checkbox" checked="checked" />在线支付平台--%>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;BI应用
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">项目管理<input id="pbi1" name="pBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">CRM管理<input id="pbi2" name="pBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">有问必答<input id="pbi3" name="pBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">客服通<input id="pbi4" name="pBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">工作统计<input id="pbi5" name="pBI" type="checkbox" checked="checked" /></div>
						<%--  <input id="pbi1" name="pBI" type="checkbox" checked="checked" />项目管理
					<input id="pbi2" name="pBI" type="checkbox" checked="checked" />CRM管理
					<input id="pbi3" name="pBI" type="checkbox" checked="checked" />有问必答
					<input id="pbi4" name="pBI" type="checkbox" checked="checked" />客服通
					<input id="pbi5" name="pBI" type="checkbox" checked="checked" />工作统计--%>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
			id="ForumShow">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;我的工作台
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<input id="fpd1" type="checkbox" checked="checked" />我的工作台
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;扩展功能
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					    <div class="checkDiv">广告管理<input id="fb1" name="fPlub" type="checkbox" checked="checked" /></div>
                        <div class="checkDiv" style="display:none;">广告管理<input id="fb2" name="fPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">访问统计<input id="fb3" name="fPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">日志管理<input id="fb4" name="fPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">问卷调查<input id="fb5" name="fPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">百科问答<input id="fb6" name="fPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">数据字典<input id="fb7" name="fPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他管理<input id="fb8" name="fPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他功能<input id="fb9" name="fPlub" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;教育模块
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">组卷管理<input id="ff1" name="fForum" type="checkbox" checked="checked" /></div>
                        <div class="checkDiv" style="display:none;"><input id="ff2" name="fForum" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">考试管理<input id="ff3" name="fForum" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">班级管理<input id="ff4" name="fForum" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">学员管理<input id="ff5" name="fForum" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">培训资源库<input id="ff6" name="fForum" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">财务管理<input id="ff7" name="fForum" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">阅卷中心<input id="ff8" name="fForum" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;BI应用
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">项目管理<input id="fbi1" name="fBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">CRM管理<input id="fbi2" name="fBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">有问必答<input id="fbi3" name="fBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-客服通-<input id="fbi4" name="fBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">工作统计<input id="fbi5" name="fBI" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
			id="OAShow">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;我的工作台
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">我的工作台<input id="od1" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;用户管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">会员管理<input id="ou1" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">管理员管理<input id="ou2" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户角色<input id="ou3" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">信息发送<input id="ou4" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">订阅中心<input id="ou5" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">人才招聘<input id="ou6" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">社区模块<input id="ou7" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">微博管理<input id="ou8" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-3D地带-<input id="ou9" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">视频面试<input id="ou10" name="oUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">多人视频<input id="ou11" name="oUser" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;BI应用
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					  <div class="checkDiv">项目管理<input id="obi1" name="oBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">CRM管理<input id="obi2" name="oBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">有问必答<input id="obi3" name="oBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-客服通-<input id="obi4" name="oBI" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">工作统计<input id="obi5" name="oBI" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
			id="ConfigShow">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;用户管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">会员管理<input id="ccu1" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">管理员管理<input id="ccu2" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户角色<input id="ccu3" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">信息发送<input id="ccu4" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">订阅中心<input id="ccu5" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">人才招聘<input id="ccu6" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">社区模块<input id="ccu7" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">微博管理<input id="ccu8" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-3D地带-<input id="ccu9" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">视频面试<input id="ccu10" name="ccUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">多人视频<input id="ccu11" name="ccUser" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;扩展功能
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					  <div class="checkDiv">广告管理<input id="cp1" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">访问统计<input id="cp2" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">日志管理<input id="cp3" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">问卷调查<input id="cp4" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">百科问答<input id="cp5" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">文件管理<input id="cp6" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">数据字典<input id="cp7" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他管理<input id="cp8" name="cPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他功能<input id="cp9" name="cPlub" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;系统配置
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					  <div class="checkDiv">网站配置<input id="ccx1" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模型管理<input id="ccx2" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">节点管理<input id="ccx3" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">工作流配置<input id="ccx4" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">流程管理<input id="ccx5" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">专题管理<input id="ccx6" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模板风格<input id="ccx7" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">标签管理<input id="ccx8" name="ccSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">支付平台<input id="ccx9" name="ccSystem" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="100%" border="0" cellspacing="10" cellpadding="0" style="display: none"
			id="SafeShow">
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;用户管理
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					<div class="checkDiv">会员管理<input id="Sacu1" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">管理员管理<input id="Sacu2" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">用户角色<input id="Sacu3" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">信息发送<input id="Sacu4" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">订阅中心<input id="Sacu5" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">人才招聘<input id="Sacu6" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">社区模块<input id="Sacu7" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">微博管理<input id="Sacu8" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">-3D地带-<input id="Sacu9" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">视频面试<input id="Sacu10" name="SacUser" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">多人视频<input id="Sacu11" name="SacUser" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;扩展功能
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">广告管理<input id="sap1" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">访问统计<input id="sap2" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">日志管理<input id="sap3" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">问卷调查<input id="sap4" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">百科问答<input id="sap5" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">文件管理<input id="sap6" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">数据字典<input id="sap7" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他管理<input id="sap8" name="SaPlub" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">其他功能<input id="sap9" name="SaPlub" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td style="height: 24px; background-color: #E8F4FF; font-size: 12px; font-weight: bold">&nbsp;系统配置
					</td>
				</tr>
				<tr>
					<td style="height: 24px; font-size: 12px">&nbsp;
					 <div class="checkDiv">网站配置<input id="sacx1" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模型管理<input id="sacx2" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">节点管理<input id="sacx3" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">工作流配置<input id="sacx4" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">流程管理<input id="sacx5" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">专题管理<input id="sacx6" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">模板风格<input id="sacx7" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">标签管理<input id="sacx8" name="sacSystem" type="checkbox" checked="checked" /></div>
						<div class="checkDiv">支付平台<input id="sacx9" name="sacSystem" type="checkbox" checked="checked" /></div>
					</td>
				</tr>
			</tbody>
		</table>
	</td>
</tr>
</table>
</td>
</tr>
</table>
<div style="width: 100%;margin-top:10px;">
<span style="display: none;">
<input id="noshow2" name="noshow" type="checkbox" checked="checked" /></span>
<input id="Button2" type="button" value="上一步" class="btn btn-success" onclick="Showtoolsup(1)" />
<input id="Button3" type="button" value="保存配置" class="btn btn-success" onclick="disBtn(this); SetConfig();" style="margin-left: 10px;" />
</div>
</form>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/ManageJS.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/ajaxrequest.js"></script>
<script type="text/javascript">
var ajax = new AJAXRequest;
function tipMes() {
	ajax.get("/User/mess.aspx?c=show", function (obj) {
		var tip = obj.responseText; //获得返回信息
		var tips = tip.split("|");
		if (tips.length > 1 && tips[0] != 0) {
			var content = "<a href='javascript:void(0)' hidefocus='true' onclick='top.OpenOnline()'><FONT color=#ff0000>点击查看</FONT></a><br/>";
			showmsg("您有" + tips[0] + "条新信息", content);
		}
	});
}
function showmsg(tip, content) {
	var MSG = new CLASS_MSN_MESSAGE("aa", 200, 120, "短消息提示：", tip, content);
	MSG.speed = 10;
	MSG.step = 2;
	MSG.show();
}
function SetConfig() {
	$.ajax({
		type: "Post",
		url: "Scence.aspx?" + GetConfig(),
		data: { value: "" },
		success: function (data) {
			if (data)
			{
				parent.location = parent.location;
			}
		},
		error: function (data) { alert("更新失败"); }
	});
}
function show()
{

}
</script>
</asp:Content>