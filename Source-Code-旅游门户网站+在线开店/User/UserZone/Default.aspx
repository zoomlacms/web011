<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserZone_Default, App_Web_qh5tryws" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的空间</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的空间</li>
    </ol>
    <div style="margin: auto; width: 100%">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc1:WebUserControlTop>
                <div class="us_topinfo" style="margin-top: 10px; width: 98%"><a href="/user/userzone/Default.aspx">修改空间基本信息</a> | <a href="/user/userzone/StyleSet.aspx">设定空间模板</a> | <a href="/ShowList.aspx?id=<%=id %>" target="_blank">个人空间首页</a></div>
                <div class="us_topinfo" style="margin-top: 10px; width: 98%">
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td width="150" align="right">空间名称：  </td>
                            <td align="left">
                                <asp:TextBox ID="Nametxt" class="U_input" runat="server" Text='' CssClass="form-control" style="max-width:300px;"></asp:TextBox>
                                <span><font color="red">*</font></span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Nametxt">名称必填</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">空间简介：</td>
                            <td align="left">
                                <textarea id="textareacontent" class="form-control" style="max-width:300px; height: 138px" runat="server"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">推广地址：</td>
                            <td align="left">
                                <asp:TextBox ID="txtPromotion" runat="server" CssClass="form-control" style="max-width:300px;"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">
                                <asp:Button ID="EBtnSubmit" class="btn btn-primary" runat="server" OnClick="EBtnSubmit_Click" Text="信息提交" />
                                <input id="Button1" class="btn btn-primary" onclick="javascript: history.go(-1)" type="button" value="返  回" />
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">系统未开启此功能，请在后台-系统设置-网站参数设置启用该功能。 </asp:View>
        </asp:MultiView>
        <!-- str -->
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
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
