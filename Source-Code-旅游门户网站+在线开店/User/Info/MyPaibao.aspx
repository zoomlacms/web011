<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_MyPaibao, App_Web_3slerdid" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>购买拍宝套餐</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="UserInfo.aspx">账户管理</a></li>
        <li class="active">我的收益信息</li>
    </ol>
    <div class="us_seta" style="margin-bottom: 10px; float: left; width: 100%" id="manageinfos" runat="server">
        <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    </div>
    <div class="clearfix"></div>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="text-center" colspan="2">购买拍宝</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <img src="<%# UploadDir %><%#Eval("Timg") %>" /></td>
                    <td>
                        <input name="rboBuy" value='<%#Eval("ID") %>' type="radio" />
                        ¥<%#Eval("Tform")%></a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td>支付方式：</td>
            <td>
                <asp:DropDownList ID="ddPayplat" CssClass="form-control" Width="150" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="充值" OnClick="btn_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
