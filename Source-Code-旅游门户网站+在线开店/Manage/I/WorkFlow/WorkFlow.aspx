<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow, App_Web_5xj5wdms" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加流程</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td>流程名称：</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="proNameT" MaxLength="30" />
                    <span style="color: #f00">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="proNameT" runat="server" ErrorMessage="名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>流程分类：</td>
                <td>
                    <asp:DropDownList runat="server" ID="proTypeDP" CssClass="form-control"></asp:DropDownList>
                </td>
            </tr>
            <tr style="">
                <td>流程类型：</td>
                <td>
                    <asp:DropDownList ID="ddlFlowType" CssClass="form-control" runat="server">
                        <asp:ListItem Value="1">固定流程</asp:ListItem>
                        <asp:ListItem Value="2">自由流程</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>允许发起人：</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="sponsorT" />
                            <span class="input-group-btn">
                                <input type="button" id="refSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'sponsor');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="sponsorD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" ID="sponsorGroupT" CssClass="form-control" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button1" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'sponsorGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="sponsorGroupD" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>允许附件：</td>
                <td>
                    <asp:DropDownList ID="ddlFlowDoc" CssClass="form-control" Width="80" runat="server">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="line-height: 60px;">流程说明：</td>
                <td>
                    <asp:TextBox runat="server" ID="remindT" CssClass="form-control" TextMode="MultiLine" Columns="60" Width="300" Height="60px" />
                </td>
            </tr>
            <tr>
                <td>绑定节点：</td>
                <td>
                    <asp:RadioButtonList ID="NodeSel" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr style="display: none;">
                <td>自动文号表达式：</td>
                <td>
                    <input name="txtAutoName" type="text" size="30" id="txtAutoName" class="BigInput" />
                    &nbsp;&nbsp;<a href="javascript:my_tip()">查看说明</a>
                </td>
            </tr>
            <tr id="tip" style="display: none">
                <td>说明：</td>
                <td>表达式中可以使用以下特殊标记：<br>
                    {Y}：表示年 4位的年份<br>
                    {yy}：表示年 不包含纪元的年份，如果不包含纪元的年份小于 10，则显示具有前导0的年份<br>
                    {M}：表示月 一位数的月份没有前导0<br>
                    {mm}：表示月 一位数的月份有一个前导0<br>
                    {D}：月中的某一天,一位数的日期没有前导0<br>
                    {dd}：月中的某一天,一位数的日期有一个前导0<br>
                    {H}：表示时<br>
                    {I}：表示分<br>
                    {S}：表示秒<br>
                    {F}：表示流程名<br>
                    {U}：表示用户姓名<br>
                    {SD}：表示短部门<br>
                    {LD}：表示长部门<br>
                    {R}：表示角色<br>
                    {N}：表示编号，通过 <u>编号计数器</u> 取值并自动增加计数值<br>
                    <br>
                    例如，表达式为：成建委发[{Y}]{N}号，编号位数为4<br>
                    自动生成文号如：成建委发[2006]0001号<br>
                    <br>
                    例如，表达式为：BH{N}，编号位数为3<br>
                    自动生成文号如：BH001<br>
                    <br>
                    例如，表达式为：{F}流程（{Y}年{M}月{D}日{H}:{I}）{U}<br>
                    自动生成文号如：请假流程（2009年1月1日10:30）张三<br>
                    <br>
                    可以不填写自动文号表达式，则系统默认按以下格式，如：<br>
                    请假流程(2009-01-01 10:30)
                </td>
            </tr>
            <tr style="display: none;">
                <td>允许手工输入文号：</td>
                <td>
                    <asp:DropDownList runat="server" ID="flowDP">
                        <asp:ListItem Value="1">允许手工修改文号</asp:ListItem>
                        <asp:ListItem Value="0">不允许手工修改文号</asp:ListItem>
                        <asp:ListItem Value="2">允许在自动文号前输入前缀</asp:ListItem>
                        <asp:ListItem Value="3">允许在自动文号后输入后缀</asp:ListItem>
                        <asp:ListItem Value="4">允许在自动文号前后输入前缀和后缀</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <asp:Button runat="server" ID="saveBtn" CssClass="btn btn-primary" Text="保存" OnClick="saveBtn_Click" />
                    <input type="button" value="返回" class="btn btn-primary" name="back" onclick="history.back();">
                </td>
            </tr>
        </table>
    </div>
    <div id="div_share" class="panel panel-primary" style="display: none; width: 300px; position: absolute; z-index: 3;">
        <div class="panel-heading">
            <span class="close" onclick="hidediv()" title="关闭"></span>
            <h3 class="panel-title">选择会员</h3>
        </div>
        <div class="panel-body">
            <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: 300px;"
                name="main_right" src="/Mis/OA/Mail/SelUser.aspx" frameborder="0"></iframe>
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
    <script>
        function showdiv(div_id, f) {
            $("#dataField").val(f);
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight - 600) / 2;
            var w = (document.documentElement.offsetWidth - 400) / 2;
            div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        function hidediv() {
            $("#div_share").hide();
        }
        function hidediv1() {
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
        function selgroup(groupJson) {
            var Gnames = "";
            var Gids = "";
            for (var i = 0; i < groupJson.length; i++) {
                Gnames += "[" + groupJson[i].Gname + "],";
                Gids += groupJson[i].Gid + ",";
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
