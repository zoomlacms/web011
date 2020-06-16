<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_AddTasj, App_Web_znlyx4aw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>派任务</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js" ></script>
<script src="../../Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
<script src="/JS/MisView.js"></script>  
</head>
<body>
<form id="form1" runat="server">
  <div class="Mis_Title"><strong> 派任务 </strong></div>
<div class="Mis_pad">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
    <%--    <tr><td colspan="2" class="Mis_Title"><strong>新建项目</strong></td></tr>--%>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td style="width: 150px" class="tdbgleft" align="right"><strong>标题<b>*</b>：</strong></td>
    <td><asp:TextBox ID="TextProName" class="M_input" runat="server" />
        <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>  
        </td>
    </tr>  
   <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  class="tdbgleft" align="right"><strong>任务描述<b>*</b>：</strong></td>
    <td> <asp:TextBox TextMode="MultiLine" ID="TextProContent" runat="server" width="500px" height="200px"></asp:TextBox>
        </td>
    </tr> 
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  class="tdbgleft" align="right"><strong>完成时间<b>*</b>：</strong></td>
    <td><asp:TextBox ID="TextEndDate" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server" />
     </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td   class="tdbgleft" align="right"><strong>紧要程度：</strong></td>
    <td> 
     <asp:DropDownList ID="DrProLevel" runat="server">
      <asp:ListItem value="0">不重要不紧急</asp:ListItem>
<asp:ListItem value="1">紧急</asp:ListItem>
<asp:ListItem value="2">重要</asp:ListItem>
<asp:ListItem value="3">重要且紧急</asp:ListItem></asp:DropDownList>
     </td>
    </tr>
     <tr><td colspan="2">任务相关人员 </td></tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  class="tdbgleft" align="right"><strong>负责人<b>*</b>：</strong></td>
    <td><asp:TextBox ID="TextInputer" class="M_input" runat="server" /><a href="javascript:void(0)" onclick="PopupDiv('div_share','lblChecked','TextInputer')";>选择</a> 
        </td>
    </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td   class="tdbgleft" align="right"><strong>参与人<b>*</b>：</strong></td>
    <td><asp:TextBox ID="TextJoiner" class="M_input" runat="server" /><a href="javascript:void(0)" onclick="PopupDiv('div_share','lblChecked','TextJoiner')";>选择</a>
        </td>
    </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td   class="tdbgleft" align="right"><strong>附件：</strong></td>
    <td> 
        <asp:FileUpload ID="Files" runat="server" class="M_input" onkeydown="event.returnValue=false;"   onpaste="return false" />
        <asp:Label ID="lbMsg" runat="server" ForeColor="Red" ></asp:Label> 
        </td>
    </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td colspan="2"><asp:Button Text="确定"  runat="server" ID="BtnCommit" CssClass="i_bottom"  OnClick="Button_Click"/></td>
    </tr>
  </table>
</div>
</form>
    <script id="headscript" type="text/javascript">
        //<![CDATA[
        CKEDITOR.replace('TextProContent',
{
    enterMode: 2,
    width: '100%',
    shiftEnterMode: 2,
    toolbar: [['Source', '-', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
});
        //]]>
</script>
    <div id="div_share" class="pop_box" style="width:500px;">
<div class="p_head">
<div class="p_h_title">人员选择</div>
<div class="p_h_close" onclick="HideDiv('div_share')">关闭</div>
</div>
<iframe id="ifm1" src="/Mis/SelUser.aspx" width="480" height="180" scrolling="no" frameborder="0"></iframe>
<div class="p_bottom">
<input type="button" value="确定" onclick="HideDiv('div_share')" />
</div>
</div>
</body>
</html>
