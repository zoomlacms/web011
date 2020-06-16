<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.PaymentList, App_Web_0sth0hzm" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>支付信息</title>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation">后台管理&gt;&gt;系统管理&gt;&gt;支付信息管理</div>
<ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="PaymentID"  AllowPaging="true" AllowSorting="true" OnPageIndexChanging="Egv_PageIndexChanging" OnRowDataBound="Egv_RowDataBound" OnRowCommand="Lnk_Click" Width="100%">
    <Columns>            
        <asp:BoundField DataField="PaymentID" HeaderText="ID">
            <HeaderStyle Width="6%" />
            <ItemStyle  HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="UserName" HeaderText="会员">
            <HeaderStyle Width="6%" />
            <ItemStyle  HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="PaymentNum" HeaderText="支付序号">
            <HeaderStyle Width="10%" />
            <ItemStyle  HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="PayPlatName" HeaderText="支付平台">
            <HeaderStyle Width="10%" />
            <ItemStyle  HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="MoneyPay" HeaderText="金额">
            <HeaderStyle Width="6%" />
            <ItemStyle  HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="MoneyTrue" HeaderText="实际金额">
            <HeaderStyle Width="6%" />
            <ItemStyle  HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="交易状态">
            <HeaderStyle Width="6%" />
            <ItemTemplate>  
                <%# GetStatus(Eval("Status","{0}"))%>    
            </ItemTemplate>
            <ItemStyle  HorizontalAlign="Center" />         
        </asp:TemplateField>
        <asp:TemplateField HeaderText="处理结果">
            <HeaderStyle Width="6%" />
            <ItemTemplate>  
                <%# GetCStatus(Eval("CStatus","{0}"))%>    
            </ItemTemplate>
            <ItemStyle  HorizontalAlign="Center" />          
        </asp:TemplateField>            
        <asp:TemplateField HeaderText="完成时间">
            <HeaderStyle Width="14%" />
            <ItemTemplate>  
                <%# Eval("SuccessTime")%>    
            </ItemTemplate>
            <ItemStyle  HorizontalAlign="Center" />          
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作" >
            <ItemTemplate>                     
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Doit" CommandArgument='<%# Eval("PaymentID") %>'>增加短信量</asp:LinkButton>
              </ItemTemplate>
            <ItemStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
    </Columns>
    <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
     <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
     <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
</ZL:ExGridView>
</asp:Content>
