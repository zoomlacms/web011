<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_UserGuide, App_Web_rsvfdmb3" %>
<div class="menu_tit"><span class="glyphicon glyphicon-globe"></span>会员管理</div>
<div id="nodeNav">
<div class="input-group">
<input type="text" ID="keyWord" class="form-control ascx_key" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"I/User/UserManage.aspx?keyWord=" %>',this);" placeholder="请输入用户名" />
<span class="input-group-btn">
    <button class="btn btn-default" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"I/User/UserManage.aspx?keyWord=" %>','keyWord');"><span class="glyphicon glyphicon-search"></span></button>
    <asp:Button runat="server" ID="search_Btn" Style="display: none;"/>
</span>
</div>
<div class="tvNavDiv">
<div class="left_ul">
    <ul>
	<li class="guideli"><a onclick="ShowMain('','User/UserManage.aspx')"><%=lang.LF("会员管理")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','User/GroupManage.aspx')"><%=lang.LF("会员组别")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','User/PointGroup.aspx')"><%=lang.LF("积分等级")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','User/SystemUserModel.aspx')"><%=lang.LF("注册字段")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','Polymeric/ClassManage.aspx')"><%=lang.LF("聚合分类")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','Polymeric/ConfigSet.aspx')"><%=lang.LF("聚合配置")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','User/UserDay.aspx')"><%=lang.LF("手机节日")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','User/UserDayManage.aspx')"><%=lang.LF("用户节日")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','Config/UserConfig.aspx')"><%=lang.LF("会员参数")%></a></li>
	<li class="guideli"><a onclick="ShowMain('','APP/Suppliers.aspx')">社会化登陆</a></li>
	<li class="guideli"><a onclick="ShowMain('','APP/Ucenter.aspx')">跨域网站接入</a></li>
	<li class="guideli"><a onclick="ShowMain('','User/UserApi.aspx')"><%=lang.LF("Api整合接口")%></a></li>
    </ul>
</div>
</div>
</div>