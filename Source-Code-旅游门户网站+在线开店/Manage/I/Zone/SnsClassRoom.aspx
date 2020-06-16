<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_SnsClassRoom, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>班级信息管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="chkSel" title="" value='<%#Eval("RoomID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="RoomID" />
            <asp:TemplateField HeaderText="班级名称">
                <ItemTemplate>
                    <a href="AddClassRoom.aspx?menu=edit&id=<%#Eval("RoomID") %>"><%#Eval("RoomName")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="学校名称">
                <ItemTemplate>
                    <%#GetSchool(Eval("SchoolID","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建人(管理员)">
                <ItemTemplate>
                    <%#GetUser(Eval("CreateUser","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="添加时间">
                <ItemTemplate>
                    <%#Eval("Creation","{0:yyyy-MM-dd}")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="相关操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("RoomID") %>' CommandName="shenhe" runat="server"><%# Getshenhe(Eval("IsTrue","{0}")) %></asp:LinkButton>
                    <a href="AddClassRoom.aspx?menu=edit&id=<%#Eval("RoomID") %>">修改</a>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("RoomID") %>' CommandName="del1" runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Button1_Click" OnClientClick="if(!IsSelectedId()){alert('请选择操作项');return false;}" Text="批量删除" />
    <asp:Button ID="Button2" class="btn btn-primary" runat="server" OnClick="Button2_Click" OnClientClick="if(!IsSelectedId()){alert('请选择操作项');return false;}" Text="批量审核" />
    <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClick="Button3_Click" OnClientClick="if(!IsSelectedId()){alert('请选择操作项');return false;}" Text="取消审核" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })
        function IsSelectedId()
        {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
