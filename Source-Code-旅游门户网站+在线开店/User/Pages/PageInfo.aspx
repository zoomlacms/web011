<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Pages_PageInfo, App_Web_pa2vy3y0" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>注册企业黄页</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">注册企业黄页</li>
    </ol>
    <div class="us_seta" style="margin-top: 10px;">
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    <div class="us_seta" id="regpage" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Label ID="Label2" runat="server" Text="添加企业黄页"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="min-width:150px; text-align: right;">会员账号:</td>
                <td style="text-align: left;">
                    <asp:Label ID="Username" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">黄页类型:</td>
                <td style="text-align: left;">
                    <asp:RadioButtonList ID="Styleids" runat="server" OnSelectedIndexChanged="Styleids_SelectedIndexChanged" AutoPostBack="True" RepeatDirection="Horizontal" Height="24px" RepeatColumns="4" Style="margin-top: 0px; padding-top: 0px; line-height: 30px"></asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">企业名称:</td>
                <td style="text-align: left;">
                    <asp:TextBox ID="Proname" Name="Proname" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">企业LOGO:</td>
                <td style="text-align: left;">
                    <table border='0' cellpadding='0' cellspacing='1' width='100%'>
                        <tr class='tdbg'>
                            <td>
                                <asp:TextBox ID="txt_logos" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class='tdbg'>
                            <td>
                                <iframe id="Iframe1" src="/Common/UserUpload.aspx?FieldName=txt_logos" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="30" scrolling="no"></iframe>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width:150px; text-align: right;">企业说明:</td>
                <td style="text-align: left;">
                    <asp:TextBox ID="PageInfo" runat="server" Height="400px" TextMode="MultiLine" Width="800"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">快速栏目分配：</td>
                <td>
                    <asp:DropDownList ID="Styleid" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        </table>
        <div class="clearfix"></div>
        <div class="clearfix"></div>
        <table style="margin: auto;">
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:HiddenField ID="HdnNode" runat="server" />
                    <asp:HiddenField ID="HdnID" runat="server" />
                    <asp:HiddenField ID="HdnModel" runat="server" />
                    <asp:Button ID="BtnSubmit" CssClass="btn btn-primary" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
                    &nbsp;&nbsp;
                    <input type="reset" class="btn btn-primary" value="取消" />
                </td>
            </tr>
        </table>
    </div>
    <div class="clear"></div>
    <div class="us_seta" style="margin-top: 10px; line-height: 28px; padding-left: 20px;" id="Auditing" runat="server" visible="false">
        正在审核中......! 请等待管理员开通您的黄页功能! <a href=""></a>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">修改我提交的黄页信息!</asp:LinkButton><br />
        <br />
        <br />
    </div>
    <div class="clear"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script>
        $().ready(function () {
            $("input[type=text]").addClass("form-control");
            $("select").addClass("form-control");
        });
    </script> 
           <%=Call.GetUEditor("PageInfo",2) %>
</asp:Content>
