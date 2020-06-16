<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Profile_pass, App_Web_h0t5nwk3" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>密码确认</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">密码确认</li>
    </ol>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td style="width:50%;text-align:right">请填写密码：</td>
            <td>
                <input type="password" id="password" class="form-control" runat="server" />
                <input  type="hidden" id="hfhonor" runat="server"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="btn" CssClass="btn btn-primary" runat="server" Text="确认" OnClientClick="load()" onclick="btn_Click" />
                <input type="button" class="btn btn-primary" id="btnCan" onclick="click()" value="取消"/>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function click() {
            window.close();
        }

        function load() {
            document.getElementById("hfhonor").value = opener.document.getElementById("ddlAmount").value;
        }
</script>
</asp:Content>