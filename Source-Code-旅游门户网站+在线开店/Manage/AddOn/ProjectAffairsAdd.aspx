<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_ProjectAffairsAdd, App_Web_hc0q2vuk" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>事务中心</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">

 <div class="clearbox"></div>   
<div>
<table class="table table-bordered table-hover">
        <tr>
            <td style="line-height:50px;">
                新建事务：文件名：
                <asp:TextBox ID="TxtFilename" runat="server" class="form-control"></asp:TextBox>.txt
                <asp:RequiredFieldValidator ID="ValrKeywordText" ControlToValidate="TxtFilename"
            runat="server" ErrorMessage="事务名不能为空！" Display="Dynamic"></asp:RequiredFieldValidator>                       
                路径:
                <asp:Label ID="lblFielName" runat="server" Text="/"></asp:Label>
                <asp:HiddenField ID="HdnShowPath" runat="server" />                       
            </td>
        </tr>
          <tr>
            <td><asp:TextBox TextMode="MultiLine" runat="server" 
                    ID="textContent" Rows="15" Columns="100" Height="186px"></asp:TextBox></td></tr>
            <tr>
            <td>
                <asp:Button ID="btnSave" runat="server"  CssClass="btn btn-primary" Text="保存文档"  OnClick="btnAffairs_Click" class="C_input"/>
                <asp:Button ID="btnModify" runat="server"  CssClass="btn btn-primary" Text="保存文档"  OnClick="btnAffairsModify_Click" Visible="false" class="C_input"/>
                <input id="Button1" type="button" value="取消" class="btn btn-primary" onclick="javascript:window.history.go(-1);" class="C_input"/>
                </td>
        </tr>
            
            </table>
        
</div>
</asp:Content>
