<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_SpecialManage, App_Web_pyrhy5wd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>专题类别管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="noncate" class="divbox" style="display: none" runat="server"><font color="red">暂时没有专题类别</font></div>
    <div id="catelist" runat="server">
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" AllowPaging="true" DataKeyNames="SpecCateID" PageSize="10" OnPageIndexChanging="GV_PageIndexChanging" OnRowEditing="Egv_RowEditing" OnRowDeleting="GV_RowDeleting" OnRowCommand="Lnk_Click" Width="100%" CssClass="table table-striped table-bordered table-hover" GridLines="None" CellPadding="2" CellSpacing="1">
            <Columns>
                <asp:BoundField DataField="SpecCateID" HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="6%" />
                </asp:BoundField>
                <asp:BoundField DataField="SpecCateName" HeaderText="专题类别名称" ItemStyle-HorizontalAlign="Left">
                    <HeaderStyle Width="20%" />
                </asp:BoundField>
                <asp:BoundField DataField="SpecCateDir" HeaderText="专题类别目录" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="SpecCateDesc" HeaderText="专题类别描述" ItemStyle-HorizontalAlign="left">
                    <HeaderStyle Width="30%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href='/Special_<%# Eval("SpecCateID")%>/List.aspx' target="_blank">前台浏览</a>
                        |
				<asp:LinkButton ID="LinkButton1" CommandName="AddSpec" CommandArgument='<%# Eval("SpecCateID")%>' runat="server">添加专题</asp:LinkButton>
                        |
				<asp:LinkButton ID="LinkButton2" CommandName="SpecList" CommandArgument='<%# Eval("SpecCateID")%>' runat="server">专题列表</asp:LinkButton>
                        |
				<asp:LinkButton ID="LnkModify" CommandName="Modify" CommandArgument='<%# Eval("SpecCateID")%>' runat="server">修改</asp:LinkButton>
                        |
				<asp:LinkButton ID="LnkDelete" runat="server" CommandName="Delete" OnClientClick="if(!this.disabled) return confirm('确实要删除此专题类别吗？');" CommandArgument='<%# Eval("SpecCateID")%>'>删除</asp:LinkButton>
                        <asp:Button ID="Modify_B" CommandName="Modify" CommandArgument='<%# Eval("SpecCateID")%>' style="display:none;" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    <style>
        th {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $("body").ready(function () {
            $("#EGV").find("tr").dblclick(function () {
                $("#Modify_B").click();
            });
        });
    </script>
</asp:Content>
