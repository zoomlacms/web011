<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_Arrive_AddArrive, App_Web_15zmdlk5" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>编辑优惠劵</title>
<link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="/JS/pacalendar.js" type="text/javascript"></script> 
<script type="text/javascript" src="/JS/Dialog.js"></script>
<script type="text/javascript" src="/JS/jquery.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script language="javascript">
    function Openwin() {
        var diag = new Dialog();
        diag.Modal = false;
        diag.Width = 800;
        diag.Height = 400;
        diag.Title = "选择客户";
        diag.URL = "SelectUserName.aspx";
        diag.show();
    }

    function clears() {
        var ite = document.getElementById("txtUserID");
        var ite1 = document.getElementById("hfid");
        ite.value = "未激活";
        ite1.value = "0";
    }
</script>
</head>
<body>   
<form id="form1" runat="server">
<div class="r_navigation">        
    <span>后台管理</span> &gt;&gt; <span>商城管理</span> &gt;&gt; <span>
    <a href="ArriveManage.aspx">优惠劵管理</a></span> &gt;&gt;<span>新增优惠劵</span></div>
<div class="clearbox">
</div>
<table width="100%" border="0" cellpadding="5" cellspacing="1" class="border">
    <tr>
        <td class="spacingtitle" align="center">
            <asp:Literal ID="LTitle" runat="server" Text="添加优惠劵"></asp:Literal>
        </td>
    </tr>
    <tr class="tdbg">
        <td valign="top" style="margin-top: 0px; margin-left: 0px;">
            <table width="100%" cellpadding="2" cellspacing="1" style="background-color: white;">
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td class="tdbgleft"><strong>卡别名：</strong></td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" class="l_input"></asp:TextBox>
                        <font color="green">用于系统识别,便于记忆 </font>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="卡别名不能为空!" />
                   </td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td class="tdbgleft"><strong>优惠券类型：</strong></td>
                    <td>
                        <asp:RadioButtonList RepeatDirection="Horizontal" runat="server" ID="Magclass">
                            <asp:ListItem Value="0" Selected="True">现金卡</asp:ListItem>
                            <asp:ListItem Value="1">银币卡</asp:ListItem>
                        <%--    <asp:ListItem Value="2">试用券</asp:ListItem>--%>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tbody id="no" runat="server">
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft"><strong>编号:</strong></td>
                        <td><asp:TextBox ID="txtNo" runat="server" Enabled="false" class="l_input"></asp:TextBox></td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft"><strong>密码:</strong></td>
                        <td><asp:TextBox ID="txtPwd" runat="server" Enabled="false" class="l_input"></asp:TextBox></td>
                    </tr>
                        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft"><strong>状态:</strong></td>
                        <td><asp:TextBox ID="txtState" runat="server" Enabled="false" class="l_input"></asp:TextBox></td>
                    </tr>
                        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft"><strong>所属用户:</strong></td>
                        <td><asp:TextBox ID="txtUserID" runat="server" Enabled="false" class="l_input"></asp:TextBox>
                        <asp:HiddenField ID="hfid" runat="server"  />
                        <input id="Button1" type="button" value="选择用户" onclick="Openwin();void(0)" class="C_input" />
                        <input type="button" id="btnC" value="不送出" class="C_input" onclick="clears()" />
                            </td>
                    </tr>
                </tbody>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" id="amountTr">
                    <td class="tdbgleft"><strong>金额：</strong></td>
                    <td><asp:TextBox ID="txtAmount" runat="server" class="l_input" /></td>
                </tr>
                 <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" id="amountAreaTr">
                    <td class="tdbgleft"><strong>适用范围：</strong></td>
                    <td>
                        <asp:TextBox runat="server" ID="minAmount" class="l_input" MaxLength="10" style="width:55px;" Text="0"/>到
                        <asp:TextBox runat="server" ID="maxAmount" class="l_input" MaxLength="10" style="width:56px;"/>
                        <span style="color:green;margin-left:1px;">*如输入(200-300)则只有200-300单价的商品才能使用该券</span>
                </tr>
                    <tbody id="createNum" runat="server">
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft"><strong>生成数量：</strong></td>
                        <td><asp:TextBox ID="txtCreateNum" runat="server" class="l_input" />
                        <span  style="color:red;"><asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                                ControlToValidate="txtCreateNum" ErrorMessage="生成数量必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$" SetFocusOnError="True" /></span></td>
                    </tr>
                </tbody>
                <tr class="tdbg">
                    <td class="tdbgleft" style="height: 26px"><strong>生效时间：</strong></td>
                    <td style="height: 26px">
                    <asp:TextBox ID="txtCreateTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" class="l_input" />
                        <span style="line-height:26px;color:green;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="/App_Themes/AdminDefaultTheme/images/Calendar.gif" ToolTip="鼠标点击左边输入框出现时间选择框" style="top:4px;position:relative;"/>
                        (即优惠劵生效时间)</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                            runat="server" ControlToValidate="txtCreateTime" ErrorMessage="生效时间不能为空!"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr  class="tdbg">
                    <td class="tdbgleft" style="height: 26px"><strong>到期时间:</strong></td>
                    <td style="height: 26px">
                        <asp:TextBox ID="txtEndTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" class="l_input"></asp:TextBox>
                        <asp:Image ID="Image1" runat="server" ImageUrl="/App_Themes/AdminDefaultTheme/images/Calendar.gif" ToolTip="鼠标点击左边输入框出现时间选择框" style="top:4px;position:relative;"/>
                        <font color="red"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                            runat="server" ControlToValidate="txtEndTime" ErrorMessage="到期时间不能为空!"></asp:RequiredFieldValidator>
                        </font></td>
                </tr>
                  <tr  class="tdbg">
                    <td class="tdbgleft" style="height: 26px"><strong>是否立即激活:</strong></td>
                    <td style="height: 26px">
                    <asp:CheckBox runat="server" ID="isValid" Checked="true"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%" id="TABLE1">
    <tr>
        <td align="left" style="height: 59px">
            &nbsp; &nbsp;
            <asp:Button ID="EBtnSubmit" class="C_input" Text="制作优惠劵" runat="server" OnClick="EBtnSubmit_Click" />
            <input type="button" class="C_input" value="返回列表" onclick="location.href='ArriveManage.aspx'" />
        </td>
    </tr>
</table>
</form>
   
</body>
</html>
