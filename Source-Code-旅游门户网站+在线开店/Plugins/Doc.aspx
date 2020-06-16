<%@ page language="C#" autoeventwireup="true" inherits="User_Cloud_wordpage, App_Web_tfch1s4r" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>智能文档生成平台</title> 
<link href="../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style type="text/css">
p.MsoNormal { margin-bottom: .0001pt; text-align: justify; text-justify: inter-ideograph; font-size: 10.5pt; font-family: "Calibri", "sans-serif"; margin-left: 0cm; margin-right: 0cm; margin-top: 0cm; }
</style>
</head>
<body class="DocBg">
<form id="form1" runat="server">
<div id="DocTop">
<a href="/" target="_blank"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>_文件工厂" /> </a>文件工厂-用于快速生成各种文档
</div>
<!--top end -->
<div class="Doc_topinfo"> 您现在的位置：<span id="YourPosition"><a title="网站首页" href="/" target="_parent"><span id="LblSiteName">逐浪CMS</span></a> &gt;&gt;<a title="会员中心" href='/User/Default.aspx' target="_parent">会员中心</a> &gt;&gt;生成Word</span> </div>
    
<div id="WebBlock" >
   
    <div id='nav' class='navmeu' style="z-index:999;"> 
				<div   class='navCenter'>
					<div class='itemPrev'>  </div>
					 
					<ul class='itemContainer'> <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <li  class='item' id='nav1'><a href="/Plugins/Doc.aspx?id=<%#Eval("ID") %>"><%#Eval("DocName") %></a></li> 
        </ItemTemplate>
    </asp:Repeater>  
</ul>	 
<div class='itemNext'> 
</div>
</div>  
</div>
    			

<!--WebBlock e --> 
  <div id="manageinfo" class="us_seta" style="margin-top: 10px; width: 100%; float: left">
    <h1 style="text-align: center"> 生成Word</h1>
    文件名：
    <asp:TextBox ID="Mydoc" runat="server" Text="我的合同"></asp:TextBox>
    <br />
    <div id="formHtml" runat="server"> </div>
    <br />
    <asp:HiddenField ID="txtDes" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="selCard" runat="server"></asp:HiddenField>
    <asp:Button ID="Button1" runat="server" Text="格式预览" OnClick="btnBill2_Click"  /> 
    <input type="button" ID="Button2" value="隐藏预览" OnClick="hide()"  /> 
    <asp:Button ID="btnBill" runat="server" Text="生成合同到云盘" OnClick="btnBill_Click" />
  </div>
  <textarea id="viewWord" runat="server"  visible="false" rows="40" cols="100" > </textarea>
  <%--<div id="viewWord" runat="server"  visible="false">  
    </div>--%>
    <asp:HiddenField ID="fileurl" runat="server" />
     <div id="bottom" class="reg" style="margin-top:10px;padding-top:10px;"> 
                <script language="javascript" type="text/javascript"> 
<!--
    var year = "";
    mydate = new Date();
    myyear = mydate.getYear();
    year = (myyear > 200) ? myyear : 1900 + myyear;
    document.write(year); 
    --> 
                </script>
                &copy;&nbsp; Copyright&nbsp;逐浪CMSAll rights reserved. 
        </div>

</form>
</body> 
<script type="text/javascript" src="/JS/fai.js"></script> 
<script type="text/javascript" >
    $(function () {
        Site.showNavSubMenu(0);
        Site.showNavItemContainer();
    });
    function hide() {
        $("#viewWord").css("display","none");
    }
</script>
<script type="text/javascript" language="javascript" >
    window.onbeforeunload = function () {
    }

      var _mainDomain = ''; var _resRoot = ''; var _colId = 319; var _extId = 0; var _fromColId = -1; var _designMode = false; var nav1SubMenu = [];
</script>
</html>
