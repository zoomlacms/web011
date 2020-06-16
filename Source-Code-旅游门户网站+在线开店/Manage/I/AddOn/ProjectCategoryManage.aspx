<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_ProjectCategoryManage, App_Web_oxnlb5iw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>项目分类管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
<span>后台管理</span>&gt;&gt;<span>项目管理</span> &gt;&gt;<span>项目分类管理</span>
</div>
<div class="clearbox"></div>   
<ZL:ExGridView RowStyle-HorizontalAlign="Center" ID="GridView1" DataKeyNames="ProjectCategoryID" AllowSorting="true" runat="server"  OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" AllowPaging="True" PageSize="6" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" EmptyDataText="无相关数据">
			<Columns>
				<asp:TemplateField HeaderText="选中">                     
					<ItemTemplate>
						<asp:CheckBox ID="SelectCheckBox" runat="server" />
					</ItemTemplate>
					<ItemStyle CssClass="tdbg" />
				</asp:TemplateField>
				<asp:BoundField DataField="ProjectCategoryID" HeaderText="序号">
				 <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
				  </asp:BoundField>                  
						  
				<asp:TemplateField HeaderText="分类名称">
				   <ItemTemplate>
					  
							<%# DataBinder.Eval(Container.DataItem,"ProjectCategoryName")%>
			
					</ItemTemplate>
					 <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
				</asp:TemplateField>
									 
				<asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>                                            
				<asp:LinkButton ID="LnkDelete"  runat="server" CommandName="DelProCate" OnClientClick="return confirm('确实要删除吗？');"
					CommandArgument='<%# Eval("ProjectCategoryID")%>'>删除</asp:LinkButton>                         
				</ItemTemplate>
			  <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
		</asp:TemplateField>
			</Columns>
		  <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
 <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
 <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
 <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
		</ZL:ExGridView>
		   <div class="clearbox"></div>   
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="AddProjectCategory.aspx">添加分类</asp:HyperLink>           
 <asp:Button ID="btndelete" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}"
					Text="删除选定分类" OnClick="btndelete_Click" class="C_input"/>
</form>
</body>
</html>