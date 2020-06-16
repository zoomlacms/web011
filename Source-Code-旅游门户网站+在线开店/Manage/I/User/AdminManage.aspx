<%@ page language="C#" autoeventwireup="true" inherits="ZoomLaManage.WebSite.Manage.User.AdminManage, App_Web_pwpbtctt" title="管理员管理" tracemode="SortByCategory" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>管理员管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group nav_searchDiv" style="margin: 5px 0 5px 0;">
        <asp:TextBox runat="server" ID="Search_T" class="form-control" placeholder="请输入需要搜索的内容" style="display:inline;" />
        <span class="input-group-btn">
            <asp:LinkButton runat="server" CssClass="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
        </span>
    </div>
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        class="table table-striped table-bordered table-hover" DataKeyNames="AdminID" OnRowEditing="Egv_RowEditing" OnPageIndexChanging="Egv_PageIndexChanging" 
        OnRowCommand="Lnk_Click" OnRowDataBound="Egv_RowDataBound">
        <Columns>
            <asp:TemplateField >
                <ItemTemplate>
                    <input  name="idchk" type="checkbox" title="全选" value="<%#Eval("AdminID") %>"  />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="AdminId" HeaderText="ID">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate><%# ZoomLa.Common.DataConverter.CBool(DataBinder.Eval(Container, "DataItem.IsLock", "{0}")) ? "<span stytle='color:red;'>锁定</span>" : "正常"%> </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="管理员名" DataField="AdminName" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="AdminTrueName" HeaderText="管理员真实姓名" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="多人登录" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate><%# ZoomLa.Common.DataConverter.CBool(DataBinder.Eval(Container, "DataItem.EnableMultiLogin", "{0}")) ? "<span stytle='color:red;'>允许</span>" : "不允许"%> </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="最后登录IP" DataField="LastLoginIP" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="上次修改密码时间" DataField="LastModifyPwdTime" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField HeaderText="登录次数" DataField="LoginTimes" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <% if (m.IsSuperAdmin(badmin.GetAdminLogin().RoleList))
                       {%>
                    <a href="RegionManage.aspx?id=<%#Eval("AdminId") %>" title="设定管理员能查看哪些地区的订单" style="margin-right: 5px;">区域订单权限</a><%} %>
                    <asp:LinkButton ID="LnkModify" CommandName="ModifyAdmin" CommandArgument='<%# Eval("AdminId")%>' runat="server">修改</asp:LinkButton>
                    <asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteAdmin" OnClientClick="return confirm('确实要删除此管理员吗？');" CommandArgument='<%# Eval("AdminId")%>'>删除</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
        <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
    </ZL:ExGridView>
    <div class="clearbox"></div>
    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Font-Size="9pt" Text="取消" OnClick="Button1_Click" />
    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Font-Size="9pt" Text="删除" OnClick="Button2_Click" 
        OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
	$().ready(function () {
		$("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");
		$("#chkAll").click(function () {//EGV 全选
			selectAllByName(this, "chkSel");
		});
	});
	function selectAllByName(obj, name) {
		var allInput = document.getElementsByName(chkSel);
		var loopTime = allInput.length;
		for (i = 0; i < loopTime; i++) {
			if (allInput[i].type == "checkbox") {
				allInput[i].checked = this.checked;
			}
		}
	}
	function IsSelectedId() {
	    return $("input:checkbox[name=chkSel]:checked").length > 0;
	}
	HideColumn("4,5,6,7,8");
</script>
</asp:Content>