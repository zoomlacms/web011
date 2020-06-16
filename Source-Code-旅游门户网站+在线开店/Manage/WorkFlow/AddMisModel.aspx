<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddMisModel, App_Web_wx5dt34e" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加模型</title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<style>
.tdbg{ height:24px;}
.edui-default{ margin:auto;}
</style>
</head>
<body>
<form id="form1" runat="server">
    <div class="r_navigation" style="font-size:12px;">后台管理&gt;&gt;系统设置 &gt;&gt;<a href="MisModelManage.aspx">模板管理</a><a href="AddMisModel.aspx" style="color:#f00; margin-left:10px;">[添加模板]</a></div>
    <div>
        <table class="border" style="background:#fff;width:100%;" cellspacing="1" cellpadding="4">
            <tr class="tdbg">
                <td style="width:100px;height:30px;">模型名称:</td>
                <td>
                    <asp:TextBox ID="ModelName" CssClass="l_input" runat="server"></asp:TextBox>
                    <span style="color:#f00">*</span>
                    <asp:RequiredFieldValidator ID="r1" ControlToValidate="ModelName" runat="server" ErrorMessage="名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
               <tr class="tdbg">
                <td style="height:30px;">模板类型:</td>
                <td>
                    <asp:DropDownList runat="server" ID="DocType_DP">
                        <asp:ListItem Value="0">公文</asp:ListItem>
                        <asp:ListItem Value="1">事务</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
                 <tr class="tdbg">
                <td style="width:100px;height:30px;">绑定节点:</td>
                <td>
                    <asp:TextBox runat="server" ID="bindNodeT" CssClass="l_input"/>提示:请输入需绑定节点ID(绑定节点添加内容,默认加载该模板,可为空)
                </td>
            </tr>
            <tr class="tdbg">
                <td colspan="2" style="height:auto;">
                    <asp:TextBox ID="ModelContent" style="min-height:500px;" TextMode="MultiLine" runat="server" Width="815"></asp:TextBox>
                    <script type="text/javascript">
                        setTimeout(function () {UE.getEditor('ModelContent'); },300);
                    </script>
                </td>
            </tr>
            <tr class="tdbg" style="height:32px;">
                <td>操作:</td>
                <td>
                    <asp:Button ID="BtnSav" runat="server" CssClass="C_input" OnClick="BtnSav_Click" Text="保存" />
                    <button type="button" class="C_input" onclick="window.location.href='MisModelManage.aspx'" >返回列表</button>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
