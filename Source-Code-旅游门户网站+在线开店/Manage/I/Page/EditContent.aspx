<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="ZoomLa.WebSite.Manage.Page.EditContent, App_Web_0fbyacen" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加内容</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    
<table class="table table-striped table-bordered table-hover">
    <tr><td colspan="2"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td></tr>
    <tbody id="Tabs0">
         <tr>
            <td class="tdbgleft" style="width: 20%" align="right">                    
               <b>内容标题:</b> </td>
            <td class="bqright">
                <asp:TextBox ID="txtTitle" class= "l_input" runat="server" Text='' Width="50%"></asp:TextBox>
                <span><font color="red">*</font></span>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTitle">内容标题必填</asp:RequiredFieldValidator></td>
         </tr>
         <asp:Literal ID="ModelHtml" runat="server"></asp:Literal><tr class="tdbg">
            <td class="tdbgleft" style="width: 20%" align="right">                    
                推荐：</td>
            <td class="bqright">
                <asp:CheckBox ID="ChkAudit" Text="推荐" runat="server" /></td>
         </tr>
         <tr>
            <td class="tdbgleft" style="width: 20%" align="right">                    
                指定内容模板：</td>
            <td >
                <asp:TextBox ID="TxtTemplate" MaxLength="255" class= "l_input" runat="server" Columns="50"></asp:TextBox>
                <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtTemplate') + '&FilesDir=', 650, 480)" class="C_input"/></td>
         </tr>
    </tbody>        
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:HiddenField ID="HdnItem" runat="server" />
                <asp:HiddenField ID="HdnNode" runat="server" />
                <asp:Button ID="EBtnSubmit" Text="保存项目" class="C_input"  OnClick="EBtnSubmit_Click" runat="server" />
                &nbsp;                
                <asp:Button ID="BtnBack" runat="server" class="C_input" Text="返　回" OnClick="BtnBack_Click" UseSubmitBehavior="False"
                    CausesValidation="False" />
            </td>
        </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Common.js" type="text/javascript"></script>
<script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
</asp:Content>