<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_AuthorManage, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>作者管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />

</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">	<span>内容管理</span>&gt;&gt;<span><a href="SourceManage.aspx">内容参数</a></span>&gt;&gt; <span>作者管理</span>
    &nbsp;&nbsp;<span><a href="AddSource.aspx"  style="color:red;" target="main_right">[添加来源]</a></span>&nbsp;&nbsp;<span><a href="Author.aspx" style="color:red;" target="main_right">[添加作者]</a></span>&nbsp;&nbsp;<span><a href="AddKeyWord.aspx" style="color:red;" target="main_right">[添加关键字]</a></span></div><!--end color-->
<div class="clearbox"></div>    
        <ZL:ExGridView RowStyle-HorizontalAlign="Center"  CssClass="table_li table-border" ID="EGV" DataKeyNames="ID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" OnPageIndexChanging="GridView1_PageIndexChanging" EmptyDataText="当前没有信息">
            <Columns>
                <asp:TemplateField HeaderText="选中">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCheckBox" runat="server" />
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" />
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="序号">
                 <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                  </asp:BoundField>                  
                <asp:TemplateField HeaderText="作者名称">
                   <ItemTemplate>
                        <a href="Author.aspx?Action=Modify&AUId=<%#Eval("ID")%>">
                            <%# DataBinder.Eval(Container.DataItem,"Name")%>
                        </a>
                    </ItemTemplate>
                     <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="作者分类">
                <HeaderStyle/>
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem, "Type")%>
                    </ItemTemplate>
                     <ItemStyle CssClass="tdbg" />
                </asp:TemplateField>                     
                <asp:TemplateField HeaderText="操作">
                <HeaderStyle Width="19%" />
                <ItemTemplate>
                    <a href='Author.aspx?Action=Modify&AUId=<%# Eval("ID")%>' >修改</a>
                    <a href="javascript:if(confirm('你确定要删除吗?')) window.location.href='AuthorManage.aspx?AUId=<%# Eval("ID")%>';">删除</a> 
                </ItemTemplate>
                 <ItemStyle CssClass="tdbg" />
                </asp:TemplateField>
            </Columns>
          <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
 <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
 <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
 <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
        </ZL:ExGridView>
         <div class="clearbox"></div>                   
    <table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
        <tr>
            <td style="height: 21px">                   
              <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="全选" />
                &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<asp:Button
                    ID="btndelete" class="C_input" style="width:110px;"  runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}"
                    Text="删除选定作者" OnClick="btndelete_Click" />
                <input name="Cancel" type="button" style="width:127px;"  class="C_input" class="inputbutton" id="Cancel" value="添加一个新作者" onclick="javascript:window.location.href='Author.aspx'" /></td>
        </tr>
        <tr>
            <td style="height: 21px">
            </td>
        </tr>
    </table>           
</form>
</body>
</html>