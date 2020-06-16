<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.ChangPSW, App_Web_wp4exovk" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>会员修改密码</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">修改密码</li>
    </ol>
    <div runat="server" id="Login" class="us_seta" visible="false">
        <table class="table table-bordered table-striped">
            <tr>
                <td colspan="2" class="text-center"><font color="red">本页需支付密码才能登入请输入支付密码</font></td>
            </tr>
            <tr>
                <td style="width:50%;" class="text-right">
                    <asp:TextBox ID="Second" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:Button ID="sure" runat="server" CssClass="btn btn-primary" Text="确定" OnClick="sure_Click" /></td>
            </tr>
        </table>
    </div>
    <div runat="server" id="DV_show">
        <div style="margin-top: 10px;">
            <div class="us_seta" style="margin-top: 5px; width: 100%;">
                <table class="table table-bordered table-hover table-striped">
                    <tr>
                        <td class="text-right" width="50%"><strong>原 密 码：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtOldPassword" runat="server" CssClass="form-control" TextMode="Password" />
                            <span style="color: Red">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="原密码不能为空" ControlToValidate="TxtOldPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right" width="40%"><strong>新 密 码：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="form-control" /><span style="color: Red">*</span>
                            <asp:RequiredFieldValidator runat="server" ID="R2" Display="Dynamic" ErrorMessage="新密码不能为空" ControlToValidate="TxtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="R3" Display="Dynamic" runat="server" ErrorMessage="密码不能少于6位" ControlToValidate="TxtPassword" ValidationExpression="[\s\S]{6,}" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right" width="40%"><strong>确认密码：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtPassword2" runat="server" TextMode="Password" CssClass="form-control" />
                            <span style="color: Red">*</span>
                             <asp:RequiredFieldValidator runat="server" ID="R4" Display="Dynamic" ErrorMessage="确认密码不能为空" ControlToValidate="TxtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtPassword2" ControlToCompare="TxtPassword" ErrorMessage="新密码和确认密码必须一致!" runat="server" ForeColor="Red"/></td>
                    </tr>
                    <tr class="text-center">
                        <td class="text-center" colspan="2">
                            <asp:Button ID="BtnSubmit" runat="server" Text="修改" OnClick="BtnSubmit_Click" class="btn btn-primary" />
                            <asp:Button ID="BtnCancle" runat="server" Text="取消" OnClick="BtnCancle_Click" class="btn btn-primary" /></td>
                    </tr>
                </table>
                <div style="width: 100%; text-align: center; margin-top: 10px">
                    <div style="width: 100%; text-align: center"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
