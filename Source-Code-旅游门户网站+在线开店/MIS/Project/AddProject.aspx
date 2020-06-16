<%@ page language="C#" autoeventwireup="true" inherits="MIS_AddProject, App_Web_1230bsik" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>新建项目</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script src="/Plugins/Ckeditor/EditFile/sample.js" type="text/javascript"></script>
<link href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" type="text/css" />
<script src="/JS/MisView.js"></script> 
</head>
<body>
<form id="form1" runat="server">
    <div class="Mis_Title"><strong> 新建项目 </strong></div>
<div class="Mis_pad">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
    <%--    <tr><td colspan="2" class="Mis_Title"><strong>新建项目</strong></td></tr>--%>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td style="width: 150px" class="tdbgleft" align="right"><strong>项目名称<b>*</b>：</strong></td>
    <td><asp:TextBox ID="TextProName" class="M_input" runat="server" />
        <asp:Label ID="LblMessage" runat="server" Text=""></asp:Label>  
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  class="tdbgleft" align="right"><strong>项目编号：</strong></td>
    <td><asp:TextBox ID="TextProCode" class="M_input" runat="server" /> 
        </td>
    </tr>

        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  class="tdbgleft" align="right"><strong>项目描述<b>*</b>：</strong></td>
    <td> <asp:TextBox TextMode="MultiLine" ID="TextProContent" runat="server" width="580px" height="200px"></asp:TextBox>
        </td>
    </tr>

        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  class="tdbgleft" align="right"><strong>开始时间<b>*</b>：</strong></td>
    <td><asp:TextBox ID="TextStartDate"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server" />
    
        </td>
    </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  class="tdbgleft" align="right"><strong>完成时间<b>*</b>：</strong></td>
    <td><asp:TextBox ID="TextEndDate" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input" runat="server" />
        </td>
    </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td   class="tdbgleft" align="right"><strong>项目级别：</strong></td>
    <td> 
         <asp:DropDownList ID="DrProLevel" runat="server">
              <asp:ListItem value="0">正常</asp:ListItem>
<asp:ListItem value="1">紧急</asp:ListItem>
<asp:ListItem value="2">重要</asp:ListItem>
<asp:ListItem value="3">重要且紧急</asp:ListItem></asp:DropDownList>
     
        </td>
    </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td   class="tdbgleft" align="right"><strong>进度：</strong></td>
    <td> 
        <asp:DropDownList ID="DrProRate" runat="server">
            <asp:ListItem Value="0">0</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
            <asp:ListItem Value="30">30</asp:ListItem>
            <asp:ListItem Value="40">40</asp:ListItem>
            <asp:ListItem Value="50">50</asp:ListItem>
            <asp:ListItem Value="60">60</asp:ListItem>
            <asp:ListItem Value="70">70</asp:ListItem>
            <asp:ListItem Value="80">80</asp:ListItem>
            <asp:ListItem Value="90">90</asp:ListItem>
            <asp:ListItem Value="100">100</asp:ListItem>
        </asp:DropDownList>%
     
        </td>
    </tr>
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
<iframe id="ifm1" src="/Mis/SelUser.aspx" width="420" height="120" scrolling="no" frameborder="0"></iframe>
<div class="p_bottom">
<input type="button" value="确定" onclick="HideDiv('div_share')" />
</div>
</div>
    
 
</body>
</html>
