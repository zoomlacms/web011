 <%@ page language="C#" autoeventwireup="true" inherits="App_content, App_Web_m5epptqi" enableEventValidation="false" viewStateEncryptionMode="Never" %>
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

<div data-role="page" class="type-interior">
	<div data-role="header" data-theme="f"   style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>">
		<h1> <asp:Label ID="Titles" runat="server" Text="Label"></asp:Label> </h1>
		 <a href="Default.aspx?NodeID=<%=GetID()%>&ID=<%Call.Label("{$GetRequest(ID)$}"); %>" data-icon="home" data-iconpos="notext" data-direction="reverse" target="_self"  style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>">Home</a>
     <a href="nav.aspx?NodeID=<%=GetID()%>&ID=<%Call.Label("{$GetRequest(ID)$}"); %>" data-icon="search" data-iconpos="notext" data-rel="dialog" data-transition="fade" target="_self"  style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>" ></a>
	</div><!-- /header -->

	<div data-role="content">
	<div class="content-primary">
   <asp:Label ID="content" runat="server" Text="Label"></asp:Label>
 	</div><!--/content-secondary -->

	<div class="content-secondary">

		<div data-role="collapsible" data-collapsed="true" data-theme="b" data-content-theme="d">

				<h3>查看更多</h3>

				<ul data-role="listview"  data-theme="c" data-dividertheme="d">

					<li data-role="list-divider">
    <asp:Label ID="NodeName" runat="server" Text="Label"></asp:Label></li>
					  <asp:Repeater ID="Egv" runat="server">  
                    <ItemTemplate>
                    <li> <asp:Label ID="Title" runat="server" Text=' <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"))%>' /></li>
                    </ItemTemplate>
              </asp:Repeater>
				</ul>
		</div>
	</div>

</div><!-- /content -->

<div data-role="footer" class="footer-docs" data-theme="c">
		<p> <%Call.Label("{$Copyright/}"); %> </p>
</div>

</div><!-- /page -->
    	
     
</body>
</html>
