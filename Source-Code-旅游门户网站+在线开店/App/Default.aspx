<%@ page language="C#" autoeventwireup="true" inherits="App_Default, App_Web_m5epptqi" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>浏览</title>
<link rel="stylesheet"  href="../App_Themes/UserThem/jquery.mobile-1.2.0.css" />
<link rel="stylesheet" href="../App_Themes/UserThem/jqm-docs.css" />
<script src="../JS/jquery-1.6.4.js"></script>
<script src="http://code.zoomla.cn/jquery/jquery.js"></script>
<script src="http://code.zoomla.cn/jquery/jqm-docs.js"></script>
<script src="http://code.zoomla.cn/jquery/jquery.mobile-1.2.0.js"></script>
<script type="text/javascript">
    var tempMarginTop = 0;
    var count;
    var temp;
    var tempTop;
    if (document.documentElement.clientHeight <= 405) {
        window.onload = function () {
            var liHeight = $('.type-home').find('ul').children('li').first().height();
            count = $('ul').find('li').length / 2;
            temp = -(liHeight + 30);
            var margintop = $('.type-home').find('ul').css('margin-top');
            tempMarginTop = parseInt(margintop.toString().substring(0, margintop.length - 2));
            $('.type-home').bind("mousewheel", function (event, delta) {
                return Scroll(event, delta);
            });
        }

        function Scroll(event, delta) {
            liHeight = $('.type-home').find('ul').children('li').first().height();
            count = $('ul').find('li').length / 2;
            temp = -(liHeight + 30);
            var increase;
            if (event.wheelDelta / 120 > 0) {
                if (tempMarginTop >= 0) {
                    tempMarginTop = 0;
                }
                else {
                    tempMarginTop = tempMarginTop - temp;
                }
            }
            else {
                tempMarginTop = tempMarginTop + temp;
            }
            if (-tempMarginTop >= -(temp * (count - 1))) {
                $('.type-home').find('ul').css('margin-top', '0px');
                tempMarginTop = 0;
            }
            else {
                $('.type-home').find('ul').css('margin-top', tempMarginTop + 'px');
            }
            return false;
        }
    }
</script>
</head>
<body>
<form id="form1" runat="server">
 <div data-role="page" class="type-home">
    	<div data-role="header" data-theme="f" id="bgcolor" style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>">
		<h1><asp:Label  ID="Label1" runat="server" Text=""></asp:Label></h1>
	 <a href="Default.aspx?NodeID=<%=GetID()%>&ID=<%Call.Label("{$GetRequest(ID)$}"); %>" data-icon="home" data-iconpos="notext" data-direction="reverse" target="_self"  style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>">Home</a>
     <a href="nav.aspx?NodeID=<%=GetID()%>&ID=<%Call.Label("{$GetRequest(ID)$}"); %>" data-icon="search" data-iconpos="notext" data-rel="dialog" data-transition="fade" target="_self"  style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>" ></a>
	</div><!-- /header -->
	<div data-role="content">
		<div class="content-secondary">
			<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="f">
                <asp:Repeater runat="server" ID="nodeRepeater">
                    <ItemTemplate>
				<li data-role="list-divider"  style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>">
                    <%#Eval("NodeName") %>
                </li>
                    </ItemTemplate>
                </asp:Repeater>
                  <%--  <%Call.Label("{ZL.Label id=\"根据节点ID输出指定节点名\"  /}"); %>--%>

              <%--    <%Call.Label("{ZL.Label id=\"节点列表App\" ShowNum=\"30\" /}"); %> --%>
			</ul>
		</div><!--/content-primary-->
	</div>
	<div data-role="footer" class="footer-docs" data-theme="c">
			<p> <%Call.Label("{$Copyright/}"); %> </p>
	</div>
 </div>
</form>
</body>
</html>
