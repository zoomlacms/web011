<%@ page language="C#" autoeventwireup="true" inherits="Manage_AddOn_AlipayBank, App_Web_oxnlb5iw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>编辑在线支付平台</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
<%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('57')" title="帮助"></a></div>
  <%} %>后台管理&gt;&gt;系统设置 &gt;&gt;<a href="Paypalmanage.aspx">支付宝平台管理</a>&gt;&gt;<asp:Label ID="LblAction" runat="server" Text="支付宝平台"></asp:Label></div>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
    <tr align="center">
        <td class="spacingtitle" colspan="2">
            <asp:Label ID="LblTitle" runat="server" Text="PayPal支付平台" />
        </td>
    </tr>
       <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td class="tdbgleft">
                        <strong>支付名称：</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="DDLPayName" runat="server" class="l_input"></asp:TextBox>
                        <span style="color: red">* 必填</span>     
                    </td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td class="tdbgleft">
                        <strong>商户ID：</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtAccountID" runat="server" class="l_input" />
                         <span style="color: red">* 必填</span>     
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="商户ID不能为空！" ControlToValidate="TxtAccountID" Display="Dynamic" SetFocusOnError="True" />
                    </td>
                </tr>
                <tr id="trMD5Key" runat="server" class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td class="tdbgleft">
                        <strong>安全校验码：</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtMD5Key" runat="server" class="l_input" />
                        <span style="color: red">* 必填</span>         
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="安全校验码不能为空!" ControlToValidate="TxtMd5Key" Display="Dynamic" SetFocusOnError="true">  </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td class="tdbgleft">
                        <strong>卖家Email：</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtSellerEmail" runat="server" class="l_input" />
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtSellerEmail" Display="Dynamic" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不正确</asp:RegularExpressionValidator>
                        <span style="color: red">* 必填:如支付宝接口必须填写卖家Email,否则会出错</span>
                    </td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td class="tdbgleft">
                        <strong>分成：</strong>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtRate" runat="server" Text="0" class="l_input" />%&nbsp;&nbsp<span  style="color: black">*此项如设置为10%，则商户得到90%</span>
                        <asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^[0-9]\d*|0$" ControlToValidate="TxtRate" ErrorMessage="只能输入整数"></asp:RegularExpressionValidator>
                    </td>
                </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft"><strong>支持银行：</strong></td>
        <td class="style3">
            <asp:CheckBoxList ID="bankList" runat="server" Height="83px" RepeatColumns="6">
                <asp:ListItem Value='ICBCB2C' Selected="True">中国工商银行 </asp:ListItem>
                <asp:ListItem Value='CMB' Selected="True">招商银行 </asp:ListItem>
                <asp:ListItem Value='CCB' Selected="True">中国建设银行 </asp:ListItem>
                <asp:ListItem Value='ABC' Selected="True">中国农业银行 </asp:ListItem>
                <asp:ListItem Value='CIB' Selected="True">兴业银行 </asp:ListItem>
                <asp:ListItem Value='COMM' Selected="True">交通银行 </asp:ListItem>
                <asp:ListItem Value='CEBBANK' Selected="True">光大银行 </asp:ListItem>
                <asp:ListItem Value='BOCB2C' Selected="True">中国银行 </asp:ListItem>
                <asp:ListItem Value='CITIC' Selected="True">中信银行 </asp:ListItem>
                <asp:ListItem Value='PSBC-DEBIT' Selected="True">中国邮政储蓄银行</asp:ListItem>
                <asp:ListItem Value='CMBC' Selected="True">中国民生银行</asp:ListItem>
                <asp:ListItem Value='BJBANK' Selected="True">北京银行</asp:ListItem>
            </asp:CheckBoxList>
      选择支持哪些银行交易</span></td>            
    </tr>  
</table>
</ContentTemplate>
</asp:UpdatePanel>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center">
        &nbsp;&nbsp; &nbsp;
        <asp:Button ID="EBtnSubmit" Text="保存" OnClick="EBtnSubmit_Click" runat="server" class="C_input"/>&nbsp; &nbsp;
        <input name="Cancel" type="button" id="BtnCancel" value="取消" onclick="window.location.href = 'PayPlatManage.aspx'" class="C_input"/></td>
    </tr>
</table>
</form>
</body>
</html>