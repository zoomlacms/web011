<%@ page language="C#" autoeventwireup="true" inherits="V_Content_ContentShow, App_Web_gqexlk3x" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title>显示内容</title>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered">
            <caption class="t_caption"><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></caption>
            <tbody>
                <tr>
                    <td class="text-right" style="width:120px;">所属栏目：</td>
                    <td><asp:Label ID="NodeName" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr><td class="text-right">内容ID：</td>
                    <td><asp:Label runat="server" ID="ContentID_L" /></td>
                </tr>
                <tr>
                    <td class="text-right">标题：</td>
                    <td><asp:Label ID="Title_T" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td class="text-right">状态：</td>
                    <td><asp:Label ID="statess" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
			        <td height="22" align="center" colspan="2" style="line-height: 25px;">
				        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
				        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
			        </td>
		        </tr>
            </tbody>
        </table>
        <br />
        <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
    </div>
    <div class="modal" id="title_div">
        <div class="modal-dialog" style="width: 1024px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong id="title">用户信息</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="title_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript">
        var diag = new Dialog();
        function opentitle(url, title) {
            //diag.Width = 800;
            //diag.Height = 500;
            //diag.Title = title;
            //diag.URL = url;
            //diag.show();
            $("#title").text(title);
            $("#title_ifr").attr("src", url);
        }
        function editnode(NodeID) {
            var answer = confirm("该栏目未绑定模板，是否立即绑定");
            if (answer == false) {
                return false;
            }
            else {
                open_page(NodeID, "EditNode.aspx?NodeID=");
            }
        }
        function closdlg() {
            Dialog.close();
        }
        function open_page(NodeID, strURL) {
            var diag = new Dialog();
            diag.Width = 1000;
            diag.Height = 750;
            diag.Title = "配置节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
            diag.URL = strURL + NodeID;
            diag.show();
        }
    </script>
</asp:Content>