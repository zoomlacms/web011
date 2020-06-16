<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserZone_StyleSet, App_Web_qh5tryws" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的空间</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">设定空间模板</li>
    </ol>
    <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
    <div class="us_topinfo" style="margin-top: 10px;">
        <a href="/user/userzone/Default.aspx">修改空间基本信息</a> <a href="/user/userzone/StyleSet.aspx">设定空间模板</a>(当前模板:<asp:Label ID="StyleNameLB" runat="server" Text="Label"></asp:Label>)
    </div>
    <div class="us_topinfo" style="margin-top: 10px;">
        <asp:DataList ID="DlStyle" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
            Width="100%" DataKeyField="ID" CssClass="table table-bordered">
            <ItemTemplate>
                &nbsp;&nbsp;
				<table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td align="center" height="114">
                            <asp:Image ID="Image1" runat="server" Height="95px" Width="100px" ImageUrl='<%#GetImg(DataBinder.Eval(Container.DataItem, "ID").ToString())%>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <%#Eval("StyleName", "{0}")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">设为模板</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <div style="height: 30px; text-align: center;">
            共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
			<asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
			<asp:Label ID="pagess" runat="server" Text="" />个/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            页
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript">
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
    </script>
</asp:Content>