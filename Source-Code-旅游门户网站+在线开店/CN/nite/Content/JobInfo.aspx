<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_JobInfo, App_Web_bqdihibb" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
  title>职位详细</title>
</asp:Content>


<asp:Content ContentPlaceHolderID="Content" runat="Server">
   <div class="us_topinfo">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a title="会员中心" href="SendResume.aspx">找工作</a></li>
        <li class="active">职位详细</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 
        <div class="cleardiv">
        </div>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <tr align="center">
            <td colspan="2" class="spacingtitle">
                <span>
                    <asp:Label ID="txtTitle" runat="server" Text="职位详细"></asp:Label></span>
            </td>
        </tr>
        <tr class="WebPart">
            <td height="22" align="right" valign="top">
                <strong>职位名称：</strong>
            </td>
            <td height="22" valign="middle">
                <%=jname %>
            </td>
        </tr>
        <tr class="WebPart">
            <td height="22" style="width:200px" align="right" valign="top">
                <strong>职位所需人数：</strong>
            </td>
            <td valign="middle">
               <%=jnum %>
            </td>
        </tr>
        <tr class="WebPart">
            <td height="22" align="right" valign="top">
                <strong>工作地点：</strong>
            </td>
            <td height="22" valign="middle">
               <%=jadd %>
            </td>
        </tr>
        <tr class="WebPart">
            <td align="right">
                <strong>职位描述：</strong>
            </td>
            <td valign="middle">
                <%=jinfo %>
            </td>
        </tr>
        <tr class="WebPart" runat="server" id="Tr1">
            <td height="22" align="right" valign="top">
                <strong>职位截止时间：</strong>
            </td>
            <td valign="middle">
                <%=jendtime %>
            </td>
        </tr>
    </table>
</asp:Content>


<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
