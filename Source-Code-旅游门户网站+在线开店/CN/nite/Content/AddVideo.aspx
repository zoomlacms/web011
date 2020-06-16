<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_AddVideo, App_Web_bqdihibb" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
       <title>视频上传</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
   <div class="us_topinfo">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a title="会员中心" href="AddVideo.aspx">视频管理</a></li>
        <li class="active">视频上传</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 
        <div class="cleardiv">
        </div>
    </div>
    <div class="clearbox">
    </div>
    
    <table class="table table-bordered table-hover table-striped">
        <tr align="center">
            <td colspan="2" class="spacingtitle">
                <span>
                    <asp:Label ID="txtTitle"  runat="server" Text="视频上传"></asp:Label></span>
            </td>
        </tr>
        <tr class="WebPart">
            <td height="22"  align="right" valign="top">
                <strong>上传文件：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr class="WebPart">
            <td height="22"  align="right" valign="top">
                <strong>视频名称：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:TextBox ID="txtVn" class="form-control"  runat="server" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVn" runat="server" ErrorMessage="视频名称必填" ControlToValidate="txtVn"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="WebPart">
            <td height="22"  align="right" valign="top">
                <strong>视频描述：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:TextBox class="form-control" ID="txtVd" runat="server" TextMode="MultiLine" Width="224px" Height="70px"></asp:TextBox>
            </td>
        </tr>
        <tr class="WebPart">
            <td>
            </td>
            <td height="22" valign="middle">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button CssClass="btn btn-primary" ID="btnUpload" runat="server" Width="70px" OnClick="btnUpload_Click" Text="提  交" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>

