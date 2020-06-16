<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_Invite, App_Web_bqdihibb" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>邀请用户</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
      <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">邀请用户</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 
    <table class="table table-bordered table-hover table-striped">
        <tr >
            <td colspan="6" class="spacingtitle">
                <span>发出邀请</span>
            </td>
        </tr>        
        <tr class="WebPart">
            <td class="tdbgleft" align="right">
                <strong>面试时间：</strong>
            </td>
            <td >
                <asp:TextBox ID="txtViewTime1" runat="server" onclick="calendar();"></asp:TextBox>~
                <asp:TextBox ID="txtViewTime2" runat="server" onclick="calendar();"></asp:TextBox>
            </td>
          </tr>
         <tr class="WebPart">
            <td class="tdbgleft" height="22" align="right" valign="top" style="width: 40%">
                <strong>面试职位：</strong>
            </td>
            <td  >
                <asp:DropDownList ID="DropDownList1" runat="server" Width="130px">
                </asp:DropDownList>
            </td>               
        </tr>        
        <tr class="tdbgbottom">
            <td colspan="6" style="text-align:center">               
                <asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="邀请" runat="server" />

                <asp:Button ID="Cancel" CssClass="btn btn-primary" Text="取消" runat="server"   />         
            </td>
        </tr>              
    </table>
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
