<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyItemList, App_Web_0t1uxiqn" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问卷投票问题列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation">
        <asp:HiddenField ID="HdnSID" runat="server" />
    </div>
    <div class="clear"></div>
    <ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" DataKeyNames="QID"
        CssClass="table table-striped table-bordered table-hover" GridLines="None" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="10"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="Lnk_Click">
        <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
        <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2" />
        <Columns>
            <asp:BoundField DataField="QID" HeaderText="序号">
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="5%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="问题标题" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="SurveyItem.aspx?SID=<%=Request["SID"] %>&QID=<%# Eval("QID") %>"><%# Eval("QTitle") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类别">
                <ItemTemplate>
                    <%# GetQType(Eval("TypeID","{0}"),Eval("QID", "{0}")) %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("QID") %>'>修改</asp:LinkButton>
                    |                 
                <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("QID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton>
                    | 
                <asp:LinkButton ID="lbtnMoveUp" runat="server" CommandName="MovePre" CommandArgument='<%# Eval("QID") %>'>上移</asp:LinkButton>
                    |
                <asp:LinkButton ID="lbtnMoveDown" runat="server" CommandName="MoveNext" CommandArgument='<%# Eval("QID") %>'>下移</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>
        th {
            text-align: center;
        }
    </style>
</asp:Content>
