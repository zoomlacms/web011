<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddFlowStep, App_Web_5xj5wdms" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>流程设计</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Addstep" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td style="width: 200px;">序号:</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="stepCodeT" Enabled="false" Width="40" Style="text-align: center;" /></td>
            </tr>
            <tr>
                <td>步骤名称:</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" Width="300" ID="stepNameT" />
                    <span style="color: #f00;">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="名称不能为空" ControlToValidate="stepNameT" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>主办人:</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control pull-left" ID="referUserT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="refSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'referUser');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="referUserD" />
                    </div>
                    <div class="clearfix"></div>
                    <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                    <div class="input-group" style="width: 300px;">
                        <asp:TextBox runat="server" CssClass="form-control" ID="referGroupT" Enabled="false" />
                        <span class="input-group-btn">
                            <input type="button" id="Button1" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'referGroup');" />
                        </span>
                    </div>
                    <asp:HiddenField runat="server" ID="referGroupD" />
                </td>
            </tr>
            <tr>
                <td>协办人:</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox CssClass="form-control" runat="server" ID="ccUserT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="ccSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'ccUser');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="ccUserD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="ccGroupT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button2" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'ccGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="ccGroupD" />
                    </div>
                    提示:只有查看,无审批权限                
                </td>
            </tr>
            <tr>
                <td>会签选项:</td>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control" Width="150" ID="hqOptionDP">
                        <asp:ListItem Value="0">任意一人即可</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">必须全部审核</asp:ListItem>
                    </asp:DropDownList>
                    提示:选择必须全部审核,则需要所有经办人审核并同意,才能进入下一步骤<font color="red">(会签不支持会员组)</font>
                </td>
            </tr>
            <tr>
                <td>转交:</td>
                <td>经办人未办理完毕时是否允许主办人强制转交:
                <asp:DropDownList runat="server" CssClass="form-control" Width="80" ID="qzzjDP">
                    <asp:ListItem Value="1">允许</asp:ListItem>
                    <asp:ListItem Value="0">不允许</asp:ListItem>
                </asp:DropDownList></td>
            </tr>
            <tr>
                <td>回退选项：</td>
                <td>是否允许回退：
                <asp:DropDownList runat="server" CssClass="form-control" Width="150" ID="htDP">
                    <asp:ListItem Value="0">不允许</asp:ListItem>
                    <asp:ListItem Value="1">允许回退上一步骤</asp:ListItem>
                    <asp:ListItem Value="2">允许回退之前步骤</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>转交时,邮件自动通知以下人员：</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="emailAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="emailSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'emailAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="emailAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="emailGroupT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button3" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'emailGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="emailGroupD" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>转交时,短信通知以下人员：</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="smsAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="smsSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'smsAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="smsAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="smsGroupT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button4" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'smsGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="smsGroupD" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>公共附件选项：</td>
                <td>
                    <asp:DropDownList runat="server" ID="PublicAttachOptionDP">
                        <asp:ListItem Value="0">不允许删除</asp:ListItem>
                        <asp:ListItem Value="1">允许删除</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>流程简述：</td>
                <td>
                    <asp:TextBox runat="server" ID="remindT" CssClass="form-control pull-left" Width="300" />
                </td>
            </tr>
            <tr>
                <td>操作：</td>
                <td>
                    <asp:Button runat="server" ID="saveBtn" Text="添加" OnClick="saveBtn_Click" CssClass="btn btn-primary" />
                    <input type="button" value="返回" onclick="window.location='<%="AddFlow.aspx?proID="+proID %>    ';" class="btn btn-primary" />
                </td>
            </tr>
        </table>
    </div>
    <div id="div_share" class="panel panel-primary" style="display: none; position: absolute; z-index: 3;">
        <div class="panel-heading">
            <span class="close" onclick="hidediv()" title="关闭"></span>
            <h3 class="panel-title">选择会员</h3>
        </div>
        <div class="panel-body">
            <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: 300px;" name="main_right" src="/Mis/OA/Mail/SelUser.aspx" frameborder="0"></iframe>
        </div>
    </div>
    <div id="div_group" class="panel panel-primary" style="display: none; position: absolute; z-index: 3;">
        <div class="panel-heading">
            <span class="close" onclick="hidediv1()" title="关闭"></span>
            <h3 class="panel-title">选择会员组</h3>
        </div>
        <div class="panel-body">
            <iframe id="Iframe1" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: 300px;" name="main_right" src="/Mis/OA/Mail/SelGroup.aspx" frameborder="0"></iframe>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="dataField" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function showdiv(div_id, f) {
            $("#dataField").val(f);
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight) / 2;
            var w = (document.documentElement.offsetWidth - 400) / 2;
            div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        function hidediv()
        {
            $("#div_share").hide();
        }
        function hidediv1()
        {
            $("#div_group").hide();
        }
        //组名外加[],用户名则不加，用,隔开
        function seluser(groupJson, userJson) {
            var names = "";
            var ids = "";
            //for (var i = 0; i < groupJson.length; i++) {
            //    n += "[" + groupJson[i].Gname + "],";
            //}
            for (var i = 0; i < userJson.length; i++) {
                names += userJson[i].Uname + ",";
                ids += userJson[i].Uid + ",";
            }
            var flag = $("#dataField").val();
            $("#" + flag + "T").val(names);
            $("#" + flag + "D").val(ids);
            hidediv();
        }
        function selgroup(groupJson)
        {
            var Gnames = "";
            var Gids = "";
            for (var i = 0; i < groupJson.length; i++) 
            {
                Gnames +="["+ groupJson[i].Gname + "],";
                Gids+=groupJson[i].Gid+",";
            }
            Gnames = Gnames.substring(0, Gnames.length - 1);
            Gids = Gids.substring(0, Gids.length - 1);
            var flag = $("#dataField").val();
            $("#" + flag + "T").val(Gnames);
            $("#" + flag + "D").val(Gids);
            $("#div_group").toggle();
        }
    </script>
</asp:Content>
