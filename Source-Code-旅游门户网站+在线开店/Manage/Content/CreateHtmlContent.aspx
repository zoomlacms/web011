<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="ZoomLa.WebSite.Manage.Content.CreateHtmlContent, App_Web_i3fxcuwj" enableviewstatemac="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8">
<title><%=lang.LF("发布管理")%></title>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/Guide.css"  />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
<link type="text/css" rel="stylesheet" href="../../dist/css/bootstrap.min.css" />
<script type="text/javascript" src="/JS/calendar.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
 var tID = 0;
 var arrTabTitle = new Array("TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5");
 function pload() {
     var ID = '<%=Request.QueryString["id"]%>';
     if (ID != tID) {
         if (document.getElementById(arrTabTitle[ID].toString()) != null) {
             document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
         }
         if (document.getElementById(arrTabTitle[tID].toString()) != null) {
             document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
         }
     } else {
         if (document.getElementById("TabTitle") != null) {
             document.getElementById("TabTitle").style.display = "";
             document.getElementById("TabTitle").className = "titlemouseover";
         }
         tID = ID;
     }
 }
</script>
<script type="text/javascript">
    function myfun() {
        if (document.form1.ColumnList.value == "") {
            alert("请选择栏目");
            return false;
        }
    }

    function lbColumnCheck() {
        if (document.form1.lbColumn.value == "") {
            alert("请选择栏目");
            return false;
        }
    }

    function lbSingleCheck() {
        if (document.form1.lbSingle.value == "") {
            alert("请选择单页");
            return false;
        }
    }
    function lbSpeacilCheck() {
        if (document.form1.lbSpeacil.value == "") {
            alert("请选择专题");
            return false;
        }
    }
    function ShowCreate(result,id) {
		HideCreate();
		document.getElementById(result).style.display = "";

        for (var i = 0; i < arrTabTitle.length; i++) {
            if (arrTabTitle[i] == id) {
                document.getElementById(arrTabTitle[i]).style.display = "";
                document.getElementById(arrTabTitle[i]).className = "titlemouseover";
            } else {
            document.getElementById(arrTabTitle[i]).className = "tabtitle";
            }
        }
    }

    function HideCreate() {
        for (i = 1; i < 6; i++) {
            document.getElementById("crt" + i).style.display = "none";
        }
    }
    function ShowMainsgourl(lurl, rurl) {
        parent.parent.frames["left"].location = lurl;
        parent.parent.frames["main_right"].location = rurl; void (0);
    }
</script>
</head>
<body onload="pload()">
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation"><%=lang.LF("后台管理")%>&gt;&gt;<a href="ContentManage.aspx"><%=lang.LF("内容管理")%></a>&gt;&gt; <a href="javascript:void(0)" onclick="ShowMainsgourl('CreateLink.aspx','CreateHtmlContent.aspx')"><%=lang.LF("生成发布")%></a></div>
</div>
<div style="height:24px;"></div>
   <%-- <div class="divline">
        <ul style="cursor: hand;">
            <li class="spanfixdiv1" onclick="ShowCreate('crt1')">发布主页与内容</li>
            <li class="spanfixdiv1" onclick="ShowCreate('crt3')">发布单页</li>
            <li class="spanfixdiv1" onclick="ShowCreate('crt2')">发布栏目</li>
            <li class="spanfixdiv1" onclick="ShowCreate('crt4')">发布专题</li>
        </ul>
    </div>
    <div class="clearbox">
    </div>--%>
<!--    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center">
        <tr class="title">
            <td colspan="3" align="left">
                &nbsp;<%=lang.LF("生成发布")%>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" style="width:20%">
                &nbsp;<%=lang.LF("生成发布")%>：
            </td>
            <td align="left"  style="width:8%">
            <asp:RadioButtonList ID="rblTime" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" onselectedindexchanged="rblTime_SelectedIndexChanged">
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="2" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList>
            </td>
            <td  ><asp:TextBox ID="txtDate" runat="server"  onclick="calendar()" class="l_input" ></asp:TextBox></td>
        </tr>
    </table>
