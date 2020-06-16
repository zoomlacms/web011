<%@ page language="C#" autoeventwireup="true" inherits="manage_User_UserGuide, App_Web_dczgtqur" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("会员功能")%></title>
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

    function gotourl(url) {
        try {
            parent.MDILoadurl(url); void (0);
        } catch (Error) {
            parent.frames["main_right"].location = "../" + url; void (0);
        }
    }
    function search() {
        var LabelName = document.getElementById("Lname").value;
        window.open('../I/User/UserManage.aspx?lblkey=' + LabelName, "main_right");
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
<body id="Guidebody" style="margin-top: 1px;">
<form id="formGuide" runat="server">
  <div id="Div1">
    <ul>
      <li id="Guide_top">
        <div id="Guide_toptext"><%=lang.LF("会员管理")%></div>
      </li>
      <li id="Guide_main">
        <div id="Guide_box">
          <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("会员管理")%></div>
          <div class="guide">
              <div id="Guide_div">
    <table  cellpadding="2" cellspacing="1" class="l_input" style="background:#fff;"><tr><td> <asp:TextBox ID="Lname" runat="server" Width="155px" Height="20px"  class="l_inpnon" Text="会员名" onfocus="cls()" onblur="res()" onkeyup="if (event.keyCode==13) {search();}"></asp:TextBox></td><td><input type="button" onclick="search()" value=" " class="C_sch" Style=""/></td></tr></table></div>
            <ul>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/user/UserManage.aspx" target="main_right"><%=lang.LF("会员管理")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/user/GroupManage.aspx" target="main_right"><%=lang.LF("会员组管理")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/user/PointGroup.aspx" target="main_right"><%=lang.LF("用户积分等级")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/User/SystemUserModel.aspx" target="main_right"><%=lang.LF("注册字段管理")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/Polymeric/ClassManage.aspx" target="main_right"><%=lang.LF("聚合分类")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/Polymeric/ConfigSet.aspx" target="main_right"><%=lang.LF("聚合页配置")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/User/UserDay.aspx" target="main_right"><%=lang.LF("手机节日提醒")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/User/UserDayManage.aspx" target="main_right"><%=lang.LF("用户节日管理")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/Config/UserConfig.aspx" target="main_right"><%=lang.LF("会员参数配置")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/APP/Suppliers.aspx" target="main_right">社会化登陆</a></li> 
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/APP/Ucenter.aspx" target="main_right">跨域网站接入</a></li> 
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../I/user/UserApi.aspx" target="main_right"><%=lang.LF("Api整合接口")%></a></li> 
            </ul>
          </div>
        </div>
      </li>
    </ul>
  </div>
</form>
</body>
</html>