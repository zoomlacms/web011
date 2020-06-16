<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_Default, App_Web_5xj5wdms" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>流程管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style=" margin-bottom:10px;">
        <div class="input-group" style="width:300px;">
            <asp:TextBox runat="server" ID="searchText" Width="250" placeholder="请输入需要查询的信息" CssClass="form-control" />
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" />
            </span>
        </div>
    </div>
    <div class="tab3">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table table-striped table-bordered table-hover" BackColor="White" EmptyDataText="当前没有信息!!" OnRowDataBound="EGV_RowDataBound" DataKeyNames="ID" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-Height="22" />
                <asp:BoundField HeaderText="流程名" DataField="ProcedureName" />
                <asp:TemplateField HeaderText="分类">
                    <ItemTemplate>
                        <%#GetClassID(Eval("ClassID","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="表格模型" DataField="ModelID" />
                <asp:TemplateField HeaderText="允许附件">
                    <ItemTemplate>
                        <%#GetAllowAttach(Eval("AllowAttach","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="备注" DataField="Remind" />
                <asp:BoundField HeaderText="状态" DataField="Status" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="WorkFlow.aspx?proID=<%#Eval("ID") %>">编辑</a>
                        <a href="AddFlow.aspx?proID=<%#Eval("ID") %>">查看步骤</a>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                            删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $().ready(function () {
            $(":button").addClass("btn btn-primary");
            $(":submit").addClass("btn btn-primary");
            $("#EGV tr:last >td>:text").css("line-height", "normal");
            $("#EGV tr:first >th").css("text-align", "center");
        });
    </script>
</asp:Content>
