<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_ViewDrafting, App_Web_5xj5wdms" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>公文预览</title>
<link href="/MIS/OA/CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="draftnav"><a href="/MIS/OA/Main.aspx">行政公文</a>/<a href="Drafting.aspx">公文起草</a></div>
<div class="panel panel-primary" style="margin:10px;">
    <div class="panel-heading">
        <h3 class="panel-title">公文添加成功</h3>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-hover">
            <tr><td style="width:150px; text-align:right;">标题</td><td><asp:Label ID="LBTitle" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td style="width:150px; text-align:right;">主题词</td><td><asp:Label ID="LBKeyWords" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td style="width:150px; text-align:right;">添加人</td><td><asp:Label ID="AddUSer" runat="server" Text="Label"></asp:Label></td></tr>
            <tr><td style="width:150px; text-align:right;">添加时间</td><td><asp:Label ID="AddTime" runat="server" Text="Label"></asp:Label></td></tr>
            <tr>
                <td style="width:150px; text-align:right;">操作</td>
                <td>
                    <asp:Button ID="EditButton" CssClass="btn btn-primary" OnClick="EditButton_Click" runat="server" Text="重新修改" />
                    <asp:Button ID="AddButton" CssClass="btn btn-primary" OnClick="AddButton_Click" runat="server" Text="继续添加" />
                    <asp:Button ID="ListButton" CssClass="btn btn-primary" OnClick="ListButton_Click" runat="server" Text="发文管理" />
                    <input type="button" id="preViewBtn" class="btn-primary" onclick="disWin();" value="预览流程" />
                </td>
            </tr>
        </table>
    </div>
</div>
    <script type="text/javascript">
        function disWin() {
            var iTop = (window.screen.availHeight - 30 - 550) / 2;
            var iLeft = (window.screen.availWidth - 10 - 960) / 2;
            var myWin = window.open('/Mis/OA/PreViewProg.aspx?proID=<%=moa.ProID%>', 'newwindow', 'height=550, width=960,top=' + iTop + ',left=' + iLeft + ',toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
        }
    </script>
</form>
</body>
</html>
