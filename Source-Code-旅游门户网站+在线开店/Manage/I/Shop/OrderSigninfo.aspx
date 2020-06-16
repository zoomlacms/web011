<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_OrderSigninfo, App_Web_2afsdgkd" validaterequest="false" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<title>签收状态</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr>
    <td width="35%"> 请选择状态：<asp:HiddenField ID="hforderid" runat='server' /></td>
    <td> <asp:DropDownList ID="ddstate" runat='server' AutoPostBack="True" 
            onselectedindexchanged="ddstate_SelectedIndexChanged">
            <asp:ListItem Value="0">未签收</asp:ListItem>
            <asp:ListItem Value="1">本人签收</asp:ListItem>
            <asp:ListItem Value="2">他人签收</asp:ListItem>
        </asp:DropDownList><span id="tips" style="color:Red" runat="server"></span>
    </td></tr>
    <tbody id="sign" runat="server" visible="false">
    <tr>
        <td>代签人：</td><td><asp:TextBox ID="txtSignUser" runat="server" class="l_input" Height="19px"></asp:TextBox></td></tr>
    <tr>
        <td>代签人手机：</td><td><asp:TextBox ID="txtMobile" runat="server" class="l_input" Height="19px"></asp:TextBox></td></tr>
    </tbody>
    <tr>
        <td>备注：</td>
        <td><asp:TextBox ID="txtremark" runat="server" class="l_input" TextMode="MultiLine" 
                Height="87px" Width="403px"></asp:TextBox></td>
    </tr>
    <tr>
        <td>短信发送：</td><td><input id="nock" runat="server" type="checkbox" onclick="onchan()" />手机短信和E_Mail通知</td>
    </tr>
   <tbody id="con">
    <tr>
        <td>通知内容：</td><td>
       <asp:TextBox ID="txtContent" runat="server" class="l_input" TextMode="MultiLine" Height="106px" Width="404px"></asp:TextBox><br/>
       <font color="red">{$UserName}订货人姓名;{$SiteName}网站名称;{$Remark}为上面的备注信息; {$OrderCode}为订单号;{$DeliveryUser}送货员;{$DeliUserMobile}送货手机;{$SignUserName}代签人姓名；{$SignUserMobil}代签人手机</font>
      </td></tr>
    </tbody>
    <tr>
       <td align="center" colspan="2">
        <asp:Button ID="btn" runat="server" Text="保存" onclick="btn_Click" class="btn btn-primary" /><span id="sptip" runat="server" style="color:Red"></span></td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function onchan() {
            if (document.getElementById("nock").checked) {
                document.getElementById("con").style.display = "";
            } else {
                document.getElementById("con").style.display = "none";
            }
        }
    </script>
</asp:Content>

