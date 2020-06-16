<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddSign, App_Web_wx5dt34e" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加电子签名</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<style type="text/css">
.tdbg {width:80px;}
.panel-heading { line-height:35px; background:#428bca; padding-left:10px; color:#fff;}
.panel-heading  span{ float:right; margin-right:10px;}
.panel-heading span a { color:#fff;}
.panel-body { background:#fff;}
</style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
      <div class="r_navigation" style="font-size:12px;">后台管理&gt;&gt;OA配置 &gt;&gt;<a href="SignManage.aspx">签章管理</a>&gt;&gt;<span>添加签章</span></div>
        <div>
            <table align="center" class="border" style="background:#fff;width:100%;" cellspacing="1" cellpadding="4" border="0">
                <tr class="tdbg">
                    <td class="tdbg">签章名：</td>
                    <td>
                        <asp:TextBox runat="server" CssClass="l_input" ID="signNameT" MaxLength="30"/>
                        <span style="color:#f00">*</span><asp:RequiredFieldValidator ControlToValidate="signNameT" ID="r1" runat="server" ErrorMessage="签章名不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td>签章图：</td>
                    <td>
                        <asp:TextBox ID="signPicT" CssClass="l_input" runat="server" Visible="false"></asp:TextBox><br />
                        <asp:FileUpload runat="server" ID="signPic" /><span style="color:#f00">*</span>
                    </td>
                </tr>
                 <tr class="tdbg">
                    <td>密钥：</td>
                    <td>
                        <asp:TextBox runat="server" CssClass="l_input" ID="signKeyT" Enabled="false"/>提示:勿需填,添加时自动生成
                    </td>
                </tr>
                <tr class="tdbg">
                    <td>绑定用户：</td>
                    <td><asp:TextBox runat="server" ID="bindUserT" CssClass="l_input" />
                        <input type="button" id="selUserBtn" onclick="showdiv('div_share', 'bindUser');" value="选择用户" class="C_input"/>
                    </td>
                </tr>
                <tr class="tdbg">
                    <td>状态：</td>
                    <td><asp:CheckBox runat="server" ID="statusChk" Text="启用" Checked="true" /></td>
                </tr>
                <tr class="tdbg">
                    <td>备注：</td>
                    <td>
                        <asp:TextBox runat="server" ID="remindT" TextMode="MultiLine" Height="100" CssClass="l_input"></asp:TextBox>
                    </td>
                </tr>
                <tr class="tdbg" style="height:30px;">
                    <td>操作：</td>
                    <td style="text-align:center;">
                        <asp:Button runat="server" ID="saveBtn" CssClass="C_input" Text="保存" OnClick="saveBtn_Click"/>
                        <asp:Button runat="server" ID="editBtn" CssClass="C_input" Text="修改" OnClick="editBtn_Click" Visible="false" />
						<input type="button" value="返回" class="C_input" name="back" onclick="history.back();" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="div_share" class="panel panel-primary" style="display:none; position:absolute;z-index:3;">
            <div class="panel-heading"><span style="float:right;cursor:pointer;" onclick="hidediv()" title="关闭">关闭</span><h3 class="panel-title">选择会员</h3></div>
            <div class="panel-body">
                <iframe id="userIframe" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:300px;" name="main_right" src="/Mis/OA/Mail/SelUser.aspx?Type=Radio" frameborder="0"></iframe>
            </div>
        </div>
        <asp:HiddenField runat="server" ID="dataField" />
    </div>
    </form>
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
            if (userJson)
            {
                names = userJson[0].Uname;
                ids = userJson[0].Uid;
                uid = userJson[0].Uid;
            }
            var flag = $("#dataField").val();
            $("#" + flag + "T").val(names);
            hidediv();
        }
    </script>
</body>
</html>
