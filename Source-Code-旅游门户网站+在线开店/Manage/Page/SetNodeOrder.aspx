<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.SetNodeOrder, App_Web_y1nkzetg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>节点排序</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="nav_box">
            <div class="r_navigation">
                后台管理&gt;&gt;企业黄页&gt;&gt;<a href="PageTemplate.aspx">栏目列表</a>&gt;&gt;<asp:Literal ID="Literal1" runat="server"></asp:Literal>&gt;&gt;子栏目排序
            </div>
        </div>
        <div style="height: 27px;"></div>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" class="border" align="center">
            <tr class="gridtitle" align="center" style="height: 25px;">
                <td style="width: 10%; height: 20px;">
                    <strong>栏目ID</strong>
                </td>
                <td style="width: 20%; height: 20px;">
                    <strong>栏目名称</strong>
                </td>
                <td style="width: 20%">
                    <strong>节点目录</strong>
                </td>
                <td style="width: 20%">
                    <strong>栏目类型</strong>
                </td>
                <td style="width: 10%">
                    <strong>手动排序</strong>
                </td>
                <td style="width: 20%">
                    <strong>排序</strong>
                </td>
            </tr>
            <asp:Repeater ID="RepSystemModel" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td align="center">
                            <%#Eval("TemplateID")%>
                            <asp:HiddenField ID="Hid_TemplateID" runat="server" Value='<%#Eval("TemplateID")%>' Visible="false" />
                        </td>
                        <td align="center">
                            <%#Eval("TemplateName")%>
                        </td>
                        <td align="center">
                            <%# Eval("Identifiers")%>
                        </td>
                        <td align="center">
                            <%# GetNodeType(Eval("TemplateType", "{0}"))%>
                        </td>
                        <td align="center">
                            <input type="text" class="l_input" style="width: 40px; text-align: center" name="order_T"  value="<%#Eval("OrderID") %>" style="width:50px;text-align:center;" tabindex="1"/>
                            <input type="hidden" name="order_Hid" value="<%#Eval("templateID")+":"+Eval("OrderID") %>" />
                            
                        </td>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="UpMove" CommandArgument='<%# Eval("TemplateID") %>'>上移</asp:LinkButton>
                            |
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DownMove" CommandArgument='<%# Eval("TemplateID") %>'>下移</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <asp:Button ID="Button1" runat="server" Text="批量更新排序" CssClass="C_input" OnClick="Button1_Click" />
    </form>
</body>
</html>
