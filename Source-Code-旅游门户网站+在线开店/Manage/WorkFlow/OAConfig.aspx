<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_OAConfig, App_Web_wx5dt34e" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>OA系统配置</title>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../JS/SelectCheckBox.js"></script>
<style type="text/css">
.must {float:left;margin-left:5px;color:red;line-height:22px;}
.prompt {float:left;margin-left:5px;color:green;line-height:22px;}
.tdbgleft {width:200px;}
.tdbg,.tdbgmouseover{ height:24px;}
.tab_ul li{ float:left;line-height:22px;text-align:center;}
</style>
<script type="text/javascript">
$().ready(function () {
    $(".border tr").addClass("tdbg");
    $(".border tr").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
});
function ShowTabs(obj,n)
{
    $(".border").hide();
    $("#tab" + n).show();
    $(obj).parent().find("li").removeClass("titlemouseover");
    $(obj).parent().find("li").addClass("tabtitle");
    $(obj).addClass("titlemouseover");
}
</script>
</head>
<body>
    <form id="form1" runat="server">
   <div id="nav_box">
  <div class="r_navigation"> 
  <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('3')" title="帮助"></a></div>
  <%} %> 后台管理 &gt;&gt; OA工作流管理 &gt;&gt; OA系统配置 </div>
  </div><div style="height:30px;"></div>
        <ul class="tab_ul">
            <li class="titlemouseover" onclick="ShowTabs(this,0)">系统设置</li>
            <li class="tabtitle" onclick="ShowTabs(this,1)">OA节点设置</li>
        </ul>
        <table style="width:100%;" cellspacing="1" id="tab0" cellpadding="0" class="border">
            <tr class="tdbg"><td class="tdbgleft"><strong>绑定模型ID：</strong></td>
            <td><div style="float:left"><asp:TextBox runat="server" ID="bindModel" MaxLength="8" Columns="3"></asp:TextBox></div><div class="must">
            <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="bindModel" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
            ErrorMessage="绑定模型不能为空!" />
            <asp:RegularExpressionValidator ID="p2" runat="server" ControlToValidate="bindModel" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="必须是数字!" ValidationExpression="^([0-9]+)"  />
            </div>
            </td>
          </tr>
            <tr class="tdbg"><td class="tdbgleft"><strong>用户名显示：</strong></td>
            <td><div style="float:left">
                <asp:RadioButtonList ID="UNameConfigR" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">用户名</asp:ListItem>
                    <asp:ListItem Value="2">真名(呢称)</asp:ListItem>
                    <asp:ListItem Value="3">真名</asp:ListItem>
                    <asp:ListItem Value="4">真名(ID)</asp:ListItem>
                </asp:RadioButtonList></div><div class="prompt">提示:设置经办人,抄送人等显示格式</div>
            </td>
          </tr>
            <tr class="tdbg"><td class="tdbgleft"><strong>发送手机短信：</strong></td>
            <td>
               <div style="float:left">
               <asp:RadioButtonList ID="allowMsgR" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">允许</asp:ListItem>
                    <asp:ListItem Value="0">禁止</asp:ListItem>
                </asp:RadioButtonList></div><div class="prompt"></div>
            </td></tr>
            <tr class="tdbg"><td class="tdbgleft"><strong>自定义OA界面：</strong></td>
            <td>
               <div style="float:left">
               <asp:RadioButtonList ID="allowUIR" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">允许</asp:ListItem>
                    <asp:ListItem Value="0">禁止</asp:ListItem>
                </asp:RadioButtonList></div><div class="prompt"></div>
            </td></tr>
            <tr class="tdbg"><td class="tdbgleft"><strong>OA标题：</strong></td>
            <td><asp:TextBox runat="server" ID="oaTitleT" MaxLength="50"/></td></tr>
            <tr class="tdbg"><td class="tdbgleft"><strong>Logo地址：</strong></td>
            <td>
            <asp:TextBox runat="server" ID="logoT" MaxLength="100" />
            </td></tr>
            <tr><td class="tdbgleft"><strong>主办人签名模板：</strong></td><td><asp:TextBox runat="server" ID="Leader_T" TextMode="MultiLine" style="width:500px;height:100px;"></asp:TextBox></td></tr>
            <tr><td class="tdbgleft"><strong>协办人签名模板：</strong></td><td><asp:TextBox runat="server" ID="Parter_T" TextMode="MultiLine" style="width:500px;height:100px;"></asp:TextBox></td></tr>
            <tr class="tdbg"><td class="tdbgleft"><strong>邮箱容量：</strong></td>
            <td>
                <asp:TextBox runat="server" ID="MailSize_T" MaxLength="50"/>(以M为单位，0则不限制)
            </td></tr>
            <tr class="tdbg"><td class="tdbgleft"><strong>操作：</strong></td>
            <td>
                <asp:Button runat="server" ID="saveBtn" Text="保存" OnClick="saveBtn_Click" OnClientClick="disBtn(this,1000);" CssClass="C_input"/>
                <input type="button" id="refBtn" value="重置" onclick="location = location;" class="C_input"/>
            </td></tr>
        </table>
        <table style="width:100%;display:none;" cellspacing="1" cellpadding="0" id="tab1" class="border">
            <tr class="tdbg">
                <td class="tdbgleft"><strong>党办：</strong></td>
                <td>
                    <asp:TextBox ID="DangBangT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>院办：</strong></td>
                <td>
                    <asp:TextBox ID="YuanBT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>纪检：</strong></td>
                <td>
                    <asp:TextBox ID="JijianT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>人事：</strong></td>
                <td>
                    <asp:TextBox ID="RenShiT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>财务：</strong></td>
                <td>
                    <asp:TextBox ID="CaiWuT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>科教：</strong></td>
                <td>
                    <asp:TextBox ID="KejiaoT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>医务：</strong></td>
                <td>
                    <asp:TextBox ID="YiwuT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>护理：</strong></td>
                <td>
                    <asp:TextBox ID="HuliT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>信息：</strong></td>
                <td>
                    <asp:TextBox ID="InfoT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>医院最新通知：</strong></td>
                <td>
                    <asp:TextBox ID="NewsT" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>医院论坛交流：</strong></td>
                <td>
                    <asp:TextBox ID="BBST" CssClass="l_input" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft"><strong>医院论坛交流：</strong></td>
                <td>
                    <asp:Button runat="server" ID="NodeSavBtn" Text="保存" OnClick="NodeSavBtn_Click" OnClientClick="return checkvalue()" CssClass="C_input"/>
                </td>
            </tr>
        </table> 
    </form>
<script>
    function checkvalue()
    {
        flag = false;
        dang = $("#DangBangT").val();
        yuan = $("#YuanBT").val();
        jijian = $("#JijianT").val();
        ren = $("#RenShiT").val();
        caiwu = $("#CaiWuT").val();
        kejiao = $("#KejiaoT").val();
        yiwu = $("#YiwuT").val();
        huli = $("#HuliT").val();
        info = $("#InfoT").val();
        news = $("#NewsT").val();
        bbs = $("#BBST").val();
        if (isNaN(dang) || isNaN(yuan) || isNaN(jijian) || isNaN(ren) || isNaN(caiwu) || isNaN(kejiao) || isNaN(yiwu) || isNaN(huli) || isNaN(info) || isNaN(news) || isNaN(bbs))
            alert("节点必须为数字");
        else
            flag = true;
        return flag;
    }
</script>
</body>
</html>
