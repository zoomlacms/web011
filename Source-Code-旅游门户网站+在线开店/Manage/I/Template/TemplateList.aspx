<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.TemplateList, App_Web_uf4f5mnd" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>文件管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/ICMS/V3.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <table style="width: 100%; height: 100%" border="0" cellpadding="2" cellspacing="0"
            class="border">
            <tr style="height: 100%; width: 100%">                    
                <td class="tdbg" align="left" valign="top" colspan="3" style="width: 70%;">
                    <iframe id="main_right" name="main_right" scrolling="yes" style="width: 100%;height:400px;" src="SelectTemplate.aspx<%:Request.Url.Query %>" frameborder="0" marginheight="0" marginwidth="1"></iframe>
                </td>
            </tr>
            <tr class="title" style="height: 22; width: 177px">
                <td style="width: 103px" align="right">
                    文件名称：</td>
                <td align="left">
                    <input type="text" id="FileName" size="60"  class="form-control"  />
                    <input type="hidden" id="ParentDirText" />
                        <asp:HiddenField ID="HdnParentDir" runat="server" />
                    </td>
                    <td align="center" style="width: 177px">
                        <input type="button"  id="BtnSubmit" class="btn btn-primary" value="确定" onclick="javascript:window.close(); add()" />
                        <input type="button"  id="BtnCancel" class="btn btn-primary" value="取消" onclick="javascript:window.close();" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
<script type="text/javascript">
function add()
{
    if (window.opener) {
        window.opener.document.getElementById('<%=Request.QueryString["OpenerText"].Trim() %>').value = document.getElementById('FileName').value;
    }
    else {
        window.dialogArguments.document.getElementById('<%=Request.QueryString["OpenerText"].Trim() %>').value = document.getElementById('FileName').value;
    }
}
</script>
</body>
</html>
