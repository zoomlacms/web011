<%@ page language="C#" autoeventwireup="true" inherits="manage_Guest_WdCheck, App_Web_jwvfgwdw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>词条管理</title>
    <link href="/App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="/App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <style type="">
        .rap {
            word-wrap: break-word;
            word-break: break-all;
        }

        #Egv td {
            width: auto;
            text-align: center;
        }

        .user_t {
            border: 1px solid #9bbde6;
            border-top: none;
        }

        .borders {
            border-bottom: 1px solid #40a2fd;
        }
    </style>
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3");
        window.onload = function () {
            pload();
        }
        function ShowTabss(ID) {
            location.href = 'WdCheck.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
    }
    function pload() {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
    }
    </script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation" style="position:relative;float:left;width:97%">
            <%if (GetOpenHelp.IsopenHelp() == "1")
              { %>
            <div id="help"><a onclick="help_show('97')" title="帮助"></a></div>
            <%} %>
            <%=lang.LF("后台管理")%> &gt;&gt;<%=lang.LF("百科问答")%> &gt;&gt;<%=lang.LF("问答管理")%>
            <input type="button" class="C_schmor" title="显示扩展搜索" value="" onclick="displayToolbar()" />
        </div>
        <div id="toolbar1" style="position:absolute;left:220px;top:2px;display:none;margin-left:8px;"> 
                    <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 

                <asp:TextBox ID="TxtLableName" BorderColor="#fff" CssClass="l_inpnon" runat="server"></asp:TextBox>

                &nbsp;
                <asp:Button ID="BtnSearch" class="C_sch"  runat="server" Text="" OnClick="BtnSearch_Click" />
                    </td></tr></table></div>
        <script type="text/javascript" src="/js/jquery.js"></script>
           <script type="text/javascript">
               function displayToolbar() {

                   $("#toolbar1").toggle("fast");

               }
                </script>  
        <div class="clearbox">
        </div>
        <div class="borders">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr align="center">
                    <td id="TabTitle0" class="titlemouseover" onclick="ShowTabss(0)"><a href="?type=0&id=0&QueType=<%=Request["QueType"] %>">所有问题</a></td>
                    <td id="TabTitle1" class="tabtitle" onclick="ShowTabss(1)"><a href="?type=1&id=1&QueType=<%=Request["QueType"] %>"><%=lang.LF("待审核")%></a></td>
                    <td id="TabTitle2" class="tabtitle" onclick="ShowTabss(2)"><a href="?type=2&id=2&QueType=<%=Request["QueType"] %>"><%=lang.LF("已审核")%></a></td>
                    <td id="TabTitle3" class="tabtitle" onclick="ShowTabss(3)"><a href="?type=3&id=3&QueType=<%=Request["QueType"] %>">已解决  </a></td>
                </tr>
            </table>
        </div>
        <div class="clearbox">
        </div>
        <div class="user_t">

            <asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="20" OnRowDataBound="Egv_RowDataBound"
                OnRowCommand="Lnk_Click" Width="100%" Height="20px" AllowPaging="True" CellPadding="1" RowStyle-CssClass="tdbg"
                CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" GridLines="None" Font-Bold="false" Font-Size="12px"
                EnableTheming="false">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <HeaderStyle Width="5%" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSel" runat="server" />
                            <%#Eval("ID")%>
                        </ItemTemplate>
                        <HeaderStyle Width="5%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" HeaderStyle-Width="0%" Visible="false">
                        <ItemTemplate>
                        </ItemTemplate>
                        <HeaderStyle Width="0%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="问题内容" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <a href="Asklist.aspx?ID=<%# Eval("ID") %>"><%# GetContent(Eval("Qcontent") as string) %></a>
                        </ItemTemplate>
                        <HeaderStyle Width="18%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="问题类型" HeaderStyle-Width="12%">
                        <ItemTemplate>
                            <a href="WdCheck.aspx?QueType=<%#Eval("QueType") %>"><%#gettype(Eval("QueType").ToString())%></a>
                        </ItemTemplate>
                        <HeaderStyle Width="12%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="提交人" HeaderStyle-Width="12%">
                        <ItemTemplate>
                            <%#Eval("UserName")%>
                        </ItemTemplate>
                        <HeaderStyle Width="12%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="提交时间" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <%#Eval("AddTime")%>
                        </ItemTemplate>
                        <HeaderStyle Width="10%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="推荐">
                        <ItemTemplate>
                            <%#gettj(Eval("Elite").ToString())%>
                        </ItemTemplate>
                        <ItemStyle CssClass="tdbg" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核">
                        <ItemTemplate>
                            <%#getcommend(Eval("status"))%>
                        </ItemTemplate>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="Asklist.aspx?ID=<%#Eval("ID")%>">留言</a>| <a href="/Guest/Ask/SearchDetails.aspx?soure=manager&ID=<%#Eval("ID") %>" target="_blank">预览</a>
                            |
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Audit" CausesValidation="false">审核</asp:LinkButton>
                            | <a href="WdAlter.aspx?ID=<%#Eval("ID")%>" target="_self">修改</a>
                            |
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确实要删除吗？');" CommandArgument='<%#Eval("ID") %>'
                        CommandName="Del" CausesValidation="false">删除</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
                <SelectedRowStyle BackColor="#9471DE" ForeColor="White" />
                <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
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
        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />
        <asp:Button ID="Button1" runat="server" Text="删除" OnClick="BtnSubmit1_Click" UseSubmitBehavior="False" 
            OnClientClick="if(!confirm('确定要批量删除吗？')){return false;}" class="C_input" />
        <asp:Button ID="Button2" runat="server" Text="审核通过" OnClick="BtnSubmit2_Click" UseSubmitBehavior="False" class="C_input" />
        <asp:Button ID="Button3" runat="server" Text="取消审核" OnClick="BtnSubmit3_Click" UseSubmitBehavior="False" class="C_input" />
        <asp:Button ID="Button4" runat="server" Text="批量推荐" OnClick="BtnSubmit4_Click" UseSubmitBehavior="False" class="C_input" />
        <asp:Button ID="Button5" runat="server" Text="取消推荐" OnClick="BtnSubmit5_Click" UseSubmitBehavior="False" class="C_input" />
    </form>
</body>
</html>
