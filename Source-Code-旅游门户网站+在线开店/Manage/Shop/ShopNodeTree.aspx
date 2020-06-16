<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.ShopNodeTree, App_Web_3rrk3jrp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<html>
<head id="Head1" runat="server">
<title><%=lang.LF("节点栏目导航")%></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
    function Switch(obj) {
        obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
        var nextDiv;
        if (obj.nextSibling) {
            if (obj.nextSibling.nodeName == "DIV") {
                nextDiv = obj.nextSibling;
            }
            else {
                if (obj.nextSibling.nextSibling) {
                    if (obj.nextSibling.nextSibling.nodeName == "DIV") {
                        nextDiv = obj.nextSibling.nextSibling;
                    }
                }
            }
            if (nextDiv) {
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

    function chechs() {
        if (document.getElementById) {
            parent.document.getElementById("left").height = document.body.scrollHeight + 20;
        }
        else {
            parent.document.getElementById("left").height = document.body.scrollHeight + 20;
        }
    }

    function gotourl(url) {
        try {
            parent.MDILoadurl(url); void (0);
        } catch (Error) {
            parent.frames["main_right"].location = "../" + url; void (0);
        }
    }
    function search()
    {
        var LabelName = document.getElementById("Lname").value;
        window.open('ProductManage.aspx?souchtype=1&key=' + LabelName, "main_right");
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
</head>
<body id="Guidebody" style="margin: 0px; margin-top: 1px;">
<form id="formGuide" runat="server">
<div id="Guide_back">
<ul>
    <li id="Guide_top">
        <div id="Guide_toptext"><%=lang.LF("商城管理")%></div>
    </li>
    <li>
        <div id="Guide_div">
<table  cellpadding="2" cellspacing="1" class="l_input" style="background:#fff;"><tr><td> 
    <asp:TextBox ID="Lname" runat="server" Width="155px" Height="20px"  class="l_inpnon" style="color:#666"
            Text="商品名称" onfocus="if (this.value == '商品名称') { this.value = ''; this.style.color = 'black';}"
               onblur="if(this.value==''){this.value='商品名称';this.style.color='#666';}" 
            onkeypress="CheckInfo(this)" ></asp:TextBox></td><td>
                <script type="text/javascript">
                    function CheckInfo(obj) {
                        if (event.keyCode == 13) {
                            search();
                        }
                    }
        </script>
  <input type="button" onclick="search()" value=" " class="C_sch" Style=""/>

                                                                                                                         </td></tr></table></div>
        <div style="display:none;">
        <asp:TextBox runat="server"></asp:TextBox>
        </div>
    </li>
    <li id="Guide_main">
        <div id="Guide_box" style="height: 500px">
            <asp:TreeView ID="tvNav" runat="server" ExpandDepth="0" ShowLines="True" EnableViewState="False" NodeIndent="10" Height="220px" Width="98px">
                <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
                <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
                <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
                <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
            </asp:TreeView>
        </div>
    </li>
</ul>
</div> 
</form>
</body>
</html>