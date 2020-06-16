<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Page.PageContent, App_Web_y1nkzetg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>内容管理</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/ajaxrequest.js"></script>
    <script type="text/javascript" src="/JS/PassStrong.js"></script>
    <script>
        var tID = 0;
        var arrTabTitle = new Array("TabTitle", "TabTitle1", "TabTitle2", "TabTitle3");
        window.onload = function () {
            pload();
        }
        function pload() {
            var ID = '<%=Request.QueryString["ID"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
        }
        $().ready(function () {
            $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
    <style>
        .tdbg {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            <%if (GetOpenHelp.IsopenHelp() == "1")
              { %>
            <div id="help"><a onclick="help_show('88')" title="帮助"></a></div>
            <%} %>
   后台管理  &gt;&gt; <a href="PageManage.aspx">企业黄页 </a>&gt;&gt; <a href="PageContent.aspx">
       <asp:Label ID="Label1" runat="server"></asp:Label></a>
           &gt;&gt; <a href="PageRecyle.aspx">回收站 </a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div class="clearbox"></div>
        <div class="divline" style="padding-left: 5px; height: 35px;">
            <ul>
                <li style="float: left;">&nbsp;&nbsp; <b>
                    <%=lang.LF("排序") %>：</b>
                    <asp:DropDownList ID="txtbyfilde" CssClass="x_input" runat="server" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="txtbyOrder" runat="server" CssClass="x_input" OnSelectedIndexChanged="txtbyOrder_SelectedIndexChanged">
                    </asp:DropDownList>
                </li>
                <li style="float: left; margin-left: 20px;">&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" CssClass="x_input" runat="server">
                    <asp:ListItem Value="0" Selected="True">标题</asp:ListItem>
                    <asp:ListItem Value="1">ID</asp:ListItem>
                    <asp:ListItem Value="2">录入者检索</asp:ListItem>
                </asp:DropDownList></li>
                <li style="float: left; margin-left: 20px;">
                    <table cellpadding="2" border="0" cellspacing="1" style="background: #fff;" class="l_input">
                        <tr>
                            <td>

                                <asp:TextBox ID="TextBox1" runat="server" Width="90px" Height="15px" BorderColor="#fff" CssClass="l_inpnon"></asp:TextBox>
                                <asp:Button ID="Button4" runat="server" Text="" OnClick="Button4_Click" class="C_sch" />&nbsp;</td>
                        </tr>
                    </table>

                </li>
                <li><%=lang.LF("按发布者地区筛选")%>： 
                    <select runat="server" id="selprovince" name="selprovince" onchange="javascript:area()">
                    </select>
                    <asp:DropDownList ID="selcity" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="selcity_SelectedIndexChanged">
                    </asp:DropDownList>
                    <%-- <select runat="server" id="selcity" onchange="area2();">
                                            </select>--%> </li>


                <script type="text/javascript" src="/js/jquery.js"></script>
                <script type="text/javascript">

                    function area() {
                        $.ajax({
                            type: "POST",
                            url: "PageContent.aspx",
                            data: "action=area&value=" + $("#selprovince option:selected").val(),
                            success: function (msg) {
                                var s = new Array();
                                s = msg.split("|");
                                var str = "";
                                for (var i = 0; i < s.length; i++) {
                                    if (s[i] != null && s[i] != "")
                                        str += "<option>" + s[i] + "</option>"
                                }
                                $("#selcity").html(str);
                            },
                            Error: function (msg) {
                                alert("地址获取失败");
                            }
                        });
                    }
                </script>
            </ul>
        </div>
        <div class="clearbox"></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr align="center">
                <td class="titlemouseover" id="TabTitle" onclick="ShowTabs(0)"><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&province=<%=Request.QueryString["province"] %>&city=<%=Request.QueryString["city"] %>">内容列表</a></td>
                <td class="tabtitle" id="TabTitle1"><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&flag=Audit&ID=1&province=<%=Request.QueryString["province"] %>&city=<%=Request.QueryString["city"] %>">已审核内容</a></td>
                <td class="tabtitle" id="TabTitle2"><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&flag=UnAudit&ID=2&province=<%=Request.QueryString["province"] %>&city=<%=Request.QueryString["city"] %>">未审核内容</a></td>
                <td class="tabtitle" id="TabTitle3"><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&flag=Elite&ID=3&province=<%=Request.QueryString["province"] %>&city=<%=Request.QueryString["city"] %>">推荐内容</a></td>
                <td align="right">&nbsp; </td>
            </tr>
        </table>
        <div class="user_t">
            <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                RowStyle-CssClass="tdbg" DataKeyNames="GeneralID" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%" Height="20px" AllowSorting="True"
                CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border"
                EnableTheming="False" GridLines="None" EnableModelValidation="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <input type="checkbox" name="chkSel" title="" value='<%#Eval("GeneralID") %>' />
                        </ItemTemplate>
                        <HeaderStyle Width="5%" BorderColor="White" />
                        <ItemStyle HorizontalAlign="Center" BorderColor="White" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="ID" DataField="GeneralID">
                        <HeaderStyle Width="5%" BorderColor="White" />
                        <ItemStyle HorizontalAlign="Center" BorderColor="White" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="标题">
                        <ItemTemplate>
                            <%# GetTitle(Eval("GeneralID", "{0}"), Eval("ModelID", "{0}"), Eval("Title", "{0}"))%>
                        </ItemTemplate>
                        <HeaderStyle Width="40%" BorderColor="White" />
                        <ItemStyle BorderColor="White" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="点击数" DataField="Hits">
                        <ItemStyle HorizontalAlign="Center" BorderColor="White" />
                        <HeaderStyle Width="10%" BorderColor="White" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%# GetStatus(Eval("Status", "{0}")) %>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" BorderColor="White" />
                        <ItemStyle HorizontalAlign="Center" BorderColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已生成">
                        <ItemTemplate>
                            <%# GetCteate(Eval("IsCreate", "{0}"))%>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" BorderColor="White" />
                        <ItemStyle HorizontalAlign="Center" BorderColor="White" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>'>修改</asp:LinkButton>
                            | 
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据删除到回收站吗？')">删除</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle BorderColor="White" />
                        <ItemStyle HorizontalAlign="Center" BorderColor="White" />
                    </asp:TemplateField>
                </Columns>

                <PagerSettings Visible="False" />
                <RowStyle Height="24px" />
                <HeaderStyle Font-Bold="True" ForeColor="#E7E7FF" BackColor="#FFFFFF" Height="30px" Font-Overline="False" />

                <%--  <RowStyle ForeColor="Black" BackColor="#fff" Height="25px" />
    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" /> <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
     
     <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />--%>
            </asp:GridView>
            <table width="100%">
                <tr>
                    <td class="tdbg">
                        <div style="text-align: center">
                            <span style="text-align: center">
                                <%=lang.LF("共")%>
                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                                <%=lang.LF("条数据")%>
                                <asp:Label ID="Toppage" runat="server" Text="" />
                                <asp:Label ID="Nextpage" runat="server" Text="" />
                                <asp:Label ID="Downpage" runat="server" Text="" />
                                <asp:Label ID="Endpage" runat="server" Text="" />
                                <%=lang.LF("页次")%>：
                        <asp:Label ID="Nowpage" runat="server" Text="1" />/
                        <asp:Label ID="PageSize" runat="server" Text="" /><%=lang.LF("页")%>
                                <asp:Label ID="pagess" runat="server" Text="" />
                                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"
                                    Width="30px"></asp:TextBox>
                                <%=lang.LF("条数据/页   转到第")%>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%=lang.LF("页")%><asp:RangeValidator ID="RangeValidator1" runat="server"
                                    ControlToValidate="txtPage" ErrorMessage="仅支持数字" Type="Integer" MaximumValue="100000"
                                    MinimumValue="0"></asp:RangeValidator></span>
                        </div>
                    </td>
                </tr>
            </table>

        </div>
        <asp:Button ID="Button1" class="C_input" runat="server" Text="审核通过" OnClick="btnAudit_Click" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要审核选中内容吗？')}" />&nbsp;   
    <asp:Button ID="Button3" CssClass="C_input" runat="server" OnClick="Button3_Click" Text="取消审核" OnClientClick="if(!IsSelectedId()){alert('请选择取消审核项');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" />
        <asp:Button ID="Button2" class="C_input" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click"
            OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项放入回收站吗？')}" UseSubmitBehavior="true" />&nbsp;
   &nbsp; &nbsp;
    </form>
</body>
</html>
