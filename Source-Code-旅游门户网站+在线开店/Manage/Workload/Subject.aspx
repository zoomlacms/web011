<%@ page language="C#" autoeventwireup="true" inherits="manage_Workload_Subject, App_Web_znwdg1ob" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
<title>工作统计</title>
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script src="../../JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../../JS/GetTable.js" type="text/javascript"></script>
<script type="text/javascript" src="../../JS/DatePicker/WdatePicker.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
<%if(GetOpenHelp.IsopenHelp()=="1")
{ %>
    <div id="help"> <a onclick="help_show('52')" title="帮助"></a></div>
    <%} %>
    后台管理&gt;&gt; 企业办公&gt;&gt; 工作统计</div>
    <table border="0" cellpadding="2" cellspacing="1" class="border" width="100%">
    <tr valign="middle">
        <td class="spacingtitle" colspan="2" style="height: 26px; text-align: center">
            <strong> <asp:Label ID="Title_L" runat="server" Text=""></asp:Label></strong>
        </td>
    </tr>
</table>
  <div id="t1" runat="server">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td align="right" style="height: 28px; width: 180px;"><asp:Label ID="left" Text="" runat="server"></asp:Label></td>
        <td align="left"><asp:TextBox ID="UserName" runat="server" Visible="false"></asp:TextBox>
          <asp:ListBox ID="LstNodes" runat="server" DataTextField="NodeName" DataValueField="NodeId" SelectionMode="Multiple" Height="282px" Width="200px" Visible="false"></asp:ListBox>
              
           
          
              <asp:TextBox ID="start" class="l_input" runat="server" onclick="WdatePicker();" Visible="false"></asp:TextBox>
          <asp:Calendar ID="Calendar1" Width="200" BorderColor="Gray" BackColor="AliceBlue"
                        TitleStyle-BackColor="LightSkyBlue" Style="top: 85px; left: 180px; position: absolute;
                        z-index: 444; display: none;" ShowGridLines="True" OnSelectionChanged="Calendar1_SelectionChanged"
                        SelectedDayStyle-BackColor="#DBDBDB" OnVisibleMonthChanged="OnVisibleMonthChanged1"
                        runat="server"></asp:Calendar>
          <asp:Label ID="endtime" runat="server"> </asp:Label>
            <asp:TextBox ID="end" class="l_input" runat="server"  onclick="WdatePicker();" Visible="false"></asp:TextBox>
          <asp:Calendar ID="Calendar2" Width="200" BorderColor="Gray" BackColor="AliceBlue"
                        TitleStyle-BackColor="LightSkyBlue" Style="position: absolute; top: 85px; left: 400px;
                        z-index: 444; display: none;" ShowGridLines="True" OnSelectionChanged="Calendar2_SelectionChanged"
                        OnVisibleMonthChanged="OnVisibleMonthChanged2" runat="server"></asp:Calendar></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td align="right"></td>
        <td align="left"><asp:Button runat="server" ID="count" CssClass="C_input" Text="开始统计" OnClick="count_Click" />
        </td>
      </tr>
    </table>
  </div>
  <div id="Top" runat="server" visible="false" style="text-align: center; font-size: 15px;
        font-weight: bold;">
 
  </div>
  <div id="t2" runat="server" visible="false" style="text-align: center;">


    <table cellpadding="2" cellspacing="1" class="border" style="background-color: white;" width="100%">
      <tr class="tdbg" runat="server" id="NodeNames">
        <td align="center" height="24" width="10%"><b>ID</b></td>
        <td align="center" height="24" width="10%"><b>栏目名称</b></td>
        <td align="center" height="24" width="20%"><b>合计</b></td>
      </tr>
      <asp:Repeater ID="repeater1" runat="server" >
        <ItemTemplate>
       <%--  <tr class="tdbg"  runat="server" onmouseover="this.className='tdbgmouseover'"onmouseout="this.className='tdbg'" ondblclick="getinfo(this.id )" style="text-align: center;" > 
            <td><strong><%# Eval("ID") %></strong></td>
            <td><strong><%# Eval("nodeid")%></strong></td>
            <td><strong><%# Eval("countNum")%></strong></td>
          </tr>--%>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    </div>
</form>
<div id="Excel" runat="server" visible="false" style="text-align: center; margin-top: 10px;">
  <input type="button" id="back" name="back" value="返回" class="C_input" onclick="javascript:history.back();" />
  <input type="button" id="GetExcel" name="GetExcel" value="生成Excel文件" class="C_input" onclick="GetExcelWithPath('tb','<%=CustomerPageAction.customPath2+"content/GetExcel.aspx"%>')" />
</div>
</body>
</html>