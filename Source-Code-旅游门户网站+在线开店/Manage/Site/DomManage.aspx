<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_DomManage, App_Web_5arvbvnz" masterpagefile="~/Manage/Site/OptionMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>域名管理</title>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 域名管理</p></div>
    <div id="site_main" style="margin-top:15px;">
    <div id="tab3">
            域名搜索：<asp:TextBox runat="server" CssClass="site_input" ID="keyWord"  />
                     <asp:Button runat="server" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" CssClass="site_button"/>
                     <input type="button" value="添加"  onclick="location.href = 'AddDomain.aspx';" class="site_button"/>
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" RowStyle-CssClass="tdbg"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand"
             CellPadding="2" CellSpacing="1" Width="100%" OnRowCancelingEdit="EGV_RowCancelingEdit" PageSize="10"
            GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
                <Columns>
                   <%-- <asp:BoundField HeaderText="ID" DataField="ID" />--%>
                     <asp:BoundField HeaderText="序号" DataField="ID" ReadOnly="true" />
                  <%--   <asp:BoundField HeaderText="站点ID" DataField="SiteID" ReadOnly="true" />--%>
                       <asp:TemplateField HeaderText="域名">
                        <ItemTemplate>
                            <a href="<%# "http://"+Eval("DomName") %>"  target="_blank" title="打开站点"><%#Eval("DomName") %></a>
                        </ItemTemplate>
                           <EditItemTemplate>
                               <asp:Label runat="server" ID="lDomain" Text='<%#Eval("DomName").ToString().ToLower().Replace("www.","") %>'></asp:Label>
                           </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="所属用户" DataField="UserName"/>
<%--                     <asp:TemplateField HeaderText="站点名">
                        <ItemTemplate>
                            <a href="SiteDetail.aspx?SiteName=<%#Server.UrlEncode(Eval("SiteName") as string) %>" target="_blank" title="站点详情"><%#Eval("SiteName") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="到期日">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy年M月d日}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="证书">
                        <ItemTemplate>
                        <a href="/Plugins/Domain/ViewCert.aspx?id=<%#Eval("ID") %>" target="_viewCert">查看证书</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="续费多久" Visible="false">
                        <ItemTemplate>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <select name="periodDP">
                                <option value="1">1年</option>
                                <option value="2">2年</option>
                                <option value="3">3年</option>
                                <option value="4">4年</option>
                                <option value="5">5年</option>
                            </select>
                        </EditItemTemplate>
                    </asp:TemplateField>
                   <%--  <asp:BoundField HeaderText="到期日期" DataField="EndDate" />--%>
                     <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Container.DisplayIndex %>' CommandName="Edit2">续费</asp:LinkButton>
                           <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("ID")%>' CommandName="Details">查看详情</asp:LinkButton>
                        </ItemTemplate>
                         <EditItemTemplate>
                             <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%#Container.DisplayIndex %>' CommandName="Save" OnClientClick="return confirm('你确定要续费该域名吗');">确定</asp:LinkButton>
                             <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Container.DisplayIndex %>' CommandName="Cancel">取消</asp:LinkButton>
                         </EditItemTemplate>
                     </asp:TemplateField>
                </Columns>
        </ZL:ExGridView> 
        </div>
     </div>
</asp:Content>