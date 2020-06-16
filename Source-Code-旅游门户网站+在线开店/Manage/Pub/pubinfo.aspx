<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="manage_Pub_pubinfo, App_Web_bfm3gvdt" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>互动模块配置</title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css"  rel="stylesheet" />
<script src="/JS/Common.js" type="text/javascript"></script>
<script type="text/javascript" src="../../JS/DatePicker/WdatePicker.js"></script>
<script src="../../JS/chinese.js"></script>
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style>
.atCenter{top:6px;left:expression(document.body.offsetWidth-this.offsetWidth-50);position: absolute;text-align: right;}
#save{text-align:center;	WIDTH: 100%; display:block;overflow:hidden;margin:0 auto;RIGHT: 0px; BOTTOM: 0px;POSITION:fixed;_POSITION: absolute;_TOP: expression(offsetParent.scrollTop+document.documentElement.clientHeight-this.offsetHeight);z-index:9999;}
.front{ margin-left:5px;}
</style>
    <script type="text/javascript">
        $().ready(function () {
            $("tr").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover"); }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg"); });
        });
    </script>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation">后台管理&gt;&gt;内容管理 &gt;&gt; <a href="pubmanage.aspx">互动模块管理</a></div>
</div>
<div class="h_27"></div>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="10">
<ProgressTemplate>
    <div class="atCenter"></div>
</ProgressTemplate>
</asp:UpdateProgress>
<table id="table" cellpadding="2" cellspacing="1" class="border" style="background-color: white;" width="100%">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
<ContentTemplate>
<tr class="tdbg">
    <td align="center" class="title" colspan="2" height="24" width="100%">
        <asp:Label ID="Lbtitle" runat="server" Text="添加互动模块"></asp:Label>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubNames">
    <td align="left" height="24" width="20%">
        <strong>互动模块名称：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="PubName" runat="server" Width="223px"  AutoPostBack="True" class="l_input" onkeyup="Getpy('PubName','PubTableName','PubLoadstr','PubInputLoadStr')"></asp:TextBox>
        &nbsp;<font color=red>*</font> <asp:Label ID="Label1" runat="server" ForeColor="#CC3300"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PubName" ErrorMessage="互动模块名称不能为空!"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr class="tdbg" runat="server" id="Tr1">
    <td align="left" height="24" width="20%">
        <strong>模型表名：</strong>
    </td>
    <td align="left" height="24" width="80%">
        &nbsp;ZL_Pub_<asp:TextBox ID="PubTableName" runat="server" Width="101px" AutoPostBack="True" ontextchanged="PubTableName_TextChanged"  class="l_input"/>
        &nbsp;<asp:DropDownList ID="ModelList" runat="server" AutoPostBack="True" onselectedindexchanged="ModelList_SelectedIndexChanged"></asp:DropDownList>
        &nbsp;<font color=red>*</font>
        <asp:Label ID="Label2" runat="server" ForeColor="#CC3300"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PubTableName" ErrorMessage="模型名称不能为空!"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubClasss">
    <td align="left" height="24" width="20%">
        <strong>信息类别：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:RadioButtonList ID="PubClass" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="PubClass_SelectedIndexChanged">
            <asp:ListItem Value="6">首页</asp:ListItem>
            <asp:ListItem Value="5">节点</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">内容</asp:ListItem>
            <asp:ListItem Value="1">商城</asp:ListItem>
            <asp:ListItem Value="2">黄页</asp:ListItem>
            <asp:ListItem Value="3">店铺</asp:ListItem>
            <asp:ListItem Value="4">会员</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr class="tdbg" id="PubTypes" runat="server">
    <td align="left" style="height: 24px" width="20%">
        <strong>互动类型：</strong><font color=red>(不可修改)</font></td>
    <td align="left" style="height: 24px" width="80%">
        <asp:RadioButtonList ID="PubType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="PubType_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="0">评论</asp:ListItem>
            <asp:ListItem Value="1">投票</asp:ListItem>
            <asp:ListItem Value="2">活动</asp:ListItem>
            <asp:ListItem Value="3">留言</asp:ListItem>
            <asp:ListItem Value="4">问券调查</asp:ListItem>
            <asp:ListItem Value="5">统计</asp:ListItem>
            <asp:ListItem Value="6">竞标</asp:ListItem>
            <asp:ListItem Value="7">评星</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr id="starOPTr" class="tdbg"  runat="server" visible="false">
    <td align="left" style="height: 24px" width="20%">
        <strong>选项：</strong> 
    </td>
    <td align="left" style="height: 24px" width="80%">
       <asp:TextBox runat="server" ID="starOPT" Text="包装满意度,送货满意度,配送满意度" Width="600" />
    </td>
