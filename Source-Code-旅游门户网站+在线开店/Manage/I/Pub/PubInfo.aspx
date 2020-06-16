<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Pub_PubInfo, App_Web_xczopl2y" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>互动模块配置</title>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/chinese.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="10">
        <ProgressTemplate>
            <div class="atCenter"></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <table id="table" cellpadding="2" cellspacing="1" class="table table-bordered" style="background-color: white;" width="100%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
            <ContentTemplate>
                <tr>
                    <td align="center" class="title" colspan="2" width="100%">
                        <asp:Label ID="Lbtitle" runat="server" Text="添加互动模块"></asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="PubNames">
                    <td align="left" width="20%">
                        <strong>互动模块名称：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="PubName" runat="server" Width="223px" AutoPostBack="True" CssClass="form-control pull-left" onkeyup="Getpy('PubName','PubTableName','PubLoadstr','PubInputLoadStr')"></asp:TextBox>
                        &nbsp;<font color="red">*</font>
                        <asp:Label ID="Label1" runat="server" ForeColor="#CC3300"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PubName" ErrorMessage="互动模块名称不能为空!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr runat="server" id="Tr1">
                    <td align="left" width="20%">
                        <strong>模型表名：</strong>
                    </td>
                    <td align="left" width="80%">&nbsp;<span class="pull-left spanl_30">ZL_Pub_</span><asp:TextBox ID="PubTableName" runat="server" Width="101px" AutoPostBack="True" OnTextChanged="PubTableName_TextChanged" CssClass="form-control pull-left" />
                        &nbsp;<asp:DropDownList ID="ModelList" Width="180" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ModelList_SelectedIndexChanged" CssClass="form-control pull-left"></asp:DropDownList>
                        &nbsp;<font color="red">*</font>
                        <asp:Label ID="Label2" runat="server" ForeColor="#CC3300"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PubTableName" ErrorMessage="模型名称不能为空!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr runat="server" id="PubClasss">
                    <td align="left" width="20%">
                        <strong>信息类别：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:RadioButtonList ID="PubClass" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="PubClass_SelectedIndexChanged">
                            <asp:ListItem Value="6">首页</asp:ListItem>
                            <asp:ListItem Value="5">节点</asp:ListItem>
                            <asp:ListItem Selected="True" Value="0">内容</asp:ListItem>
                            <asp:ListItem Value="1">商城</asp:ListItem>
                            <asp:ListItem Value="2">黄页</asp:ListItem>
                            <asp:ListItem Value="3">店铺</asp:ListItem>
                            <asp:ListItem Value="4">会员</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr id="PubTypes" runat="server">
                    <td align="left" style="height: 24px" width="20%">
                        <strong>互动类型：</strong><font color="red">(不可修改)</font></td>
                    <td align="left" style="height: 24px" width="80%">
                        <asp:RadioButtonList ID="PubType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="PubType_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="0">评论</asp:ListItem>
                            <asp:ListItem Value="1">投票</asp:ListItem>
                            <asp:ListItem Value="2">活动</asp:ListItem>
                            <asp:ListItem Value="3">留言</asp:ListItem>
                            <asp:ListItem Value="4">问券调查</asp:ListItem>
                            <asp:ListItem Value="5">统计</asp:ListItem>
                            <asp:ListItem Value="6">竞标</asp:ListItem>
                            <asp:ListItem Value="7">评星</asp:ListItem>
                            <asp:ListItem Value="8">表单</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr id="starOPTr" runat="server" visible="false">
                    <td align="left" style="height: 24px" width="20%">
                        <strong>选项：</strong>
                    </td>
                    <td align="left" style="height: 24px" width="80%">
                        <asp:TextBox runat="server" ID="starOPT" Text="包装满意度,送货满意度,配送满意度" Width="600" />
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td align="left" style="height: 24px" width="20%">
                        <strong>前台权限：</strong>
                    </td>
                    <td align="left" style="height: 24px" width="80%">
                        <asp:CheckBox ID="CheckBox1" runat="server" onclick="checkAll(this)" />&nbsp;可查看&nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox2" runat="server" onclick="check(this)" />&nbsp;可修改&nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox3" runat="server" onclick="check(this)" />&nbsp;可删除&nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox4" runat="server" onclick="check(this)" />&nbsp;可审核&nbsp;&nbsp;
                    </td>
                </tr>
                <tr runat="server" id="PubOneOrMores">
                    <td align="left" width="20%">
                        <strong>用户重复提交次数：</strong>
                    </td>
                    <td align="left" width="80%">
                        <span style="width: auto; float: left">
                            <asp:RadioButtonList ID="PubOneOrMore" runat="server" OnSelectedIndexChanged="PubOneOrMore_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="0">无限制</asp:ListItem>
                                <asp:ListItem Value="1">每人限一次</asp:ListItem>
                                <asp:ListItem Value="2">自定义</asp:ListItem>
                                <asp:ListItem Value="3">每篇文章限一次</asp:ListItem>
                            </asp:RadioButtonList>
                        </span>
                        <span style="width: auto; float: left; margin-left: 10px">
                            <asp:TextBox ID="PubOneOrMorenum" runat="server" Visible="False" Width="69px" CssClass="form-control pull-left">0</asp:TextBox>
                        </span>
                    </td>
                </tr>
                <tr runat="server" id="PubIPOneOrMores">
                    <td align="left" width="20%">
                        <strong>重复IP提交次数：</strong>
                    </td>
                    <td align="left" width="80%">
                        <span style="width: auto; float: left">
                            <asp:RadioButtonList ID="PubIPOneOrMore" runat="server" OnSelectedIndexChanged="PubIPOneOrMore_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True">
                                <asp:ListItem Selected="True" Value="0">无限制</asp:ListItem>
                                <asp:ListItem Value="1">每IP只限一次</asp:ListItem>
                                <asp:ListItem Value="2">自定义</asp:ListItem>
                            </asp:RadioButtonList>
                        </span>
                        <span style="width: auto; float: left; margin-left: 10px">
                            <asp:TextBox ID="PubIPOneOrMorenum" runat="server" Visible="False" Width="69px" CssClass="form-control pull-left">0</asp:TextBox>
                        </span>
                    </td>
                    </tr>
                <tr>
                    <td><strong>隔多久可重复提交：</strong></td>
                    <td><asp:TextBox runat="server" CssClass="form-control" ID="Interval_T" Text="0" Width="100" /> <span class="spanl_30"><font color="blue">单位：小时,为0则不启用该项</font></span></td>
                </tr>
                <tr runat="server" id="DivPuberrmsg">
                    <td align="left" width="20%">
                        <strong>达到提交次数提示：</strong>
                    </td>
                    <td align="left" width="80%">
                        <span style="width: auto; float: left">
                            <asp:TextBox ID="Puberrmsg" runat="server" Width="349px" CssClass="form-control pull-left">该用户提交信息的数量已经达到上限!</asp:TextBox></span></td>
                </tr>
                <tr runat="server" id="Tr4">
                    <td align="left" width="20%">
                        <strong>提交完毕跳转地址：</strong>
                    </td>
                    <td align="left" width="80%">
                        <span style="width: auto; float: left">
                            <asp:TextBox ID="PubGourl" runat="server" Width="349px" CssClass="form-control pull-left"></asp:TextBox><span class="spanl_30"><font color="blue">为空则默认跳转</font></span></span></td>
                </tr>
                <tr runat="server" id="Tr3">
                    <td align="left" width="20%"><strong>提交时间间隔：</strong></td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="PubTimeSlot" runat="server" Width="100px" Text="10" CssClass="form-control pull-left" />
                        <span class="spanl_30"><font color="blue">单位：秒</font></span>
                    </td>
                </tr>
                <tr runat="server" id="Tr5">
                    <td align="left" width="20%">
                        <strong>保留天数信息：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="Pubkeep" runat="server" Width="100px" Text="99999999" CssClass="form-control pull-left" />
                        <span class="spanl_30"><font color="blue">单位：天</font></span>
                    </td>
                </tr>
                <tr runat="server" id="PubTemplates">
                    <td align="left" width="20%">
                        <strong>互动模板地址：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="PubTemplate" runat="server" Width="200px" CssClass="form-control pull-left" />
                        <input style="width: 110px; margin-left: 10px;" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('PubTemplate') + '&amp;FilesDir=', 650, 480)" type="button" style="width: 110px;" value="选择模板" class="btn btn-primary" />
                        <font color="blue">添加时如果为空则自动创建</font>
                    </td>
                </tr>
                <tr id="PubLoadstrs" runat="server">
                    <td align="left" width="20%">
                        <strong>自定义调用互动标签：</strong>
                    </td>
                    <td align="left" width="80%">
                        <span class="pull-left" style="line-height: 30px;">{Pub.Load_</span><asp:TextBox ID="PubLoadstr" CssClass="form-control pull-left" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="PubLoadstr_TextChanged"></asp:TextBox>
                        <span class="pull-left" style="line-height: 30px;">/}</span>&nbsp;<span style="color: red;">*</span><span style="line-height: 30px;"><font color="blue"><asp:Label ID="Label4" runat="server" ForeColor="#CC3300"></asp:Label>&nbsp;设置标签或模板中调用的标签</font></span>
                    </td>
                </tr>
                <tr runat="server" id="PubIsTrues">
                    <td align="left" width="20%">
                        <strong>是否需要审核：</strong>
                    </td>
                    <td align="left" width="80%">
                        <input type="checkbox" runat="server" id="PubIsTrue" class="switchChk"  />
                    </td>
                </tr>
                <tr runat="server" id="PubCodes">
                    <td align="left" width="20%">
                        <strong>是否需要验证码：</strong>
                    </td>
                    <td align="left" width="80%">
                        <input type="checkbox" runat="server" id="PubCode" class="switchChk"  />
                    </td>
                </tr>
                <tr runat="server" id="PubLogins">
                    <td align="left" width="20%">
                        <strong>是否需要登陆：</strong>
                    </td>
                    <td align="left" width="80%">
                         <input type="checkbox" runat="server" id="PubLogin" class="switchChk" onchange="$('#PubLogin_Btn').click();"   />
                         <asp:Button runat="server" ID="PubLogin_Btn" style="display:none;" OnClick="PubLogin_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr runat="server" id="Tr6">
                    <td align="left" width="20%">
                        <strong>是否公开：</strong>
                    </td>
                    <td align="left" width="80%">
                        <input type="checkbox" runat="server" id="RaPublic" class="switchChk"  checked="checked" />
                    </td>
                </tr>
                <tr runat="server" id="PubLoginUrls">
                    <td align="left" width="20%">
                        <strong>跳转登陆地址(http://)：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="PubLoginUrl" runat="server" Width="260px" CssClass="form-control pull-left"></asp:TextBox>
                    </td>
                </tr>
                <tr runat="server" id="PubOpenComments">
                    <td align="left" width="20%" class="style1">
                        <strong>是否开启前台管理：</strong>
                    </td>
                    <td align="left" width="80%" class="style1">
                        <input type="checkbox" runat="server" id="PubOpenComment" class="switchChk" />
                    </td>
                </tr>
                <tr runat="server" id="PubShowTypes" style="display: none">
                    <td align="left" width="20%">
                        <strong>生成投票显示：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:RadioButtonList ID="PubShowType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="0">无</asp:ListItem>
                            <asp:ListItem Value="1">柱状</asp:ListItem>
                            <asp:ListItem Value="2">圆形</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr runat="server" id="PubEndTimes">
                    <td align="left" width="20%">
                        <strong>结束时间：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="PubEndTime" runat="server" Width="140px" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" CssClass="form-control pull-left"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="PubEndTime" ErrorMessage="结束时间必须是日期!" ValidationExpression="^(\d{4}[\-]?\d{1,2}[\-]?\d{1,2})?([ ]?)(\d{1,2}[:]?\d{1,2}[:]?\d{1,2})?$" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                        <font color="blue">不限制请不要填写</font></b>
                    </td>
                </tr>
                <tr id="PubInputTMs" runat="server">
                    <td align="left" width="20%">
                        <strong>自定义信息提交模板：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="PubInputTM" runat="server" Width="200px" CssClass="form-control pull-left" />
                        <input style="width: 110px; margin-left: 10px;" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('PubInputTM') + '&amp;FilesDir=', 650, 480)" type="button" value="选择模板" class="btn btn-primary" />
                        <font color="blue">添加时如果为空则自动创建</font>
                    </td>
                </tr>
                <tr id="PubInputLoadStrs" runat="server">
                    <td align="left" width="20%">
                        <strong>调用信息提交标签：</strong>
                    </td>
                    <td align="left" width="80%">
                        <span class="pull-left" style="line-height: 30px;">{Pub.</span><asp:TextBox ID="PubInputLoadStr" CssClass="form-control pull-left" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="PubInputLoadStr_TextChanged"></asp:TextBox>
                        <span class="pull-left" style="line-height: 30px;">/}</span>&nbsp;<span style="color: red;">*</span><font color="blue"><asp:Label ID="Label3" runat="server" ForeColor="#CC3300"></asp:Label>设置标签或模板中调用的标签</font>
                    </td>
                </tr>
                <tr runat="server" id="Pubinfos">
                    <td align="left" width="20%">
                        <strong>互动描述：</strong>
                    </td>
                    <td align="left" width="80%">
                        <asp:TextBox ID="Pubinfo" runat="server" style="max-width:95%;height:100px;" CssClass="form-control pull-left" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </ContentTemplate>
        </asp:UpdatePanel>
        <tr>
            <td align="center" colspan="2">
                <div id="save">
                    <div>
                        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="btn btn-primary" />
                        <asp:Button ID="Button2" CausesValidation="false" runat="server" OnClick="Button2_Click" Text="返回" CssClass="btn btn-primary" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" class="C_input" />
                        <asp:HiddenField ID="HiddenID" runat="server" />
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <script>
        function check(obj) {
            chkArr1 = $(obj).parent().find(":checkbox[name=CheckBox1]");
            chkArr2 = $(obj).parent().find(":checkbox[name=CheckBox2]");
            chkArr3 = $(obj).parent().find(":checkbox[name=CheckBox3]");
            chkArr4 = $(obj).parent().find(":checkbox[name=CheckBox4]");
            if (!chkArr2[0].checked && !chkArr3[0].checked && !chkArr4[0].checked) {
                chkArr1[0].checked = false;
            }
            else {
                chkArr1[0].checked = true;
            }
        }
        function checkAll(obj) {
            chkArr2 = $(obj).parent().find(":checkbox[name=CheckBox2]");
            chkArr3 = $(obj).parent().find(":checkbox[name=CheckBox3]");
            chkArr4 = $(obj).parent().find(":checkbox[name=CheckBox4]");
            if (!obj.checked) {
                chkArr2[0].checked = false;
                chkArr3[0].checked = false;
                chkArr4[0].checked = false;
            }
        }
        function WinOpenDialog(url, w, h) {
            var feature = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;center:yes;status:no;help:no";
            showModalDialog(url, window, feature);
        }
    </script>
    <style>
        .spanl_30 {
            line-height: 30px;
            margin-left: 5px;
        }

        #ModelList {
            margin-left: 10px;
        }
    </style>
</asp:Content>
