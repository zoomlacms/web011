<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_UserBase, App_Web_k5dq03lr" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>基本信息</title>
    <style>
        .Top{margin-top:3px;}
        .UserFaseStyle{float:left;margin:10px;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="UserInfo.aspx">账户管理</a></li>
        <li class="active">基本信息</li>
    </ol>
    <div runat="server" id="Login" class="us_seta" style="position: absolute; top: 40%; left: 40%" visible="false">
        <table>
            <tr>
                <td colspan="2"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="Second" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:Button ID="sure" runat="server" Text="确定" OnClick="sure_Click" /></td>
            </tr>
        </table>
    </div>
    <div runat="server" id="DV_show">  
        <div class="us_seta" style="margin-top: 10px; width: 100%; float: left" id="manageinfo" runat="server">
            <ul class="nav nav-tabs">
                <li><a href="UserInfo.aspx">注册信息</a></li>
                <li class="active" onclick="switchTab('Tabs0');"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
                <li onclick="switchTab('Tabs1');"><a href="#Tabs1" data-toggle="tab">头像设置</a></li>
                <li><a href="DredgeVip.aspx">VIP信息</a></li>
                <li><a href="ListProfit.aspx">我的收益</a></li>
            </ul>
        </div>
        <script type="text/javascript">
            $("body").ready(function () {
                switchTab("<%=switchID.Value %>");
            });
            function switchTab(id) {
                switch (id) {
                    case "Tabs0":
                        $("#Tabs0").show();
                        $("#Tabs1").hide();
                        $("#switchID").val("Tabs0");
                        break;
                    case "Tabs1":
                        $("#Tabs0").hide();
                        $("#Tabs1").show();
                        $("#switchID").val("Tabs1");
                        break;
                }
                $("#switchID").val(id);
            }
            $().ready(function () {
                if ($("#switchID").val() == "Tabs1")
                {
                    $(".nav-tabs li").removeClass("active");
                    $(".nav-tabs li:eq(2)").addClass("active");
                }
            })
        </script>
        <asp:HiddenField ID="switchID" runat="server" />
        <table style="width: 100%; margin: 0 auto;" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
                <tbody id="Tabs0">
                    <tr>
                    <td colspan="4" class="text-center" style="font-size: 1.5em;">基本信息</td>
                </tr>
                <tr id="DivCompany" runat="server" visible="false">
                    <td class="tdbgleft" colspan="4">
                        <table style="border-collapse: collapse;" cellspacing="1" cellpadding="2" width="100%" border="0">
                            <tr>
                                <td class="tdbgleft">
                                    <strong>企业名称：</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCompanyName" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdbgleft">
                                    <strong>企业简介：</strong>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCompanyDescribe" class="form-control" runat="server" TextMode="MultiLine" Height="60"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">真实姓名：
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="tbTrueName" CssClass="form-control " runat="server"></asp:TextBox>
                    </td>
                    <td style="text-align: right">昵称：
                    </td>
                    <td style="">
                        <asp:TextBox ID="txtHonName" CssClass="form-control " runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">出生日期：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbBirthday" CssClass="form-control " runat="server" onfocus="WdatePicker();" onclick="WdatePicker();"></asp:TextBox>
                    </td>
                    <td style="text-align: right">办公电话：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbOfficePhone" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="tips" runat="server" ControlToValidate="tbOfficePhone" ErrorMessage="请输入数字！" Display="Dynamic" ValidationExpression="^\d+(\d+)?$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">家庭电话：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbHomePhone" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="tbHomePhone"
                            ErrorMessage="请输入区位号-数字！" CssClass="tips" Display="Dynamic" ValidationExpression="^\d+-(\d+)?$"></asp:RegularExpressionValidator>
                    </td>
                    <td style="text-align: right">传真：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbFax" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ValidationExpression="^\d+(\d+)?$"
                            ControlToValidate="tbFax" CssClass="tips" ErrorMessage="只能输入整数"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">手机号码：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbMobile" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationExpression="^1[(0-9)]{10}$"
                            ControlToValidate="tbMobile" CssClass="tips" ErrorMessage="按照手机号规则输入"></asp:RegularExpressionValidator>
                    </td>
                    <td style="text-align: right">小灵通：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbPHS" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <%--  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator6" ValidationExpression="^\d+(\d+)?$"
                            ControlToValidate="tbPHS" CssClass="tips" ErrorMessage="只能输入整数"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>

                    <td style="text-align: right">所属城市：
                    </td>
                    <td style="">
                        <asp:DropDownList ID="tbProvince" CssClass="form-control pull-left" style="max-width:80px;" runat="server" AutoPostBack="true" OnSelectedIndexChanged="tbProvince_SelectedIndexChanged"></asp:DropDownList>
                        <asp:DropDownList ID="tbCity" CssClass="form-control pull-left" style="max-width:80px;" runat="server"></asp:DropDownList>
                        <asp:TextBox ID="tbCounty" CssClass="form-control pull-left" runat="server" MaxLength="40"></asp:TextBox>
                        <input id="address" runat="server" type="hidden" />
                    </td>
                    <td style="text-align: right">性别：
                    </td>
                    <td style="">
                        <asp:RadioButtonList ID="tbUserSex" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                            <asp:ListItem Value="0">女</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">联系地址：
                    </td>
                    <td style="" colspan="3">
                        <asp:TextBox ID="tbAddress" CssClass="form-control" runat="server" Columns="30"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td style="text-align: right">邮政编码：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbZipCode" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="\d{6}"
                            ControlToValidate="tbZipCode" ErrorMessage="只能输入正确的邮政编码"></asp:RegularExpressionValidator>
                    </td>
                    <td style="text-align: right">身份证号码：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbIDCard" CssClass="form-control pull-left" runat="server" Columns="30"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="(^\d{15}$)|(^\d{17}([0-9]|X)$)"
                            ControlToValidate="tbIDCard" CssClass="tips"  ErrorMessage="请输入正确身份证号"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">个人主页：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbHomepage" CssClass="form-control" runat="server" Columns="30">http://</asp:TextBox>
                    </td>
                    <td style="text-align: right">QQ号码：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbQQ" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ValidationExpression="^[0-9]*$"
                            ControlToValidate="tbQQ" CssClass="tips" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
                    </td>

                </tr>
                <tr>

                    <td style="text-align: right">MSN账号：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbMSN" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator10"
                            ValidationExpression="^[0-9]*$" CssClass="tips" ControlToValidate="tbMSN" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
                    </td>
                    <td style="text-align: right">雅虎通账号：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbYahoo" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator11"
                            ValidationExpression="^[0-9]*$" CssClass="tips" ControlToValidate="tbYahoo" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>

                    <td style="text-align: right">公司名:</td>
                    <td style="">
                        <asp:TextBox runat="server" CssClass="form-control pull-left" ID="CompanyName"></asp:TextBox>
                    </td>
                    <td style="text-align: right">UC账号：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbUC" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator12"
                            ValidationExpression="^[0-9]*$" CssClass="tips" ControlToValidate="tbUC" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
                    </td>


                </tr>
                <tr>
                    <td style="text-align: right">职务:</td>
                    <td style="">
                        <asp:TextBox runat="server" CssClass="form-control pull-left" ID="Position"></asp:TextBox></td>

                    <td style="text-align: right">ICQ号码：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbICQ" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator9" ValidationExpression="^[0-9]*$"
                            ControlToValidate="tbICQ" CssClass="tips" ErrorMessage="只接受数字输入"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr><td style="display:none;"></td></tr>
                
                <tr>
                    <td style="text-align: right">签名档：
                    </td>
                    <td style="">
                        <asp:TextBox ID="tbSign" runat="server" class="form-control" TextMode="MultiLine" Width="300" Height="60"></asp:TextBox>
                    </td>
                     <td rowspan="2" style="text-align: right">隐私设定：
                    </td>
                    <td rowspan="2" style="">
                        <asp:RadioButtonList ID="tbPrivacy" runat="server">
                            <asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
                            <asp:ListItem Value="1">只对好友公开</asp:ListItem>
                            <asp:ListItem Value="2">完全保密</asp:ListItem>
                        </asp:RadioButtonList>
                        <!--<div style="float:right;margin-right:50px;"><asp:Image ID="ImgCode" runat="server" Width="145" Height="120"/></div>-->
                    </td>
                </tr>
                    <tr>
                        <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
                    </tr>
                    
                </tbody>
                <tbody id="Tabs1" style="display:none;">
                    <tr>
                    <td style="text-align: right" >头像地址：
                    </td>
                    <td style="" colspan="3">
                        <div class="UserFaseStyle">
                            <div >
                            <asp:FileUpload ID="HeaderUpImage" style="display:inline;"  runat="server"/><asp:Button ID="BtUpImage" runat="server" OnClick="BtUpImage_Click" CssClass="btn btn-primary" Text="上传" />
                        </div>
                        <div class="Top">
                            <asp:TextBox ID="tbUserFace" CssClass="form-control" runat="server" Text="/Images/userface/noface.gif"></asp:TextBox>&nbsp;
                    <select size="1" name="myface" class="form-control" style="max-width:100px;" onchange="document.images['face'].src=options[selectedIndex].value;document.getElementById('tbUserFace').value=options[selectedIndex].value;options[selectedIndex].selected=true;">
                        <option value="/Images/userface/1.gif">01.gif</option>
                        <option value="/Images/userface/2.gif">02.gif</option>
                        <option value="/Images/userface/3.gif">03.gif</option>
                        <option value="/Images/userface/4.gif">04.gif</option>
                        <option value="/Images/userface/5.gif">05.gif</option>
                        <option value="/Images/userface/6.gif">06.gif</option>
                        <option value="/Images/userface/7.gif">07.gif</option>
                        <option value="/Images/userface/8.gif">08.gif</option>
                        <option value="/Images/userface/9.gif">09.gif</option>
                        <option value="/Images/userface/10.gif">10.gif</option>
                        <option value="/Images/userface/11.gif">11.gif</option>
                        <option value="/Images/userface/12.gif">12.gif</option>
                        <option value="/Images/userface/13.gif">13.gif</option>
                        <option value="/Images/userface/14.gif">14.gif</option>
                        <option value="/Images/userface/15.gif">15.gif</option>
                        <option value="/Images/userface/16.gif">16.gif</option>
                        <option value="/Images/userface/17.gif">17.gif</option>
                        <option value="/Images/userface/18.gif">18.gif</option>
                        <option value="/Images/userface/19.gif">19.gif</option>
                        <option value="/Images/userface/20.gif">20.gif</option>
                    </select>
                        </div>
                        </div>
                     <div class="UserFaseStyle">
                         <div class="pull-left">
                             头像预览:
                            <asp:Image ID="face" runat="server" Height="111" Width="111" ImageUrl="~/Images/userface/noface.gif" />
                             <button class="btn btn-primary btn-xs" data-toggle='modal' data-target='#Cut_div' onclick="SetCutPic()" type="button">裁剪</button>
                        </div>
                     </div>
                    </td>
                   
                </tr>
                    <tr>
                    <td style="text-align: right">头像宽度：
                    </td>
                    <td style="">
                        <asp:TextBox CssClass="form-control" ID="tbFaceWidth" runat="server">111</asp:TextBox>
                    </td>
                    <td style="text-align: right;">头像高度：
                    </td>
                    <td style="">
                        <asp:TextBox CssClass="form-control" ID="tbFaceHeight" runat="server">111</asp:TextBox>
                    </td>
                </tr>
                </tbody>
             <tr>
                    
                    <td style="width: 100%; text-align: center" colspan="4">
                        <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="更新信息" OnClick="btnSave_Click" TabIndex="12" />
                    </td>
                </tr>
            </table>
    </div>
    <div class="modal" id="Cut_div">
        <div class="modal-dialog" style="width: 800px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button id="closeCut" type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong id="modtitle">截图工具</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="CutImg" style="width:100%;height:750px; border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/Dialog.js"></script>
<script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
    <script>
        function SetCutPic() {
            $("#CutImg").attr("src", "/Common/CutPic.aspx?p=" + $("#face").attr("src") + "&d=" + parseInt(10 * Math.random()) + parseInt(10 * Math.random()));
            //var diag = new Dialog();
            //diag.Width = 800;
            //diag.Height = 700;
            //diag.Title = "图片截图";
            //diag.URL = "/Common/CutPic.aspx?p=" + $("#face").attr("src") + "&d="+parseInt(10 * Math.random()) + parseInt(10 * Math.random());
            //diag.show();
        }
        function closdlg() {
            $("#closeCut").click();
        }
        function setCutUrl(url) {
            $("#face").attr("src", url);
            $("#tbUserFace").val(url);
        }
    </script>
</asp:Content>