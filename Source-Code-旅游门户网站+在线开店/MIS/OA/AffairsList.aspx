<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_AffairsList, App_Web_kvow1qcj" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>发文列表</title>
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<link href="CSS/zlOA.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function openWin(v)
        {
            var url = "<%=CustomerPageAction.customPath2+"Common/NodeList.aspx?ModelID="+ZoomLa.Components.OAConfig.ModelID%>";
            var iTop = (window.screen.availHeight - 30 - 550) / 2;
            var iLeft = (window.screen.availWidth - 10 - 960) / 2;
            window.open(url, "_win", 'height=550, width=500,top=' + iTop + ',left=' + iLeft + ',toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
            $("#pageData").val(v);
        }
        function ParentFunc(v)
        {
            v = $("#pageData").val() + ":" + v;
            $("#pageData").val(v);
            $("#singleBtn").trigger("click");
        }
    </script>
</head>
<body>
<form id="form1" runat="server">
<div class="draftnav">
    <a onclick="javascript:parent.window.location.href='/MIS/OA/'">行政公文</a>/<a href="AffairsList.aspx?view=<%:CurrentView %>"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></a>
</div>
<div style="padding-left:10px; padding-right:10px;">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None"  Width="100%" CssClass="table_li table-border" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="发文类型" Visible="false">
                <ItemTemplate>
                    <%#GetType(Eval("Type", "{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
            <asp:BoundField HeaderText="标题" DataField="Title" />
            <asp:TemplateField HeaderText="密级">
                <ItemTemplate>
                    <%#GetSecret( Eval("Secret","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="紧急程度">
                <ItemTemplate>
                    <%# GetUrgency(Eval("Urgency","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="重要程度">
                <ItemTemplate>
                    <%# GetImport(Eval("Importance","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%# GetStatus(Eval("Status","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                  <a href="Office/<%=Request.QueryString["DocType"]=="1"?"ReadAffair.aspx":"ReadOffice.aspx" %>?AppID=<%#Eval("ID") %>">详情</a>|
                  <a href="javascript:;" onclick="openWin('<%#Eval("ID") %>');">分发</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center"/>
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
</div>
    <asp:Button runat="server" ID="singleBtn" OnClick="singleBtn_Click" style="display:none;"/><!--后台前测，前台只有提交请求权-->
    <asp:HiddenField runat="server" ID="pageData" />
</form>
</body>
</html>
