<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_AddSites, App_Web_gqexlk3x" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="server" >
<title>添加站点信息</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="server">
    <table class="table table-bordered table-hover table-striped">
        <tr>
            <td class="name">站点名称：</td>
            <td>
                <asp:TextBox ID="SiteName_T" runat="server" Style="float:left;" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Style="float:left; margin:7px;" ControlToValidate="SiteName_T"
                    ErrorMessage="站点名称不能为空!" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="name">站点链接：</td>
            <td>
                <asp:TextBox runat="server" ID="SiteUrl_T" CssClass="form-control" Style="float:left;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  Style="float:left; margin:7px;" runat="server" ControlToValidate="SiteUrl_T"
                    ErrorMessage="站点链接不能为空!" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
                
        </tr>
        <tr>
            <td class="name">子站备注：</td>
            <td>
                <asp:TextBox runat="server" ID="SiteDesc_T" CssClass="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="name">站点密钥：</td>
            <td>
                <asp:TextBox runat="server" ID="SiteKey_T" Style="float:left;" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Style="float:left; margin:7px;" runat="server" ControlToValidate="SiteKey_T"  ErrorMessage="站点密钥不能为空!" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="name">需获取的节点：</td>
            <td><asp:TextBox runat="server" ID="Nodes_T" CssClass="form-control" style="display:inline-block;"></asp:TextBox>
                <input type="button" value="选择" onclick="ShowDiv('node_div');" class="btn btn-primary" /><abbr>为空代表所有节点</abbr>
            </td>
        </tr>
            <tr>
                <td colspan="2"><asp:Button CssClass="btn btn-primary" OnClick="Save_Btn_Click" ID="Save_Btn" runat="server" Text="添加站点" /></td>
            </tr>
    </table>
    <div class="modal" id="node_div" style="position: fixed; top: 10%;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" onclick="CloseDiv('node_div');"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span class="modal-title">远程节点选择</span><span id="source_span"></span>
                </div>
                <div class="modal-body">
                    <div id="forward_his_div">
                    </div>
                    <div id="forward_my_div" style="margin-top: 5px;">
                        <iframe src="" id="node_ifr" style="width: 500px; height: 500px; border: none;"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">    
<link rel="stylesheet" href="/dist/css/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<style>.name{ width:8%;}</style>
<script>
	function CloseDiv(id)
	{
		$("#" + id).hide();
	}
	function ShowDiv(id)
	{
		var url = $("#SiteUrl_T").val();
		if (!url || url == "") {
			alert("站点地址不能为空!");
		}
		else {
			if (url.indexOf("http://") < 0) url = "http://" + url;
			if (url.lastIndexOf("/") != url.length - 1) url = url += "/";
			$("#source_span").text("来源："+url);
			$("#node_ifr").attr("src", "/Common/NodeList.aspx?SiteUrl=" + url);
			$("#" + id).show();
		}
	}
	function DealResult(r)
	{
		$("#Nodes_T").val(r);
		$("#node_div").hide();
	}
</script>
</asp:Content>