<%@ page language="C#" autoeventwireup="true" inherits="App_demos_docs_nav, App_Web_m5epptqi" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> </title>
<link rel="stylesheet"  href="../App_Themes/UserThem/jquery.mobile-1.2.0.css" />
<link rel="stylesheet" href="../App_Themes/UserThem/jqm-docs.css" />
<script src="http://code.zoomla.cn/jquery/jquery.js"></script>
<script src="http://code.zoomla.cn/jquery/jqm-docs.js"></script>
<script src="http://code.zoomla.cn/jquery/jquery.mobile-1.2.0.js"></script>
</head>
<body>
<form id="form1" runat="server">
    	
 <div data-role="page" data-theme="a" class="nav-search">
<div data-role="header" data-theme="f" id="bgcolor" style=" background:#333333; border:1px solid #333333;width:100%;">
<h1><asp:Label  ID="Label1" runat="server" Text=""></asp:Label></h1>
<a href="Default.aspx?NodeID=<%=GetID()%>&ID=<%Call.Label("{$GetRequest(ID)$}"); %>" data-icon="home" data-iconpos="notext" data-direction="reverse" target="_self"  style=" background:#333333;  border:1px solid #333333">返回</a>
</div><!-- /header -->
	<div data-role="content">   

	<style>

		.nav-search .ui-content {
			margin-top:16px;
		}
		.nav-search .ui-corner-top {
			-moz-border-radius: 0;
			-webkit-border-radius: 0;
			border-radius: 0;
		}
		.nav-search .ui-bar-a {
			background-image:none;
			background-color:#555;
		}
		.nav-search .ui-btn-up-a {
			background-image:none;
			background-color:#333333;
             
		}
		.nav-search .ui-btn-inner {
			border-top: 1px solid #888;
			border-color: rgba(255, 255, 255, .1);
		}
	</style>
	
	<script>
	    $('body').delegate('.nav-search', 'pageshow', function (e) {
	        $('.ui-input-text').attr("autofocus", true)
	    });
	</script>


	<ul data-role="listview" data-theme="a" data-divider-theme="a" data-filter="true" data-filter-theme="a" data-filter-placeholder="Search documentation...">
			   <asp:Repeater ID="Egv" runat="server">  
                    <ItemTemplate>
                   <li data-filtertext="<%#GetT(Eval("Title", "{0}"))%>"><asp:Label ID="Title" runat="server" Text=' <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"))%>' /> </li> 
                    </ItemTemplate>
              </asp:Repeater>
		</ul>
	</div><!-- /content -->

</div><!-- /page -->
    </form>
</body>
</html>
