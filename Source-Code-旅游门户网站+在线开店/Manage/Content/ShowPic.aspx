 <%@ page language="C#" autoeventwireup="true" inherits="App_content, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
	<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>图片预览</title> 
</head>
<body> 
  <div id="divDrp" runat="server">   <img src="Default.aspx?Gid=<%=Request["Gid"] %>&ModeID=<%=Request["ModeID"] %>&FileName=<%=Request["FileName"] %>" /></div>  
</body>
</html>
