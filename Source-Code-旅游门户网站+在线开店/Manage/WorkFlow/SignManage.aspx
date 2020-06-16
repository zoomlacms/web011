<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_SignManage, App_Web_wx5dt34e" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>签章管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$().ready(function () {
    $(":button").addClass("btn btn-primary");
    $(":submit").addClass("btn btn-primary");
    $("#EGV tr:last >td>:text").css("line-height", "normal");
    $("#EGV tr:first >th").css("text-align", "center");
});
</script>
</head>
<body>
<form id="form1" runat="server">
    <div class="r_navigation" style="font-size:12px;">
    <div style="float:left;">后台管理&gt;&gt;OA配置 &gt;&gt;<a href="SignManage.aspx">签章管理</a><a href="AddSign.aspx" style="color:#f00;margin-left:5px;">[添加签章]</a>
    </div>
    <input type="button" class="C_schmor" style="float:left; margin-top:4px;margin-left:4px;" title="显示扩展搜索" value="" onclick="displayToolbar()" />
    <div id="toolbar1" style="display:none;margin-left:8px; float:left;">
        <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input">
            <tr >
                <td>
                    <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" BorderColor="#fff" CssClass="l_inpnon" />&nbsp;
                    <asp:Button runat="server" CssClass="C_sch" ID="searchBtn" Text="" OnClick="searchBtn_Click"/>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function displayToolbar() {
            $("#toolbar1").toggle("fast");
        }
        </script>
    <div class="clear"></div>
</div>
    <div class="tab3">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table border" BackColor="White" EmptyDataText="当前没有信息!!" OnRowDataBound="EGV_RowDataBound" RowStyle-CssClass="tdbg" DataKeyNames="ID" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="签章名" DataField="SignName" />
                <asp:BoundField HeaderText="绑定用户" DataField="UserName" />
                <asp:TemplateField HeaderText="签章图">
                    <ItemTemplate>
                        <a onmouseout="showdiv(this)" onmouseover="showdiv(this)" class="lightbox" title="<%#Eval("SignName")%>"><img src="<%#Eval("VPath") %>" title="<%#Eval("SignName")%>" alt="" style="width:60px;height:60px;"/></a>
                        <div class="imagediv" style="display:none; position:absolute;">
                            <img src="<%#Eval("VPath") %>" alt="" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="密钥" DataField="SignKey" />
                <asp:BoundField HeaderText="添加时间" DataField="CreateTime" />
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="AddSign.aspx?ID=<%#Eval("ID") %>">修改</a>|
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
<script>
    function showdiv(obj)
    {
        imagediv = $(obj).parent().find(".imagediv").toggle();
    }
</script>
</form>
</body>
</html>
