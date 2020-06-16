<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_EditOrderSql, App_Web_3rrk3jrp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>查看账单申请</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <div class="r_navigation"> 
  后台管理 &gt;&gt; 商城管理 &gt;&gt; 订单管理 &gt;&gt; <a href="OrderSql.aspx">账单管理</a> &gt;&gt; 查看账单  </div>
    <div>
      <table  cellpadding="2" cellspacing="1" class="border" style="background-color: white; margin-top:5px;" width="100%">
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td align="right" class="tdbgleft" height="24" > 帐单类型:</td><td> 
           <asp:DropDownList ID="DrpOrderType" runat="server"><asp:ListItem Value="1">新开返利</asp:ListItem><asp:ListItem Value="2">消费上报</asp:ListItem></asp:DropDownList></td></tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			 <td align="right" class="tdbgleft" height="24" >报单商家用户ID:</td><td><asp:TextBox ID="TxtUserName" runat="server"  class="l_input" Width="453px"></asp:TextBox></td></tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" class="tdbgleft">申请时间:</td><td><asp:TextBox ID="TxtAddTime" runat="server" class="l_input"  Width="453px"></asp:TextBox></td></tr>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" class="tdbgleft">返分会员的ID:</td><td><asp:TextBox ID="TxtPuserID" runat="server"  class="l_input" Width="453px"></asp:TextBox></td></tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" class="tdbgleft">返分会员用户名:</td><td><asp:TextBox ID="TxtPuserName" runat="server"  class="l_input" Width="453px"></asp:TextBox></td></tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" class="tdbgleft">订单金额:</td><td><asp:TextBox ID="Txtmoney" runat="server" class="l_input" Width="453px"></asp:TextBox></td></tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
          <td align="right" class="tdbgleft">脚本:</td><td><asp:TextBox ID="TxtSqlstr" class="l_input" runat="server" Height="107px" TextMode="MultiLine" Width="456px"></asp:TextBox></td></tr> 
           <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" class="tdbgleft">执行次数:</td><td><asp:TextBox ID="TxtRunNum" runat="server" class="l_input" Width="453px"></asp:TextBox></td></tr>
           <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
           <td align="right" class="tdbgleft">备注:</td><td><asp:TextBox ID="Txtremark" runat="server" Width="195px"></asp:TextBox></td></tr>
       <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td >&nbsp;</td><td  ><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改" Class="C_input" /> 
           <asp:Button ID="Button4" runat="server" OnClick="Run_Click" Text="执行批处理" Class="C_input" /> 
            <asp:Button ID="Button3" runat="server" OnClick="Save_Click" Text="生成脚本文件" Class="C_input" />  
            <asp:Button ID="Button5" runat="server" OnClick="Save1_Click" Text="下载数据库脚本" Class="C_input" />   
           <input type="button" ID="Button2"  Value="返回" Class="C_input" onclick="javascript: history.back();"  /> </td></tr>
    </table>  
        <div id="RunOK" runat="server"></div>
    </div>   
    </form>
</body>
</html>
