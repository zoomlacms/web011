<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.I.Pay.PaymentList, App_Web_nzaiysvq" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑在线支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" AllowPaging="true"
         AllowSorting="true" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="PaymentID"
         OnRowDataBound="Egv_RowDataBound" OnRowCommand="Lnk_Click"
         CssClass="table table-striped table-bordered table-hover" Width="100%">
        <Columns>
            <asp:BoundField DataField="PaymentID" HeaderText="ID">
                <HeaderStyle Width="6%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="会员">
                <HeaderStyle Width="6%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PaymentNum" HeaderText="支付序号">
                <HeaderStyle Width="10%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PayPlatName" HeaderText="支付平台">
                <HeaderStyle Width="10%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MoneyPay" HeaderText="金额">
                <HeaderStyle Width="6%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="MoneyTrue" HeaderText="实际金额">
                <HeaderStyle Width="6%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="交易状态">
                <HeaderStyle Width="6%" />
                <ItemTemplate>
                    <%# GetStatus(Eval("Status","{0}"))%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="处理结果">
                <HeaderStyle Width="6%" />
                <ItemTemplate>
                    <%# GetCStatus(Eval("CStatus","{0}"))%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="完成时间">
                <HeaderStyle Width="14%" />
                <ItemTemplate>
                    <%# Eval("SuccessTime")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Doit" CommandArgument='<%# Eval("PaymentID") %>'>增加短信量</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
