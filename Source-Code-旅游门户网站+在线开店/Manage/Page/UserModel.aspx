<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Page.UserModel, App_Web_y1nkzetg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
<title>添加模型</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
<script src="../../JS/chinese.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/JavaScript">
        function Getpy(ontxt, id) {
            if (true) {
            var str = document.getElementById(ontxt).value.trim();
            if (str == "") {
                document.getElementById(id).value = "";
                return;
            }
            var arrRslt = makePy(str);//这里将汉字转为拼音
            if (arrRslt.length > 0) {
                document.getElementById(id).value = arrRslt.toString().toLowerCase();
                if (document.getElementById(id).value.indexOf(',') > -1) {//判断栏目名称有多音字后栏目标识名“，”并去掉逗号后面的数据
                    var str = document.getElementById(id).value;
                    document.getElementById(id).value = str.split(',', 1);
                }
            }
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation">
        <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('85')" title="帮助"></a></div>
  <%} %><span>后台管理</span> &gt;&gt; 企业黄页 &gt;&gt; 黄页申请设置 &gt;&gt;<span>
        <asp:Literal ID="LNav" runat="server" Text="添加申请模型"></asp:Literal></span></div>
    <div class="clearbox"></div>
    <table class="border" width="100%" cellpadding="2" cellspacing="1">
        <tr>
            <td class="spacingtitle" colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="添加申请模型"></asp:Literal>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft" style="width: 35%">
                <strong>申请模型名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtModelName" CssClass="l_input" runat="server" Width="168px" MaxLength="200" AutoPostBack="true" onkeyup="Getpy('TxtModelName','TxtTableName')" /><span style="color:red;">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">申请模型名称不能为空</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>创建的数据表名：</strong>
            </td>
            <td>
                <asp:Label ID="LblTablePrefix" runat="server" Text="ZL_Reg_" />
                <asp:TextBox ID="TxtTableName" CssClass="l_input" runat="server" Width="120" MaxLength="50" AutoPostBack="True" /><span style="color:red;">*</span>
                <asp:RegularExpressionValidator ID="ValeTableName" runat="server" ControlToValidate="TxtTableName" ErrorMessage="只允许输入字母、数字或下划线" ValidationExpression="^[\w_]+$" SetFocusOnError="true" Display="Dynamic" />
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>模型描述：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtDescription" CssClass="l_input" runat="server" TextMode="MultiLine" Width="365px" Height="60px" />
            </td>
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:HiddenField ID="HdnModelId" runat="server" />
                <asp:Button ID="EBtnSubmit" CssClass="C_input" Text="保存" OnClick="EBtnSubmit_Click" runat="server" />
                &nbsp;&nbsp;
                <input name="Cancel" type="button" class="C_input" id="Cancel" value="取消" onclick="location.href='UserModelManage.aspx'" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>