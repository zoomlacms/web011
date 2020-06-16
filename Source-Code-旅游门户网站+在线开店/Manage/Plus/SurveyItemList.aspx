<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyItemList, App_Web_ka5t45ft" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>问卷投票问题列表</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理&gt;&gt;<a href="SurveyManage.aspx">问卷投票管理</a>&gt;&gt;问卷投票问题列表
   <span style="padding-left: 80px;"> 
          问卷投票名：<asp:Label ID="Label1" runat="server" Text="Label" ForeColor="red"></asp:Label>&nbsp;&nbsp;&nbsp; [<asp:Label ID="LablAdd" runat="server">添加问题</asp:Label>]
            <asp:HiddenField ID="HdnSID" runat="server" />
    </span>
</div>
<div class="clear"></div>  
<asp:GridView ID="Gdv" RowStyle-HorizontalAlign="Center" DataKeyNames="QID" CellPadding="2" CellSpacing="1" BackColor="White" CssClass="border" GridLines="None" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" OnRowDataBound="Gdv_RowDataBound">
                <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
            <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2"/>
        <Columns>                
            <asp:BoundField DataField="QID" HeaderText="序号">
            <ItemStyle   HorizontalAlign="Center" />
            <HeaderStyle Width="5%" />
            </asp:BoundField>  
            <asp:TemplateField HeaderText="问题标题" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                   <a href="SurveyItem.aspx?SID=<%=Request["SID"] %>&QID=<%# Eval("QID") %>" > <%# Eval("QTitle") %></a>
                </ItemTemplate>
            </asp:TemplateField>                                          
            <asp:TemplateField HeaderText="类别">
                <ItemTemplate>                                
                   <%# GetQType(Eval("TypeID","{0}"),Eval("QID", "{0}")) %>
                </ItemTemplate>
                 <ItemStyle  HorizontalAlign="Center" />
                 <HeaderStyle Width="10%" />
            </asp:TemplateField>                                                
            <asp:TemplateField HeaderText="操作">                
            <ItemTemplate>    
                 <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("QID") %>'>修改</asp:LinkButton> |                 
                <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("QID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton> | 
                <asp:LinkButton ID="lbtnMoveUp" runat="server" CommandName="MovePre" CommandArgument='<%# Eval("QID") %>'>上移</asp:LinkButton> |
                <asp:LinkButton ID="lbtnMoveDown" runat="server" CommandName="MoveNext" CommandArgument='<%# Eval("QID") %>'>下移</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
            <SelectedRowStyle BackColor="#def2dd" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="tdbg" BorderStyle="None"/>
            <HeaderStyle Font-Bold="True" ForeColor="#def2dd" BorderStyle="None" Height="30px" Font-Overline="False" />
            <PagerTemplate>
                <%=lang.LF("共")%>
                <asp:Label ID="lblTotalCnt" runat="server" Text="Label"></asp:Label>
                    <%=lang.LF("条数据")%>&nbsp;&nbsp;
                        <asp:LinkButton ID="lbtnFirstPage" CommandArgument="First" CommandName="Page"  runat="server">首页</asp:LinkButton>&nbsp;
                       <asp:LinkButton ID="lbtnPrePage" CommandArgument="Prev" CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>" runat="server">上一页</asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnNextPage" CommandArgument="Next" CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"  runat="server">下一页</asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnLastPage" CommandArgument="Last" CommandName="Page"  runat="server">尾页</asp:LinkButton>&nbsp; &nbsp;
                        <%=lang.LF("页次")%>：
                        <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>/<%# ((GridView)Container.NamingContainer).PageCount %>                        
                    <%=lang.LF("页")%>&nbsp; &nbsp;
                                <asp:Label ID="lblPages" runat="server" Text="" />
                    <%=lang.LF("每页显示：")%>
                    <asp:TextBox ID="txtPageSize" runat="server" AutoPostBack="true" class="l_input" Width="30px" ToolTip="所输入的数据小于100" Text="<%# ((GridView)Container.NamingContainer).PageSize %>"></asp:TextBox>
                    <%=lang.LF("条数据")%> &nbsp; &nbsp;
                                <%=lang.LF("转到第")%>
                    <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <%=lang.LF("页")%> &nbsp; &nbsp;
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPageSize" ErrorMessage="数据不合法！" Type="Integer" MaximumValue="100" MinimumValue="1"></asp:RangeValidator>
            </PagerTemplate>
        </asp:GridView>
</form>
</body>
</html>