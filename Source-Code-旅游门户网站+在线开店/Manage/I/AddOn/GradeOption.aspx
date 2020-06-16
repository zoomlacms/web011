<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Guest_GradeOption, App_Web_oxnlb5iw" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>多级数据字典管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
    <ZL:EXGridView ID="Gdv" RowStyle-HorizontalAlign="Center" DataKeyNames="GradeID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" OnRowDataBound="Gdv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" OnRowEditing="Gdv_Editing" EmptyDataText="无相关数据" CellPadding="2" CellSpacing="1" ForeColor="Black" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" GridLines="None">
    <Columns>            
        <asp:BoundField DataField="GradeID" HeaderText="序号">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>                                                           
        <asp:BoundField DataField="GradeName" HeaderText="选项">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>            
        <asp:TemplateField HeaderText="操作">                
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit1" CommandArgument='<%# Eval("GradeID") %>'>修改</asp:LinkButton> | 
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("GradeID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton> | 
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DicList" CommandArgument='<%# Eval("GradeID") %>'>下级选项列表</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
     <RowStyle ForeColor="Black" Height="25px" />
     <SelectedRowStyle Font-Bold="True" ForeColor="White" />
     <PagerStyle HorizontalAlign="Center" />
     <HeaderStyle Font-Bold="True" />            
</ZL:EXGridView>
<table class="table table-striped table-bordered table-hover" cellspacing="1" cellpadding="0" width="100%" border="0" align="center">
    <tr>
        <td class="tdbgleft" style="width:20%;height: 21px;text-align:right">
                所属分类：
        </td>
        <td>
            <asp:Label ID="LblCate" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td class="tdbgleft" style="width:20%;height: 21px;text-align:right">
                级别：
        </td>
        <td>
            <asp:Label ID="LblLevel" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td class="tdbgleft" style="width:20%;height: 21px;text-align:right">
                上级选项：
        </td>
        <td>
            <asp:Label ID="LblPreGrade" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td class="tdbgleft" style="width:20%;height: 21px;text-align:right">
                分级选项：
        </td>
        <td>
            <asp:TextBox ID="txtGradeName" runat="server" Width="300px" CssClass="form-control"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="text-center">
            <asp:HiddenField ID="HdnGradeID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnParentID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnLastLevel" Value="0" runat="server" />
            <asp:Button ID="btnSave" runat="server" Text="添 加" OnClick="btnSave_Click" CssClass="btn btn-primary"/>
            <asp:Button ID="Button1" runat="server" Text="返 回" OnClick="btnBack_Click" CssClass="btn btn-primary"/>
        </td>
    </tr>
</table> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>
        th{text-align:center;}
    </style>
</asp:Content>