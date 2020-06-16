<%@ page language="C#" autoeventwireup="true" inherits="manage_Guest_ReplyGuest, App_Web_jwvfgwdw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>回复留言</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script>
        function clickurl() {
            var refer = document.referrer;
            if (refer != "") {
                location.href = refer;
            }
            else {
                window.close();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">

            <span>后台管理</span>&gt;&gt;<span><a href="Default.aspx?CateID=<%=Server.HtmlEncode(Request.QueryString["CateID"]) %>">留言管理</a></span> &gt;&gt;<span>留言内容</span>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" id="bindset">
        </table>
        <table class="TableWrap" border="0" cellpadding="0" cellspacing="0" width="100%">
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="repFileReName_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; border: #fff solid 1px;"><strong>ID</strong></td>
                        <td class="tdbg" style="width: 85%; border: #fff solid 1px;"><%# Eval("GID")%></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; border: #fff solid 1px;"><strong>留言人</strong></td>
                        <td class="tdbg" style="width: 85%; border: #fff solid 1px;"><a href="../User/UserInfo.aspx?id=<%# Eval("UserID") %>" title="点击查看该用户详情"><%# GetUserName(Eval("UserID","{0}")) %></a></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; border:#fff solid 1px;"><strong>留言标题</strong></td>
                        <td class="tdbg" style="width: 85%; border:#fff solid 1px;"><%# Eval("Title") %></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; border:#fff solid 1px;"><strong>留言内容</strong></td>
                        <td class="tdbg" style="width: 85%; border:#fff solid 1px;"><%# Eval("TContent") %></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; border:#fff solid 1px;"><strong>IP地址</strong></td>
                        <td class="tdbg" style="width: 85%; border:#fff solid 1px;"><%# Eval("IP") %></td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 100px; text-align: center; border:#fff solid 1px;"><strong>添加时间</strong></td>
                        <td class="tdbg" style="width: 85%; border:#fff solid 1px;"><%# Eval("GDate") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <div id="Pager1" runat="server" style="display:none;"></div>
        <asp:HiddenField ID="HdnGID" runat="server" />
        <div style="margin-top: 20px;">
            <table style="width: 100%; margin: 0 auto; margin-top: 5px;" cellpadding="0" cellspacing="0"
                class="border">
                <tr class="tdbg">
                    <td colspan="2" class="title" style="text-align: center">
                        <asp:Label ID="LblModelName" runat="server" Text="回复留言"></asp:Label>
                    </td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td align="right" class="tdbgleft">标题：
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" class="l_input" runat="server" Width="365px" /><span style="color:#1e860b;margin-left:5px;">*非必填项</span>
                    </td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td align="right" class="tdbgleft">内容：
                    </td>
                    <td>
                        <asp:TextBox ID="tx_Content" runat="server" class="l_input" Height="107px" TextMode="MultiLine"
                            Width="427px"></asp:TextBox>
                    </td>
                </tr>
                <asp:Literal ID="ModelHtml" runat="server"></asp:Literal><tr class="tdbgbottom border">
                    <td colspan="2">
                        <asp:HiddenField ID="HdnModel" runat="server" />
                        <asp:HiddenField ID="HiddenParentid" runat="server" />
                        <asp:HiddenField ID="HdnPubid" runat="server" />
                        <asp:HiddenField ID="HdnID" runat="server" />
                        <asp:HiddenField ID="HdnType" runat="server" />
                        <div class="clearbox"></div><div class="clearbox"></div><div class="clearbox"></div>
                        <asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
                        <asp:Button ID="EBtnSubmit" Text="保存回复" class="C_input" OnClick="EBtnSubmit_Click" runat="server" />
                        <asp:Button ID="Button1" Text="返回列表" class="C_input" runat="server" OnClick="Button1_Click" />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
