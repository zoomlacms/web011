<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddFlowStep, App_Web_wx5dt34e" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加步骤</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style>
.tdbg{ height:24px;}
.panel-heading { line-height:35px; background:#428bca; padding-left:10px; color:#fff;}
.panel-heading  span{ float:right; margin-right:10px; background:url(/MIS/OA/Images/close.gif) left no-repeat;width:14px;height:14px; margin-top:10px;}
.panel-body { background:#fff;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation" style="font-size:12px;">后台管理&gt;&gt;系统设置 &gt;&gt;<a href="AddFlow.aspx?proID=<%= proID %>">流程设计</a><a href="AddFlowStep.aspx?proID=<%= proID %>&Add=1" style="color:#f00;margin-left:5px;">[添加步骤]</a></div>
<div id="Addstep" runat="server">
    <table class="border" style="width:100%;background:#fff;" CellPadding="2" CellSpacing="1">
        <tr class="tdbg">
            <td style="width:200px;">序号:</td>
            <td><asp:TextBox runat="server" CssClass="form-control" ID="stepCodeT" Enabled="false" Width="40" style="text-align:center;"/></td>
        </tr>
        <tr class="tdbg">
            <td>步骤名称:</td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" Width="300" ID="stepNameT" />
                <span style="color:#f00;">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="名称不能为空" ControlToValidate="stepNameT" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="tdbg">
            <td>主办人:</td>
            <td>
                <span style="display:block; width:50px; text-align:right; float:left;">会员：</span><asp:TextBox runat="server" CssClass="form-control pull-left" ID="referUserT" Width="300" Enabled="false"/>
                <input type="button" id="refSelBtn" style="margin-left:10px;" value="选择" class="C_input" onclick="showdiv('div_share', 'referUser');"/>
                <asp:HiddenField runat="server" ID="referUserD" /><br />
                <span style="display:block; width:50px; text-align:right; float:left;">会员组：</span><asp:TextBox runat="server" CssClass="form-control pull-left" ID="referGroupT" Width="300" Enabled="false"/>
                <input type="button" id="Button1" style="margin-left:10px;" value="选择" class="C_input" onclick="showdiv('div_group', 'referGroup');"/>
                <asp:HiddenField runat="server" ID="referGroupD" />
            </td>
        </tr>
        <tr class="tdbg">
            <td>协办人:</td>
            <td>
                <span style="display:block; width:50px; text-align:right; float:left;">会员：</span><asp:TextBox CssClass="form-control pull-left" runat="server" ID="ccUserT" Width="300" Enabled="false"/>
                <input type="button" id="ccSelBtn" value="选择" style="margin-left:10px;" class="C_input" onclick="showdiv('div_share', 'ccUser');"/>提示:只有查看,无审批权限
                <asp:HiddenField runat="server" ID="ccUserD" /><br />
                <span style="display:block; width:50px; text-align:right; float:left;">会员组：</span><asp:TextBox runat="server" CssClass="form-control pull-left" ID="ccGroupT" Width="300" Enabled="false"/>
                <input type="button" id="Button2" style="margin-left:10px;" value="选择" class="C_input" onclick="showdiv('div_group', 'ccGroup');"/>
                <asp:HiddenField runat="server" ID="ccGroupD" />
            </td>
        </tr>
        <tr class="tdbg">
            <td>会签选项:</td>
            <td>
                <asp:DropDownList runat="server" ID="hqOptionDP">
                    <asp:ListItem value="0">任意一人即可</asp:ListItem>
                    <asp:ListItem value="1" Selected="True">必须全部审核</asp:ListItem>
                </asp:DropDownList>
                提示:选择必须全部审核,则需要所有经办人审核并同意,才能进入下一步骤<font color="red">(会签不支持会员组)</font>
            </td>
        </tr>
        <tr class="tdbg">
            <td>转交:</td>
            <td>
                经办人未办理完毕时是否允许主办人强制转交:
                <asp:DropDownList runat="server" ID="qzzjDP">
                    <asp:ListItem Value="1">允许</asp:ListItem>
                    <asp:ListItem Value="0">不允许</asp:ListItem>
                </asp:DropDownList></td></tr>
        <tr class="tdbg">
            <td>回退选项：</td>
            <td>
                是否允许回退：
                <asp:DropDownList runat="server" ID="htDP">
                    <asp:ListItem Value="0">不允许</asp:ListItem>
                    <asp:ListItem Value="1">允许回退上一步骤</asp:ListItem>
                    <asp:ListItem Value="2">允许回退之前步骤</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="tdbg">
            <td>转交时,邮件自动通知以下人员：</td>
            <td>
                <span style="display:block; width:50px; text-align:right; float:left;">会员：</span><asp:TextBox runat="server" CssClass="form-control pull-left" Width="300" ID="emailAlertT" Enabled="false"/>
                <input type="button" id="emailSelBtn" style="margin-left:10px;" value="选择" class="C_input" onclick="showdiv('div_share', 'emailAlert');"/>
                <asp:HiddenField runat="server" ID="emailAlertD" /><br />
                <span style="display:block; width:50px; text-align:right; float:left;">会员组：</span><asp:TextBox runat="server" CssClass="form-control pull-left" Width="300" ID="emailGroupT" Enabled="false"/>
                <input type="button" id="Button3" style="margin-left:10px;" value="选择" class="C_input" onclick="showdiv('div_group', 'emailGroup');"/>
                <asp:HiddenField runat="server" ID="emailGroupD" />
            </td>
        </tr>
        <tr class="tdbg">
            <td>转交时,短信通知以下人员：</td>
            <td>
                <span style="display:block; width:50px; text-align:right; float:left;">会员：</span><asp:TextBox runat="server" CssClass="form-control pull-left" Width="300" ID="smsAlertT" Enabled="false"/>
                <input type="button" id="smsSelBtn" style="margin-left:10px;" value="选择" class="C_input" onclick="showdiv('div_share', 'smsAlert');"/>
                <asp:HiddenField runat="server" ID="smsAlertD" /><br />
                <span style="display:block; width:50px; text-align:right; float:left;">会员组：</span><asp:TextBox runat="server" CssClass="form-control pull-left" Width="300" ID="smsGroupT" Enabled="false"/>
                <input type="button" id="Button4" style="margin-left:10px;" value="选择" class="C_input" onclick="showdiv('div_group', 'smsGroup');"/>
                <asp:HiddenField runat="server" ID="smsGroupD" />
            </td>
        </tr>
        <tr class="tdbg">
            <td>公共附件选项：</td>
            <td>
                <asp:DropDownList runat="server" ID="PublicAttachOptionDP">
                    <asp:ListItem Value="0">不允许删除</asp:ListItem>
                    <asp:ListItem Value="1">允许删除</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="tdbg">
            <td>流程简述：</td>
            <td>
                <asp:TextBox runat="server" ID="remindT" CssClass="form-control pull-left" Width="300" />
            </td>
        </tr>
        <tr class="tdbg">
            <td>操作：</td>
            <td>
                <asp:Button runat="server" ID="saveBtn" Text="添加" OnClick="saveBtn_Click" CssClass="C_input"/>
                <input type="button" value="返回" onclick="window.location='<%="AddFlow.aspx?proID="+proID %>';" class="C_input" />
            </td>
        </tr>
    </table>
</div>
    <div id="div_share" class="panel panel-primary" style="display:none; position:absolute;z-index:3;">
        <div class="panel-heading"><span class="close" onclick="hidediv()" title="关闭"></span><h3 class="panel-title">选择会员</h3></div>
        <div class="panel-body">
            <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:300px;" name="main_right" src="/Mis/OA/Mail/SelUser.aspx" frameborder="0"></iframe>
        </div>
    </div>
    <div id="div_group" class="panel panel-primary" style="display:none; position:absolute;z-index:3;">
        <div class="panel-heading"><span class="close" onclick="hidediv1()" title="关闭"></span><h3 class="panel-title">选择会员组</h3></div>
        <div class="panel-body">
            <iframe id="Iframe1" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:300px;" name="main_right" src="/Mis/OA/Mail/SelGroup.aspx" frameborder="0"></iframe>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="dataField" />
    <script>
        function showdiv(div_id, f) {
        $("#dataField").val(f);
        var div_obj = $("#" + div_id);
        var h = (document.documentElement.offsetHeight) / 2;
        var w = (document.documentElement.offsetWidth - 400) / 2;
        div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
        div_obj.focus();
        }
        function hidediv()
        {
            $("#div_share").hide();
        }
        function hidediv1()
        {
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
        function selgroup(groupJson)
        {
            var Gnames = "";
            var Gids = "";
            for (var i = 0; i < groupJson.length; i++) 
            {
                Gnames +="["+ groupJson[i].Gname + "],";
                Gids+=groupJson[i].Gid+",";
            }
            Gnames = Gnames.substring(0, Gnames.length - 1);
            Gids = Gids.substring(0, Gids.length - 1);
            var flag = $("#dataField").val();
            $("#" + flag + "T").val(Gnames);
            $("#" + flag + "D").val(Gids);
            $("#div_group").toggle();
        }
    </script>
</form>
</body>
</html>