</tr>
<tr class="tdbg"  runat="server">
    <td align="left" style="height: 24px" width="20%">
        <strong>前台权限：</strong> 
    </td>
    <td align="left" style="height: 24px" width="80%">
        <asp:CheckBox ID="CheckBox1" runat="server" onclick="checkAll(this)" />&nbsp;可查看&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox2" runat="server" onclick="check(this)" />&nbsp;可修改&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox3" runat="server" onclick="check(this)" />&nbsp;可删除&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox4" runat="server" onclick="check(this)" />&nbsp;可审核&nbsp;&nbsp;
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubOneOrMores">
    <td align="left" height="24" width="20%">
        <strong>用户重复提交次数：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <span style="width: auto; float: left">
            <asp:RadioButtonList ID="PubOneOrMore" runat="server" OnSelectedIndexChanged="PubOneOrMore_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="0">无限制</asp:ListItem>
                <asp:ListItem Value="1">每人限一次</asp:ListItem>
                <asp:ListItem Value="2">自定义</asp:ListItem>
                <asp:ListItem Value="3">每篇文章限一次</asp:ListItem>
            </asp:RadioButtonList>
        </span>
        <span style="width: auto; float: left; margin-left: 10px">
            <asp:TextBox ID="PubOneOrMorenum" runat="server" Visible="False" Width="69px" class="l_input">0</asp:TextBox>
        </span>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubIPOneOrMores">
    <td align="left" height="24" width="20%">
        <strong>重复IP提交次数：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <span style="width: auto; float: left">
            <asp:RadioButtonList ID="PubIPOneOrMore" runat="server" OnSelectedIndexChanged="PubIPOneOrMore_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="0">无限制</asp:ListItem>
                <asp:ListItem Value="1">每IP只限一次</asp:ListItem>
                <asp:ListItem Value="2">自定义</asp:ListItem>
            </asp:RadioButtonList>
        </span>
        <span style="width: auto; float: left; margin-left: 10px">
            <asp:TextBox ID="PubIPOneOrMorenum" runat="server" Visible="False" Width="69px" class="l_input">0</asp:TextBox>
        </span>
    </td>
</tr>
<tr class="tdbg" runat="server" id="DivPuberrmsg">
    <td align="left" height="24" width="20%">
        <strong>达到提交次数提示：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <span style="width: auto; float: left"><asp:TextBox ID="Puberrmsg" runat="server" Width="349px" class="l_input">该用户提交信息的数量已经达到上限!</asp:TextBox></span></td>
</tr>
<tr class="tdbg" runat="server" id="Tr4">
    <td align="left" height="24" width="20%">
        <strong>提交完毕跳转地址：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <span style="width: auto; float: left"><asp:TextBox ID="PubGourl" runat="server" Width="349px" class="l_input"></asp:TextBox> <font color="blue">为空则默认跳转</font></span></td>
</tr>
<tr class="tdbg" runat="server" id="Tr2">
    <td align="left" height="24" width="20%"><strong>提交时间间隔：</strong></td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="PubTimeSlot" runat="server" Width="100px" Text="10"  class="l_input"/>
        <font color=blue>单位：秒</font>
    </td>
</tr>
<tr class="tdbg" runat="server" id="Tr3">
    <td align="left" height="24" width="20%">
        <strong>保留天数信息：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="Pubkeep" runat="server" Width="100px" Text="99999999" class="l_input" />
        <font color=blue>单位：天</font>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubTemplates">
    <td align="left" height="24" width="20%">
        <strong>互动模板地址：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="PubTemplate" runat="server" Width="200px" class="l_input" />
        <input style="width:110px;"  onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('PubTemplate')+'&amp;FilesDir=',650,480)" type="button" style="width:110px;"  value="选择模板"  class="C_input" />
        <font color=blue>添加时如果为空则自动创建</font>
    </td>
