<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_DownServerManage, App_Web_oxnlb5iw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>下载服务器管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理&gt;&gt;其他管理&gt;&gt;下载服务器管理</div>
	<ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" DataKeyNames="ServerID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="6" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging">
		<Columns>
			<asp:TemplateField HeaderText="选中">                            
				<ItemTemplate>
					<asp:CheckBox ID="SelectCheckBox" runat="server" />
				</ItemTemplate>
				<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
			<asp:BoundField DataField="ServerID" HeaderText="序号">
			<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
			  </asp:BoundField>     
										 
			<asp:TemplateField HeaderText="服务器名">
			   <ItemTemplate>                                
						<%# DataBinder.Eval(Container.DataItem, "ServerName")%>
				</ItemTemplate>
				 <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="服务器LoGo">
			<HeaderStyle/>
				<ItemTemplate>
					<img src='<%#Eval("ServerLogo")%>' alt="LOGO"  width="50px" height="30px"/>
				</ItemTemplate>
				<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>                    
			
			<asp:TemplateField HeaderText="显示方式">
				<ItemTemplate>
				  <%#Convert.ToInt32(Eval("ShowType"))==0?"显示名称":"显示LOGo"%>
				</ItemTemplate>
			<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="服务器地址">
				<ItemTemplate>
				  <%#Eval("ServerUrl")%>
				</ItemTemplate>  
				<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />                      
			</asp:TemplateField>                        
			<asp:TemplateField HeaderText="操作">
			<HeaderStyle Width="19%" />
			<ItemTemplate>
				<a href='DownServer.aspx?Action=Modify&DSId=<%# Eval("ServerID")%>' >修改</a>
				<a  href="javascript:if(confirm('你确定要删除吗?')) window.location.href='DownServerManage.aspx?SId=<%# Eval("ServerID")%>';">删除</a> 
				</ItemTemplate>
				<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
			</asp:TemplateField>
		</Columns>                
	</ZL:ExGridView>
		 <div class="clearbox"></div>           
<table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
	<tr>
		<td style="height: 21px">                   
			<asp:Button ID="btndelete" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}"
				Text="批量删除" OnClick="btndelete_Click" class="C_input"/>
			&nbsp;                        
		  
			</td>
	</tr>                
</table>
</form>
</body>
</html>