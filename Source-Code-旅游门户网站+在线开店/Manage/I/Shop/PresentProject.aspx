﻿<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.PresentProject, App_Web_2afsdgkd" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>促销方案管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无相关信息！！">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="方案名称" DataField="Promoname" />
            <asp:TemplateField HeaderText="价格区间">
                <ItemTemplate>
                    <%# remoney(DataBinder.Eval(Container, "DataItem.Pricetop", "{0}"), DataBinder.Eval(Container, "DataItem.Priceend", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="有效期">
                <ItemTemplate>
                    <%# ontimes(DataBinder.Eval(Container, "DataItem.Promostart", "{0}"), DataBinder.Eval(Container, "DataItem.Promoend", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="促销内容">
                <ItemTemplate>
                    <%# rePresentmoney(DataBinder.Eval(Container, "DataItem.GetPresent", "{0}"), DataBinder.Eval(Container, "DataItem.Presentmoney", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddPresentProject.aspx?menu=edit&id=<%#Eval("id") %>">修改</a>
                    <asp:LinkButton ID="LinkButton1" CommandName="del1" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function getinfo(id) {
            location.href = "AddPresentProject.aspx?menu=edit&id=" + id + "";
        }
    </script>
</asp:Content>