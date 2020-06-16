<%@ page language="C#" autoeventwireup="true" inherits="Manage_Plus_AnswerView, App_Web_0t1uxiqn" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问卷详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table style="width: 100%;" class="border" cellpadding="2" cellspacing="1">
        <tr>
            <td>
                <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" GridLines="None" EnableModelValidation="True">
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
</asp:Content>
