<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_EditDataList, App_Web_znnaxtvm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html >
<head runat="server">
    <title>修改表说明</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">   后台管理&gt;&gt;扩展功能&gt;&gt;<a href="RunSql.aspx">开发中心 </a>&gt;&gt;<a href="DatalistProfile.aspx">系统全库概况</a>&gt;&gt; 修改说明 </div>
  <table border="0" cellpadding="2" cellspacing="1" class="border" width="100%">
    <tr>
      <td class="spacingtitle" colspan="2" style="height: 26px; text-align:center;"><strong>
        <span id="Label1">修改表说明</span>
        </strong></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td align="left" class="tdbgleft"style="width:200px;"><strong>数据表名：</strong></td>
      <td align="left"> <asp:Label ID="TxtTableName" runat="server" ></asp:Label> </td>
    </tr>
       <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td align="left" class="tdbgleft"style="width:200px;"><strong>类型：</strong></td>
      <td align="left"> <asp:Label ID="TxtType" runat="server" ></asp:Label><asp:HiddenField ID="TxtTypeID" runat="server" /> </td>
    </tr>
    
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td align="left" class="tdbgleft" style="width:200px;"><strong>说明：</strong></td>
      <td align="left"> <asp:TextBox ID="TxtExplain"  runat="server"  class="l_input" style="width:220px;"></asp:TextBox> &nbsp;*
         </td>
    </tr>
    <tr  class="tdbg"><td colspan="2"><asp:Button ID="EBtnTable" runat="server" OnClick="EBtnTable_Click" Text="保存" class="C_input"/>
  <input id="Cancel"  name="Cancel" onclick="GoBack();" style="cursor: hand" type="button" value="取消" class="C_input" />
     </td></tr>
</table>
    </form>
</body>
</html>
