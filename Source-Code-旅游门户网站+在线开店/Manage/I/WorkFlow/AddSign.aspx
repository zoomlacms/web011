<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddSign, App_Web_5xj5wdms" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加电子签名</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>签章名：</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="signNameT" MaxLength="30" />
                    <span style="color: #f00">*</span><asp:RequiredFieldValidator ControlToValidate="signNameT" ID="r1" runat="server" ErrorMessage="签章名不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>签章图：</td>
                <td>
                    <asp:TextBox ID="signPicT" CssClass="form-control" runat="server" Visible="false"></asp:TextBox><br />
                    <asp:FileUpload runat="server" CssClass="form-control" Style="display: inline;" ID="signPic" /><span style="color: #f00">*</span>
                </td>
            </tr>
            <tr>
                <td>密钥：</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="signKeyT" Enabled="false" />提示:勿需填,添加时自动生成
                </td>
            </tr>
            <tr>
                <td>绑定用户：</td>
                <td>
                    <div class="input-group" style="width: 300px;">
                        <asp:TextBox runat="server" ID="bindUserT" CssClass="form-control" />
                        <span class="input-group-btn">
                            <input type="button" id="selUserBtn" onclick="showdiv('div_share', 'bindUser');" value="选择用户" class="btn btn-primary" />
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>状态：</td>
                <td>
                    <asp:CheckBox runat="server" ID="statusChk" Text="启用" Checked="true" /></td>
            </tr>
            <tr>
                <td>备注：</td>
                <td>
                    <asp:TextBox runat="server" ID="remindT" TextMode="MultiLine" Height="100" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td>操作：</td>
                <td style="text-align: center;">
                    <asp:Button runat="server" ID="saveBtn" CssClass="btn btn-primary" Text="保存" OnClick="saveBtn_Click" />
                    <asp:Button runat="server" ID="editBtn" CssClass="btn btn-primary" Text="修改" OnClick="editBtn_Click" Visible="false" />
                    <input type="button" value="返回" class="btn btn-primary" name="back" onclick="history.back();" />
                </td>
            </tr>
        </table>
    </div>
    <div id="div_share" class="panel panel-primary" style="display: none; position: absolute; z-index: 3;">
        <div class="panel-heading">
            <span style="float: right; cursor: pointer;" onclick="hidediv()" title="关闭">关闭</span><h3 class="panel-title">选择会员</h3>
        </div>
        <div class="panel-body">
            <iframe id="userIframe" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: 300px;" name="main_right" src="/Mis/OA/Mail/SelUser.aspx?Type=Radio" frameborder="0"></iframe>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="dataField" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        var uid = "";
        function showdiv(div_id, f) {
            $("#userIframe").attr("src", "/Mis/OA/Mail/SelUser.aspx?Type=Radio&ID=" + uid);
            $("#dataField").val(f);
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight) / 2;
            var w = (document.documentElement.offsetWidth - 400) / 2;
            div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        function hidediv() {
            $("#div_share").hide();
        }
        //组名外加[],用户名则不加，用,隔开
        function seluser(groupJson, userJson) {
            var names = "";
            var ids = "";
            if (userJson) {
                names = userJson[0].Uname;
                ids = userJson[0].Uid;
                uid = userJson[0].Uid;
            }
            var flag = $("#dataField").val();
            $("#" + flag + "T").val(names);
            hidediv();
        }
    </script>
</asp:Content>
