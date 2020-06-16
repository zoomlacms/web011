<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_SurveyViewer, App_Web_ka5t45ft" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <title>问卷来源分析</title>
    <style>
        #sendMsg {
            width: 610px;
        }

        .closex {
            float: right;
        }

            .closex a {
                color: #F00;
                font-size: 20px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            后台管理&gt;&gt;<a href="SurveyManage.aspx">问卷投票管理</a>&gt;&gt;[问卷：<asp:Label ForeColor="Red" runat="server" ID="SurveyName_L"></asp:Label> ]问卷来源分析
        </div>
        <asp:GridView ID="gviewSurSorcer" DataKeyNames="Rid" CellPadding="2" CellSpacing="1" BackColor="White" CssClass="border" GridLines="None" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" OnRowDataBound="gviewSurSorcer_RowDataBound" OnPageIndexChanging="gviewSurSorcer_PageIndexChanging" OnRowCommand="gviewSurSorcer_RowCommand">
            <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
            <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="chkSel" title="" value='<%#Eval("Rid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编号">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="问卷ID">
                    <ItemTemplate>
                        <%=Request.QueryString["SID"] %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Submitip" HeaderText="提交IP" />
                <asp:TemplateField HeaderText="提交者">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlnkUser" Target="_self" NavigateUrl='<%# customPath2+"Plus/UserVote.aspx?SID="+Eval("Sid")+"&UID="+Eval("Userid")+"&PTime="+Server.UrlEncode(Eval("Submitdate","{0}")) %>' ToolTip="查看我的答卷" runat="server"><%# GetUserName(Eval("Userid", "{0}"))%></asp:HyperLink>
                        <a href='<%# customPath2+"UserVote.aspx?SID="+Eval("Sid")+"&UID="+Eval("Userid")+"&PTime="+Server.UrlEncode(Eval("Submitdate","{0}")) %>'></a>
                        <itemstyle horizontalalign="Center" width="17%" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Submitdate" HeaderText="提交日期" DataFormatString="{0:yyyy-MM-dd  HH:mm}" HeaderStyle-Width="16%" />
                <asp:TemplateField HeaderText="总分">
                    <ItemTemplate>
                        <%#GetScoreAll(Eval("UserID","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--        <asp:TemplateField HeaderText="浏览器类型">
            <ItemTemplate>
                <%# Request.Browser.Type %> &nbsp; 版本: <%# Request.Browser.Version %>
                <ItemStyle HorizontalAlign="Center" Width="15%" />
            </ItemTemplate>
        </asp:TemplateField>--%>
                <%--        <asp:BoundField DataField="Submitip" HeaderText="来源IP" HeaderStyle-Width="14%" />
        <asp:TemplateField HeaderText="所在地">
            <ItemTemplate><%# GetCitybyIP(Eval("Submitip", "{0}")) %></ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <HeaderStyle Width="20%" />
        </asp:TemplateField>--%>

                <%--        <asp:TemplateField HeaderText="状态">
            <ItemTemplate>
                <%#  GetStatus(Eval("Status","{0}")) %>
                <ItemStyle HorizontalAlign="Center" Width="15%" />
            </ItemTemplate>
        </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="AnswerView.aspx?sid=<%=Request.QueryString["SID"] %>&UID=<%# Eval("UserID") %>">查看</a> |
                <asp:LinkButton ID="lbtStatus" runat="server" ToolTip="审核" CommandName="Del1" CommandArgument='<%# Eval("Rid") %>'>删除</asp:LinkButton>
                        <%--<asp:LinkButton ID="lbtnExport" runat="server" ToolTip="导出为Word文档" CommandName="Export" CommandArgument='<%# Eval("Rid") %>'></asp:LinkButton> --%>

                        <%--                <asp:LinkButton ID="lbtConcle" runat="server" ToolTip="取消审核" CommandName="Concle" CommandArgument='<%# Eval("Rid") %>'>取消审核</asp:LinkButton> |
                <asp:LinkButton ID="lbtSelected" runat="server" ToolTip="通过" CommandName="Selected" CommandArgument='<%# Eval("Rid") %>'>通过</asp:LinkButton> |  
                <asp:LinkButton ID="lbtNLock" runat="server" ToolTip="解除锁定" CommandName="NLock" CommandArgument='<%# Eval("Rid") %>'>解除锁定</asp:LinkButton>     --%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#def2dd" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="tdbg" BorderStyle="None" />
            <HeaderStyle Font-Bold="True" ForeColor="#def2dd" BorderStyle="None" Height="30px" Font-Overline="False" />
            <PagerSettings Visible="false" />
        </asp:GridView>
        <div id="divPager" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td class="tdbg">
                        <div style="text-align: center">
                            <span style="text-align: center">
                                <%=lang.LF("共")%>
                                <asp:Label ID="lblTotalCnts" runat="server" Text=""></asp:Label>
                                <%=lang.LF("条数据")%>&nbsp;&nbsp;
                        <asp:LinkButton ID="lbtnFirstPage" CommandName="First" OnClick="LbtnAlterPage_Click" runat="server">首页</asp:LinkButton>
                                &nbsp;
                        <asp:LinkButton ID="lbtnPrePage" CommandName="Previous" OnClick="LbtnAlterPage_Click" runat="server">上一页</asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnNextPage" CommandName="Next" OnClick="LbtnAlterPage_Click" runat="server">下一页</asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnLastPage" CommandName="Last" OnClick="LbtnAlterPage_Click" runat="server">尾页</asp:LinkButton>&nbsp; &nbsp;
                        <%=lang.LF("页次")%>：
                <asp:Label ID="lblCurntPageNum" runat="server" />/
                <asp:Label ID="lblPageCnts" runat="server" />
                                <%=lang.LF("页")%>&nbsp; &nbsp;
                        <asp:Label ID="lblPages" runat="server" Text="" />
                                <%=lang.LF("每页显示：")%>
                                <asp:TextBox ID="txtPageSize" runat="server" AutoPostBack="true" CssClass="l_input" Width="30px" ToolTip="所输入的数据小于100" OnTextChanged="txtPageSize_TextChanged"></asp:TextBox>
                                <%=lang.LF("条数据")%> &nbsp; &nbsp;
                        <%=lang.LF("转到第")%>
                                <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%=lang.LF("页")%>
                        &nbsp; &nbsp;
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPageSize" ErrorMessage="数据不合法！" Type="Integer" MaximumValue="100" MinimumValue="1"></asp:RangeValidator></span>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button runat="server" ID="DelAll" Text="批量删除" CssClass="C_input" OnClick="DelAll_Click" />
        <div id="sendMsg" runat="server" visible="false" style="position: absolute; top: 20px; left: 20px; background: #fff; padding: 5px;">
        </div>
    </form>
    <script>
        $().ready(function () {
            $("#gviewSurSorcer tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })

        function hid(obj) {
            document.getElementById(obj).innerHTML = '';
            document.getElementById(obj).style.display = 'none';
        }
    </script>
</body>
</html>
