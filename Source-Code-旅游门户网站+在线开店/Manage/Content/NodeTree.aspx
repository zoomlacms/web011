<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.NodeTree, App_Web_zxhe1krl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%--<%@ OutputCache Duration="6000" VaryByParam="none"%>--%>
<html>
<head runat="server">
<title><%=lang.LF("节点栏目导航")%></title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script type="text/javascript">    
    function Switch(obj) {
        obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
        var nextDiv;
        if (obj.nextSibling)
        {
            if(obj.nextSibling.nodeName=="DIV")
            {
                nextDiv = obj.nextSibling;
            }
            else
            {
                if(obj.nextSibling.nextSibling)
                {
                    if(obj.nextSibling.nextSibling.nodeName=="DIV")
                    {
                        nextDiv = obj.nextSibling.nextSibling;
                    }
                }
            }
            if(nextDiv)
            {
                nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none"; 
            }
        }
    }
    function OpenLink(lefturl, righturl) {
        if (lefturl != "") {
            parent.frames["left"].location = lefturl;
        }
        try {
            parent.MDIOpen(righturl); return false;
        } catch (Error) {
            parent.frames["main_right"].location = righturl;
        }
    }

    function gotourl(url) {
        try {
            parent.MDILoadurl(url); void (0);
        } catch (Error) {
            parent.frames["main_right"].location = "../222222222222222" + url; void (0);
        }
    }

    function chechs() {
        if (document.getElementById) {
            parent.document.getElementById("left").height = parent.document.documentElement.clientHeight- 100;
            //alert(parent.document.getElementById("left").height);
        }
        else {
            parent.document.getElementById("left").height = document.body.scrollHeight + 20;
        }
    }
    function search() {
        var LabelCate = "";
        var LabelName = document.getElementById("Lname").value;
        if (/^(\+|-)?\d+($|\.\d+$)/.test(LabelName)) {
            window.open('ContentManage.aspx?type=1&title=' + LabelName, "main_right");
        }
        else
        {
            window.open('ContentManage.aspx?title=' + LabelName, "main_right");
        }
    }
    function cls() {

        var obj = document.getElementById('Lname');

        obj.style.color = '#000';

        with (event.srcElement)

            if (value == defaultValue) value = ""

    }

    function res() {

        var obj = document.getElementById('Lname');

        obj.style.color = 'Gray';

        with (event.srcElement)

            if (value == "") value = defaultValue

    }
</script>
    <style>  #Lname {
       line-height:20px; padding-left:5px;   }
     </style>

</head>
<body id="Guidebody">
<form id="formGuide" runat="server">
<div id="Guide_back">
<ul>
<li id="Guide_top">
	<div id="Guide_toptext"><%=lang.LF("内容管理")%></div>
</li>
<li> 
    <div id="Guide_div">
    <table  cellpadding="2" cellspacing="1" class="l_input" style="background:#fff;"><tr><td>
        <asp:TextBox ID="Lname" runat="server"  class="l_inpnon" style="color:#ddd; width:150px; height:20px; "
            Text="请输入文章标题或ID" onfocus="if (this.value == '请输入文章标题或ID') { this.value = ''; this.style.color = '#ddd';}"
               onblur="if(this.value==''){this.value='请输入文章标题或ID';this.style.color='#ddd;width:150px; height:20px;  ';}" 
             onkeypress="CheckInfo(this)" ></asp:TextBox>
        <script type="text/javascript">
            function CheckInfo(obj) {
                if (event.keyCode == 13)
                {
                    //alert(obj.value);
                    search();
                }
            }
        </script>
        <div style="display:none;">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>                                                                             </td><td><input type="button" onclick="search()" value="" class="C_sch" Style=""/></td></tr></table></div>
</li>
<li id="Guide_main">
	<div id="Guide_box">
		<asp:TreeView ID="tvNav" runat="server" ShowLines="True" EnableViewState="False" NodeIndent="10" onclick="chechs()">
			<NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
			<ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
			<SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
			<RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
		</asp:TreeView>
    <span style="color:green;" runat="server" id="remind" visible="false" />
	</div>
</li>
</ul>
</div>
</form>
</body>
</html>
