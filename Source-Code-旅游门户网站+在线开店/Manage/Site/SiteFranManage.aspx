<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_SiteFranManage, App_Web_5arvbvnz" masterpagefile="~/Manage/Site/SiteMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>网站管理</title>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 网站管理</p></div>
    <div id="site_main" style="margin-left:2%;">
        <table>
            <tr>
                <td>网站名称：</td>
                <td><asp:Label runat="server" ID="sName" /></td>
            </tr>
            <tr>
                <td>启用时间：</td>
                <td><asp:TextBox runat="server" onclick="WdatePicker();" ID="StartDate" /></td>
            </tr>
            <tr>
                <td>到期时间：</td>
                <td><asp:TextBox runat="server" onclick="WdatePicker();" ID="EndDate" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button runat="server" ID="editBtn" OnClick="editBtn_Click" Text="修改" CssClass="site_button" />
                    <asp:Button runat="server" ID="cancelBtn" Text="取消" CssClass="site_button" />
                </td>
            </tr>
        </table>
    <div id="tab3">
    <div style="width:100%">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="True" RowStyle-CssClass="tdbg" 
            MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1" Width="100%" 
            GridLines="None" EnableTheming="False" EmptyDataText="没有日志！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true"/>
                <asp:TemplateField HeaderText="站点名">
                    <ItemTemplate>
                        <%#GetSiteName(Eval("SiteID").ToString()) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型">
                    <ItemTemplate>
                        <%#GetType(Eval("Type")as string) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="说明" DataField="Remind"/>
                <asp:BoundField HeaderText="操作时间" DataField="CreateDate" />
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>  
    </div> 
    </div>
    </div>
</asp:Content>
