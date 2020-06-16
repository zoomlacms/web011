<%@ page language="C#" autoeventwireup="true" inherits="MIS_PreViewProg, App_Web_kvow1qcj" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>流程预览</title>
<link type="text/css" href="CSS/ZLOA.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $("tr:not(:first):not(:last)").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
    });
</script>
</head>
<body>
<form id="form1" runat="server">
<div style="margin:10px;">
    <div class="draftnav" style="margin:0; margin-bottom:10px;">
        <span>流程预览</span>
    </div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table_li table-border" OnPageIndexChanging="EGV_PageIndexChanging" BackColor="White" DataKeyNames="ID" AllowUserToOrder="true" EmptyDataText="当前没有信息!!" >
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-Height="22" Visible="false" />
            <asp:BoundField HeaderText="序号" DataField="StepNum"/>
            <asp:BoundField HeaderText="步骤名" DataField="StepName"/>
            <asp:TemplateField HeaderText="经办人" >
                <ItemTemplate >
                    <%#GetUserInfo(Eval("ReferUser","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="抄送人">
                <ItemTemplate>
                    <%# GetUserInfo(Eval("CCUser","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="会签">
                <ItemTemplate>
                    <%# GetHQoption(Eval("HQoption","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="强制转交">
                <ItemTemplate>
                    <%# GetQzzjoption(Eval("Qzzjoption","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回退">
                <ItemTemplate>
                    <%# GetHToption(Eval("HToption","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="备注" DataField="Remind"/>
        </Columns>
        <PagerStyle HorizontalAlign="Center"/>
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
</div>
</form>
</body>
</html>
