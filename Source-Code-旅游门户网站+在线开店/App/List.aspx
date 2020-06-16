<%@ page language="C#" debug="true" autoeventwireup="true" inherits="App_List, App_Web_dacmy2i0" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
 <!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>图库列表</title>
<link rel="stylesheet" href="../App_Themes/UserThem/jquery.mobile-1.2.0.css" />
<link rel="stylesheet" href="../App_Themes/UserThem/jqm-docs.css" />
<script src="http://code.zoomla.cn/jquery/jquery.js"></script>
<script src="http://code.zoomla.cn/jquery/jquery.mobile-1.2.0.js"></script>

<%--测试用--%>
<link href="../App_Themes/CloudStyle/styles.css" type="text/css" rel="stylesheet" />
<link href="../App_Themes/CloudStyle/photoswipe.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../JS/klass.min.js"></script>
<script type="text/javascript" src="/JS/jquery.js"></script>
<script type="text/javascript" src="../JS/code.photoswipe.jquery-3.0.5.min.js"></script>
<script type="text/javascript">
    (function (window, $, PhotoSwipe) {
        $(document).ready(function () {
            var options = {};
            $("#Gallery a").photoSwipe(options);
        });
    }(window, window.jQuery, window.Code.PhotoSwipe));
</script>

<script src="http://code.zoomla.cn/jquery/jqm-docs.js"></script>
<style>
#txtPage,#TextBox1 {display:none;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div data-role="page" class="type-index">
<div data-role="header" data-theme="f" style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>">
        <h1> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
        <a href="javascript:history.go(-1)" data-icon="home" data-iconpos="notext" data-direction="reverse" target="_self" style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>">返回</a>
     <a href="nav.aspx?NodeID=<%=GetID()%>&ID=<%Call.Label("{$GetRequest(ID)$}"); %>" data-icon="search" data-iconpos="notext" data-rel="dialog" data-transition="fade" target="_self" style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>"></a>
</div>
<asp:TextBox ID="TextBox1" runat="server" Width="90px" Height="15px" class="l_input"></asp:TextBox>
 <div data-role="content">
		<ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="f" >
             <li data-role="list-divider"  style="background:<%=GetColor()%>; border:1px solid <%=GetColor()%>"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></li>
              <asp:Repeater ID="Egv" runat="server" OnItemDataBound="Egv_ItemDataBound">  
                    <ItemTemplate>
                    <li><asp:Label ID="Title" runat="server" Text=' <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"))%>' />

<%--                        <img style="width:80px; height:80px; border:1px solid #c2c1c1;" src="<%=GetImgUrl()%>" alt="暂无缩略图" />--%>
<%--<table id="tabs" Width="100%">
    <tr style="text-align:center;">
        <td>
        <asp:DetailsView ID="DetailsView1"  runat="server"  CellPadding="4" 
        GridLines="None" Font-Size="12px" Style="margin-bottom: 0px; margin-top: 0px;" 
		CssClass="r_navigations" CellSpacing="1">
		<Fields>
		</Fields>
		<FooterStyle Font-Bold="True" BackColor="#FFF" />
		<CommandRowStyle Font-Bold="True" CssClass="r_navigations tdlefttxt"/>
		<RowStyle />
		<FieldHeaderStyle Font-Bold="True" />
		<PagerStyle HorizontalAlign="Center" />
		<HeaderStyle Font-Bold="True" />
		<EditRowStyle />
		<AlternatingRowStyle />
	    </asp:DetailsView>
        </td>
    </tr> 
</table>--%>
                    </li>
                    </ItemTemplate>
              </asp:Repeater>
        </ul>
</div>

<table width="100%">
     <tr class="tdbg">
      <td height="24" colspan="77" align="center" class="tdbgleft"> 
        <asp:Label ID="Toppage" runat="server" Text="" />
        <asp:Label ID="Nextpage" runat="server" Text="" />
        <asp:Label ID="Downpage" runat="server" Text="" />
        <asp:Label ID="Endpage" runat="server" Text="" />
       
        <%--<asp:Label ID="Nowpage" runat="server" Text="" />
        <asp:Label ID="PageSize" runat="server" Text="" />--%>
         <span style="text-align: center">
        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" ontextchanged="txtPage_TextChanged"></asp:TextBox>
        </span></td>
    </tr>
</table>
</div> 
<div data-role="footer" id="Foot" class="footer-docs" data-theme="c">
<p class="jqm-version"></p>
<p> <%Call.Label("{$Copyright/}"); %> </p>
</div>
</form>
<%--<script src="/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script>
    var type;
    var typeDes;
    $("#DetailsView1 tr").each(function (trindex, tritem) {
        $(tritem).find("td").each(function (tdindex, tditem) {
            type = $(tditem).html();
            var strDes = "<ul id=\"Gallery\" class=\"gallery\">";
            strDes += "<li><a href='" + type + "' target='_blank'><img style='width:200px;' src='" + type + "'/></a></li>";
            strDes += "</ul>"
            alert(strDes);
            $(tditem).html(strDes);
        });
        $(this).children('td').eq(0).html("");
    });
</script>--%>
</body>
</html>