<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_ProjectsType, App_Web_oxnlb5iw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>项目分类管理</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<table class="table table-striped table-bordered table-hover">
	<tr align="center" height="25px">
		<td width="10%">选择</td>
		<td width="10%">序号ID</td>
		<td width="20%">项目类型名称</td>
		<td width="30%">项目类型简介</td>
		<td width="30%">操作</td>
	</tr>
	<asp:Repeater ID="Repeat" runat="server" OnItemCommand="Repeat_ItemCommand">
		<ItemTemplate>
			<tr align="center">
				<td>
					<asp:CheckBox ID="Chck" runat="server" /><asp:Label ID="Lbl" runat="server" Text='<%#Eval("ProjectTypeID") %>' Visible="false"></asp:Label>
				</td>
				<td><%#Eval("ProjectTypeID")%></td>
				<td><a href="ProjectsAddType.aspx?projecttypeID=<%#Eval("ProjectTypeID") %>"><%#Eval("ProjectTypeName")%></a></td>
				<td><%#Eval("ProjectTypeInfo")%></td>
				<td>
					<asp:LinkButton ID="LbtnDel" runat="server" OnClientClick="return confirm('您确定要删除吗？')" CommandArgument='<%#Eval("ProjectTypeID") %>' CommandName="Del">删除</asp:LinkButton>&nbsp;|
				<asp:LinkButton ID="LbtnUpdate" runat="server" CommandArgument='<%#Eval("ProjectTypeID") %>' CommandName="Update">修改</asp:LinkButton>
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
</table>
<table width="25%">
	<tr align="center">
		<td width="10%">
			<asp:CheckBox ID="ChkBx" runat="server" onclick="javascript:CheckAll(this);" Text="全部选择" /></td>
		<td width="15%">
			<asp:Button ID="BtnChck" runat="server" Text="全部删除" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" OnClick="BtnChck_Click" />
		</td>
	</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/js/Common.js"></script>
<script>
	function CheckAll(spanChk)//CheckBox全选
	{
		var oItem = spanChk.children;
		var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
		xState = theBox.checked;
		elm = theBox.form.elements;
		for (i = 0; i < elm.length; i++)
			if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
				if (elm[i].checked != xState)
					elm[i].click();
			}
	}
</script>
</asp:Content>