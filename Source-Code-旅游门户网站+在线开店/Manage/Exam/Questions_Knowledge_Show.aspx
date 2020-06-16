<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Questions_Knowledge_Show, App_Web_lmkt1j3a" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>知识点管理</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理 &gt;&gt; 教育模块 &gt;&gt;<a href="QuestionManage.aspx">在线考试系统</a> &gt;&gt; 知识点管理<asp:HyperLink ID="hlAdd" runat="server">[添加知识点]</asp:HyperLink></div>
    <table style="width: 100%; margin: 0 auto; margin-top: 5px;" cellpadding="0" cellspacing="0"
        class="border">
        <tr class="tdbg">
            <td style="height: 24px">
                <asp:Label ID="lblClass" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <div class="clearbox">
    </div>
    <div class="divbox" id="nocontent" runat="server" style="display: none">
        暂无知识点信息</div>
    <div class="clearbox">
    </div>
    <div>
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" AllowPaging="true"  class="border" AllowSorting="true" CellPadding="3" CellSpacing="1" BackColor="White"
        ForeColor="Black" CssClass="border" EnableTheming="False" GridLines="None" OnPageIndexChanging="EGV_PageIndexChanging"
            Width="100%" RowStyle-HorizontalAlign="Center" RowStyle-CssClass='tdbg' RowStyle-VerticalAlign="Middle"
            OnRowCommand="gvCard_RowCommand" HeaderStyle-Height="28px" RowStyle-Height="26px">


            <RowStyle CssClass="tdbg"></RowStyle>
            <Columns>
                <asp:BoundField DataField="TestPoint" HeaderText="知识点" />
                <asp:BoundField DataField="OrderBy" HeaderText="排序" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("ID") %>'>修改</asp:LinkButton>
                        |
                        <asp:LinkButton ID="lbDetele" runat="server" CommandName="Del" CommandArgument='<%#Eval("ID") %>'
                            OnClientClick="if(confirm('确定删除?')) return true; else return false;">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    </form>
</body>
</html>
