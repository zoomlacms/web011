<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.Group, App_Web_rvziairi" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>会员组编辑</title>
<link href="/App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<script language="javascript">
    function CheckAll(spanChk)//CheckBox全选
    {
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;
        for (i = 0; i < elm.length; i++)
            if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
            if (elm[i].checked != xState)
                elm[i].click();
        }
    }
    function SelectRule() {
        window.open('RuleList.aspx?id=<%=Request.QueryString["id"] %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
    }
    function VIP() {
        var dd = document.getElementByNames("RBVipG");
    }
</script>
<body>
<form id="form1" runat="server" enctype="multipart/form-data">
<div class="r_navigation">后台管理&gt;&gt;<a href="UserManage.aspx">会员管理</a>&gt;&gt;<a href="GroupManage.aspx">会员组管理</a>&gt;&gt;<asp:Literal ID="LNav" runat="server" Text="添加会员组"></asp:Literal></div>
  <table width="100%" cellpadding="2" cellspacing="1" class="border">
    <tr>
      <td class="spacingtitle" colspan="2" align="center"><asp:Literal ID="LTitle" runat="server" Text="添加会员组"></asp:Literal></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" style="width: 35%"><strong>父会员组名称：</strong></td>
        <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 35%"><strong>会员组名称：</strong></td>
      <td><asp:TextBox class="l_input" ID="TxtGroupName" runat="server" Width="156" MaxLength="200" OnTextChanged="TxtGroupName_TextChanged" AutoPostBack="true" />
        <font color="red">*</font><asp:Label ForeColor="Red" ID="CheckName" runat="server" Text=""></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtGroupName">会员组名称不能为空</asp:RequiredFieldValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>会员组别名：</strong></td>
      <td><asp:TextBox class="l_input" ID="OtherName" runat="server" Width="156" MaxLength="200" /></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>会员组说明：</strong></td>
      <td><asp:TextBox class="x_input" ID="TxtDescription" runat="server" TextMode="MultiLine" Width="365px" Height="43px" /></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>是否为招生人员：</strong></td>
      <td><asp:RadioButtonList ID="txt_Enroll" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Value="1">是</asp:ListItem>
          <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>是否注册可选：</strong></td>
      <td><asp:RadioButtonList ID="RBLReg" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
          <asp:ListItem Value="0">否</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>是否为企业用户组：</strong></td>
      <td><asp:RadioButtonList ID="RBcompanyG" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Value="1">是</asp:ListItem>
          <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>是否为VIP用户组：</strong></td>
      <td><asp:RadioButtonList ID="RBVipG" runat="server" RepeatDirection="Horizontal" onclick="VIP()">
          <asp:ListItem Value="1">是</asp:ListItem>
          <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>VIP默认级别：</strong></td>
      <td><asp:TextBox class="l_input" runat="server" ID="txtVIPNum" Text="0"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtVIPNum" ErrorMessage="请输入有效数字！" MaximumValue="999" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>升级所需费用：</strong></td>
      <td><asp:TextBox class="l_input" ID="UpGradeMoney" runat="server">0</asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0" ControlToValidate="UpGradeMoney"> </asp:CompareValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>返利比率：</strong></td>
      <td><asp:TextBox class="l_input" ID="txtRebateRate" runat="server">0</asp:TextBox>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0"  ControlToValidate="txtRebateRate"></asp:CompareValidator></td>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>信誉值：</strong></td>
      <td><asp:TextBox class="l_input" ID="txtCreit" runat="server">0</asp:TextBox>
        (用户达到多少信誉值可升级为此等级,0为不升级)
        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"  ControlToValidate="txtCreit"></asp:CompareValidator></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>付费方式：</strong></td>
      <td>每个包年会员费为<asp:TextBox class="l_input" ID="Byear" style="width:40px;" runat="server">50</asp:TextBox>， 每个月最多使用<asp:TextBox class="l_input" ID="Payment" style="width:40px;" runat="server">50</asp:TextBox>篇文章&nbsp;
        <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0"  ControlToValidate="Payment"></asp:CompareValidator></td>
    </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
          <td class="tdbgleft"><strong>部门签章：</strong></td>
          <td>
              <asp:TextBox runat="server" id="SignImg_T" Enabled="false" Width="300" Visible="false"></asp:TextBox>
              <input type="file" name="signImg_F" />
          </td>
      </tr>
  </table>
  <div class="clearbox"> </div>
  <table width="100%" cellpadding="2" cellspacing="1" class="border">
    <tr class="tdbgbottom">
      <td colspan="2"><asp:HiddenField ID="HdnGroupID" runat="server" />
        &nbsp;&nbsp;
        <asp:Button ID="EBtnSubmit" Text="保存设置" OnClick="EBtnSubmit_Click" runat="server" class="C_input" />
        &nbsp;&nbsp;
        <input name="Cancel" type="button" class="C_input" id="Cancel" value="取消" onclick="location.href='GroupManage.aspx'" /></td>
    </tr>
  </table>
</form>
</body>
</html>