<%@ page language="C#" autoeventwireup="true" inherits="manage_User_addUrlReWr, App_Web_pwpbtctt" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>栏目变子站管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div>
    <table class="table table-striped table-bordered table-hover">
      <tr align="center">
        <td colspan="2" class="style1"> 栏目变子站选项 </td>
      </tr>
      <tr>
        <td class="style4" align="right" style=" line-height:35px;"> 转换记录标题名称：</td>
        <td><asp:TextBox ID="KeyName" class="form-control" style="max-width:200px;" runat="server" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="KeyName" ErrorMessage="标题不能为空!"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
        <td class="style5" align="right"> 转发目标类型：<br />
          <i>打开本站页面还是打开第三方网站页面</i></td>
        <td class="style6"><asp:RadioButtonList runat="server" AutoPostBack="True"  RepeatDirection="Horizontal" ID="xuan"  onselectedindexchanged="Unnamed1_SelectedIndexChanged" Height="16px">
            <asp:ListItem Value="0" Selected="True">本站</asp:ListItem>
            <asp:ListItem Value="1">第三方网站</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr>
        <td height="22" class="style4" align="right"> 转换形式：</td>
        <td><asp:RadioButtonList runat="server" AutoPostBack="True"  RepeatDirection="Horizontal" ID="RadioButtonList1" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Value="0" Selected="True">站点转换</asp:ListItem>
            <asp:ListItem Value="1">页面转换</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr>
        <td height="22" class="style4" align="right"> 请求来源地址：</td>
        <td><asp:TextBox ID="UrlLook" 
class="form-control" style="max-width:200px;" runat="server" Width="311px"></asp:TextBox>
          <br />
          &nbsp;&nbsp;
          <asp:Label ID="Label2" runat="server" Text="<span style='color:#1e860b;'>样例：index.aspx或abc/index.aspx 子站转换则输入全路径：样例：www.zoomla.cn/default.aspx</span>"></asp:Label></td>
      </tr>
      <tr>
        <td height="22" class="style4" align="right"> 转换目地址标(<u>真实地址</u>)：</td>
        <td><asp:TextBox ID="UrlSend" class="form-control" style="max-width:200px;" runat="server" Width="311px"></asp:TextBox>
          <br />
          &nbsp;&nbsp;
          <asp:Label ID="Label1" runat="server" Text="<span style='color:#1e860b;'>输入格式为：http://www.zoomla.cn/default.aspx。</span>"></asp:Label></td>
      </tr>
      <tr>
        <td height="22" class="style4" align="right"> 是否可访问目标地址：</td>
        <td><asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatColumns="2">
            <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
            <asp:ListItem Value="0">否</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr>
        <td height="22" class="style4" align="right"><strong></strong></td>
        <td><asp:Button ID="Button1" runat="server"  Text="　添　加　" onclick="Button1_Click" class="btn btn-primary" />
          <asp:Button ID="Button2" runat="server" Text="返回列表" OnClientClick="javascript:location.href='UrlReWr.aspx';return false;"  class="btn btn-primary" />
          <asp:HiddenField ID="HdnNodeID" runat="server" />
          <asp:HiddenField ID="HdnKeyName" runat="server" /></td>
      </tr>
    </table>
    <br />
    <div style="line-height:20px;" class="r_navigation">
      <div style="width:98%; padding:10px"> 　<b>说　　明：</b>栏目变子站功能为<u>地址交换</u>功能，此功能将改变浏览器浏览该地址的路径；实现可以从请求来源地址转发到任意转换目标地址，如果目标地址为 http:// 开头，系统将自动跳转而不会转发。<br />
        <u>转换目标地址</u>为网站的真实地址，现实存在此地址；<u>请求来源地址</u>为本站的虚假地址，此地址不存在，本功能实现目标为：将&quot;虚假&quot;地址替换成&quot;真实&quot;地址！<br />
        <b>注　　意：</b>对于多个地址交换项目，请不要将来源地址和其他重复，否则系统无法辨别目标地址；此功能请勿转发到其他站点，以防外站含有病毒，对您的电脑将产生影响！<br />
      </div>
    </div>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
<script language="javascript">
    function setheight() {
    }
</script>
</asp:Content>
