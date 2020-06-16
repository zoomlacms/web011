<%@ page language="C#" autoeventwireup="true" inherits="Guest_Bar_EditContent, App_Web_s4ng4gaf" masterpagefile="~/Guest/Guest.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title><%:Call.SiteName+"贴吧" %></title>
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
    <div runat="server" id="send_div">
        <div style="padding-top:5px;padding-bottom:2px;">
            <div style="text-align: left;">
                 <a href="<%=ZoomLa.BLL.B_Guest_Bar.CreateUrl(2, PostID) %>" title="返回贴子"><span class="glyphicon glyphicon-backward" style="margin-right:3px;"></span>返回</a>
                <span runat="server" id="Anony_Span" visible="false" class="card_menNum" style="margin-left:20px;font-size:12px;">[匿名发帖模式]</span>
            </div>
        </div>
        <div><asp:TextBox runat="server" ID="MsgTitle_T" Visible="false" data-type="normal" CssClass="form-control"/></div>
        <div style="padding: 5px 0 5px 0;">
            <asp:TextBox runat="server" ID="MsgContent_T" data-type="normal" TextMode="MultiLine" Style="height: 200px;width:100%;" placeholder="说点什么吧..."/></div>
        <div id="SendDiv" runat="server">
          <span id="Valid_S" runat="server" visible="false">
              <asp:TextBox ID="TxtValidateCode" style="max-width:100px;display:inline;" placeholder="验证码" MaxLength="6" runat="server" CssClass="form-control"></asp:TextBox>
               <img src="/Common/ValidateCode.aspx" title="点击刷新验证码" style="margin-left:2px;width:80px;" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()"/>
          </span>
          <asp:Button runat="server" ID="PostMsg_Btn" Text="保存"  style="display:inline;" OnClick="PostMsg_Btn_Click" OnClientClick="return CheckData();" CssClass="btn btn-primary" />
        </div>
    </div>
     <div id="noauth_div" runat="server" visible="false">你当前没有发贴权限,请联系管理员开通!!</div>
    <%=Call.GetUEditor("MsgContent_T",4)%>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script>
	function CheckData() {
		var msg = $("#MsgContent_T").val();
		if (msg.replace(" ", "") == "") { alert("内容不能为空"); return false; }
		if ($("#TxtValidateCode").val() == "") { alert("验证码不能为空"); return false; }
	}
	function GetSource() { return "bar"; }
</script>
</asp:Content>