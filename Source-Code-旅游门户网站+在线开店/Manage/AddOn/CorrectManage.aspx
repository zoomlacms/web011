<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.CorrectManage, App_Web_0sth0hzm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>纠错报告</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation"><span>内容管理</span>&gt;&gt;<span><a href="SourceManage.aspx">内容参数</a></span>&gt;&gt;<span>纠错报告</span>
    &nbsp;&nbsp;<span><a href="AddSource.aspx" style="color:red;" target="main_right">[添加来源]</a></span>&nbsp;&nbsp;<span><a href="Author.aspx" style="color:red;" target="main_right">[添加作者]</a></span>&nbsp;&nbsp;<span><a href="AddKeyWord.aspx" style="color:red;" target="main_right">[添加关键字]</a></span></div>

<div class="divline"  class="l_input" style="height:25px;">
     <b style="float:left"> 根据标题搜索：</b>
    <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr><td> 
   </td><td><asp:TextBox ID="TxtTitle" runat="server" BorderColor="#fff" CssClass="l_inpnon"></asp:TextBox>
        </td><td>
        <asp:Button ID="Button1"  class="C_sch" runat="server" Text="" OnClick="Button1_Click" />
            </td></tr></table>
</div>
<div class="clearbox"></div>
<asp:GridView ID="Gdv" DataKeyNames="CorrectID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="20" Width="100%"  Height="20px"
    CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" GridLines="None" 
    OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" EmptyDataText="无相关数据">
    <Columns>
        <asp:TemplateField HeaderText="选中">                       
            <ItemTemplate>
            <asp:CheckBox ID="chkSel" runat="server" />
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            <HeaderStyle Width="5%" />
        </asp:TemplateField>
        <asp:BoundField DataField="CorrectID" HeaderText="ID">
        <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        <HeaderStyle Width="5%" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="网页标题">
            <HeaderStyle Width="20%" />
            <ItemTemplate>
            <a href="<%#Eval("CorrectUrl")%>" title="点击查看出错页" target="_parent"><%#Eval("CorrectTitle")%></a>
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="left" />                        
        </asp:TemplateField>
        <asp:BoundField DataField="CorrectDetail" HeaderText="详细信息">
        <ItemStyle  CssClass="tdbg" HorizontalAlign="left" />
        <HeaderStyle Width="30%" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="错误类型">
            <HeaderStyle Width="10%" />
            <ItemTemplate>
            <%# GetCTitle(Eval("CorrectType", "{0}"))%>
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />                        
        </asp:TemplateField>
        <asp:BoundField DataField="CorrectPer" HeaderText="报告人">
        <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        <HeaderStyle Width="10%" />
        </asp:BoundField>
        <asp:BoundField DataField="PerEmail" HeaderText="报告人Email">
        <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        <HeaderStyle Width="10%" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="操作">                
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("CorrectID") %>' OnClientClick="return confirm('你确定将该数据删除吗？')">删除</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
    <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
     <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
     <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
     <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
     <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
</asp:GridView>
<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />
<asp:Button ID="btnDeleteAll" style="width:110px;"  class="C_input" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click"
    OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}"  UseSubmitBehavior="true" />
</form>
</body>
</html>