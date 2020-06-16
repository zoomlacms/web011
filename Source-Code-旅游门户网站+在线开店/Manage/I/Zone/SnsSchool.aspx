<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_SnsSchool, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>学校信息配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input name="chkSel" type="checkbox" value='<%#Eval("ID")  %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="学校名称">
                <ItemTemplate>
                    <a href="AddSchool.aspx?menu=edit&id=<%#Eval("ID") %>"><%#Eval("SchoolName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="国家" DataField="Country" />
            <asp:BoundField HeaderText="省份" DataField="Province" />
            <asp:TemplateField HeaderText="类型">
                <ItemTemplate>
                    <%#GetSchoolType(Eval("SchoolType", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="性质">
                <ItemTemplate>
                    <%#GetVisage(Eval("Visage","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="添加时间">
                <ItemTemplate>
                    <%#Eval("Addtime","{0:yyyy-MM-dd}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="相关操作">
                <ItemTemplate>
                    <a href="AddClassRoom.aspx?menu=addroom&schoolid=<%#Eval("ID") %>">添加班级</a>
                    <a href="AddSchool.aspx?menu=edit&id=<%#Eval("ID") %>">修改</a>
                    <asp:LinkButton ID="LinkButton1" CommandName="del1" CommandArgument='<%# Eval("ID") %>' runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="DelBtn" CssClass="btn btn-primary" runat="server" Text="批量删除" OnClick="DelBtn_Click" OnClientClick="if(!IsSelectedId()){alert('请先选则要删除的记录!')} else { return confirm('你确认要删除选定的记录吗？')}" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
