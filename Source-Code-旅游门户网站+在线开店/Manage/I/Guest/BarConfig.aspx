<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Guest_BarConfig, App_Web_5ay3adzg" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
#BreadNav {display: none;}
.mysite {display: none;}
.optext {text-align: right;}
</style>
<title>贴吧栏目设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="nav nav-tabs" style="border-bottom: none;">
<li class="active"><a href="#basic" data-toggle="tab">基本设置</a></li>
<li><a href="#auth" data-toggle="tab">权限设定</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane active" id="basic">
        <table class="table table-bordered table-hover table-striped">
            <tr class="onlybar">
                <td style="text-align: right;">父栏目：</td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" style="width:300px;text-align:left;" id="dropdownMenu1" runat="server" data-toggle="dropdown" aria-expanded="true">
                            <span id="dr_text">sfsdfds</span>
                           <span class="caret pull-right" style="margin-top:7px;"></span>
                            <asp:HiddenField id="selected_Hid" runat="server" />
                        </button>
                        <ul id="PCate_ul" runat="server" class="dropdown-menu" style="overflow:auto;height:200px;width:300px;" role="menu" aria-labelledby="dropdownMenu1">
                        </ul>
                    </div>
                    </td>
            </tr>
            <tr>
                <td style="width: 120px;"><span class="pull-right" style="line-height: 34px">栏目名称：</span></td>
                <td>
                    <asp:TextBox ID="txtCateName" class="form-control pull-left" runat="server" placeholder="栏目名称"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="float: left; margin-top: 10px; color: red;" ValidationGroup="add" ErrorMessage="必填项" ControlToValidate="txtCateName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="optext">栏目类型：</td>
                <td>
                    <asp:RadioButtonList runat="server" ID="GType_Rad" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">贴吧栏目</asp:ListItem>
                        <asp:ListItem Value="0">留言栏目</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td><span class="pull-right" style="line-height:34px;">所属类别：</span></td>
                <td>
                    <asp:RadioButtonList ID="PostType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">论坛版面</asp:ListItem>
                        <asp:ListItem Value="1">论坛分类</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr class="barFile_div onlybar">
                <td><span class="pull-right" style="line-height: 34px;">贴吧图片：</span></td>
                <td>
                    <asp:TextBox runat="server" ID="ImageInfo_T" CssClass="form-control" Style="display: inline;"></asp:TextBox>
                </td>
            </tr>
            <tr class="barFile_div">
                <td><span class="pull-right" style="line-height: 34px;">栏目简介：</span></td>
                <td>
                    <asp:TextBox ID="BarDesc_T" class="form-control pull-left" runat="server" TextMode="MultiLine" Width="300px" placeholder="栏目简介"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="pv2" ValidationExpression="^((.){0,300}$)" ValidationGroup="add" Display="Dynamic" ForeColor="Red" ErrorMessage="简介内容不能大于30位！" ControlToValidate="BarDesc_T" />
                </td>
            </tr>
            <tr>
                <td class="optext">吧主：</td>
                <td>
                    <asp:TextBox runat="server" ID="BarOwner_T" ReadOnly="true" TextMode="MultiLine" CssClass="form-control" />
                    <div style="padding-top: 3px;">
                        <input type="button" class="btn btn-primary" value="选择" onclick="SelBarOwner();" />
                        <span style="padding-left: 5px;">提示：包含拥有在前台修改,删除,置顶,精华权限</span>
                    </div>
                    <asp:HiddenField runat="server" ID="BarOwner_Hid" />
                </td>
            </tr>
        </table>
    </div>
    <div class="tab-pane" id="auth">
        <table class="table table-bordered table-hover table-striped">
            <tr>
                <td style="width: 120px;"><span class="pull-right" style="line-height: 34px;">访问权限：</span></td>
                <td>
                    <asp:RadioButtonList ID="NeedLog" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><span class="pull-right" style="line-height: 34px;">发贴权限：</span></td>
                <td>
                    <asp:RadioButtonList ID="PostAuth" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
    </div>
    <div id="userdiv" style="position: fixed; top: 10px; left: 20%; background: #fff; display: none;">
        <iframe runat="server" id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 430px;" name="main_right" src="/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo" frameborder="0"></iframe>
    </div>
    <div style="display: none;">
        <asp:Button runat="server" ID="AddBar_Btn" Text="添加贴吧" OnClick="AddBar_Btn_Click" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function HideBarSet() {
            $(".onlybar").hide();
        }
        $().ready(function () {
            $("#GType_Rad :radio").click(function () { if (this.value == "1") $(".onlybar").show(); else $(".onlybar").hide(); });
            $("#dropdownMenu1").find("#dr_text").text($("#PCate_ul").find("[role=" + $("#selected_Hid").val() + "]").children().first().text().trim());
        });
        function Refresh() {
            parent.location = parent.location;
        }
        function SelBarOwner() {
            //$("#select").css("margin-top", $(document).scrollTop());
            //$("#User_IFrame")[0].contentWindow.ClearChk();
            $("#userdiv").show();
        }
        function UserFunc(json, select) {
            if (json && json[0].UserID != "") {
                var uname = "";
                var uid = "";
                for (var i = 0; i < json.length; i++) {
                    uname += json[i].UserName + ",";
                    uid += json[i].UserID + ",";
                }
                if (uid) uid = uid.substring(0, uid.length - 1);
                $("#BarOwner_T").val(uname);//主负责人
                $("#BarOwner_Hid").val(uid);
            }
            else { $("#BarOwner_T").val(""); $("#BarOwner_Hid").val(""); }
            $("#userdiv").hide();
        }
        function selectCate(data) {
            $("#selected_Hid").val($(data).attr("role"));
            $("#dropdownMenu1").find("#dr_text").text($(data).children().first().text().trim());
        }
    </script>
</asp:Content>
