<%@ page language="C#" autoeventwireup="true" inherits="manage_Workload_Subject, App_Web_jcn55lh2" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>工作统计</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table border="0" cellpadding="2" cellspacing="1" class="border" width="100%">
        <tr valign="middle">
            <td class="spacingtitle" colspan="2" style="height: 26px; text-align: center">
                <strong>
                    <asp:Label ID="Title_L" runat="server" Text=""></asp:Label></strong>
            </td>
        </tr>
    </table>
    <div id="t1" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td align="right" style="height: 28px; width: 180px;">
                    <asp:Label ID="Subjectleft" Text="" runat="server"></asp:Label></td>
                <td align="left">
                    <asp:TextBox ID="UserName" runat="server" Visible="false"></asp:TextBox>
                    <asp:ListBox ID="LstNodes" CssClass="form-control" runat="server" DataTextField="NodeName" DataValueField="NodeId" SelectionMode="Multiple" Height="282px" Width="200px" Visible="false"></asp:ListBox>
                    <asp:TextBox ID="start" class="form-control" runat="server" onclick="WdatePicker();" Visible="false"></asp:TextBox>
                    <asp:Calendar ID="Calendar1" Width="200" BorderColor="Gray" BackColor="AliceBlue"
                        TitleStyle-BackColor="LightSkyBlue" Style="top: 85px; left: 180px; position: absolute; z-index: 444; display: none;"
                        ShowGridLines="True" OnSelectionChanged="Calendar1_SelectionChanged"
                        SelectedDayStyle-BackColor="#DBDBDB" OnVisibleMonthChanged="OnVisibleMonthChanged1"
                        runat="server"></asp:Calendar>
                    <asp:Label ID="endtime" runat="server"> </asp:Label>
                    <asp:TextBox ID="end" class="form-control" runat="server" onclick="WdatePicker();" Visible="false"></asp:TextBox>
                    <asp:Calendar ID="Calendar2" Width="200" BorderColor="Gray" BackColor="AliceBlue"
                        TitleStyle-BackColor="LightSkyBlue" Style="position: absolute; top: 85px; left: 400px; z-index: 444; display: none;"
                        ShowGridLines="True" OnSelectionChanged="Calendar2_SelectionChanged"
                        OnVisibleMonthChanged="OnVisibleMonthChanged2" runat="server"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td align="right"></td>
                <td align="left">
                    <asp:Button runat="server" ID="count" CssClass="btn btn-primary" Text="开始统计" OnClick="count_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div id="Top" runat="server" visible="false" style="text-align: center; font-size: 15px; font-weight: bold;">
    </div>
    <div id="t2" runat="server" visible="false" style="width: 100%;">
        <table class="table table-striped table-bordered table-hover">
            <tr runat="server" id="NodeNames">
                <td align="center" height="24" width="10%"><b>ID</b></td>
                <td align="center" height="24" width="10%"><b>栏目名称</b></td>
                <td align="center" height="24" width="20%"><b>合计</b></td>
            </tr>
            <asp:Repeater ID="repeater1" runat="server">
                <ItemTemplate>
                    <%--  <tr  runat="server" onmouseover="this.className='tdbgmouseover'"onmouseout="this.className='tdbg'" ondblclick="getinfo(this.id )" style="text-align: center;" > 
            <td><strong><%# Eval("ID") %></strong></td>
            <td><strong><%# Eval("nodeid")%></strong></td>
            <td><strong><%# Eval("countNum")%></strong></td>
          </tr>--%>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <div id="Excel" runat="server" visible="false" style="text-align: center; margin-top: 10px;">
        <input type="button" id="back" name="back" value="返回" class="btn btn-primary" onclick="javascript:history.back();" />
        <input type="button" id="GetExcel" name="GetExcel" value="生成Excel文件" class="btn btn-primary" onclick="GetExcelWithPath(<%=CustomerPageAction.customPath2+"I/Content/GetExcel.aspx"%>)" />
    </div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>
        th {
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/GetTable.js" type="text/javascript"></script>
    <script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
