<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_DomPrice, App_Web_0jhes4tp" masterpagefile="~/Manage/Site/OptionMaster.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<title>域名定价</title>
<style>
    #site_main #tab3 td,#site_main #tab3 th,#site_main #fileList th,#site_main #fileList td{ height:30px; line-height:30px;}
    .domname{ border:1px solid #ccc; padding-left:5px;}
    .imgLocal {position:relative;margin-top:10px;}
</style>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 域名定价</p></div>
    <div id="site_main" style="margin-top:15px;">
        <script type="text/javascript">
            $().ready(function () {
                $(":submit").addClass("site_button");
                $(":button").addClass("site_button");
                $(":text").addClass("site_input");
            });
        </script>
        <div id="tab3">
        <div id="viewDiv" runat="server">
            <asp:TextBox runat="server" ID="searchText" />
            <asp:Button runat="server" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" ValidationGroup="search" />
            <asp:Button runat="server" ID="disAddBtn" Text="添加" OnClick="disAddBtn_Click" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="searchText" Display="Dynamic" ErrorMessage="关键词不能为空" ValidationGroup="search" ForeColor="Red"/>
        <ZL:ExGridView runat="server" ID="domPriceEGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="100" RowStyle-CssClass="tdbg" EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%"  OnRowCommand="domPriceEGV_RowCommand" OnRowCancelingEdit="domPriceEGV_RowCancelingEdit" OnPageIndexChanging="mimeEGV_PageIndexChanging" 
            HeaderStyle-HorizontalAlign="Center">
          <Columns>
             <asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true"/>
              <asp:TemplateField HeaderText="域名">
                  <ItemTemplate>
                      <%#Eval("DomName") %>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:TextBox runat="server" ID="eDomName" CssClass="domname" Text='<%#Eval("DomName") %>'></asp:TextBox>
                  </EditItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="价格">
                  <ItemTemplate>
                      <asp:TextBox runat="server" ID="DomPriceText" Text='<%#Eval("DomPrice") %>' 
                          style="text-align:center;" Width="50" TabIndex="1" MaxLength="10" autocomplete="off"/>
                  </ItemTemplate>
                  <EditItemTemplate>
                      <asp:TextBox runat="server" ID="eDomPrice" CssClass="domname" Text='<%#Eval("DomPrice") %>'></asp:TextBox>
                  </EditItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="状态">
                  <ItemTemplate>
                    <%#GetStatus(Eval("Status")) %>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="接口">
                  <ItemTemplate>
                      <%#GetInterFace(Eval("IFSupplier")) %>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField HeaderText="简述" DataField="ProDetail" />
              <asp:TemplateField HeaderText="操作">
                  <ItemTemplate>
                      <a href="?ID=<%#Eval("ID") %>" title="查看详情"><img src="/Plugins/ckfinder/skins/v1/images/toolbar/view.gif" /></a>
                      <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del2" 
                          OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                          <img src="/App_Themes/AdminDefaultTheme/images/del.png" class="imgLocal"/></asp:LinkButton>
                  </ItemTemplate>
<%--                  <EditItemTemplate>
                      <asp:LinkButton runat="server" CommandArgument='<%#Container.DisplayIndex+":"+Eval("ID") %>' CommandName="Renewals"  >确定</asp:LinkButton>
                      <asp:LinkButton runat="server" CommandArgument='<%#Container.DisplayIndex %>' CommandName="Cancel">取消</asp:LinkButton>
                  </EditItemTemplate>--%>
              </asp:TemplateField>
          </Columns>
          <PagerStyle   HorizontalAlign="Center" />
          <RowStyle Height="24px" HorizontalAlign="Center" />
      </ZL:ExGridView>
            <asp:Button runat="server" Text="保存价格修改" ID="saveBtn" OnClick="saveBtn_Click" CssClass="site_button" style="margin-top:5px;"/>
                </div>
        <div id="addDiv" runat="server" visible="false" style="margin-top:10px; margin-bottom:5px;">
            <table>
                <tr><td>域名：</td><td> 
                    <span style="color:green;" runat="server" id="addSpan"><asp:DropDownList runat="server" ID="domNameDP"></asp:DropDownList>
                    注:尚未定价的后缀名</span>
                    <asp:Label runat="server" ID="domNameL" ReadOnly="true" Visible="false"/><!--用于修改-->
               </td></tr>
               <tr><td>价格：</td><td> 
                   <asp:TextBox runat="server" ID="tab2DomPrice" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ControlToValidate="tab2DomPrice" 
                      Display="Dynamic" ErrorMessage="价格不能为空" ValidationGroup="add"/>
                             </td></tr>
                   <tr><td>简述：</td><td><asp:TextBox runat="server" Rows="5" ID="detailText" TextMode="MultiLine" style="width:200px;"/></td></tr>
                <tr><td>接口：</td><td>
                    <asp:DropDownList runat="server" ID="ifListDP">
                        <asp:ListItem Value="0">新网</asp:ListItem>
                        <asp:ListItem Value="1">万网</asp:ListItem>
                    </asp:DropDownList>
                              </td></tr>
                 <tr><td>状态：</td><td>
                     <asp:CheckBox runat="server" ID="statusChk" Checked="true" Text="启用"/>
                                 </td></tr>
                <tr><td>操作：</td><td>
                    <asp:Button runat="server" ID="tab2AddBtn" Text="添加" OnClick="tab2AddBtn_Click" ValidationGroup="add" />
                    <input type="button" id="returnBtn" value="返回" onclick="location = 'DomPrice.aspx';"/>
                                </td></tr>
                </table>
        </div>
    </div>
    </div>
</asp:Content>