<%@ page language="C#" autoeventwireup="true" inherits="FreeHome.Manage.ProductManage, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>虚拟商品列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered">
            <tr>
                <td colspan="2" align="center">虚拟商品列表</td>
            </tr>
            <tr>
                <td style="height: 26px">
                    <asp:GridView ID="gvGrouplist" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="ID" EmptyDataText="无相关信息！！">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input id="pidCheckbox" name="pidCheckbox" type="checkbox" value='<%#DataBinder.Eval(Container.DataItem,"ID")  %>' class="checkbox" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="商品缩略图">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="54px" Width="60px" ImageUrl='<%#GetPic(DataBinder.Eval(Container.DataItem,"ProductPic").ToString()) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ProductName" HeaderText="商品名称">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" HeaderText="商品价格">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Addtime" HeaderText="添加时间">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    [<asp:LinkButton ID="Editbtn" runat="server" CausesValidation="False" OnClick="Editbtn_Click">查看详细信息</asp:LinkButton>]
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center"  />
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td height="24" colspan="5" align="center" class="tdbgleft">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
                    <asp:Label ID="pagess" runat="server" Text="" />个/页
                    转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>页
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_DeleteRecords" class="btn btn-primary" runat="server" OnClientClick="return judgeSelect();" Text="删除选中记录" OnClick="btn_DeleteRecords_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        //根据传入的checkbox的选中状态设置所有checkbox的选中状态
        //function selectAll(obj) {
        //    var allInput = document.getElementsByTagName("input");
        //    //alert(allInput.length);
        //    var loopTime = allInput.length;
        //    for (i = 0; i < loopTime; i++) {
        //        //alert(allInput[i].type);
        //        if (allInput[i].type == "checkbox") {
        //            allInput[i].checked = obj.checked;
        //        }
        //    }
        //}
        //判断是否选中记录，用户确认删除
        function judgeSelect() {
            var result = false;
            var allInput = document.getElementsByTagName("input");
            var loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                if (allInput[i].checked) {
                    result = true;
                    break;
                }
            }
            if (!result) {
                alert("请先选则要删除的记录！");
                return result;
            }
            result = confirm("你确认要删除选定的记录吗？");
            return result;
        }
        $().ready(function () {
            $("#gvGrouplist tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "pidCheckbox");
            });
         })
    </script>
    <style>
        th{ text-align:center;}
    </style>
</asp:Content>
