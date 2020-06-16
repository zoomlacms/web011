<%@ page language="C#" autoeventwireup="true" inherits="manage_Common_ShowUploadPic, App_Web_hjb2stj5" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>选择文件</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<base target="_self" />
<script src="/JS/Popup.js" language="javascript" type="text/javascript"></script>
</head>
<body>
<form id="form1" runat="server">
<div> 
	<table width="100%" border="0" cellpadding="2" cellspacing="1">
		<tr class="tdbg">                
			<td align="right">
				搜索当前目录文件：
				<asp:TextBox ID="TxtSearchKeyword" runat="server"></asp:TextBox>
				<asp:Button ID="BtnSearch" runat="server" Text="搜索" />
			</td>
		</tr>
	</table>
	<br />
	<table width="100%">
		<tr>
			<td>
				当前目录：<asp:Label ID="LblCurrentDir" runat="server"></asp:Label>
			</td>
			<td align="right">
				<a href="ShowUploadPic.aspx?Dir=<%= Server.UrlEncode(m_ParentDir) %>">返回上一级</a></td>
		</tr>
	</table>
	<asp:Repeater ID="RptFiles" runat="server" OnItemCommand="RptFiles_ItemCommand">
		<HeaderTemplate>
	 
    <ul>                  
	</HeaderTemplate>
	<ItemTemplate>         
        <li style=" float:left; margin-left:10px;margin-top:10px; height:130px;">
            <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<a href='ShowUploadPic.aspx?ClientId=" + Request.QueryString["ClientId"] + "&Dir=" + Server.UrlEncode(Request.QueryString["Dir"] + "/" + Eval("Name").ToString()) + "'  ><img src=\"/App_Themes/AdminDefaultTheme/Images/Folder/folder_b.gif\"><br />" + Eval("Name").ToString() + " </a>" :  "<a href='javascript:ReturnUrl(\"" + Request.QueryString["Dir"] + "/" + Eval("Name").ToString() + "\")'>"+GetShowExtension(Eval("content_type").ToString(),Eval("Name").ToString())+"<br />" + Eval("Name").ToString() + " </a>" %> 
            </li>
	</ItemTemplate>
	<FooterTemplate>
        </ul> </FooterTemplate>
</asp:Repeater> 
<div id="dHTMLADPreview" style="z-index: 1000; left: 0px; visibility: hidden; width: 10px;
		position: absolute; top: 0px; height: 10px">
	</div>

	<script language="javascript" type="text/javascript">
<!--
    function ReturnUrl(url) {

        if (url.substring(0, 1) == "/") {
            url = url.substring(1, url.Length);
        }

        var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
        if (isMSIE) {
            window.returnValue = url;
            window.close();
        }
        else {
            var thumbClientId = '<%= Request.QueryString["ThumbClientId"] %>';
         
    if (thumbClientId == '') {
        var obj = opener.document.getElementById('<%= Request.QueryString["ClientId"] %>');
        var strs = '<%= Request.QueryString["ClientId"] %>';
        var obj2 = opener.document.getElementById("Img_" + strs.replace("txt_",""));
        var newurl = url;
        obj.value = newurl;
        alert(obj2);
        obj2.src = "/uploadfiles/"+newurl;
	   // obj.options[obj.length] = new Option(newurl, newurl);
	}
    else {
	    var obj = opener.document.getElementById(thumbClientId);
	    obj.value = url;
	}
    //window.close();
}
}
 
//-->
	</script>

</div>
</form>
</body>
</html>
