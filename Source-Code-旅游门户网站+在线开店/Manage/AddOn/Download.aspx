<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_Download, App_Web_nmafnnk0" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>客户端下载</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation">后台管理&gt;&gt;客户端管理&gt;&gt;客户端下载  </div>
<table class="border" cellspacing="1" cellpadding="0" rules="all" border="0" border="1" id="GridView1" style="width:100%;">
<asp:Label ID="tempclientlist" runat="server" Text=""></asp:Label>
    <tr>
      <td id="localtb" name="localtb"><table width="100%" border="0" cellpadding="0" cellspacing="1">
          <span id="s"><tr class="tdbg" align="center" style="height: 230px;"><td width="25%"><table width="156" height="210" border="0" cellpadding="0" cellspacing="0" class="Template_box">
          <tr>
                <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="134" align="center"><a alt="点击进入下载"  href="TemplateManage.aspx?setTemplate=/Template/blue"> <img alt="点击进入下载"  onerror="this.onerror=null;this.src='/Images/nopic.gif'" onmouseover="this.style.border='1px solid #9ac7f0';" onmouseout="this.style.border='1px solid #eeeeee';" style="border:1px solid #eeeeee;width:124px;height:111px;" src='/Template/blue/view.jpg'></a></td>
                      </tr>
                      <tr>
                        <td height="59" align="center" valign="top">
                            <p style='line-height:18px;'> <span  value='blue' type='text' sclass='l_input' style='line-height:18px;width:110px;color:black' name='tempname0' >名称：逐浪助手</span></p>
                           <p style='line-height:18px;'> 
                            <a disabled='false' onclick='return false;'  href="TemplateSet.aspx?defaultproject=blue"> 客户端下载</a>&nbsp;&nbsp;
                            <a rel="lightbox"  href="/Template/blue/Bview.jpg"><img  alt="大图预览"  width="16px" height"14px" src='/App_Themes/AdminDefaultTheme/images/glassover.jpg'></img></a>
                             </p>
                              <p style='line-height:18px;'><asp:Button ID="keyDown" OnClick="Button4_Click" Text="密钥文件下载" runat="server" /> </p>
                            
                        </td>
                      </tr>
                    </table>
                    </td>
                 
                </tr>
              </table></tr>
          </table></td> 
          </tr>
          
           
</table> 
    </form>
</body>
</html>
