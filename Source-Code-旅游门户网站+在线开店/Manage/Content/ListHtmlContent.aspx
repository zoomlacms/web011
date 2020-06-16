<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ListHtmlContent, App_Web_zxhe1krl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>内容生成管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script language="javascript" type="text/javascript" src="/JS/Popmenu.js"></script>
<script>
    function displayToolbar()
    {
        var dr = document.getElementById("search");
        if (dr.style.display == "none")
        {
            dr.style.display = "block";
        }
        else
        {
            dr.style.display = "none";
        }
    }
</script>
<style>
#showsearch{display:block; width:16px; float:right; height:16px; margin-top:4px; margin-right:10px;}
#showsearch:hover{ cursor:pointer;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation">后台管理&gt;&gt; <a href="ContentManage.aspx">内容管理</a>&gt;&gt;<asp:Label ID="Label1" runat="server" Text="生成管理"></asp:Label><a id="showsearch" title="显示扩展搜索" onclick="displayToolbar()"><img src="/App_Themes/AdminDefaultTheme/images/exten.gif" alt="" /></a>
</div>
</div><div style="height:30px;"></div>
<div class="divline" id="search" style=" margin-bottom:5px;padding-left: 10px;display:none;">
	<ul>
		<li style="float:left;"><b>请选择排列顺序：</b>
		<asp:DropDownList ID="txtbyfilde" runat="server" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged">
		</asp:DropDownList>
		<asp:DropDownList ID="txtbyOrder" runat="server" OnSelectedIndexChanged="txtbyOrder_SelectedIndexChanged">
		</asp:DropDownList></li>
		<li style="float:left;">
		    <asp:DropDownList ID="DropDownList1" runat="server">
				<asp:ListItem Value="1">ID检索</asp:ListItem>
				<asp:ListItem Value="0">标题检索</asp:ListItem>
				<asp:ListItem Value="2">录入者检索</asp:ListItem>
			</asp:DropDownList>
        </li>
        <li style="float:left;">
            <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input">
                <tr >
                    <td>
                        <asp:TextBox ID="TextBox1" class="l_input" runat="server" BorderColor="#fff" CssClass="l_inpnon"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button4" runat="server" Text="" OnClick="Button4_Click" CssClass="C_sch" />
                    </td>
                </tr>
            </table>
		</li>
	</ul>
</div>
<div style="clear:both;"></div>   
<asp:GridView ID="Egv" CssClass="border" runat="server" AutoGenerateColumns="false" DataKeyNames="GeneralID" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="MakeHtmlGo" Width="100%" GridLines="None" CellPadding="2" CellSpacing="1" >
	<Columns>
		<asp:TemplateField>
            <HeaderTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" onclick="CheckAll(this)" />
            </HeaderTemplate>
			<ItemTemplate>
                <!-此处代码需要修改 ->
				<asp:CheckBox ID="chkSel" runat="server" />
			</ItemTemplate>
			<HeaderStyle Width="5%" />
			<ItemStyle  HorizontalAlign="Center" />
		</asp:TemplateField>
		<asp:BoundField HeaderText="ID" DataField="GeneralID">
			<HeaderStyle Width="5%" />
			<ItemStyle  HorizontalAlign="Center" />
		</asp:BoundField>
		<asp:TemplateField>
            <HeaderTemplate>
                <a href="ListHtmlContent.aspx?orderby=title"><font color=green><b>标题</b></font></a>
            </HeaderTemplate>
			<ItemTemplate>
				<%# GetPic(Eval("ModelID", "{0}"))%> <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"))%>
			</ItemTemplate>
			<HeaderStyle Width="55%" />
			<ItemStyle />
		</asp:TemplateField>
		<asp:TemplateField>
            <HeaderTemplate>
                <a href="ListHtmlContent.aspx?orderby=Status"><font color="green"><b>状态</b></font></a>
            </HeaderTemplate>
			<ItemTemplate>
				<%# GetStatus(Eval("Status", "{0}")) %>
			</ItemTemplate>
			<HeaderStyle Width="10%" />
			<ItemStyle  HorizontalAlign="Center" />
		</asp:TemplateField>
		<asp:TemplateField HeaderText="生成操作">
			<ItemTemplate>
				<%# GetCteate(Eval("IsCreate", "{0}"))%>
				<asp:LinkButton ID="LinkButton1" runat="server" CommandName="MakeHtml" CommandArgument='<%# Eval("GeneralID") %>' CausesValidation="false">生成文件</asp:LinkButton>
				|
				<%--<a href="ListHtmlContent.aspx?ContentID=<%# Eval("GeneralID") %>" target="_blank">查看文件</a>--%>
				<a href="<%#(geturl(Eval("GeneralID","{0}"))=="")?"javascript:void(0);":geturl(Eval("GeneralID","{0}"))%>">查看文件</a>
				|
				<a href="ListHtmlContent.aspx?GeneralID=<%# Eval("GeneralID") %>">删除文件</a>
			</ItemTemplate>
			<ItemStyle  HorizontalAlign="Center"/>
		</asp:TemplateField>
	</Columns>
	<RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
	<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
	<PagerStyle ForeColor="#030E0E" HorizontalAlign="Center" />
	<PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="" PreviousPageText="" Visible="False" />
	<HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="25px" Font-Overline="False" BorderColor="White" />
   <%-- <PagerSettings Visible="False" />
	<RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
	<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
	<PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
	<HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None"
		Height="30px" Font-Overline="False" BorderColor="White" />--%>
	<%--<PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
		NextPageText="下一页" PreviousPageText="上一页" />--%>
</asp:GridView>
<%# GetPic(Eval("ModelID", "{0}"))%>
    <table width="100%">
        <tr>
            <td class="tdbg">
	<div  style="text-align: center" >
	<span  style=" text-align: center">共
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
		<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" ontextchanged="txtPage_TextChanged" Width="30px" class="l_input"></asp:TextBox>
		条数据/页 转到第
		<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList3_SelectedIndexChanged">
		</asp:DropDownList>
		页<asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
		</span>
    </div>
            </td>
        </tr>
    </table>
<div class="clearbox"></div>
<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" onclick="CheckAll(this)" Text="全选" Visible="false" />
<asp:Button ID="btnAudit" style="width:100px;" class="C_input" CausesValidation="false" runat="server" Text="生成文件" OnClientClick="if(!IsSelectedId()){alert('请选择生成项');return false;}else{return confirm('你确定要审核选中内容吗？')}" onclick="btnAudit_Click" />&nbsp;
<asp:Button ID="btnUnAudit" style="width:100px;" CausesValidation="false" runat="server" Text="删除文件" class="C_input" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" onclick="btnUnAudit_Click" />&nbsp;
<asp:HiddenField ID="HiddenNodeID" runat="server" />
</form>
</body>
</html>