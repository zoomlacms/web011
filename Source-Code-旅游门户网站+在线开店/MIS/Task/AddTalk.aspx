<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_AddTalk, App_Web_znlyx4aw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>新建讨论</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script src="/Plugins/Ckeditor/EditFile/sample.js" type="text/javascript"></script>
<link href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" type="text/css" />
<script src="/JS/MisView.js"></script> 
<script>
    function loadPage(id, url) {
        $("#" + id).addClass("loader");
        $("#" + id).append("Loading......");
        $.ajax({
            type: "get",
            url: url,
            cache: false,
            error: function () { alert('加载页面' + url + '时出错！'); },
            success: function (msg) {
                $("#" + id).empty().append(msg);
                $("#" + id).removeClass("loader");
            }
        });
    }
</script>
</head>
<body>
<form id="form1" runat="server">
<div  id="Meno"> 
 <div class="dialog_head"><a href="javascript:void(0)" onclick="javascript:Window.Close();"> [关闭窗口]</a><span>新建讨论  </span>  </div>
<div class="popup_headti">[任务] <asp:Label ID="lblName" runat="server"></asp:Label> </div>
<div class="popup_ti"><strong>讨论基本内容 </strong></div> 
 <table class="dialog" style="width: 740px;" border="0" cellSpacing="8" cellPadding="0">
<tr><th align="right">标题<span style="color:#f00;" >*</span>: </th><td><asp:TextBox ID="txtTitle" runat="server" class="M_input"></asp:TextBox></td></tr>
<tr>
<th align="right"> 参与人<span style="color:#f00;" >*</span>:</th>
<td><asp:TextBox ID="TextIsShare" class="M_input" runat="server" /> <a href="javascript:void(0)" onclick="PopupDiv('div_share','lblChecked','TextIsShare')";>选择</a>
</td>
</tr>
<tr><th align="right">描述 : </th><td><asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine"  width="580px" height="200px"></asp:TextBox></td></tr>
<tr><th align="right"> 紧要程度 : </th><td><asp:DropDownList ID="drLevel" runat="server">
<asp:ListItem Value="0">不重要不紧急</asp:ListItem>
<asp:ListItem Value="3">重要且紧急</asp:ListItem>
<asp:ListItem Value="1">重要</asp:ListItem>
<asp:ListItem Value="2">紧急</asp:ListItem>
</asp:DropDownList> </td></tr>
<tr><th align="right">附件 :</th><td><asp:FileUpload  ID="files" runat="server"/> 添加附件 单次上传文件大小不能超过36MB。 </td></tr> 
 <tr><td colspan="2"> <asp:Button ID="Button1" CssClass="i_bottom" OnClick="Button1_Click" runat="server" Text="提交" />
   <asp:Button ID="concle" CssClass="i_bottom" runat="server" Text="取消" /></td></tr>
 </table>
</div>
</form>
<script id="headscript" type="text/javascript">
//<![CDATA[
CKEDITOR.replace('txtContent',
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
