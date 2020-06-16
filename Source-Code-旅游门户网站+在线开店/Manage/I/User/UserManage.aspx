<%@ page language="C#" autoeventwireup="true" inherits="Manage_User_UserManage, App_Web_2wb0azx5" title="会员管理" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head" EnableViewState="false">
<title>会员管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="border" style="display: none">
<ul>
  <li>
	<div style="display: none"> 选择等级：
	  <asp:DropDownList ID="SelectGroup" runat="server" DataValueField="GroupID" DataTextField="OtherName" CssClass="x_input"></asp:DropDownList>
	  <asp:Button ID="Rank" runat="server" Text="设置等级" CssClass="btn btn-primary" OnClick="Rank_Click" />
	</div>
  </li>
</ul>
</div>
<div id="search">
<table class="table table-bordered">
  <tr>
	<td><div class="input-group" style="float:left;">
		<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" style="width:120px;border-right:none;" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
		  <asp:ListItem Value="1" Selected="True">按会员组别</asp:ListItem>
		  <asp:ListItem Value="2">按登录日期</asp:ListItem>
		</asp:DropDownList>
		<strong id="strtime" runat="server" visible="false">
		<asp:TextBox ID="sTime_T" runat="server" style="border-right:none;width:180px;border-radius:0px;" placeholder="起始日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control"></asp:TextBox>
		<asp:TextBox ID="eTime_T" runat="server" style="width:180px;border-radius:0px;" placeholder="终止日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control"></asp:TextBox>
		</strong> <strong id="strgroup" runat="server" visible="true">
		<asp:DropDownList ID="ddlGroup" runat="server" Width="150" DataTextField="GroupName" DataValueField="GroupID" CssClass="form-control"></asp:DropDownList>
		</strong> <span class="input-group-btn" style="float:left;">
		<asp:LinkButton runat="server" ID="Button1" OnClick="Button1_Click1" CssClass="btn btn-default"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
		</span> </div>
	  <div class="input-group" style="width: 280px;margin-left:5px;float:left;">
		<asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Style="width: 90px;border-right:none;">
		  <asp:ListItem Selected="True" Value="UserName">会员名</asp:ListItem>
		  <asp:ListItem Value="UserID">ID</asp:ListItem>
		  <asp:ListItem Value="Email">Email</asp:ListItem>
		</asp:DropDownList>
		<asp:TextBox ID="IDName" runat="server" CssClass="form-control" style="width:150px;border-right:none;"></asp:TextBox>
		<span class="input-group-btn">
		<asp:LinkButton runat="server" ID="Button2" OnClick="Button2_Click" CssClass="btn btn-default"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
		</span> </div>
	  <asp:DropDownList ID="ProvinceDP" runat="server" CssClass="form-control" Width="150" AutoPostBack="true" Visible="false"></asp:DropDownList></td>
  </tr>
</table>
</div>
<div>
<table id="EGV" class="table table-striped table-bordered table-hover" >
  <tr>
	<td></td>
	<td>ID</td>
	<td>会名员</td>
	<td>工号</td>
	<td>会员组</td>
	<td>资金余额</td>
	<td>注册时间</td>
	<td>积分</td>
	<td>登录次数</td>
	<td>最后登录时间</td>
	<td>状态</td>
	<td>聚合认证</td>
	<td>操作</td>
  </tr>
  <ZL:Repeater runat="server" ID="RPT" PageSize="10" PagePre="<tr><td><input type='checkbox' id='AllID_Chk'></td><td colspan='12'><div class='text-center'>" PageEnd="</div></td></tr>">
	<ItemTemplate>
	  <tr ondblclick="location='UserInfo.aspx?id=<%# Eval("UserID") %>';">
		<td><input type="checkbox" name="chkSel" value='<%# Eval("UserID") %>' /></td>
		<td><%#Eval("UserID") %></td>
		<td><a href="UserInfo.aspx?id=<%# Eval("UserID") %>"><%#Eval("UserName") %></a></td>
		<td><%#Eval("WorkNum") %></td>
		<td><a href="UserManage.aspx?GroupID=<%#Eval("GroupID") %>"><%# GetGroupName(Eval("GroupID","{0}")) %></a></td>
		<td><%#Eval("Purse","{0:F2}") %></td>
		<td><%#Eval("RegTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
		<td><%#Eval("UserExp") %></td>
		<td><%#Eval("LoginTimes") %></td>
		<td><%#Eval("LastLockTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
		<td><%#GetStatus(Eval("Status","{0}")) %></td>
		<td><%#GetState(Eval("State","{0}")) %></td>
		<td><a href='UserSitePermission.aspx?uid=<%# Eval("UserID")%>'>权限</a> <a href='UserConfirm.aspx?uid=<%#Eval("UserID") %>&IsConfirm=<%#Eval("IsConfirm") %>'><%# GetConfirm(Eval("GroupID").ToString())%></a> <a href="javascript:void(0)" onclick="javascript:window.open('../../Space/Default.aspx?id=<%# Eval("UserID")%>')"><%=Getspacename() %></a> <a href='CertificateAuditInfo.aspx?UserID=<%# Eval("UserID")%>'>证件</a></td>
	  </tr>
	</ItemTemplate>
	<FooterTemplate></FooterTemplate>
  </ZL:Repeater>