</tr>
<tr class="tdbg" id="PubLoadstrs" runat="server">
    <td align="left" height="24" width="20%">
        <strong>自定义调用互动标签：</strong>
    </td>
    <td align="left" height="24" width="80%">
        {Pub.Load_<asp:TextBox ID="PubLoadstr" class="l_input"  runat="server" Width="200px" AutoPostBack="True" ontextchanged="PubLoadstr_TextChanged"></asp:TextBox>
        /}&nbsp;<span style="color:red;">*</span><font color="blue"><asp:Label ID="Label4" runat="server" ForeColor="#CC3300"></asp:Label>&nbsp;设置标签或模板中调用的标签</font>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubIsTrues">
    <td align="left" width="20%">
        <strong>是否需要审核：</strong>
    </td>
    <td align="left" width="80%">
        <asp:RadioButtonList ID="PubIsTrue" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="0">不需要</asp:ListItem>
            <asp:ListItem Value="1">需要</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubCodes">
    <td align="left" height="24" width="20%">
        <strong>是否需要验证码：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:RadioButtonList ID="PubCode" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="0">不需要</asp:ListItem>
            <asp:ListItem Value="1">需要</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubLogins">
    <td align="left" height="24" width="20%">
        <strong>是否需要登陆：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:RadioButtonList ID="PubLogin" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="PubLogin_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="0">不需要</asp:ListItem>
            <asp:ListItem Value="1">需要</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr class="tdbg" runat="server" id="Tr5">
    <td align="left" height="24" width="20%">
        <strong>是否公开：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:RadioButtonList ID="RaPublic" runat="server" RepeatDirection="Horizontal" >
            <asp:ListItem  Value="0">不公开</asp:ListItem>
            <asp:ListItem Selected="True" Value="1">公开</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubLoginUrls">
    <td align="left" height="24" width="20%">
        <strong>跳转登陆地址(http://)：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="PubLoginUrl" runat="server" Width="260px" class="l_input"></asp:TextBox>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubOpenComments">
    <td align="left" width="20%" class="style1">
        <strong>是否开启前台管理：</strong>
    </td>
    <td align="left" width="80%" class="style1">
        <asp:RadioButtonList ID="PubOpenComment" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="0">关闭</asp:ListItem>
            <asp:ListItem Value="1">开启</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubShowTypes" style="display:none">
    <td align="left" height="24" width="20%">
        <strong>生成投票显示：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:RadioButtonList ID="PubShowType" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="0">无</asp:ListItem>
            <asp:ListItem Value="1">柱状</asp:ListItem>
            <asp:ListItem Value="2">圆形</asp:ListItem>
        </asp:RadioButtonList>
    </td>
</tr>
<tr class="tdbg" runat="server" id="PubEndTimes">
    <td align="left" height="24" width="20%">
        <strong>结束时间：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="PubEndTime" runat="server" Width="140px" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" class="l_input"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="PubEndTime" ErrorMessage="结束时间必须是日期!" ValidationExpression="^(\d{4}[\-]?\d{1,2}[\-]?\d{1,2})?([ ]?)(\d{1,2}[:]?\d{1,2}[:]?\d{1,2})?$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
        <font color=blue>不限制请不要填写</font></b>
    </td>
</tr>
<tr class="tdbg" id="PubInputTMs" runat="server">
    <td align="left" height="24" width="20%">
        <strong>自定义信息提交模板：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="PubInputTM" runat="server" Width="200px" class="l_input" />
        <input style="width:110px;"  onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('PubInputTM')+'&amp;FilesDir=',650,480)" type="button" value="选择模板"  class="C_input"/>
        <font color=blue>添加时如果为空则自动创建</font>
    </td>
</tr>
<tr class="tdbg" id="PubInputLoadStrs" runat="server">
    <td align="left" height="24" width="20%">
        <strong>调用信息提交标签：</strong>
    </td>
    <td align="left" height="24" width="80%">
        {Pub.<asp:TextBox ID="PubInputLoadStr"  class="l_input" runat="server" Width="200px" AutoPostBack="True" ontextchanged="PubInputLoadStr_TextChanged"></asp:TextBox>
        /}&nbsp;<span style="color:red;">*</span><font color="blue"><asp:Label ID="Label3" runat="server" ForeColor="#CC3300"></asp:Label>
        &nbsp;设置标签或模板中调用的标签</font>
    </td>
</tr>
<tr class="tdbg" runat="server" id="Pubinfos">
    <td align="left" height="24" width="20%">
        <strong>互动描述：</strong>
    </td>
    <td align="left" height="24" width="80%">
        <asp:TextBox ID="Pubinfo" runat="server" Height="164px" Width="476px" class="l_input"></asp:TextBox>
    </td>
</tr>
</ContentTemplate>
</asp:UpdatePanel>
<tr class="tdbg">
    <td align="center" colspan="2"  width="100%">
        <div id="save">
            <div style="background:#e8f5ff;border:1px solid #9bbde6;">
        <asp:Button ID="Button1" runat="server" style="width:110px;"  Text="提　交" OnClick="Button1_Click" class="C_input" />
        &nbsp;<asp:Button ID="Button2" style="width:110px;"  CausesValidation="false" runat="server" OnClick="Button2_Click" Text="返回列表"  class="C_input"/>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False"  class="C_input"/>
        <asp:HiddenField ID="HiddenID" runat="server" />
             </div>
        </div>
    </td>
</tr>
</table>
</form>
<script>
    function check(obj)
    {
        chkArr1 = $(obj).parent().find(":checkbox[name=CheckBox1]");
        chkArr2 = $(obj).parent().find(":checkbox[name=CheckBox2]");
        chkArr3 = $(obj).parent().find(":checkbox[name=CheckBox3]");
        chkArr4 = $(obj).parent().find(":checkbox[name=CheckBox4]");
        if (!chkArr2[0].checked && !chkArr3[0].checked && !chkArr4[0].checked)
        {
            chkArr1[0].checked = false;
        }
        else
        {
            chkArr1[0].checked = true;
        }
    }
    function checkAll(obj)
    {
        chkArr2 = $(obj).parent().find(":checkbox[name=CheckBox2]");
        chkArr3 = $(obj).parent().find(":checkbox[name=CheckBox3]");
        chkArr4 = $(obj).parent().find(":checkbox[name=CheckBox4]");
        if (!obj.checked)
        {
            chkArr2[0].checked = false;
            chkArr3[0].checked = false;
            chkArr4[0].checked = false;
        }
    }
</script>
</body>
</html>