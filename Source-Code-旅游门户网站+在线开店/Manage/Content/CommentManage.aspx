<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.CommentManage, App_Web_zxhe1krl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("评论管理")%></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="/JS/Common.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script src="../../JS/SelectCheckBox.js"></script>
<script type="text/javascript">
    var tID = 0;
    var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
    window.onload = function () {
        pload();
    }
    function ShowTabss(ID) {
        location.href = 'CommentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
    }
    function pload() {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
    }
</script>
<style>
.rap { word-wrap: break-word; word-break: break-all;}
.user_t{border:1px solid #9bbde6; border-top:none}
.borders{ border-bottom:1px solid #40a2fd}
</style>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('97')" title="帮助"></a></div>
  <%} %>
<%=lang.LF("后台管理")%> &gt;&gt;<%=lang.LF("系统设置")%> &gt;&gt; <a href="ContentManage.aspx"><%=lang.LF("内容管理")%></a>&gt;&gt;<%=lang.LF("评论管理")%>
</div>
</div>
<div class="h_24"></div>
<div class="clearbox">
</div>
<div class="borders">
<table border="0" cellpadding="0" cellspacing="0">
    <tr align="center">
        <td id="TabTitle0" class="titlemouseover" onclick="ShowTabss(0)"><%=lang.LF("所有评论")%></td>
        <td id="TabTitle1" class="tabtitle" onclick="ShowTabss(1)"><%=lang.LF("待审核")%></td>
        <td id="TabTitle2" class="tabtitle" onclick="ShowTabss(2)"><%=lang.LF("已审核")%></td>
    </tr>
</table>
</div>
<div class="clearbox"></div>
<div class="user_t">
<asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKey ="CommentID"   PageSize="20" OnRowDataBound="Egv_RowDataBound"  OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%" Height="20px" AllowPaging="True" CellPadding="2"  RowStyle-CssClass="tdbg"  CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" GridLines="None" >
	<Columns>
		<asp:TemplateField HeaderText="选择">
			<HeaderStyle Width="5%" />
			<ItemTemplate>
				<asp:CheckBox ID="chkSel" runat="server" />
			</ItemTemplate>
			<ItemStyle />
		</asp:TemplateField>
		<asp:BoundField DataField="CommentID" HeaderText="评论ID">
			<HeaderStyle Width="5%" />
			<ItemStyle HorizontalAlign="Center" />
		</asp:BoundField>
		<asp:TemplateField HeaderText="所属内容标题">
			<HeaderStyle Width="20%" />
			<ItemTemplate> 
				<a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank">
					<%# GetTitle(Eval("GeneralID", "{0}"))%></a>
			</ItemTemplate>
			<ItemStyle HorizontalAlign="left" />
		</asp:TemplateField> 
        <asp:TemplateField HeaderText="状态">
			<HeaderStyle Width="10%" />
			<ItemTemplate>
				<%#getcommend(Eval("Audited"))%>
			</ItemTemplate>
			<ItemStyle HorizontalAlign="left" />
		</asp:TemplateField>
		<asp:BoundField DataField="Contents" HeaderText="评论内容">
			<HeaderStyle Width="15%" />
			<ItemStyle HorizontalAlign="left" />
		</asp:BoundField>
		<asp:TemplateField HeaderText="发表日期">
			<HeaderStyle Width="10%" />
			<ItemTemplate>
				<%# Eval("CommentTime", "{0:yyyy-MM-dd}")%>
			</ItemTemplate>
			<ItemStyle HorizontalAlign="Center" />
		</asp:TemplateField>
		<asp:TemplateField HeaderText="发表人">
			<HeaderStyle Width="10%" />
			<ItemTemplate>
            <a href="../User/UserInfo.aspx?id=<%# Eval("UserID") %>">
				<%# GetUserName(Eval("UserID", "{0}"))%>
			</ItemTemplate>
			<ItemStyle HorizontalAlign="Center" />
		</asp:TemplateField>
		<asp:TemplateField HeaderText="操作">
			<ItemTemplate>
				<asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("CommentID") %>' OnClientClick="return confirm('你确定将该数据彻底删除吗？')"><%=lang.LF("删除以下内容到回收站")%></asp:LinkButton>
				|
				<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Audit" CommandArgument='<%# Eval("CommentID") %>' OnClientClick="return confirm('你确定将该数据还原吗？')"><%=lang.LF("审核")%></asp:LinkButton>
			</ItemTemplate>
			<ItemStyle HorizontalAlign="Center" />
		</asp:TemplateField>
	</Columns>
	<RowStyle ForeColor="Black" BackColor="#E8F5FF" Height="25px" />
	<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
	<PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
	<HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
	<PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
</asp:GridView>
<table width="100%">
        <tr>
            <td class="tdbg">
                <div style="text-align: center">
                    <span style="text-align: center">
                        <%=lang.LF("共")%>
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        <%=lang.LF("条数据")%>
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        <%=lang.LF("页次")%>：
                        <asp:Label ID="Nowpage" runat="server" Text="1" />/
                        <asp:Label ID="PageSize" runat="server" Text="" /><%=lang.LF("页")%>
                        <asp:Label ID="pagess" runat="server" Text="" />
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged" Width="30px"></asp:TextBox>
                        <%=lang.LF("条数据/页   转到第")%>
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                        </asp:DropDownList>
                        <%=lang.LF("页")%>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="仅支持数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator></span>
                </div>
            </td>
        </tr>
    </table>
</div>
<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" Text="全选" onclick="CheckAll(this)" />
<asp:Button ID="Button1"   runat="server" Text="删除选定的评论" OnClick="BtnSubmit1_Click" UseSubmitBehavior="False" OnClientClick="if(!confirm('确定要批量删除评论吗？')){return false;}" class="C_input"/>
<asp:Button ID="Button2"   runat="server" Text="审核通过选定的评论" OnClick="BtnSubmit2_Click" UseSubmitBehavior="False" class="C_input" />
<asp:Button ID="Button3"  runat="server" Text="取消审核选定的评论" OnClick="BtnSubmit3_Click" UseSubmitBehavior="False" class="C_input" />
</form>
</body>
</html>