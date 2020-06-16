<%@ page language="C#" autoeventwireup="true" inherits="manage_Flex_FlexItemManage, App_Web_aljadfmd" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>Flex管理系统</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="U_PageID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="chkSel" title="" value='<%#Eval("U_PageID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="U_PageID" />
            <asp:BoundField HeaderText="页面页码" DataField="U_Pagenum" />
            <asp:TemplateField HeaderText="所属产品">
                <ItemTemplate>
                    <%#GetPClass(Eval("U_PClass"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属分类">
                <ItemTemplate>
                    <%#GetClass(Eval("U_Class"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddItempage.aspx?menu=edit&editid=<%#Eval("U_PageID") %>" >修改</a>
                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("U_PageID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" CommandName="del1" runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Button3" class="btn btn-primary" runat="server"  OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" Text="批量删除" onclick="Button3_Click"  />
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
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
