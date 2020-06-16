<%@ page language="C#" autoeventwireup="true" inherits="MIS_Mail_Contact, App_Web_mb5viozi" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" href="../CSS/ZLOA.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
        <script type="text/javascript">
            $().ready(function () {
                $("#<%=EGV.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
                $("#chkAll").click(function () { selectAllByName(this, "idChk"); });
            });
            $().ready(function () {
                $("tr:gt(1):not(:last)").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
            });
    </script>
        <style type="text/css">
        #EGV tr th {color:black;background:url(""); }
        #EGV tr th {text-align:center;}
        #EGV tr td input {line-height:normal;}
    </style>
    <title>联系人</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main" style="margin:10px;">
        <ul class="Messge_nav" style="display:none;">
            <li class="active"><a href="MessageSend.aspx">写邮件</a></li>
            <li><a href="Message.aspx">收件箱</a></li>
            <li><a href="MessageOutbox.aspx">发件箱</a></li>
            <li><a href="MessageDraftbox.aspx">草稿箱</a></li>
            <li><a href="MessageGarbagebox.aspx">垃圾箱</a></li>
            <li><a href="Mobile.aspx">手机短信</a></li>
        </ul>
          <table><tr><td><asp:TextBox runat="server" ID="searchText" placeholder="请输入会员名,工号,部门" CssClass="form-control" /></td>
                <td><asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click"/></td></tr></table>
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="table_li table-border" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                   <asp:TemplateField HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
                       <ItemTemplate>
                           <input type="checkbox" name="idChk" value="<%#Eval("UserID") %>" />
                       </ItemTemplate>
                   </asp:TemplateField>
                     <asp:BoundField HeaderText="工号" DataField="WorkNum"/>
                     <asp:BoundField HeaderText="用户名" DataField="UserName" />
                     <asp:TemplateField HeaderText="真实名称">
                        <ItemTemplate>
                           <%# GetGN(Eval("TrueName")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="所属部门">
                        <ItemTemplate>
                           <%# Eval("GroupName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField HeaderText="手机号码" DataField="Mobile" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="MessageSend.aspx?uid=<%#Eval("UserID") %>" title="发送邮件">邮件</a>
                            <a href="Mobile.aspx?MB=<%#Eval("Mobile") %>" title="发送短信">短信</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        <div style="margin-top:10px;">
        <asp:Button runat="server" ID="batMsgBtn" CssClass="btn-primary" Text="批量邮件" OnClick="batMsgBtn_Click" />
        </div>
        </div>
    </form>
</body>
</html>
