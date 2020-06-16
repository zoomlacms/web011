<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_DocManage, App_Web_wx5dt34e" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文档管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $("tr:gt(1):not(:last)").addClass("tdbg");
        $("tr:gt(1):not(:last)").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
        $("tr:gt(1):not(:last)").dblclick(function () { v = $(this).find("[name='idChk']").val(); location = "Drafting.aspx?Edit=1&appID=" + v; });//绑定双击事件
    });
    function displayToolbar() {
        $("#toolbar1").toggle("fast");
    }
</script>
</head>
<body>
<form id="form1" runat="server">
    <div class="r_navigation" style="font-size:12px;height:25px;">
        <div style="float:left;">后台管理&gt;&gt;OA配置 &gt;&gt;文档管理&gt;&gt;<asp:Label runat="server" ID="nodeNameL"></asp:Label>  <a href="AddContent.aspx" style="color:red;">[添加新文档]</a></div>
        <input type="button" class="C_schmor" style="float:left; margin-top:4px;margin-left:4px;" title="显示扩展搜索" value="" onclick="displayToolbar()" />
        <div id="toolbar1" style="display:none;margin-left:8px; float:left;">
            <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input">
                <tr >
                    <td>
                        <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" BorderColor="#fff" CssClass="l_inpnon" />&nbsp;
                        <asp:Button runat="server" CssClass="C_sch" ID="searchBtn" />
                    </td>
                </tr>
            </table>
        </div>
    </div><div class="clear"></div>
    <div style="margin-bottom:5px;">
        <ZL:ExGridView runat="server" ID="EGV" DataKeyNames="GeneralID" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%" CssClass="table border" RowStyle-CssClass="tdbg" AllowUserToOrder="true" BackColor="White" EmptyDataText="没有任何数据!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" >
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <input type="checkbox" name="idChk" value="<%#Eval("GeneralID") %>"/>
                        <%#Eval("GeneralID") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="标题" ItemStyle-CssClass="text-left">
                    <ItemTemplate>
                        <a href="ViewContent.aspx?Gid=<%#Eval("GeneralID") %>" title="<%#Eval("Title") %>"><%#Eval("Title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="录入者" DataField="Inputer" />
                <asp:TemplateField HeaderText="状态" >
                    <ItemTemplate>
                        <%# GetStatus( Eval("Status","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="创建时间">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"CreateTime","{0:yyyy年MM月dd日 hh:mm}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="更新时间">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"UpDateTime","{0:yyyy年MM月dd日 hh:mm}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandName="read" CommandArgument='<%#Eval("GeneralID") %>' runat="server">修改</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" CssClass="tdbg"/>
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
    <asp:Button runat="server" ID="batDelBtn" CssClass="C_input" Text="移入回收站" OnClick="batDelBtn_Click" OnClientClick="return confirm('确定要删除吗?');"/>
</form>
</body>
</html>
