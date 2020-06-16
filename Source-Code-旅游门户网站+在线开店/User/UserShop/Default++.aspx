<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_Default, App_Web_fbaj4n3q" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>店铺主页</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">店铺主页</li>
    </ol>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
            <table class="table table-striped table-bordered table-hover" style="margin-top: 10px;">
                <tr>
                    <td colspan="2" class="text-center">店铺基本信息[<asp:Label ID="Label2" runat="server" Text=""></asp:Label>]</td>
                </tr>
                <tr>
                    <td style="min-width: 120px;" class="text-right">商铺名称</td>
                    <td>
                        <asp:TextBox ID="Nametxt" runat="server" Text='' CssClass="form-control"></asp:TextBox>
                        <span><font color="red">*</font></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Nametxt">名称必填</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">商铺信用积分</td>
                    <td>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">商铺状态</td>
                    <td>
                        <asp:Label ID="Label4" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="text-right">商铺类型</td>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">商铺风格模板</td>
                    <td>
                        <asp:DropDownList ID="SSTDownList" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SSTDownList_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">缩略图</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="150px" />
                    </td>
                </tr>
                <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                <tr>
                    <td colspan="2" class="text-center">
                        <asp:Button ID="EBtnSubmit" Text="信息提交" CssClass="btn btn-primary" runat="server" OnClick="EBtnSubmit_Click" />
                        <input id="Button1" type="button" value="返回" class="btn btn-primary" onclick="javascript: history.go(-1)" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </asp:View>
        <asp:View ID="View2" runat="server">该功能尚未开启！</asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/LS/jquery.js"></script>
    <script type="text/javascript" src="/Common/Common.js"></script>
    <script type="text/javascript" src="/LS/Common.js"></script>
    <script src="/JS/calendar.js" type="text/javascript"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        $().ready(function () {
            $("input[type=text]").addClass("form-control");
        })
    </script>
</asp:Content>
