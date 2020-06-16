<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.Group, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/JS/ZL_Regex.js"></script>
    <title>会员组编辑</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField runat="server" ID="LNav_Hid" Value="添加房间" />
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td class="spacingtitle" colspan="2" align="center"><asp:Literal ID="LTitle" runat="server" Text="添加会员组"></asp:Literal></td>
    </tr>
    <tr>
        <td class="tdbgleft" style="width: 35%"><strong>父会员组名称：</strong></td>
        <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
      <td class="tdbgleft" style="width: 35%"><strong>会员组名称：</strong></td>
      <td><asp:TextBox class="form-control" style="max-width:150px; float:left;" ID="TxtGroupName" runat="server" Width="156" MaxLength="200" OnTextChanged="TxtGroupName_TextChanged" AutoPostBack="true" />
        <font color="red;float:left;">*</font><asp:Label ForeColor="Red" ID="CheckName" runat="server" Text=""></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtGroupName">会员组名称不能为空</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>会员组别名：</strong></td>
      <td><asp:TextBox class="form-control" style="max-width:150px;" ID="OtherName" runat="server" Width="156" MaxLength="200" /></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>会员组说明：</strong></td>
      <td><asp:TextBox class="form-control" style="max-width:350px;" ID="TxtDescription" runat="server" TextMode="MultiLine" Width="365px" Height="43px" /></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>是否为招生人员：</strong></td>
      <td>
           <input type="checkbox" runat="server" id="txt_Enroll" class="switchChk" />
      </td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>是否注册可选：</strong></td>
      <td>
          <input type="checkbox" runat="server" id="RBLReg" class="switchChk" checked="checked" />
     </td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>是否为企业用户组：</strong></td>
      <td>
          <input type="checkbox" runat="server" id="RBcompanyG" class="switchChk" />
      </td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>是否为VIP用户组：</strong></td>
      <td>
          <input type="checkbox" runat="server" id="RBVipG" class="switchChk" />
     </td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>VIP默认级别：</strong></td>
      <td><asp:TextBox class="form-control" style="max-width:150px;" runat="server" ID="txtVIPNum" Text="0"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtVIPNum" ErrorMessage="请输入有效数字！" MaximumValue="999" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
    </tr>
    <tr>
        <td class="tdbgleft"><strong>余额升级费用：</strong></td>
        <td>
            <asp:TextBox class="form-control int" Style="max-width: 150px; display:inline-block" ID="UpGradeMoney" runat="server">0</asp:TextBox><span>为0或空则不允许购买</span></td>
    </tr>
      <tr>
          <td class="tdbgleft"><strong>银币升级费用：</strong></td>
          <td>
              <asp:TextBox class="form-control int" Style="max-width: 150px; display:inline-block" ID="UpSIcon_T" runat="server">0</asp:TextBox></td>
      </tr>
      <tr>
          <td class="tdbgleft"><strong>积分升级费用：</strong></td>
          <td>
              <asp:TextBox class="form-control int" Style="max-width: 150px; display:inline-block" ID="UpPoint_T" runat="server">0</asp:TextBox></td>
      </tr>
    <tr>
      <td class="tdbgleft"><strong>返利比率：</strong></td>
      <td><asp:TextBox class="form-control" style="max-width:150px;float:left;" ID="txtRebateRate" runat="server">0</asp:TextBox>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0"  ControlToValidate="txtRebateRate"></asp:CompareValidator></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>信誉值：</strong></td>
      <td><asp:TextBox class="form-control" style="max-width:150px;float:left;" ID="txtCreit" runat="server">0</asp:TextBox>
        (用户达到多少信誉值可升级为此等级,0为不升级)
        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"  ControlToValidate="txtCreit"></asp:CompareValidator></td>
    </tr>
    <tr>
      <td class="tdbgleft"><strong>付费方式：</strong></td>
      <td>每个包年会员费为<asp:TextBox class="form-control" style="max-width:50px;float:left;" ID="Byear" runat="server">50</asp:TextBox>， 每个月最多使用<asp:TextBox class="form-control" ID="Payment" style="width:50px; display:inline;" runat="server">50</asp:TextBox>篇文章&nbsp;
        <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0"  ControlToValidate="Payment"></asp:CompareValidator></td>
    </tr>
  </table>
    <table class="table table-striped table-bordered table-hover">
    <tr>
      <td colspan="2" class="text-center"><asp:HiddenField ID="HdnGroupID" runat="server" />
        <asp:Button ID="EBtnSubmit" Text="保存设置" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary"/>
        <input name="Cancel" type="button" class="btn btn-primary" id="Cancel" value="取消" onclick="location.href = 'GroupManage.aspx'" /></td>
    </tr>
  </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
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
    $(function () {
        ZL_Regex.B_Num(".int");
    })
</script>
</asp:Content>