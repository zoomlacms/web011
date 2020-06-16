<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.CreateHtml, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>发布操作</title>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
</head>
<body  style='color:#666'>
    <form id="form1" runat="server">
    <div id="nav_box">
        <div class="r_navigation">
        后台管理&nbsp;&gt;&gt;&nbsp;<a href="ContentManage.aspx">内容管理</a>&nbsp;&gt;&gt;&nbsp;<a href="CreateHtmlContent.aspx">生成发布</a>
        </div>
    </div>
    <div style="height:24px;"></div>
    <div style="text-align: left;margin-left:10px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <br /><br />
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:Literal ID="infoHtml"  runat="server"></asp:Literal>
                <asp:TextBox ID="TextBox1" runat="server"  BorderStyle="None" TextMode="MultiLine" Width="1px" Height="1px" ></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>

<script type="text/javascript">
   var timer1= window.setInterval("ShowInfo()", 500);
   function ShowInfo()
   {
       scroll(0, 10000);
       if (document.getElementById("TextBox1").value.indexOf("生成完成") >= 0) {
           window.clearInterval(timer1);
       }
   }
</script>