-->    <div class="clearbox"></div>
    <div class="Creat_tips">
      <div class="alert alert-danger fade in" style="margin-bottom:10px;">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4>提示!</h4>
          <p style="padding-left:50px;line-height:40px;">
              <strong>
              <span class='glyphicon glyphicon-warning-sign' style='color:#f00;font-size:18px;'></span>
              <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
              <asp:LinkButton ID="btnCreate" ForeColor="#428bca" OnClick="btnCreate_Click" runat="server">立即生成>></asp:LinkButton>
                  </strong>
          </p>
        <p>发布栏目页，需在<a style="color:#428bca;" href="<%=CustomerPageAction.customPath2%>Config/SiteInfo.aspx">[系统设置]</a>-<a style="color:#428bca;" href="<%=CustomerPageAction.customPath2%>Content/NodeManage.aspx">[节点管理]</a>对相应节点生成选项进行设置，.aspx为不生成静态页<br />
           发布内容页，需对内容所在节点的生成选项的中，对内容页扩展名进行设置，.aspx为不生成静态页。
        </p>
      </div>
    </div>
    <div class="clearbox"></div>
    <!--top生成内容页-->
    <div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr align="center"> 
                <td id="TabTitle1" name="TabTitle1" class="titlemouseover" onclick="ShowCreate('crt1','TabTitle1')">
                    <%=lang.LF("快速发布")%>
                </td>
                <td id="TabTitle2" name="TabTitle2" class="tabtitle" onclick="ShowCreate('crt2','TabTitle2')">
                     <%=lang.LF("发布栏目")%>
                </td>
                <td id="TabTitle5" name="TabTitle5" class="tabtitle" onclick="ShowCreate('crt5','TabTitle5')">
                    <%=lang.LF("发布内容")%>
                </td>
                <td id="TabTitle3" name="TabTitle3" class="tabtitle" onclick="ShowCreate('crt3','TabTitle3')">
                     <%=lang.LF("发布单页")%>
                </td>
                <td id="TabTitle4" name="TabTitle4" class="tabtitle" onclick="ShowCreate('crt4','TabTitle4')">
                   发布专题
                </td>
                <td>&nbsp;
                </td>
            </tr>
        </table>
    </div>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="border" align="center" id="crt1" name="crt1">
        <tr class="title">
            <td colspan="2" align="left">快速发布
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" class="bqleft">&nbsp;<%=lang.LF("按照ID发布")%>：
            </td>
            <td align="left" class="bqright">
                <%=lang.LF("从")%><asp:TextBox ID="txtIdStart" class="l_input" runat="server"></asp:TextBox><%=lang.LF("到")%>
                <asp:TextBox ID="txtIdEnd" class="l_input" runat="server"></asp:TextBox>
                <asp:Button ID="btnCreateId" Style="width: 100px;" runat="server" Text="开始发布" class="C_input" OnClick="btnCreateId_Click" />
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right">
                <%=lang.LF("发布最新内容")%>：
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtNewsCount" Style="margin-left: 12px;" class="l_input" runat="server"></asp:TextBox><%=lang.LF("个")%>
                <asp:Button ID="btnNewsCount" Style="width: 100px;" runat="server" Text="开始发布" class="C_input" OnClick="btnNewsCount_Click" />
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right">
                <%=lang.LF("按照日期发布")%>：
            </td>
            <td class="bqright">
                <%=lang.LF("从")%><asp:TextBox ID="txtStartDate" class="l_input" runat="server" onclick="WdatePicker();" /><%=lang.LF("到")%>
                <asp:TextBox ID="txtEndDate" class="l_input" runat="server" onclick="WdatePicker();" />
                <asp:Button ID="Button2" Style="width: 100px;" runat="server" Text="开始发布" class="C_input" OnClick="Button2_Click" />
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" style="height: 24px">&nbsp;<%=lang.LF("发布人才系统") %>：
            </td>
            <td align="left" style="height: 24px">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="zhaopin">招聘企业</asp:ListItem>
                    <asp:ListItem Value="zhiwei">职位信息</asp:ListItem>
                    <asp:ListItem Value="jianli">用户简历</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button4" runat="server" Style="width: 100px;" Text="开始发布" class="C_input" OnClick="Button4_Click" />
            </td>
        </tr>
        <tr class="tdbg">
            <td align="right" style="height: 24px">&nbsp;<%=lang.LF("发布所有")%>：
            </td>
            <td align="left" class="bqright" style="height: 24px">
                <asp:Button ID="btnNewsContent" Style="width: 100px;" runat="server" Text="开始发布" class="C_input" OnClick="btnNewsContent_Click" />
            </td>
        </tr>
        <tr class="tdbg">
            <td align="left" colspan="2" valign="middle">
                <span style="color: Blue"><strong><%=lang.LF("注意")%>：</strong></span><%=lang.LF("如果选择了栏目，则只生成选择栏目下的内容；如果不选择直接生成的，则生成全站的内容。")%>
            </td>
        </tr>
    </table>
    <!--end生成内容页-->
    <!--start发布栏目-->
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center" id="crt2" name="crt2" style="display: none;">
        <tr class="title">
            <td colspan="2" align="left" style="height: 23px">
                &nbsp;<%=lang.LF("发布栏目")%>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="right" valign="middle">
                 <%=lang.LF("选择栏目")%>：
            </td>
            <td class="bqright" valign="middle" style="padding: 0px;">
                <div style="float: left;">
                    <asp:ListBox ID="lbColumn" runat="server" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                </div>
                <div style="margin-top: 100px; float: left;">
                    &nbsp;<asp:Button ID="btnCreateColumn" style="width:100px;" runat="server" Text="开始发布"  class="C_input" OnClientClick="return lbColumnCheck()" OnClick="btnCreateColumn_Click" /></div>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="right">
                <%=lang.LF("选择栏目")%>：
            </td>
            <td class="bqright">
                <asp:Button ID="btnCreateColumnAll" style="width:100px;" runat="server" Text="发布所有栏目" Class="C_input" OnClick="btnCreateColumnAll_Click" />
            </td>
        </tr>
    </table>
    <!--end发布栏目-->
    <!--start发布单页-->
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center" id="crt3" name="crt3" style="display: none;">
        <tr class="title">
            <td colspan="2" align="left">&nbsp;<%=lang.LF("发布单页")%></td>
        </tr>
        <tr class="tdbg">
            <td align="right" valign="middle"><%=lang.LF("选择单页")%>： </td>
            <td class="bqright" valign="middle" style="padding: 0px;">
                <div style="float: left;">
                    <asp:ListBox ID="lbSingle" runat="server" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                </div>
                <div style="margin-top: 100px; float: left;">
                    &nbsp;<asp:Button ID="Button3" style="width:100px;" runat="server" Text="开始发布"  class="C_input" OnClientClick="return lbSingleCheck()" OnClick="btnCreateSingle_Click" /></div>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="right"><%=lang.LF("发布所有单页")%>：</td>
            <td class="bqright">
                <asp:Button ID="Button1" style="width:100px;" runat="server" Text="发布所有单页" Class="C_input" OnClick="btnCreateSingleAll_Click" />
            </td>
        </tr>

    </table>
    <!--end发布单页-->
  
    <!--start发布主题-->
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center" id="crt4" name="crt4" style="display: none;">
        <tr class="title">
            <td colspan="2" align="left">&nbsp;<%=lang.LF("发布所有")%> </td>
        </tr>
        <tr class="tdbg">
            <td align="right" valign="middle"><%=lang.LF("选择专题")%>：</td>
            <td class="bqright" valign="middle" style="padding: 0px;">
                <div style="float: left;">
                   <asp:ListBox ID="lbSpeacil" runat="server" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                </div>
                <div style="margin-top: 100px; float: left;">
                    &nbsp;<asp:Button ID="btnCreateSpeacil" style="width:100px;" runat="server" Text="开始发布"  class="C_input" OnClientClick="return lbSpeacilCheck()" OnClick="btnCreateSpeacil_Click" /></div>
            </td></tr>
    </table>
    <!--end发布主题-->
    <!--begin发布内容-->
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center" id="crt5" name="crt5" style="display: none;">
        <tr class="title">
            <td colspan="2" align="left" style="height: 24px">
                &nbsp;<%=lang.LF("发布内容")%>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="right" valign="middle"><%=lang.LF("按照栏目发布内容")%>：</td>
            <td class="bqright" valign="middle" style="padding: 0px;">
                <div style="float: left;">
                    <asp:ListBox ID="ColumnList" runat="server" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                </div>
                <div style="margin-top: 100px; float: left;">
                    &nbsp;<asp:Button ID="Button6" style="width:100px;" runat="server" Text="开始发布"  class="C_input" OnClientClick="return myfun()" OnClick="btnColumnCreate_Click" /></div>
            </td>
        </tr>
        <tr class="tdbg">
            <td align="right"><%=lang.LF("选择栏目")%>：</td>
            <td class="bqright">
                <asp:Button ID="Button5" style="width:100px;" runat="server" Text="发布所有栏目" Class="C_input" OnClick="btnCreateColumnAll_Click" />
            </td>
        </tr>
    </table>
    <!--end发布内容-->
    <asp:Literal ID="litMessage" runat="server"></asp:Literal>
    </form>
<script src="../../dist/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>