</table>
</div>
  <div style="height: 10px;"></div>
  <asp:DropDownList ID="UserGroup_DP" CssClass="form-control" Width="150" runat="server" DataValueField="GroupID" DataTextField="GroupName"> </asp:DropDownList>
  <div class="btn-group">
    <asp:Button ID="GroupMove" runat="server" Text="批量移动" OnClick="GroupMove_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-primary" />
    <asp:Button ID="Enable" runat="server" Text="启用" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-primary" OnClick="btnCan_Click" />
    <asp:Button ID="Disable" runat="server" Text="禁用" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-primary" OnClick="btnLock_Click" />
    <asp:Button ID="RenoVate" runat="server" Text="刷新用户" CssClass="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" OnClick="RenoVate_Click" />
    <asp:Button ID="Approve" runat="server" Text="认证用户" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-primary" OnClick="Approve_Click" />
    <asp:Button ID="ApproveFailure" runat="server" Text="取消认证" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-primary" OnClick="ApproveFailure_Click" />
    <asp:Button ID="btnLock" runat="server" Text="批量锁定" OnClick="btnLock_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-primary" />
    <asp:Button ID="btnDel" runat="server" Text="批量删除" OnClick="btnDel_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" class="btn btn-primary" />
    <asp:Button ID="btnNormal" runat="server" Text="批量解锁" OnClick="btnNormal_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-primary" />
    <asp:Button ID="Export" runat="server" Text="Excel导出" CssClass="btn btn-primary" OnClick="Export_Click" />
    <input class="btn btn-primary" type="button" onclick="inputuserinfo()" value="Excel导入" />
  </div>
  <asp:HiddenField ID="Search_Hid" runat="server" />
  <div class="modal" id="userinfo_div">
    <div class="modal-dialog" style="width: 800px;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
          <span class="modal-title"><strong id="title">用户信息</strong></span> </div>
        <div class="modal-body">
          <iframe id="user_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/Dialog.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script>
    $().ready(function () {
        $("#AllID_Chk").click(function () {//EGV 全选
            selectAllByName(this, "chkSel");
        });
    })
    function inputuserinfo() {//Excel导入
        $("#title").text("导入会员");
        $("#user_ifr").attr("src", "InputUser.aspx");
        $("#userinfo_div").modal({});
    }
    function IsSelectedId() {
        var chkArr = $("#EGV").find("input[type=checkbox]:checked");
        if (chkArr.length > 0)
            return true;
        else
            return false;
    }
    function displayToolbar() {
        var dr = document.getElementById("search");
        if (dr.style.display == "none") {
            dr.style.display = "block";
            $("#Search_Hid").val("1");
        }
        else {
            $("#Search_Hid").val("0");
            dr.style.display = "none";
        }
    }
    function open_title() {
        $("#title").text("添加会员");
        $("#user_ifr").attr("src", "AddUser.aspx");
        $("#userinfo_div").modal({});
    }
    $().ready(function ()
    {
        var searchFlag = $("#Search_Hid").val();
        if (searchFlag && searchFlag == "1") {
            displayToolbar();
        }
    });
    HideColumn("5,6,7,8,9,10,11,12");
</script>
</asp:Content>