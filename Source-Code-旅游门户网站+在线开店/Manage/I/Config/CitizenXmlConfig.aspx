<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_CitizenXmlConfig, App_Web_bnkjraqn" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>国籍数据字典管理</title>
<style>
	#AllID_Chk{display:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="lblCateName" runat="server" Text=""></asp:Label>
    <asp:Label ID="LblGradeLevel" runat="server" Text=""></asp:Label>
    <ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" runat="server" DataKeyNames="FileName" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" OnRowDataBound="Gdv_RowDataBound" CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField HeaderText="选项">
                <ItemTemplate>
                    <%#Eval("FileName")%>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit1" CommandArgument='<%# Eval("FileName") %>'>修改</asp:LinkButton>
                    |
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("FileName") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton>
                    | 
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DicList" CommandArgument='<%# Eval("FileName") %>'>下级选项列表</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="60%"></ItemStyle>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div class="clearfix"></div>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td style="width: 20%; text-align: right">所属分类： </td>
            <td>
                <asp:Label ID="LblCate" runat="server" Text="国省市三级联动"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: right">级别： </td>
            <td>
                <asp:Label ID="LblLevel" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: right">上级选项： </td>
            <td>
                <asp:Label ID="LblPreGrade" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 20%; text-align: right">分级选项： </td>
            <td>
                <asp:TextBox ID="txtGradeName" runat="server" Width="300px" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:HiddenField ID="HdnFileName" Value="0" runat="server" />
                <asp:HiddenField ID="HdnCountry" Value="0" runat="server" />
                <asp:Button ID="btnSave" runat="server" Text="添加" OnClick="btnSave_Click" class="btn btn-primary" />
                <asp:Button ID="Button1" runat="server" Text="返回" OnClick="btnBack_Click" class="btn btn-primary" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
	function showdown(n)
	{
		window.location.href = $("#EGV tr:eq(" + n + ")").find("#LinkButton3").attr("href");
	}
</script>
</asp:Content>