<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.CollectionStep3, App_Web_gqexlk3x" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加采集项目</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="text-center">
            <td colspan="2"><%=type%></td>
        </tr>
        <tr>
            <td style="width: 20%"class="text-right">
                <strong>采集项目名称：</strong>
            </td>
            <td>
                <asp:Label ID="lblItemName" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:DataList ID="DataList1" CssClass="table table-striped table-bordered table-hover" runat="server">
        <ItemTemplate>
            <%#GetHtml(DataBinder.Eval(Container.DataItem, "FieldAlias").ToString(), DataBinder.Eval(Container.DataItem, "FieldName").ToString(), DataBinder.Eval(Container.DataItem, "FieldType").ToString(), DataBinder.Eval(Container.DataItem, "Content").ToString(), DataBinder.Eval(Container.DataItem, "Description").ToString(), DataBinder.Eval(Container.DataItem, "ModelID").ToString())%>
        </ItemTemplate>
    </asp:DataList>
    <asp:DataList ID="DataList2" CssClass="table table-striped table-bordered table-hover" runat="server">
        <ItemTemplate>
            <%#GetHtml(DataBinder.Eval(Container.DataItem, "FieldAlias").ToString(), DataBinder.Eval(Container.DataItem, "FieldName").ToString(),  DataBinder.Eval(Container.DataItem, "FieldType").ToString(), DataBinder.Eval(Container.DataItem, "Content").ToString(), DataBinder.Eval(Container.DataItem, "Description").ToString(), DataBinder.Eval(Container.DataItem, "ModelID").ToString())%>
        </ItemTemplate>
    </asp:DataList>
    <table style="width:100%;border:none;">
        <tr>
            <td class="text-center">
                <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="上一步" OnClick="Button2_Click" />
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存" OnClick="Button1_Click" />
                <input id="Button3" class="btn btn-primary" type="button" value="返回" onclick="window.location.href = 'CollectionManage.aspx'" />
            </td>
        </tr>
    </table>
    <br />
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="border">
        <tr align="left">
            <td colspan="2">
                <b>说明：</b>采集来源地址请使用 {geturl}
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        label{font-weight:normal;cursor:pointer;}
    </style>
    <script>
        function SetHr(cname, svalue, evalue, pvalue) {
            document.getElementById("hd_s_" + cname).value = svalue;
            document.getElementById("hd_e_" + cname).value = evalue;
            document.getElementById("hd_p_" + cname).value = pvalue;

        }
        function showpage(itemid, name, alias) {
            $(event.srcElement).closest("tr").find(":radio[value=3]")[0].checked = true;
            window.open("CollectionInfoPage.aspx?ItemID=" + itemid + "&Name=" + name + "&Alias=" + alias, "newWin", "modal=yes,width=810,height=650,resizable=yes,scrollbars=yes");
        }
    </script>

</asp:Content>
