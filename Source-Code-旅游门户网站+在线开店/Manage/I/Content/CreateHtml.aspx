<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.CreateHtml, App_Web_gqexlk3x" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<title>发布操作</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
<div style="text-align: left; margin-left: 10px;">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
			<asp:Literal ID="infoHtml" runat="server"></asp:Literal>
			<asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" TextMode="MultiLine" Width="1px" Height="1px"></asp:TextBox>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
var timer1 = window.setInterval("ShowInfo()", 500);
function ShowInfo() {
	scroll(0, 10000);
	if (document.getElementById("TextBox1").value.indexOf("生成完成") >= 0) {
		window.clearInterval(timer1);
	}
}
</script>
</asp:Content>