<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddWorkFlowType, App_Web_wx5dt34e" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<title>添加类型</title>
<style>
#EGV tr th {text-align:center;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation" style="font-size:12px;">后台管理&gt;&gt;系统设置 &gt;&gt;<a href="FlowTypeList.aspx">类型管理</a><a href="AddWorkFlowType.aspx" style="color:#f00;margin-left:10px;">[添加类型]</a></div>
<div id="AddType" runat="server">
    <table class="border" style="background:#fff;width:100%;" cellspacing="1" cellpadding="4">
        <tr class="tdbg" style="height:24px;">
            <td style="width:10%;">类型名称:</td>
            <td>
                <asp:TextBox ID="TypeName" CssClass="l_input" Width="300" runat="server"></asp:TextBox>
                <span style="color:#f00;">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TypeName" runat="server" ErrorMessage="类型名称不能为空" ForeColor="red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="tdbg">
            <td style="line-height:200px;">类型描述:</td>
            <td>
                <asp:TextBox ID="TypeDesc" CssClass="form-control" Width="300" Height="200" TextMode="MultiLine" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg" style="height:34px;">
            <td>操作:</td>
            <td>
                <asp:Button ID="SavBtn" CssClass="C_input" OnClick="SavBtn_Click" runat="server" Text="添加" />
                <button type="button" class="C_input" onclick="window.location.href='FlowTypeList.aspx'">返回列表</button>
            </td>
        </tr>
    </table>
</div>
<div id="TypeList" runat="server" >
</div>
</form>
</body>
</html>
