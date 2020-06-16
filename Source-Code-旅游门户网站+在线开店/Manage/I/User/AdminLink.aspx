<%@ page language="C#" autoeventwireup="true" inherits="manage_User_AdminLink, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=lang.LF("管理员管理")%></title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
     <div id="Div1">
    <ul>
      <li id="Guide_top">
        <div id="Guide_toptext"><%=lang.LF("管理员管理")%></div>
      </li>
      <li id="Guide_main">
        <div id="Guide_box">
          <div class="guideexpand" onclick="Switch(this)"> <%=lang.LF("管理员管理")%></div>
          <div class="list-group">
            <ul>
              <li  onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/AdminManage.aspx" target="main_right"><%=lang.LF("管理员管理")%></a></li>
              <li  onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/RoleManage.aspx" target="main_right"><%=lang.LF("角色管理")%></a></li>
            </ul>
          </div>
        </div>
      </li>
    </ul>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
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
</script>
</asp:Content>