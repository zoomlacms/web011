<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.AddContentpage, App_Web_lvsrob24" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>添加内容</title>
<style>

</style>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
	<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
	<li><a href="Mycontent.aspx?NodeID=<%=  this.NodeID%>">投稿管理</a></li>
	<li class="active"><%= Label1.Text%></li>
</ol>
    <div>    <asp:GridView runat="server" ID="EGV"></asp:GridView>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="text-right">所属节点</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right"><asp:Label ID="Title_L" runat="server">内容标题</asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" onblur="getstrKeys()" Text=''></asp:TextBox>
                    <span><font color="red">*</font></span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTitle">内容标题必填</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right">关键字</td>
                <td>
                    <asp:TextBox ID="TxtTagKey" CssClass="form-control" runat="server" Text=''></asp:TextBox>关键字请用“,”隔开
                    <span style="color: #0000ff">[</span>
                    <a href="#" onclick="SelectKey();"><span style="text-decoration: underline; color: Green;">选择关键字</span></a>
                    <span style="color: #0000ff">]</span>
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Button ID="EBtnSubmit" Text="" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
                    <input type="button" id="BtnBack" class="btn btn-primary" value="返回列表" onclick="javascript: getContentUrl()" />
                    <asp:HiddenField ID="HdnNode" runat="server" />
                    <asp:HiddenField ID="HdnModel" runat="server" />
                    <asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
var node='<%Call.Label("{$GetRequest(NodeID)$}"); %>';

if(node==71){
	$("#Drop_cyxm").parent().parent().hide();
	$("#Drop_jygw").parent().parent().hide();
	$("#Drop_shzx").parent().parent().hide();		
}
if(node==72){
	$("#Drop_zplx").parent().parent().hide(); 
	$("#Drop_jygw").parent().parent().hide();
	$("#Drop_shzx").parent().parent().hide();	
}
if(node==73){
 	$("#Drop_zplx").parent().parent().hide();
	$("#Drop_cyxm").parent().parent().hide(); 
	$("#Drop_shzx").parent().parent().hide();	
}
if(node==74){
	$("#Drop_zplx").parent().parent().hide();
	$("#Drop_cyxm").parent().parent().hide();
	$("#Drop_jygw").parent().parent().hide(); 
}

</script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function getContentUrl(){
            location.href='MyContent.aspx?NodeID=<%=NodeID %>';
        }
        function GetPicurl(imgurl) 
        {
        
        }
        function SelectKey(){
            window.open('/Common/KeyList.aspx?OpenerText=<%=TxtTagKey.ClientID %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }

        function SelectValues(ModelID,id) {
            window.open('/Common/OptionManage.aspx?id=' + id + '&ModelID=' + ModelID + '', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }
        function shows() {
            if (document.getElementById("IsBid").checked) {
                // id="bidmoneytable" style="display:none"
                document.getElementById("bidmoneytable").style.display = "";
                document.getElementById("bidmoneytable1").style.display = "";
            }
            else {
                document.getElementById("bidmoneytable").style.display = "none";
                document.getElementById("bidmoneytable1").style.display = "none";
            }
        }

        function changevalue(selectvalue) {
            if (selectvalue == "2") {
                document.getElementById('changeins').style.display = '';
            }
            else {
                document.getElementById('changeins').style.display = 'none';
            }
        }

        function getstrKeys() {
            document.getElementById("TxtTagKey").value = "";
            var strKeys = "";
            var strkey = "<%=getKey()%>";
            var str = document.getElementById("txt").value;
            var keys = new Array();
            keys = strkey.split(",");
            for (var i = 0; i < keys.length; i++) {
                if (!(str.indexOf(keys[i]) < 0)) {
                    if (i == 0) {
                        strKeys = keys[i];
                    }
                    else {
                        strKeys = strKeys + " " + keys[i];
                    }
                }
            }
            var strtxt = document.getElementById("TxtTagKey").value;
            document.getElementById("TxtTagKey").value = strtxt + strKeys;
        }                        

        var txtSynopsis = document.getElementById("txt_synopsis");
        if (txtSynopsis != undefined && txtSynopsis.style.width!=null) {
            var nwidth = txtSynopsis.style.width.substring(0,txtSynopsis.style.width.length-2);
            if (nwidth > 600) {
                txtSynopsis.style.width =  "600px";
            }
        }
        $("table .tdbgleft").css("background", "transparent");
        $("table .tdbg").css("background", "transparent");
        $().ready(function(){
            $("input[type=text]").addClass("form-control");
        })
    </script>
</asp:Content>
