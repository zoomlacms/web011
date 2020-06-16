<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Position_AddPosition, App_Web_bqdihibb" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>添加职位</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
          <div class="us_topinfo">
     <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">职位管理</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 



        <div class="cleardiv">
        </div>
    </div>
    <div>
        <table class="table table-bordered table-hover table-striped" style="width:500px">
        <tr align="center">
            <td colspan="2" class="spacingtitle">
                <span>
                    <asp:Label ID="txtTitle" runat="server" Text="Label"></asp:Label></span>
            </td>
        </tr>
        <tr class="WebPart">
            <td height="22" class="tdbgleft" align="right" valign="top">
                <strong>职位名称：</strong>
            </td>
            <td height="22" valign="middle" >
                <asp:TextBox class="form-control" ID="Jname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFPosition" runat="server" 
                    ErrorMessage="职位名称必填" ControlToValidate="Jname"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr class="WebPart">
            <td class="tdbgleft" height="22"  align="right" valign="top">
                <strong>职位所需人数：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox class="form-control" ID="Jnum" runat="server" onKeyUp="value=value.replace(/[^\d\.]/g,'')"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="Jnum" ErrorMessage="必须为数字" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </td>       
        </tr>
        <tr class="WebPart">
            <td class="tdbgleft" height="22"  align="right" valign="top">
                <strong>工作地点：</strong>
            </td>
            <td height="22" valign="middle">
                <asp:TextBox ID="Jadd" runat="server" class="form-control" Height="53px" TextMode="MultiLine" 
                    Width="430px"></asp:TextBox>
                <asp:RequiredFieldValidator  ID="Jaddcheck" runat="server" 
                    ControlToValidate="Jadd" ErrorMessage="工作地点必填"></asp:RequiredFieldValidator>
            </td>    
        </tr>
        <tr class="WebPart">
            <td class="tdbgleft" align="right">
                <strong>职位描述：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox class="form-control" ID="Jinfo" runat="server" TextMode="MultiLine" Width="87%" 
                    Height="288px"></asp:TextBox>
            </td>           
        </tr>
        <tr class="WebPart" runat="server" id="Tr1">
            <td height="22" class="tdbgleft" align="right" valign="top">
                <strong>职位截止时间：</strong>
            </td>
            <td valign="middle">
                <asp:TextBox class="form-control" ID="Jendtime" runat="server" onclick="calendar();"></asp:TextBox>
                <asp:RequiredFieldValidator ID="txtEndTime" runat="server" 
                    ControlToValidate="Jendtime" ErrorMessage="截止日期必填"></asp:RequiredFieldValidator>
            </td> 
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2">               
                <asp:Button CssClass="btn btn-primary" ID="EBtnSubmit" Text="添加" runat="server" 
                    onclick="EBtnSubmit_Click" />
                &nbsp;
                <asp:Button  name="Cancel" CssClass="btn btn-primary" text="取消" runat="server" id="Cancel" value="取消"  />
                &nbsp;                
            </td>
        </tr>      
    </table>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  <script language="javascript" type="text/javascript" src="../../../JS/calendar.js"></script>
</asp:Content>