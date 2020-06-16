<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_ModelManage, App_Web_pyrhy5wd" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
<title>模型管理</title>
<style>
   #AllID_Chk{display:none;}
</style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <asp:HiddenField ID="type" runat="server" />
    
    <div class="text-center">
            </div>
    
    
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ModelID" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无模型信息！！">
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <HeaderStyle Width="5%" />
                <ItemTemplate>
                    <strong><%# Eval("ModelID") %></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="图标" >
                <HeaderStyle Width="5%" />
                <ItemTemplate>
                    <span class="<%#Eval("ItemIcon") %>"></span>
                    <%--<img alt="" src="<%# GetIcon(DataBinder.Eval(Container, "DataItem.ItemIcon", "{0}"))%>" style="border-width: 0px;" />--%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模型名称">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <strong><%# Eval("ModelName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="表名">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <strong><%# Eval("TableName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="项目名称">
                <HeaderStyle Width="10%" />
                <ItemTemplate>
                    <strong><%# Eval("ItemName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="模型描述" DataField="Description" HeaderStyle-Width="30%" />
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle Width="20%" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Copy" CommandArgument='<%# Eval("ModelID")%>' Enabled='<%#GetEnabled(Eval("SysModel").ToString()) %>'>复制</asp:LinkButton> |
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit1" CommandArgument='<%# Eval("ModelID") %>'>修改</asp:LinkButton> |
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del2" CommandArgument='<%# Eval("ModelID") %>' OnClientClick="return confirm('确实要删除此模型吗？');">删除</asp:LinkButton> |
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Field" CommandArgument='<%# Eval("ModelID") %>'>字段列表</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript">
	function getinfo(id) {
		location.href = "AddEditModel.aspx?ModelID=" + id + '&ModelType=<%=Request["ModelType"] %>';
	}
	HideColumn("1,4,5");
</script>
</asp:Content>