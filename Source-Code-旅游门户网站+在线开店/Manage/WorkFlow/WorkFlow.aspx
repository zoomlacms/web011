<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow, App_Web_wx5dt34e" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加流程</title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style>
.tdbg{ height:24px;}
.panel-heading { line-height:35px; background:#428bca; padding-left:10px; color:#fff;}
.panel-heading  span{ float:right; margin-right:10px; background:url(/MIS/OA/Images/close.gif) left no-repeat;width:14px;height:14px; margin-top:10px;}
.panel-heading  span:hover{ cursor:pointer;}
.panel-body { background:#fff;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation" style="font-size:12px;">后台管理&gt;&gt;系统设置 &gt;&gt;<a href="Default.aspx">流程管理</a><a href="WorkFlow.aspx" style="color:#f00;margin-left:5px;">[添加流程]</a></div>
        <div>
            <table width="100%" align="center" class="border" style="background:#fff;" cellspacing="1" cellpadding="4" border="0">
                <tr class="tdbg">
                    <td  class="TableData">流程名称：</td>
                    <td class="TableData">
                        <asp:TextBox runat="server" CssClass="l_input" Width="300" ID="proNameT" MaxLength="30"/>
                        <span style="color:#f00">*</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="proNameT" runat="server" ErrorMessage="名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td>流程分类：</td>
                    <td class="TableData">
                        <asp:DropDownList runat="server" ID="proTypeDP" CssClass="form-control"></asp:DropDownList>
                    </td>
                </tr>
                <tr style="" class="tdbg">
                    <td  class="TableData">流程类型：</td>
                    <td class="TableData">
                        <asp:DropDownList ID="ddlFlowType" runat="server">
                            <asp:ListItem Value="1">固定流程</asp:ListItem>
                            <asp:ListItem Value="2">自由流程</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td class="TableData">允许发起人：</td>
                    <td class="TableData">
                        <span style="display:block; width:50px; text-align:right; float:left;">会员：</span><asp:TextBox runat="server" ID="sponsorT" Width="300" />
                        <input type="button" id="refSelBtn" value="选择" class="C_input" style="margin-left:10px;" onclick="showdiv('div_share', 'sponsor');"/>
                        <asp:HiddenField runat="server" ID="sponsorD" /><br />
                        <span style="display:block; width:50px; text-align:right; float:left;">会员组：</span><asp:TextBox runat="server" ID="sponsorGroupT" Width="300" Enabled="false" />
                        <input type="button" id="Button1" value="选择" class="C_input" style="margin-left:10px;" onclick="showdiv('div_group', 'sponsorGroup');"/>
                        <asp:HiddenField runat="server" ID="sponsorGroupD" /><br />
                    </td>
                </tr>
                <%--   <tr>
                    <td  class="TableData">表单模型：</td>
                    <td class="TableData">
                       <asp:DropDownList runat="server" ID="modelDP">
                           <asp:ListItem Value="1">请假条</asp:ListItem>
                           <asp:ListItem Value="2">申请单</asp:ListItem>
                       </asp:DropDownList>
                    </td>
                </tr>--%>
                <%--<tr>
                    <td  class="TableData">委托类型：</td>
                    <td class="TableData">
                        <select name="ddlRuleOther" id="ddlRuleOther" class="BigSelect">
                            <option value="2">自由委托</option>
                            <option value="3">按步骤设置的经办权限委托</option>
                            <option value="0">禁止委托</option>

                        </select>
                        <!--<asp:ListItem Value="1" >仅允许委托当前步骤经办人</asp:ListItem>-->
                        <a href="javascript:my_tip1();">查看说明</a>
                        <div id='tip1' style="display: none">
                            委托类型说明：<br>
                            <b>自由委托：</b>用户可以在工作委托模块中设置委托规则,可以为委托给任何人。<br>
                            <b>按步骤设置的经办权限委托：</b>仅能委托给流程步骤设置中经办权限范围内的人员<br>
                            <b>禁止委托：</b>办理过程中不能使用委托功能。<br>
                            <b>注意：</b>只有自由委托才允许定义委托规则，委托后更新自己步骤为办理完毕，主办人变为经办人
                        </div>

                    </td>
                </tr>--%>
                <tr class="tdbg">
                    <td  class="TableData">允许附件：</td>
                    <td class="TableData">
                        <asp:DropDownList ID="ddlFlowDoc" runat="server">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td class="TableData" style="line-height:60px;">流程说明：</td>
                    <td class="TableData">
                       <asp:TextBox runat="server" ID="remindT" TextMode="MultiLine" Columns="60" Width="300" Height="60px"/>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td>绑定节点：</td>
                    <td>
                        <asp:RadioButtonList ID="NodeSel" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr style="display:none;" class="tdbg">
                    <td  class="TableData">自动文号表达式：</td>
                    <td class="TableData">
                        <input name="txtAutoName" type="text" size="30" id="txtAutoName" class="BigInput" />
                        &nbsp;&nbsp;<a href="javascript:my_tip()">查看说明</a>
                    </td>
                </tr>
                <tr id="tip" style="display: none" class="tdbg">
                    <td  class="TableData">说明：</td>
                    <td class="TableData">表达式中可以使用以下特殊标记：<br>
                        {Y}：表示年 4位的年份<br>
                        {yy}：表示年 不包含纪元的年份，如果不包含纪元的年份小于 10，则显示具有前导0的年份<br>
                        {M}：表示月 一位数的月份没有前导0<br>
                        {mm}：表示月 一位数的月份有一个前导0<br>
                        {D}：月中的某一天,一位数的日期没有前导0<br>
                        {dd}：月中的某一天,一位数的日期有一个前导0<br>
                        {H}：表示时<br>
                        {I}：表示分<br>
                        {S}：表示秒<br>
                        {F}：表示流程名<br>
                        {U}：表示用户姓名<br>
                        {SD}：表示短部门<br>
                        {LD}：表示长部门<br>
                        {R}：表示角色<br>
                        {N}：表示编号，通过 <u>编号计数器</u> 取值并自动增加计数值<br>
                        <br>
                        例如，表达式为：成建委发[{Y}]{N}号，编号位数为4<br>
                        自动生成文号如：成建委发[2006]0001号<br>
                        <br>
                        例如，表达式为：BH{N}，编号位数为3<br>
                        自动生成文号如：BH001<br>
                        <br>
                        例如，表达式为：{F}流程（{Y}年{M}月{D}日{H}:{I}）{U}<br>
                        自动生成文号如：请假流程（2009年1月1日10:30）张三<br>
                        <br>
                        可以不填写自动文号表达式，则系统默认按以下格式，如：<br>
                        请假流程(2009-01-01 10:30)
                    </td>
                </tr>
                <tr style="display:none;" class="tdbg">
                    <td  class="TableData">允许手工输入文号：</td>
                    <td class="TableData">
                        <asp:DropDownList runat="server" ID="flowDP">
                            <asp:ListItem Value="1">允许手工修改文号</asp:ListItem>
                            <asp:ListItem Value="0">不允许手工修改文号</asp:ListItem>
                            <asp:ListItem Value="2">允许在自动文号前输入前缀</asp:ListItem>
                            <asp:ListItem Value="3">允许在自动文号后输入后缀</asp:ListItem>
                            <asp:ListItem Value="4">允许在自动文号前后输入前缀和后缀</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr align="center" class="tdbg" style="height:30px;">
                    <td colspan="2" >
                        <asp:Button runat="server" ID="saveBtn" CssClass="C_input" Text="保存" OnClick="saveBtn_Click"/>
						<input type="button" value="返回" class="C_input" name="back" onclick="history.back();">
                    </td>
                </tr>
            </table>
        </div>
             <div id="div_share" class="panel panel-primary" style="display:none;width:300px; position:absolute;z-index:3;">
            <div class="panel-heading"><span class="close" onclick="hidediv()" title="关闭"></span><h3 class="panel-title">选择会员</h3></div>
            <div class="panel-body">
                <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:300px;"  
                    name="main_right" src="/Mis/OA/Mail/SelUser.aspx" frameborder="0"></iframe>
            </div>
        </div>
        <div id="div_group" class="panel panel-primary" style="display:none; position:absolute;z-index:3;">
            <div class="panel-heading"><span class="close" onclick="hidediv1()" title="关闭"></span><h3 class="panel-title">选择会员组</h3></div>
            <div class="panel-body">
                <iframe id="Iframe1" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:300px;" name="main_right" src="/Mis/OA/Mail/SelGroup.aspx" frameborder="0"></iframe>
            </div>
        </div>
        <asp:HiddenField runat="server" ID="dataField" />
    </form>
<script>
function showdiv(div_id, f) {
    $("#dataField").val(f);
    var div_obj = $("#" + div_id);
    var h = (document.documentElement.offsetHeight - 600) / 2;
    var w = (document.documentElement.offsetWidth - 400) / 2;
    div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
    div_obj.focus();
}
function hidediv() {
    $("#div_share").hide();
}
function hidediv1() {
    $("#div_group").hide();
}
//组名外加[],用户名则不加，用,隔开
function seluser(groupJson, userJson) {
    var names = "";
    var ids = "";
    //for (var i = 0; i < groupJson.length; i++) {
    //    n += "[" + groupJson[i].Gname + "],";
    //}
    for (var i = 0; i < userJson.length; i++) {
        names += userJson[i].Uname + ",";
        ids += userJson[i].Uid + ",";
    }
    var flag = $("#dataField").val();
    $("#" + flag + "T").val(names);
    $("#" + flag + "D").val(ids);
    hidediv();
}
function selgroup(groupJson) {
    var Gnames = "";
    var Gids = "";
    for (var i = 0; i < groupJson.length; i++) {
        Gnames += "[" + groupJson[i].Gname + "],";
        Gids += groupJson[i].Gid + ",";
    }
    Gnames = Gnames.substring(0, Gnames.length - 1);
    Gids = Gids.substring(0, Gids.length - 1);
    var flag = $("#dataField").val();
    $("#" + flag + "T").val(Gnames);
    $("#" + flag + "D").val(Gids);
    $("#div_group").toggle();
}
</script>
</body>
</html>
