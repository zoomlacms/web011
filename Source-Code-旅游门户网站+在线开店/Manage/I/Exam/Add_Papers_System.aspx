<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Add_Papers_System, App_Web_fk1hbgsf" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑试卷信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="ssjd_txt" runat="server" Text="试卷名称："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtPaperName" runat="server" class="form-control"  Width="384px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="试卷不能为空!" ControlToValidate="txtPaperName"></asp:RequiredFieldValidator>
                <asp:HiddenField ID="hfC_Id" runat="server" Value="" />
            </td>
        </tr>
        <%-- <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label3" runat="server" Text="试卷题型："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                   <asp:DropDownList ID="ddStyle" runat='server'>
                    <asp:ListItem Value="1" Selected="True">网上考试</asp:ListItem>
                    <asp:ListItem Value="2">网上练习</asp:ListItem>
                    <asp:ListItem Value="3">网上作业</asp:ListItem>
                   </asp:DropDownList>
                </td>
            </tr>--%>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label3" runat="server" Text="阅卷类型："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:DropDownList ID="ddRtyle" runat='server' CssClass="form-control">
                    <asp:ListItem Value="1" Selected="True">自动阅卷</asp:ListItem>
                    <asp:ListItem Value="2">手工阅卷</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label4" runat="server" Text="出题方式："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:DropDownList ID="ddType" runat='server' CssClass="form-control">
                    <%--<asp:ListItem Value="1" Selected="True">固定试卷(手工)</asp:ListItem>--%>
                    <asp:ListItem Value="2" Selected="True">固定试卷(随机)</asp:ListItem>
                    <%--<asp:ListItem Value="3" >随机试卷</asp:ListItem>--%>
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="tdbg">
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="zt_txt" runat="server" Text="所属类别："></asp:Label>
                &nbsp;
            </td>
            <td>
                <asp:DropDownList ID="ddlC_ClassId" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label6" runat="server" Text="考试时间："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtTime" runat="server" class="form-control"></asp:TextBox>分钟
            </td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label7" runat="server" Text="有效时间："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtBegionTime" runat="server" class="form-control" Width="200px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' });"></asp:TextBox>
                至
                    <asp:TextBox ID="txtEndTime" runat="server" class="form-control" Width="200px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' });"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdbgleft" style="width: 20%" align="right">
                <asp:Label ID="Label5" runat="server" Text="说明："></asp:Label>
                &nbsp;
            </td>
            <td class="bqright">
                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Height="90px" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存试卷" OnClick="EBtnSubmit_Click" runat="server" />
                &nbsp;
                <asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返回列表" OnClick="BtnBack_Click" UseSubmitBehavior="False" CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/Plugins/kindeditor/kindeditor.js" charset="utf-8"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>