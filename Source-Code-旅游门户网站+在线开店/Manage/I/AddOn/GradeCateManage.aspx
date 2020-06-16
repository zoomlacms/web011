<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.GradeCateManage, App_Web_oxnlb5iw" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>多级数据字典管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" DataKeyNames="CateID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10"
	class="table table-striped table-bordered table-hover" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" OnRowEditing="Gdv_Editing" EmptyDataText="无相关数据" OnRowDataBound="Gdv_RowDataBound">
	<Columns>            
		<asp:BoundField DataField="CateID" HeaderText="序号">
			<ItemStyle HorizontalAlign="Center" />
		</asp:BoundField>                                               
		<asp:BoundField DataField="CateName" HeaderText="分类名">
			<ItemStyle HorizontalAlign="Center" />
		</asp:BoundField>
		<asp:BoundField DataField="Remark" HeaderText="备注">
			<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
		</asp:BoundField>
		<asp:BoundField DataField="GradeField" HeaderText="分级选项名">
			<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
		</asp:BoundField>
		<asp:TemplateField HeaderText="操作">                
			<ItemTemplate>
				<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("CateID") %>'>修改</asp:LinkButton> | 
				<asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("CateID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton> | 
				<asp:LinkButton ID="LinkButton3" runat="server" CommandName="DicList" CommandArgument='<%# Eval("CateID") %>'>一级选项列表</asp:LinkButton>
			</ItemTemplate>
			<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
		</asp:TemplateField>
	</Columns>              
</ZL:ExGridView>
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td style="width:20%;text-align:right">分类名：</td>
		<td>
			<asp:TextBox ID="txtCateName" runat="server" Width="200px" class="form-control"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width:20%;text-align:right">备注：</td>
		<td>
			<asp:TextBox ID="txtRemark" runat="server" Width="500px" class="form-control"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="width:20%;text-align:right">
				分级选项别名：<br />
				一行一个名称&nbsp;<br />
				例如：<br />
				省份&nbsp;&nbsp;<br />
				城市&nbsp;&nbsp;
		</td>
		<td>
			<asp:TextBox ID="txtGradeField" runat="server" Width="300px" 
				TextMode="MultiLine" Rows="5" class="form-control" Height="89px"></asp:TextBox>
		</td>
	</tr>
	<tr class="table table-striped table-bordered table-hover">
		<td colspan="2">
			<asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
			<asp:Button ID="btnSave" runat="server" Text="添 加" OnClick="btnSave_Click" class="btn btn-primary"/>
		</td>
	</tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>

