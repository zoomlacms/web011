<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_AddWx, App_Web_uaxbugcv" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信回复</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:HiddenField ID="TxtType" runat="server" Value="1" />
<table class="table table-striped table-bordered table-hover">
<tr><td colspan="2" style="text-align:center;font-size:1.5em;">设置微信回复消息</td></tr>
<tr>
<td  class="tdbgleft" width="150" ><strong> 接收的信息类型：</strong> 
</td><td><asp:RadioButtonList ID="drGetType" runat="server" RepeatDirection="Horizontal"  AutoPostBack="True" OnSelectedIndexChanged="getType_SelectedIndexChanged">
<asp:ListItem Text="text" Value="text" Selected >文字</asp:ListItem>
<asp:ListItem Text="image"  Value="image" >图片</asp:ListItem>
<asp:ListItem Text="location"  Value="location">地理位置</asp:ListItem>
<asp:ListItem Text="link"  Value="link">链接</asp:ListItem>
</asp:RadioButtonList></td></tr> 
<tr>
<td  class="tdbgleft" width="150" ><strong>类别筛选</strong></td><td>
 <asp:TextBox ID="drMsgType" CssClass="l_input" runat="server"  Text="text" Visible="false"></asp:TextBox>
<asp:RadioButtonList ID="txtTitle" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="MsgType_SelectedIndexChanged"  RepeatDirection="Horizontal">
<asp:ListItem Text="text"  Value="NodeID">栏目列表</asp:ListItem>
<asp:ListItem Text="text"  Value="Artice" Selected>文章列表</asp:ListItem>
<asp:ListItem Text="text"  Value="Photo" >图库中心</asp:ListItem>
<asp:ListItem Text="text"  Value="Tel">联系我们</asp:ListItem>  
<asp:ListItem Text="text"  Value="SmallSite">微门户</asp:ListItem>  
<asp:ListItem Text="text"  Value="LBS">地理位置</asp:ListItem> 
 </asp:RadioButtonList>
</td></tr> 
    <tr id="Tabkey" runat="server">
<td  class="tdbgleft" width="150" ><strong> 关键字：</strong></td>
<td><asp:TextBox ID="TxtKeys" runat="server" CssClass="l_input" Width="200"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="关键字不能为空" SetFocusOnError="false"  ControlToValidate="TxtKeys"></asp:RequiredFieldValidator>
</td></tr>

<tr id="TabCont"  runat="server">
<td  class="tdbgleft" width="150" ><strong>选择栏目：</strong></td>
<td>
<asp:DropDownList ID="TxtContent" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="TxtContent_SelectedIndexChanged" >
<asp:ListItem Text="text"  Value="NodeID">栏目列表</asp:ListItem>
</asp:DropDownList>
 </td></tr>
<tr id="FieldTable"  runat="server" visible="false">
<td  class="tdbgleft" width="150" ><strong>选择字段：</strong></td>
<td>
<asp:DropDownList ID="Field" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="Field_SelectedIndexChanged" >
    <asp:ListItem Text="text"  Value="">字段</asp:ListItem>
</asp:DropDownList>
 </td></tr> </table>   
    <div style="text-align:center;">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" CssClass="btn btn-primary" />
        <input type="button" id="Button2" onclick="window.history.go(-1);" class="btn btn-primary" value="取消" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>