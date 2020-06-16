﻿<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.MoneyManage, App_Web_enu4lwhk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>货币管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="Flow" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("Flow") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderStyle-Width="15%" HeaderText="货币代码" DataField="Money_code" />
            <asp:BoundField HeaderStyle-Width="15%" HeaderText="货币名称" DataField="Money_descp" />
            <asp:BoundField HeaderStyle-Width="15%" HeaderText="货币符号" DataField="Money_sign" />
            <asp:TemplateField HeaderText="当前汇率">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <%#Eval("Money_rate","{0:0.0000}")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="默认货币">
                <HeaderStyle Width="15%" />
                <ItemTemplate>
                    <%#(Eval("Is_flag").ToString()=="1")?"是":"否"%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddMoney.aspx?menu=edit&id=<%#Eval("Flow") %>">修改</a>
                    <asp:LinkButton ID="LinkButton1" CommandName="del1" CommandArgument='<%# Eval("Flow") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Button1" class="btn btn-primary" Text="删除选中货币" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" OnClick="Button1_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        function getinfo(id) {
            location.href = "AddMoney.aspx?menu=edit&id=" + id + "";
        }
    </script>
</asp:Content>
