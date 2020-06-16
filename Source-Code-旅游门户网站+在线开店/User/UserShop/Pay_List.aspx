<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_Pay_List, App_Web_vkx1tc11" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>支付信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">支付记录浏览<a href="Pay_Add.aspx">[添加支付平台]</a></li>
    </ol>
    <asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="PaymentID" CssClass="table table-bordered table-striped table-hover" OnRowDataBound="Egv_RowDataBound" OnRowCommand="Lnk_Click" Width="100%">
        <Columns>
            <asp:BoundField DataField="PaymentID" HeaderText="接口">
                <HeaderStyle Width="6%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="用户">
                <HeaderStyle Width="6%" />
                <ItemTemplate>
                    <%#(Eval("UserID"))%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="PaymentNum" HeaderText="支付序号">
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
        </Columns>
    </asp:GridView>
    <span style="text-align: center" class="text-center center-block">共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
        <asp:Label ID="Toppage" runat="server" Text="" />
        <asp:Label ID="Nextpage" runat="server" Text="" />
        <asp:Label ID="Downpage" runat="server" Text="" />
        <asp:Label ID="Endpage" runat="server" Text="" />页次：
        <asp:Label ID="Nowpage" runat="server" Text="" />/
        <asp:Label ID="PageSize" runat="server" Text="" />页
        <asp:Label ID="pagess" runat="server" Text="" />
        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" Height="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
        条数据/页 转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
        </asp:DropDownList>
        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
    </span>
</asp:Content>
