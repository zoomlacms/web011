<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.UserShopManage.DeliverType, App_Web_2pfg00wt" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>送货方式设置</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无信息！！">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="送货方式名称" DataField="deliname" />
            <asp:BoundField HeaderText="送货方式简介" DataField="deliinfo" />
            <asp:TemplateField HeaderText="运费">
                <ItemTemplate>
                    <%#getmoney( Eval("delitype","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="是否默认">
                <ItemTemplate>
                    <%#getinfo( Eval("selectto","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="已启用">
                <ItemTemplate>
                    <%#getinfo( Eval("isuse","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandName="SetDef" CommandArgument='<%# Eval("ID") %>' runat="server"><%#showselect( Eval("selectto","{0}")) %></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" CommandName="Start" CommandArgument='<%# Eval("ID") %>' runat="server"><%#showuse( Eval("IsUse","{0}")) %></asp:LinkButton>
                    <a href="AddDeliverType.aspx?menu=edit&id=<%#Eval("id") %>">修改</a>
                    <asp:LinkButton ID="LinkButton1" CommandName="Del" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    说明：“禁用”某送货方式后，前台订购时将不再显示此送货方式，但已有订单中仍然显示。
</asp:Content>