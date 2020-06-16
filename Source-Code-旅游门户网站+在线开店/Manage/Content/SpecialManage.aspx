<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.SpecialManage, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>专题分类</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
<%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('58')" title="帮助"></a></div>
  <%} %>
<span>后台管理</span>&gt;&gt;<span>系统设置</span> &gt;&gt;<span><a href="SpecialManage.aspx">专题分类管理</a></span><span> &gt;&gt;&nbsp;<a href="AddSpecCate.aspx" style="color:Red">[添加专题类别]</a></span>
</div>
<div class="clearbox">
</div>
<div id="noncate" class="divbox" style="display:none" runat="server"><font  color="red">暂时没有专题类别</font></div>
<div id="catelist" runat="server">
<asp:GridView ID="GV" runat="server" BorderColor="White" AutoGenerateColumns="False" AllowPaging="true" DataKeyNames="SpecCateID" PageSize="10" OnPageIndexChanging="GV_PageIndexChanging" OnRowEditing="Egv_RowEditing" OnRowDeleting="GV_RowDeleting" OnRowCommand="Lnk_Click" Width="100%" CssClass="border" onrowcreated="GV_RowCreated" GridLines="None" CellPadding="2" CellSpacing="1">
	<Columns>
		<asp:BoundField DataField="SpecCateID" HeaderText="ID" ItemStyle-HorizontalAlign="Center">
			<HeaderStyle Width="6%" />
		</asp:BoundField>
		<asp:BoundField DataField="SpecCateName" HeaderText="专题类别名称" ItemStyle-HorizontalAlign="Left">
			<HeaderStyle Width="20%" />
		</asp:BoundField>
		<asp:BoundField DataField="SpecCateDir" HeaderText="专题类别目录" ItemStyle-HorizontalAlign="Center">
			<HeaderStyle Width="10%" />
		</asp:BoundField>
		<asp:BoundField DataField="SpecCateDesc" HeaderText="专题类别描述" ItemStyle-HorizontalAlign="left">
			<HeaderStyle Width="30%" />
		</asp:BoundField>
		<asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
            <a href='/Special_<%# Eval("SpecCateID")%>/List.aspx' target="_blank">前台浏览</a>
            |
				<asp:LinkButton ID="LinkButton1" CommandName="AddSpec" CommandArgument='<%# Eval("SpecCateID")%>' runat="server">添加专题</asp:LinkButton>
				|
				<asp:LinkButton ID="LinkButton2" CommandName="SpecList" CommandArgument='<%# Eval("SpecCateID")%>' runat="server">专题列表</asp:LinkButton>
				|
				<asp:LinkButton ID="LnkModify" CommandName="Modify" CommandArgument='<%# Eval("SpecCateID")%>' runat="server">修改</asp:LinkButton>
				|
				<asp:LinkButton ID="LnkDelete" runat="server" CommandName="Delete" OnClientClick="if(!this.disabled) return confirm('确实要删除此专题类别吗？');" CommandArgument='<%# Eval("SpecCateID")%>'>删除</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
	<RowStyle ForeColor="Black" CssClass="tdbg" Height="25px"/>
    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
    <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="White" Height="30px" Font-Overline="False" />
    <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="" PreviousPageText="" Visible="False" />
</asp:GridView>
    <div style="text-align: center" class="tdbg">
        <span style="text-align: center">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </span>
    </div>
</div>
</form>
</body>
</html>
