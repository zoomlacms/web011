<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="Space_SpaceManage, App_Web_4di4uvez" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>我的聚合页</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="us_topinfo" style="width:97%">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的聚合</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 

    <div class="cleardiv"> </div>
  </div>


  <div class="cleardiv"> </div>
  <ZL:ExGridView ID="EGV" runat="server" AllowPaging="true" class="table table-bordered table-hover table-striped" OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="10" OnRowCommand="Lnk_Click" GridLines="None" OnRowDataBound="Egv_RowDataBound"  >
    <Columns>
    <asp:TemplateField HeaderText="选择">
      <ItemTemplate>
        <asp:CheckBox ID="chkSel" runat="server" />
      </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:BoundField DataField="GeneralID" HeaderText="ID">
      <HeaderStyle Width="6%" />
      <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:TemplateField HeaderText="标题">
      <HeaderStyle Width="40%" />
      <ItemTemplate> <a href='/User/Content/ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'> <%# Eval("Title")%></a> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="状态">
      <ItemTemplate> <%# GetStatus(Eval("Status", "{0}")) %> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="已生成">
      <ItemTemplate> <%# GetCteate(Eval("IsCreate", "{0}"))%> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="操作">
      <ItemTemplate> <a href='/User/Content/ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'>预览</a>&nbsp;&nbsp;<a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank">访问</a>
        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>'>修改</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"><%# GetIsDe(Eval("Status", "{0}")) %></asp:LinkButton>
      </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    </Columns>
    <PagerStyle HorizontalAlign="Center" />
  </ZL:ExGridView>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>