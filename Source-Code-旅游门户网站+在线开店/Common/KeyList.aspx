<%@ page language="C#" autoeventwireup="true" inherits="Common_KeyList, App_Web_gjj4kpp5" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/ICMS/V3.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<head id="Head1" runat="server">
<title>关键字</title>
<base target="_self" />
</head>
<% m_UserInput = Request.QueryString["OpenerText"];%>
<body>
<form id="form1" runat="server">
  <div>
    <table class="table table-bordered table_padding0">
      <tr class="title" style="height: 22px">
        <td align="left"><b>已经选定的关键词：</b></td>
        <td align="right"><a href="javascript:window.close();">关闭&gt;&gt;</a></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td><input type="text" id="UserNameList" size="60" class="form-control" maxlength="200" readonly="readonly"  />
          <input type="hidden" name="HdnUserName" id="HdnUserName" value="" /></td>
        <td><input type="button"  name="del1" class="btn btn-primary"  style="width:110px;"  onclick="del(1)" value="删除最后" />
          <input type="button"  name="del2" class="btn btn-primary"  style="width:110px;"  onclick="del(0)" value="删除全部" /></td>
      </tr>
    </table>
    <br />
    <table class="table table-bordered table_padding0">
    <tr class="title">
      <td onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"><b>关键字列表：</b></td>
      <td><asp:TextBox ID="TxtKeyWord" runat="server" class="form-control"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button class="C_input" ID="BtnSearch" CssClass="btn btn-primary" runat="server" Text="查找" /></td>
    </tr>
    <tr>
    <td colspan="2"><div id="DivUserName" runat="server" visible="false"> 未找到关键字！</div>
    <asp:Repeater ID="RepUser" runat="server" >
      <HeaderTemplate>
        <table class="table table-bordered table_padding0">
        <tr>
      </HeaderTemplate>
      <ItemTemplate>
        <td><a href="#" onclick="<%# "add('" + Eval("listkeyword") + "')"%>"> <%#Eval("listkeyword")%><%#SetItemUser(DataBinder.Eval(Container.DataItem, "listkeyword").ToString())%> </a></td>
        <% 
            i++; %>
        <% if (i % 8 == 0 && i > 1)
            {%>
        </tr>
        <tr>
        <%} %>
      </ItemTemplate>
      <FooterTemplate>
        </tr>
        </table>
      </FooterTemplate>
    </asp:Repeater>
    </td>
    </tr>
    <tr class="tdbg">
      <td colspan="2"><div id="DivAdd" runat="server"> <a href="#" onclick="add('<%=m_allUser %>')">增加以上所有关键字</a></div></td>
    </tr>
    </table>
    <div id="pager1" runat="server"></div>
  </div>
  <script language="javascript" type="text/javascript">
        document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
        function add(obj) {
            if (obj == "") { return false; }
            if (opener.document.getElementById('<%= m_UserInput %>').value == "") {
                opener.document.getElementById('<%= m_UserInput %>').value = obj;
                document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
                return false;
            }
            var singleUserName = obj.split("|");
            var ignoreUserName = "";
            for (i = 0; i < singleUserName.length; i++) {
                if (checkUserName(opener.document.getElementById('<%= m_UserInput %>').value, singleUserName[i])) {
                    ignoreUserName = ignoreUserName + singleUserName[i] + " ";
                }
                else {
                    opener.document.getElementById('<%= m_UserInput %>').value = opener.document.getElementById('<%= m_UserInput %>').value + " " + singleUserName[i];
                    document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
                }
            }
            if (ignoreUserName != "") {
                alert(ignoreUserName + "关键字已经存在，此操作已经忽略！");
            }
        }
        function del(num) {
            if (num == 0 || opener.document.getElementById('<%= m_UserInput %>').value == "" || opener.document.getElementById('<%= m_UserInput %>').value == ",") {
                opener.document.getElementById('<%= m_UserInput %>').value = "";
                document.getElementById('UserNameList').value = "";
                return false;
            }

            var strDel = opener.document.getElementById('<%= m_UserInput %>').value;
            var s = strDel.split(",");
            opener.document.getElementById('<%= m_UserInput %>').value = strDel.substring(0, strDel.length - s[s.length - 1].length - 1);
            document.getElementById('UserNameList').value = opener.document.getElementById('<%= m_UserInput %>').value;
        }

        function checkUserName(UserNamelist, thisUserName) {
            if (UserNamelist == thisUserName) {
                return true;
            }
            else {
                var s = UserNamelist.split("|");
                for (j = 0; j < s.length; j++) {
                    if (s[j] == thisUserName)
                        return true;
                }
                return false;
            }
        }
    </script>
</form>
</body>
</html>