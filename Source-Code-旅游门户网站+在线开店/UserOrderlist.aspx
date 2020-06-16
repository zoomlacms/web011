<%@ page language="C#" autoeventwireup="true" inherits="WebShop_UserOrderlist, App_Web_1s3tbu0c" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head>
<title>确认订单</title>
<link rel="stylesheet" type="text/css" href="../App_Themes/UserThem/style.css" />
<link rel="stylesheet" type="text/css" href="../App_Themes/UserThem/user_user.css" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/Template/Travel/style/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/dist/css/bootstrap.min.js"></script> 
<script type="text/javascript" src="JS/jquery.js"></script>
<style>
.top{ background:#fff;}
#main{ margin-top:20px;}
.cart_lei{ background:#34A150;}
#Phone{ color:#666;}
.rg_inout{ margin-top:10px;}
.input_out{ padding-top:0; padding-bottom:0; height:34px; line-height:34px;}
#Email{ padding-top:0; padding-bottom:0; height:34px; line-height:34px;}
</style>
</head>
<body>
<%Call.Label("{ZL.Label id=\"全站头部\" /}"); %>
    <form id="form1" runat="server">
    <div class="container rg_inout">
        <h1>
            第二步：确认订单
            <span>[请填写您的商品信息]</span>
            <img alt="" src="/user/images/regl2.gif" width="242" height="14" /></h1>
        <div class="cart_lei"></div>
        <ul>
            <li style="text-align: left;">
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                <asp:HiddenField ID="hfproclass" runat="server" />
            </li>
        </ul>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><span style="color:#FF0000">*</span> 收货人地址薄：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:DropDownList ID="dddizhi" runat="server" CssClass="form-control" OnSelectedIndexChanged="dddizhi_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>       
            </li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><asp:CheckBox ID="cbAdd" runat="server" style="vertical-align:-2px;"/><b>加入我的地址薄|</b>
            <a href="javascript:" onclick="disLi()" style="display:none; color:red;">代购录入</a></li>
            <li id="otherUserLi" style="display:none;" runat="server">
            <asp:TextBox type="text" ID="otherUser" runat="server" OnPreRender="otherUserButton_Click" AutoPostBack="true"/>
            <span style="color:red;" id="Remind" runat="server" >请输入对方用户名,回车确认</span></li>
            <script type="text/javascript">
                function disLi()
                {       
                    $("#otherUserLi").toggle("fast");
                }
            </script>
        </ul>

        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><span style="color:#FF0000">*</span> 收货人姓名：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:TextBox ID="Receiver" runat="server" CssClass="form-control" Text="123131232"></asp:TextBox> </li>
             <li class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="color:#f00;"><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Receiver"
                    ErrorMessage="收货人姓名不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></li>
        </ul> 
        <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><span style="color:#FF0000">*</span> 收货人详细地址：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">               
                <asp:DropDownList ID="DropDownList1" runat="server" Width="33%" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="float:left" />
                <asp:DropDownList ID="DropDownList2" runat="server" Width="33%" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" style="float:left" />
                <asp:DropDownList ID="DropDownList3" runat="server" Width="33%" CssClass="form-control" />
                <asp:TextBox ID="Jiedao" runat="server" CssClass="form-control" Text="123131232123131232"></asp:TextBox>
            </li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Jiedao" style="color:#f00;"
                ErrorMessage="收货人地址不能为空!" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="Jiedao" ErrorMessage="地址过于简单，最少需要六个汉字，请补充详细" ValidationExpression="^.{6,}$" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage="收货人所属省份!" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DropDownList1" ErrorMessage="收货人所属城市!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                  </li>
        </ul>
     	<div class="clearfix"></div>
        <ul style="margin-top:10px;">
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><span style="color:#FF0000">*</span> 收货人邮箱：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:TextBox ID="Email" runat="server" CssClass="form-control" Text="468855@qq.com"></asp:TextBox></li><li class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="color:#f00;"><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email" ErrorMessage="收货人邮箱不能为空!"
                    SetFocusOnError="True"></asp:RequiredFieldValidator></li></ul>
        <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b>发票信息：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:TextBox ID="Invoice" runat="server" Rows="5" CssClass="form-control"></asp:TextBox></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><asp:CheckBox ID="Invoiceneeds" runat="server" Text="需开发票 " /></li></ul>
        <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><span style="color:#FF0000">*</span> 要求送货时间：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:DropDownList ID="Deliverytime" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">对送货时间没有特殊要求</asp:ListItem>
                    <asp:ListItem Value="2">双休日或者周一至周五的晚上送达</asp:ListItem>
                    <asp:ListItem Value="3">周一至周五的白天送达</asp:ListItem>
                </asp:DropDownList>
            </li>
        </ul>
        <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><span style="color:#FF0000">*</span> 联系电话：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:TextBox ID="Phone" runat="server" CssClass="form-control" Text="0799-6422112"></asp:TextBox></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="color:#f00;">格式:区号-号码
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Phone"
                    Display="Dynamic" ErrorMessage="联系电话不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Phone"
                    ErrorMessage="联系电话格式不正确!" SetFocusOnError="True" ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{8}|(\(\d{4}\)|\d{4}-)?\d{7}|(\(\d{4}\)|\d{4}-)?\d{7}" Display="Dynamic"></asp:RegularExpressionValidator>
            </li>
        </ul>
        <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><span style="color:#FF0000">*</span> 邮政编码：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:TextBox ID="ZipCode" runat="server" CssClass="form-control" Text="331100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ZipCode"
                    Display="Dynamic" ErrorMessage="邮政编码不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ZipCode"
                    ErrorMessage="邮政编码格式不正确!" ValidationExpression="^\d{6}$" SetFocusOnError="True"></asp:RegularExpressionValidator></li></ul>
                    <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><font color="#FF0000">*</font> 收货人手机：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:TextBox ID="Mobile" runat="server" CssClass="form-control" MaxLength="11" Text="15387955566"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Mobile"
                    Display="Dynamic" ErrorMessage="收货人手机不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Mobile"
                    ErrorMessage="手机号码格式不正确!" ValidationExpression="^(\d{11})$" SetFocusOnError="True"></asp:RegularExpressionValidator>
            </li></ul>
         <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><font color="#FF0000">*</font> 送货方式：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:DropDownList ID="Delivery" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Delivery_SelectedIndexChanged1">
                    <asp:ListItem Text="sample" Value="1"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Delivery"
                    ErrorMessage="送货方式不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></li></ul>
                    <div class="clearfix"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-right"><b><font color="#FF0000">*</font> 运费：</b></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:Label ID="lblYunFei" runat="server"></asp:Label></li>
            <li style="width: 150px; text-align: right;"></li>
            <li>&nbsp;</li>
            <asp:HiddenField runat="server" ID="projiect" />
            <asp:HiddenField runat="server" ID="prodectid" />
            <asp:HiddenField runat="server" ID="projectjiage" />
            <asp:HiddenField runat="server" ID="jifen" />
            <asp:HiddenField  ID="Mbool" runat="server" />
            
            <asp:HiddenField  ID="AllMoney" runat="server" />
            <asp:HiddenField  ID="XfMoney" runat="server" />
        </ul>
        <div class="cleardiv"></div>
        <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        <div class="cleardiv"></div>
        <ul>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6"></li>
            <li class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                <asp:Button ID="Button1" runat="server" CssClass="i_bottom" Text="提交订单" OnClick="Button1_Click" />&nbsp;</li></ul>
    </div>
        <asp:HiddenField runat="server" ID="Extend_Hid" />
    <div class="clear"></div>
    <!--main end -->
    <div id="bottom" class="hidden">
        <a href="/">
            <img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%:Call.SiteName %>" /></a>
        <p>
            <script> 
<!--
                var year = "";
                mydate = new Date();
                myyear = mydate.getYear();
                year = (myyear > 200) ? myyear : 1900 + myyear;
                document.write(year); 
--> 
            </script>
            &copy;&nbsp;Copyright&nbsp;
            <%Call.Label("{$SiteName/}"); %>
            All rights reserved.</p>
    </div>
     <script type="text/javascript">
            $(function(){
                var model=JSON.parse($("#Extend_Hid").val());
                model.RandomCode="<%Call.Label("{ZL:Random(0,1000)/}"); %>";
                $("#Extend_Hid").val(JSON.stringify(model));
            })
        </script>
    </form>
	  <%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>
</body>
</html>