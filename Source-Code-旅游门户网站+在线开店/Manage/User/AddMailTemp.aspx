<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AddMailTemp, App_Web_evybsxrg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>创建邮件模板</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/js/Common.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/EditFile/sample.js"></script>
<link type="text/css" href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server"> 
  
    <div class="r_navigation"> 后台管理&gt;&gt;用户管理&gt;&gt;<a href="MessageSend.aspx" >信息发送</a>&gt;&gt; <a href="MailTemplist.aspx">邮件模板</a>&gt;&gt;创建邮件模板</div>
<div>
      <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
      <tr>
        <td align="center" colspan="2" class="spacingtitle"><b>创建邮件模板</b></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="15%" align="right" class="tdbgleft">模板名称：</td>
        <td style="text-align: left"> <asp:TextBox ID="TxtTempName" runat="server"></asp:TextBox></td>
        </tr>
         <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="15%" align="right" class="tdbgleft">上传缩略图：</td>
        <td style="text-align: left"><asp:TextBox ID="TxtPic" class="l_input" runat="server" Width="300px" /><span style="color: #ff0000">*</span>
                <iframe id="smallimgs" style="top:2px" src="../shop/fileupload.aspx?menu=TxtPic" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                  </td>
        </tr>
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td width="15%" align="right" class="tdbgleft"><strong>选择类型：</strong></td>
        <td style="text-align: left"><table>
            <tr>
            <asp:DropDownList ID="drType" runat="server">
            <asp:ListItem Value="0">请选择</asp:ListItem>
            <asp:ListItem Value="1">普通信件</asp:ListItem>
            <asp:ListItem Value="2">贺卡</asp:ListItem> 
            </asp:DropDownList>
            </tr></table></td>
            </tr> 
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td width="15%" align="right" class="tdbgleft">模板内容：</td>
    <td style="text-align: left">
<textarea id="TxtContent" runat="server" >
  
</textarea> 
<script id="headscript" type="text/javascript">
//<![CDATA[
    CKEDITOR.replace('TxtContent',
{

});
//]]>
</script>
        </td>
    </tr>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><td width="15%" align="right" class="tdbgleft">邮件模板标签</td><td>邮件内容支持HTML，邮件内容中可用标签说明如下：<br />
<textarea rows="8" cols="60" style=" padding:5px; background:#E8F5FF" > 

邮件标题：{$Title/} 

[以下是站点基本信息]
======================================
网站名称{$SiteName/}   
网站地址{$SiteUrl/}  
网站标题{$SiteTitle/}     
网站Logo{$LogoUrl/}   
广告图：{$BannerUrl/}
网站版权：{$Copyright/}  
网站关键字{$MetaKeywords/}   
网站描述{$MetaDescription/}   
站长姓名：{$Webmaster/}
站长信箱：{$WebmasterEmail/}  

[以下是您在注册会员时填写的基本信息]
======================================
<!-- personal -->
账号: {$UserName/}
密码：{$password/}
公司名：{$Company/}
办公电话：{$OfficePhone/}  

昵称: {$HoneyName/}
头像: {$UserFace/}
性别：{$sex/} 
出生日期：{$BirthDay/}  
国家：{$Country/}
省份：{$Province/}
城市：{$City/}
县：{$County/}
地址：{$Address/} 
邮政编码：{$ZipCode/}
电话：{$Mobile/}
传真：{$Fax/}
E-mail地址：{$Email/}
个人主页：{$HomePage/}
QQ号：{$QQ/}
MSN地址：{$MSN/}   
签名档：{$Sign/} 
<!-- /personal -->
</textarea>  </td></tr>
         <tr class="tdbgbottom">
            <td colspan="2">
                <asp:HiddenField ID="HdnModelId" runat="server" />
                <asp:Button ID="EBtnSubmit" Text="保存" class="C_input"  runat="server" OnClick="EBtnSubmit_Click" />
                &nbsp;&nbsp;
                <input name="Cancel" type="button" class="C_input"  id="Cancel" value="取消" onclick="javescript:history.go(-1)" />                
            </td>
        </tr>
            </table>
</div> 
<script src="/JS/jquery.js" type="text/javascript"></script>
<script>
    // parent.GV('TxtPic', 'UploadFiles/2012/9/15/2012915145154656591.bmp');

    function GV(id, value) {
      
        $("#" + id).val(value);
    }
</script>
</form>
</body>
</html>
