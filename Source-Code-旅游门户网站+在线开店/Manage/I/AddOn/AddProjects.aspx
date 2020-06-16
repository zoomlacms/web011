<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_AddProjects, App_Web_tctqdymj" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>新建项目</title>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <ul class="nav nav-tabs">
        <li class="active"><a id="TabTitle0" onclick="show1(0)">基本资料</a></li>
        <li><a id="TabTitle1" onclick="show1(1)">客户信息</a></li>
        <li><a id="TabTitle2" onclick="show1(2)">项目需求</a></li>
        <li><a id="TabTitle3" onclick="show1(3)">流程管理</a></li>
    </ul>
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tabs0">
            <tr>
                <td>
                    <b>名称</b><br />
                    项目的名称
                </td>
                <td>
                    <asp:TextBox ID="TxtProjectName" runat="server" class="form-control"></asp:TextBox>
                    <font color="red">*</font>
                    <asp:RequiredFieldValidator ID="RV" runat="server" ControlToValidate="TxtProjectName" Display="Dynamic" ErrorMessage="*" ToolTip="项目名称必须填">项目名称不可为空</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b>项目类型</b><br />
                    请选择项目类型
                </td>
                <td>
                    <asp:DropDownList ID="DDList" runat="server" CssClass="form-control" Width="126px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 282px;">
                    <b>项目价格</b><br />
                    完成此项目的价格
                </td>
                <td>￥<asp:TextBox ID="TxtProjectPrice" runat="server" class="form-control" Width="112px"></asp:TextBox>．00<font
                    color="red">*</font>
                    <asp:RequiredFieldValidator ID="RvPrice" runat="server" ControlToValidate="TxtProjectPrice"
                        Display="Dynamic" ErrorMessage="*">价格不可为空</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="Rvr" runat="server" ControlToValidate="TxtProjectPrice" CultureInvariantValues="True"
                        Display="Dynamic" ErrorMessage="*" MaximumValue="9999999999999" MinimumValue="1"
                        Type="Double">价格格式不对</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 282px;">
                    <b>项目经理</b>
                </td>
                <td>
                    <asp:TextBox ID="Leader" runat="server" class="form-control" Width="112px"></asp:TextBox>
                    <input id="Button3" type="button" value="选择负责人" data-toggle="modal" data-target="#userinfo_div" onclick="ShowUserInfo1(); void (0)" class="btn btn-primary" />
                </td>
            </tr>
            <tr>
                <td style="width: 282px;">
                    <b>技术负责人</b>
                </td>
                <td>
                    <asp:TextBox ID="WebCoding" runat="server" class="form-control" Width="112px"></asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tbody id="Tabs1" style="display: none;">
            <tr>
                <td style="width: 282px;">
                    <b>姓名</b><br />
                    申请人姓名
                </td>
                <td>
                    <asp:TextBox ID="TxtUserName" runat="server" Width="124px" class="form-control"></asp:TextBox><font
                        color="red">*</font><input id="Button1" type="button" value="选择用户" data-toggle="modal" data-target="#userinfo_div" onclick="ShowUserInfo(); void (0)"
                            class="btn btn-primary" />
                    <asp:RequiredFieldValidator ID="RvName" runat="server" ControlToValidate="TxtUserName"
                        ErrorMessage="姓名不可为空" Display="Dynamic">姓名不可为空</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b>单位</b><br />
                    申请人的工作单位
                </td>
                <td class="style6">
                    <asp:TextBox ID="TxtUserCompany" runat="server" Width="300px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <b>联系电话</b><br />
                    申请人的常用电话
                </td>
                <td style="width: 766px;">
                    <asp:TextBox ID="TxtUserTel" runat="server" Width="188px" class="form-control"></asp:TextBox>(输入您的联系电话)
                </td>
            </tr>
            <tr>
                <td>
                    <b>手机</b><br />
                    申请人的手机号码
                </td>
                <td align="left" valign="middle">
                    <asp:TextBox ID="TxtUserMobile" runat="server" Width="188px" class="form-control"></asp:TextBox>(输入您的11位手机号,方便与您联系)
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <b>QQ</b><br />
                    申请人的QQ号码
                </td>
                <td>
                    <asp:TextBox ID="TxtUserQQ" runat="server" Width="188px" class="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RvQQ" runat="server" ErrorMessage="RangeValidator" ControlToValidate="TxtUserQQ"
                        Display="Dynamic" MaximumValue="9999999999" MinimumValue="1111">QQ格式不对</asp:RangeValidator>
                    (请输入您的QQ号码4位-10位)
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <b>MSN</b><br />
                    申请人MSN号码
                </td>
                <td>
                    <asp:TextBox ID="TxtUserMSN" runat="server" Width="188px" class="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RvMSN" runat="server" ErrorMessage="RangeValidator" ControlToValidate="TxtUserMSN"
                        Display="Dynamic" MaximumValue="99999999999" MinimumValue="1">MSN格式不对</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <b>联系地址</b><br />
                    申请人的居住地址
                </td>
                <td style="width: 766px;">
                    <asp:TextBox ID="TxtUserAddress" runat="server" Width="300px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <b>邮箱</b><br />
                    申请人的电子邮箱地址
                </td>
                <td style="width: 766px;">
                    <asp:TextBox ID="TxtUserEmail" runat="server" Width="188px" class="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RvEmail" runat="server" ControlToValidate="TxtUserEmail"
                        Display="Dynamic" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不对</asp:RegularExpressionValidator>
                    (格式为……@…….com/cn/net)
                </td>
            </tr>
        </tbody>
        <tbody id="Tabs2" style="display: none">
            <tr>
                <td colspan="2">
                    <textarea cols="80" id="TxtProjectRequire" width="80%" height="400px" name="infoeditor" rows="10" runat="server"></textarea>
                  <%=Call.GetUEditor("TxtProjectRequire",2) %>
                </td>
            </tr>
        </tbody>
        <tbody id="Tabs3" style="display: none">
            <tr>
                <td style="width: 20%">
                    <b>流程管理</b><br />
                    导入流程<br />
                    <asp:Button ID="Button2" runat="server" Text="导入流程" CssClass="btn btn-primary"
                        OnClientClick="OpenProcess();return false;" />
                </td>
                <td>
                    <span id="Projects" name="Projects"></span>
                </td>
            </tr>
        </tbody>
        <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
    </table>
    <div style="text-align: center">
        <asp:Button ID="Commit" runat="server" Text="提交" class="btn btn-primary" OnClick="Commit_Click" />
        <asp:Button ID="Cancel" runat="server" Text="重置" class="btn btn-primary" OnClick="Cancel_Click" CausesValidation="False" />
    </div>
    <div class="modal" id="userinfo_div">
        <div class="modal-dialog" style="width: 1024px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong>选择用户</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="user_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Console.js"></script>
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script>
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3");
        function show1(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
                $("#TabTitle" + SID).parent().addClass("active").siblings("li").removeClass("active");;
            }
            try {
                //parent.document.getElementById("main_right").height = document.body.offsetHeight;
            } catch (Error)
            { }
            //alert("tID" + tID);
        }
        function ShowUserInfo() {
            $("#user_ifr").attr("src", "SelectUserName.aspx");
        }
        function ShowUserInfo1() {
            $("#user_ifr").attr("src", "SelectProjects.aspx");
        }
        function Openwin1() {
            var diag = new Dialog();
            diag.Modal = false;
            diag.Width = 800;
            diag.Height = 400;
            diag.Title = "选择负责人";
            diag.URL = "SelectProjects.aspx";
            diag.show();
        }
        function Openwin() {
            var diag = new Dialog();
            diag.Modal = false;
            diag.Width = 800;
            diag.Height = 400;
            diag.Title = "选择客户";
            diag.URL = "SelectUserName.aspx";
            diag.show();
        }

        function OpenProcess() {
            var diag = new Dialog();
            diag.Modal = false;
            diag.Width = 800;
            diag.Height = 400;
            diag.Title = "导入流程";
            diag.URL = "InputProcess.aspx";
            diag.show();
        }
        function closdlg() {
            Dialog.close();
        }
    </script>
    <style>
        #Tabs1,#Tabs2,#Tabs3{ border:none;}
        .nav li a { cursor: pointer; text-decoration: none;}
    </style>
</asp:Content>
