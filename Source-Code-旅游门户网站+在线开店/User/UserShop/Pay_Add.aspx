<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_Pay_Add, App_Web_vkx1tc11" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>编辑在线支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Pay_List.aspx">支付记录浏览</a></li>
        <li class="active"><%= str %></li>
    </ol>
    <div class="us_seta">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="table table-bordered table-striped table-hover">
                    <tr>
                        <td colspan="2" class="text-center">
                            <asp:Label ID="LblTitle" runat="server" Text="添加在线支付平台" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>接口类型：</strong>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLPayPlat" runat="server" CssClass="form-control" Width="160px" AutoPostBack="True" OnSelectedIndexChanged="DDLPayPlat_SelectedIndexChanged"></asp:DropDownList>
                            <asp:DropDownList ID="DDLPayType" CssClass="form-control" runat="server" Width="130px"></asp:DropDownList>
                            <span><b>* </b>必选</span>
                        </td>
                    </tr>
                    <tr id="alipay" runat="server" visible="false">
                        <td></td>
                        <td>支付宝网站(www.alipay.com)是国内先进的网上支付平台<br />
                            <strong>逐浪CMS</strong>联合支付宝推出支付宝接口
                       <a href="http://act.life.alipay.com/systembiz/zhulang/" target="_blank" style="color: Red">立即在线申请</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>支付名称：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="DDLPayName" runat="server" class="form-control"></asp:TextBox>
                            <span style="color: black">* 必填</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商户ID：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtAccountID" runat="server" class="form-control" />
                            <span style="color: black">* 必填</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="商户ID不能为空！" ControlToValidate="TxtAccountID" Display="Dynamic" SetFocusOnError="True" />
                        </td>
                    </tr>
                    <tr id="trMD5Key" runat="server">
                        <td>
                            <strong>安全校验码：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtMD5Key" runat="server" class="form-control" />
                            <span style="color: black">* 必填</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="安全校验码不能为空!" ControlToValidate="TxtMd5Key" Display="Dynamic" SetFocusOnError="true">  </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>卖家Email：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSellerEmail" runat="server" class="form-control" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtSellerEmail" Display="Dynamic" ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不正确</asp:RegularExpressionValidator>
                            <span style="color: black">如支付宝接口必须填写卖家Email,否则会出错</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>备注：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRemark" runat="server" Text="" class="form-control" TextMode="MultiLine" style="max-width:500px;" Height="144px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:HiddenField ID="HdnPayPlatID" runat="server" />
                            <asp:Button class="btn btn-primary" ID="EBtnSubmit" Text="保存" OnClick="EBtnSubmit_Click" runat="server" />
                            <input name="Cancel" type="button" id="BtnCancel" value="取消" onclick="window.location.href = 'Pay_View.aspx'" class="btn btn-primary" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
