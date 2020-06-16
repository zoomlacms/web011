<%@ page language="C#" autoeventwireup="true" inherits="Common_Chat_chathistory, App_Web_5avmdgwc" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link type="text/css" href="chat.css" rel="stylesheet" />
    <title>历史记录</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="chat_container" style="width:80%;max-width:1024px;min-width:600px; margin:auto;">
            <div class="chat_header">
                <span id="uinfo_name"><asp:Label runat="server" ID="CUName_L"></asp:Label></span>
                <span style="float: right; margin-right: 10px;">
                    <span class="glyphicon glyphicon-remove opbtn" onclick="parent.ChatClose();" title="关闭"></span>
                </span></div>
                <asp:Repeater runat="server" ID="RPT">
                    <HeaderTemplate><div class="chat_body" style="max-height:700px;padding-bottom:10px;"></HeaderTemplate>
                    <ItemTemplate>
                        <%#GetChatContent() %>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
            <div style="text-align:center;"><asp:Literal ID="Page_Lit" runat="server" EnableViewState="false"></asp:Literal></div>
       </div>
    </form>
</body>
</html>
