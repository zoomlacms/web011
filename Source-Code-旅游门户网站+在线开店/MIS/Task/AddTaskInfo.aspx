<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_AddTaskInfo, App_Web_znlyx4aw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加事件</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script src="/Plugins/Ckeditor/EditFile/sample.js" type="text/javascript"></script>
<link href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" type="text/css" />
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
 <div class="dialog_head"><a href="javascript:void(0)" onclick="javascript:Window.Close();"> [关闭窗口]</a><span>新建事件</span>  </div>
<div class="popup_headti">[任务] <asp:Label ID="lblName" runat="server"></asp:Label> </div>

<div class="popup_ti"><strong>事件基本信息</strong></div> 
 <table class="dialog" style="width: 740px;" border="0" cellSpacing="8" cellPadding="0">
<tr><th width="18%" align="right"> 事件标签*: </th><td><asp:DropDownList ID="drType" runat="server">
<asp:ListItem Value="4">待办</asp:ListItem>
<asp:ListItem Value="5">求助</asp:ListItem>
<asp:ListItem Value="6">汇报</asp:ListItem>
<asp:ListItem Value="2">计划</asp:ListItem>
<asp:ListItem Value="7">日志</asp:ListItem>
<asp:ListItem Value="0">记录</asp:ListItem>
<asp:ListItem Value="8">消息</asp:ListItem>
<asp:ListItem Value="9">其他</asp:ListItem> 
</asp:DropDownList>          </td></tr>
<tr><th align="right">标题*: </th><td><asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td></tr>
<tr><th align="right">描述 : </th><td><asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine"  width="580px" height="200px"></asp:TextBox></td></tr>
<tr><th align="right"> 紧要程度 : </th><td><asp:DropDownList ID="drLevel" runat="server">
<asp:ListItem Value="0">不重要不紧急</asp:ListItem>
<asp:ListItem Value="3">重要且紧急</asp:ListItem>
<asp:ListItem Value="1">重要</asp:ListItem>
<asp:ListItem Value="2">紧急</asp:ListItem>
</asp:DropDownList> </td></tr>
<tr><th align="right">附件 :</th><td><asp:FileUpload  ID="files" runat="server"/> 添加附件 单次上传文件大小不能超过36MB。 </td></tr>
<tr><th align="right"> 重要活动项 : </th><td><asp:CheckBox ID="ckElit" runat="server" />设置为重要活动</td></tr>  
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
</body>
</html>
