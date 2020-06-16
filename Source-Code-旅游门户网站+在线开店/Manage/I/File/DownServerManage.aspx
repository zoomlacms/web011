<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_DownServerManage, App_Web_i0cm0h5o" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>下载服务器管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:GridView ID="EGV" CssClass="table table-striped table-bordered table-hover" DataKeyNames="ServerID" runat="server" AutoGenerateColumns="False" AllowPaging="True"
       PageSize="6" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="Egv_RowDataBound">
    <Columns>
    <asp:TemplateField HeaderText="选中" HeaderStyle-Height="24" ItemStyle-Height="22">
      <ItemTemplate>
        <asp:CheckBox ID="SelectCheckBox" runat="server" />
      </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:BoundField DataField="ServerID" HeaderText="序号">
      <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:TemplateField HeaderText="服务器名">
      <ItemTemplate> <%# DataBinder.Eval(Container.DataItem, "ServerName")%> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="服务器LOGO">
      <HeaderStyle />
      <ItemTemplate> <%#Getico(Eval("ServerLogo","{0}"))%> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="显示方式">
      <ItemTemplate> <%#Convert.ToInt32(Eval("ShowType"))==0?"显示名称":"显示LOGo"%> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="服务器地址">
      <ItemTemplate> <%#Eval("ServerUrl")%> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="操作">
      <HeaderStyle Width="19%" />
      <ItemTemplate> <a href='DownServer.aspx?Action=Modify&DSId=<%# Eval("ServerID")%>'>修改</a> <a href="javascript:if(confirm('你确定要删除吗?')) window.location.href='DownServerManage.aspx?SId=<%# Eval("ServerID")%>';"> 删除</a> </ItemTemplate>
      <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    </Columns>
  </asp:GridView>
  <div class="clearbox"> </div>
  <table  class="table table-striped table-bordered table-hover" id="sleall">
    <tr>
      <td style="height: 24px"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"  Text="全选" />
        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btndelete" class="btn btn-primary" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="批量删除" OnClick="btndelete_Click" />
        &nbsp; </td>
    </tr>
  </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>