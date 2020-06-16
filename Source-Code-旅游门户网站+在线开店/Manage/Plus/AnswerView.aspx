<%@ page language="C#" autoeventwireup="true" inherits="Manage_Plus_AnswerView, App_Web_ka5t45ft" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <title>问卷详情</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            后台管理&gt;&gt;<a href="SurveyManage.aspx">问卷投票管理</a>&gt;&gt;<span style="color: #f00">[问卷名:<asp:Label runat="server" ID="QueName_L"></asp:Label>]</span>问卷详情
        </div>
        <table style="width: 100%;" class="border" cellpadding="2" cellspacing="1">
            <tr>
                <td>
                    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField HeaderText="问卷ID" DataField="Surveyid" />
                            <asp:TemplateField HeaderText="问题名称">
                                <ItemTemplate>
                                    <%# GetQuestionTitle(Eval("Qid","{0}")) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="答案" DataField="AnswerContent" />
                            <asp:BoundField HeaderText="得分" DataField="AnswerScore" />
                        </Columns>
                        <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                        <RowStyle Height="24px" HorizontalAlign="Center" />
                    </ZL:ExGridView>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="text-align: center; height: 30px;">
                    <span style="font-size: 16px; color: #f00; font-weight: bold;">本问卷总得分:<%=GetCountScore() %></span>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
