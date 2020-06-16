<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_CarRuleManage, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>抢车位规则管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CssClass="table table-striped table-bordered table-hover" EmptyDataText="暂无信息！！">
            <Columns>
                <asp:TemplateField HeaderText="规则名称">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CText") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="规则数值">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Cvalue") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Cvalue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" HeaderText="操作" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
