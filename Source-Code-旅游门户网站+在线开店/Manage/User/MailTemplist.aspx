<%@ page language="C#" autoeventwireup="true" inherits="manage_User_MailTemplist, App_Web_aunhunhk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>邮件模板</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation"> 后台管理&gt;&gt;用户管理&gt;&gt;<a href="MessageSend.aspx" >信息发送</a>&gt;&gt;邮件模板 [<a href="AddMailTemp.aspx">添加邮件模板</a>]</div>
<div class="divbox" id="nocontent" runat="server">
      <div style="width: 100%; height: 19px; text-align: center;" class="title"> 邮件模板</div>
      暂无模板</div>
 <asp:GridView ID="GridView1" runat="server" Width="100%"  AutoGenerateColumns="False"  OnRowCommand="Row_Command"  CssClass="border" >
      <Columns>
      <asp:TemplateField HeaderText="选择">
        <ItemTemplate>
          <asp:CheckBox ID="cheCk" runat="server" />
        </ItemTemplate>
        <ItemStyle CssClass="tdbg" Width="5%" HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="模板名称">
        <ItemTemplate> <a href="AddMailTemp.aspx?id=<%#Eval("ID")%>" title='<%# Eval("TempName")%>'> <%# Eval("TempName")%></a> </ItemTemplate>
        <ItemStyle CssClass="tdbg" Width="20%" HorizontalAlign="Center" />
      </asp:TemplateField>
           <asp:TemplateField HeaderText="缩略图">
        <ItemTemplate>  <img src="<%# Eval("Pic")%>" alt="缩略图" width="50" height="50" onerror="this.src='/UploadFiles/nopic.gif';"/></ItemTemplate>
        <ItemStyle CssClass="tdbg" Width="10%" HorizontalAlign="Center" />
      </asp:TemplateField>
      
       <asp:TemplateField HeaderText="模板类型">
        <ItemTemplate> <a href="MailTemplist.aspx?type=<%#Eval("Type")%>" title='<%# Eval("TempName")%>'>  <%# GetType(Convert.ToInt32(Eval("Type")))%> </a></ItemTemplate>
        <ItemStyle CssClass="tdbg" Width="8%" HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="创建人">
        <ItemTemplate> <%# Eval("AddUser")%> </ItemTemplate>
        <ItemStyle CssClass="tdbg" Width="8%" HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="创建日期">
        <ItemTemplate> <%# Eval("CreateTime", "{0:yyyy-MM-dd}")%> </ItemTemplate>
        <ItemStyle CssClass="tdbg" Width="13%" HorizontalAlign="Center" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="操作">
        <ItemTemplate>
          <asp:LinkButton ID="View" runat="server" CommandName="View" CommandArgument='<%# Eval("ID")%>'>预览</asp:LinkButton>
          <asp:LinkButton ID="update" runat="server" CommandName="update" CommandArgument='<%# Eval("ID")%>'>修改</asp:LinkButton>
          <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此模板吗？');"  CommandArgument='<%# Eval("ID")%>' Text="删除"></asp:LinkButton>
        </ItemTemplate>
        <ItemStyle CssClass="tdbg" Width="9%" HorizontalAlign="Center" />
      </asp:TemplateField>
      </Columns>
      <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
      <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
      <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None"  Height="30px" Font-Overline="False" />
    </asp:GridView> 
    <table width="100%" style=" text-align:center;">
      <tr class="tdbg">
        <td style="height: 22px; text-align: center;" colspan="10" class="tdbgleft"><span style="text-align: center">共
          <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
          条数据
          <asp:Label ID="Toppage" runat="server" Text="" />
          <asp:Label ID="Nextpage" runat="server" Text="" />
          <asp:Label ID="Downpage" runat="server" Text="" />
          <asp:Label ID="Endpage" runat="server" Text="" />
          页次：
          <asp:Label ID="Nowpage" runat="server" Text="" />
          /
          <asp:Label ID="PageSize" runat="server" Text="" />
          页
          <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" Text="10" CssClass="l_input" Width="16px" Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
          条数据/页 转到第
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
          页
          <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
          </span></td>
      </tr>
    </table>
     
</form>
</body>
</html>
