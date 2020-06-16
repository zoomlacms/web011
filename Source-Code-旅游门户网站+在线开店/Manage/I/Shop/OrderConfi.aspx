<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_OrderConfi, App_Web_2afsdgkd" validaterequest="false" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .config {max-width:600px;}
        td strong {line-height:100px;}
    </style>
    <title>订单信息配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr><td><span style="color:Red">提示内容中可用标签说明如下：{$UserName}订货人姓名；&nbsp;{$SiteName}网站名称；&nbsp;{$OrderCode}订单号；&nbsp;{$DataTime}下单时间；&nbsp;
   {$DeliveryUser}送货员；&nbsp;{$DeliUserMobile}送货手机；&nbsp;{$SignUserName}代签人姓名；&nbsp;{$SignUserMobil}代签人手机；&nbsp; {$Remark}状态备注</span></td></tr>
    <tr>
        <td>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                <td style="width:120px;"><strong>有效订单说明：</strong></td>
                <td>
                    <asp:TextBox ID="txtAcou" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="订单返利最低兑现金额不能为空!" ControlToValidate="txtAcou"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td ><strong>无效订单说明：</strong></td>
                <td>
                    <asp:TextBox ID="txtsite" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="分站返利最低兑现金额不能为空!" ControlToValidate="txtsite"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td ><strong>全部付款和部分付款说明：</strong></td>
                <td>
                    <asp:TextBox ID="txtfu" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="全部付款和部分付款说明不能为空!" ControlToValidate="txtfu"></asp:RequiredFieldValidator>
                </td>
            </tr>
                <tr>
                <td ><strong>退款说明：</strong></td>
                <td>
                    <asp:TextBox ID="txttui" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="退款说明不能为空!" ControlToValidate="txttui"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td ><strong>已发货说明：</strong></td>
                <td> <asp:TextBox ID="txtfahuo" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="已发货说明不能为空!" ControlToValidate="txtfahuo"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                <td ><strong>本人签收说明：</strong></td>
                <td>
                    <asp:TextBox ID="txtSign" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="本人签收说明不能为空!" ControlToValidate="txtSign"></asp:RequiredFieldValidator>
                </td>
            </tr>
                <tr>
                <td ><strong>他人签收说明：</strong></td>
                <td>
                    <asp:TextBox ID="txtOtSign" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="他人签收说明不能为空!" ControlToValidate="txtOtSign"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td ><strong>未签收,未发货说明：</strong></td>
                <td> <asp:TextBox ID="txtN" runat="server"  class="form-control config" Height="100" TextMode="MultiLine" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="未签收,未发货说明不能为空!" ControlToValidate="txtN"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="修改" runat="server"  onclick="EBtnSubmit_Click" />
            <input type="button" class="btn btn-primary" name="Button2" value="返回列表" onclick="location.href = '../shop/profile/HonorManage.aspx'" id="Button2" />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
</asp:Content>




