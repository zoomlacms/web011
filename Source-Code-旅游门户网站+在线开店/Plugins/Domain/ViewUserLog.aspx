<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_User_ViewUserLog, App_Web_cpqz3j25" masterpagefile="~/Manage/Site/OptionMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>用户操作日志</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
     <div id="m_site"><p> 站群中心 >>用户中心 >>用户操作日志</p></div>

    <div id="site_main">
        <div id="tab3">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" RowStyle-CssClass="tdbg"
				EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="border"
                EmptyDataText="无日志记录.">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%#Eval("Type") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="详情" DataField="Remind"/>
                   <asp:TemplateField HeaderText="时间">
                       <ItemTemplate>
                           <%#Eval("CreateDate","{0:yyyy年MM月dd日 hh:mm}") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
				<RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
</asp:Content>