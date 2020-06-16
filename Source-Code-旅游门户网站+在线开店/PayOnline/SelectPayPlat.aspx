<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Shop.SelectPayPlat, App_Web_r0a4p3dq" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>选择支付平台</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel panel-primary" style="width: 500px; margin: auto; margin-top: 40px;">
            <!-- Default panel contents -->
            <div class="panel-heading text-center"><b>在线支付操作(选择支付平台)</b></div>
            <div class="panel-body">
                <span class="pull-left" style="line-height:32px; margin-left:70px;">请输入你支付的金额：</span>
                <asp:TextBox ID="TxtvMoney" Width="150" CssClass="form-control pull-left" Text="0" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="tips" runat="server" ControlToValidate="TxtvMoney" Display="Dynamic" ForeColor="Red" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="tips" ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtvMoney" Display="Dynamic" ForeColor="Red" ErrorMessage="金额不正确！"
                    ValidationExpression="^\d+(\.\d{1,2})?$" />
                <div class="clearfix"></div>
                <div class="text-center" style="margin-top:20px;">
                    <asp:Button ID="BtnSubmit" CssClass="btn btn-primary" runat="server" Text=" 下一步 " OnClick="BtnSubmit_Click" />
                </div>
            </div>
        </div>
        <style>
            .tips{ line-height:32px;margin-left:5px;}
        </style>
    </form>
</body>
</html>