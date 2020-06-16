<%@ page language="C#" autoeventwireup="true" inherits="manage.Page.PageTemplate, App_Web_y1nkzetg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>栏目管理</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script src="/JS/Common.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            <span>后台管理</span> &gt;&gt; 企业黄页 &gt;&gt;
        <asp:Label ID="Label1" runat="server"></asp:Label><asp:Label ID="addtree" runat="server" Text="栏目列表"></asp:Label>
            <a href="AddPageTemplate.aspx" style="color:#f00;">[添加栏目]</a>
        </div>
        <div class="clearbox"></div>
        <asp:Panel ID="selectstryle" runat="server" Width="100%">
            <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                <tr class="tdbg">
                    <td align="left" style="height: 24px">快速栏目样式分配：
                    <asp:DropDownList ID="Styleid" runat="server"></asp:DropDownList>
                        <asp:Button ID="Button2" runat="server" CssClass="C_input" OnClick="Button2_Click" Text="设置" />
                        <asp:Label ID="Label3" runat="server" Text="当前样式："></asp:Label>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <div class="clearbox"></div>
        </asp:Panel>
        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;margin-bottom:10px;">
            <tbody id="Tbody1">
                <tr class="tdbg">
                    <td align="center" class="title" style="width: 10%"><span class="tdbgleft">栏目ID</span></td>
                    <td style="width:40%;" align="center" class="title"><span class="tdbgleft">栏目名称</span></td>
                    <td style="width: 10%" align="center" class="title"><span class="tdbgleft">启用状态</span></td>
                    <td style="width: 15%" align="center" class="title"><span class="tdbgleft">栏目类型</span></td>
                    <td style="width: 25%" align="center" class="title"><span style="background-color: #e0f7e5">相关操作</span></td>
                </tr>
                <tr class="tdbg list0" name="list0" state="1" id="list0" onmouseover="this.className='tdbgmouseover list0'" onmouseout="this.className='tdbg lis0'">
                    <td style="height: 24px" align="center">0</td>
                    <td style="height: 24px" align="left">
                        <img alt="" src="/Images/TreeLineImages/plus.gif" style="vertical-align: middle;" /><span>根栏目</span>
                    </td>
                    <td style="height: 24px" align="center">
                        <font color="green">启用</font>
                    </td>
                    <td style="height: 24px" align="center">
                        根栏目
                    </td>
                    <td style="height: 24px" align="center">
                        <a href="AddPageTemplate.aspx">添加子栏目</a> | <a href="SetNodeOrder.aspx?ParentID=0">节点排序</a>
                    </td>
                </tr>
                <asp:Repeater ID="Temptable" runat="server">
                    <ItemTemplate>
                        <tr class="tdbg list<%# Eval("ParentID") %>" name="list<%# Eval("ParentID") %>" state="1" id="list<%#Eval("templateID")%>" onmouseover="this.className='tdbgmouseover list<%# Eval("ParentID") %>'" onmouseout="this.className='tdbg list<%# Eval("ParentID") %>'" onclick="showlist('<%# Eval("templateID") %>')">
                            <td style="height: 24px" align="center"><%#Eval("templateID")%></td>
                            <td style="height: 24px" align="left">
                                <img src="/Images/TreeLineImages/t.gif" /><img alt="" src='<%# getnodesrc(Eval("templateID","{0}"))%>' /><%#gettempname(Eval("templateID", "{0}"))%>
                            </td>
                            <td style="height: 24px" align="center"><%#getistrue(Eval("isTrue","{0}"))%></td>
                            <td style="height: 24px" align="center"><%#gettemptype(Eval("templateType","{0}"))%></td>
                            <td style="height: 24px" align="center"><%#getaddnode(Eval("templateID", "{0}"))%><%#getmodefy(Eval("templateID", "{0}"))%><%#getdelbotton(Eval("templateID","{0}"))%></td>
                        </tr>
                        <%#getparentid(Eval("templateID","{0}")) %>
                    </ItemTemplate>
                </asp:Repeater>
                <tr class="tdbg">
                    <td style="height: 24px" colspan="6" align="center" class="tdbgleft">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>个根栏目
                    <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />/
                    <asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:Label ID="pagess" runat="server" Text="" />个栏目/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>页
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Panel ID="updatetemplate" runat="server" Width="100%">
            <br />
            <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                <tr class="tdbg">
                    <td align="center" style="height: 24px">首页模板地址：
                    <asp:TextBox ID="templateUrl" CssClass="l_input" runat="server" Width="230px"></asp:TextBox>
                        <input type="button" value="选择模板" class="C_input" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('templateUrl') + '&FilesDir=', 650, 480)" />
                        <asp:Button ID="Button1" runat="server" Text="更新" CssClass="C_input" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <script>
            $().ready(function ()
            {
                for (i = 2; i <= $("tr").length-1; i++)
                {
                    if ($("tr:nth-child(" + i + ")").attr("name") != "list0")
                    {
                        $("tr:nth-child(" + i + ")").css("display", "none");
                    }
                }
            })
            function showlist(sid)
            {
                var i = 0;
                var j = 0;
                var state = $("#list" + sid).attr("state");
                if (sid == "0")
                {
                    for (i = 3; i <= $("tr").length; i++) {
                        if (state == "1") {
                            $("tr:nth-child(" + i + ")").css("display", "none");
                            $("tr:nth-child(" + i + ")").attr("state", "1");
                        }
                        else {
                            $(".list" + sid).css("display", "");
                            $("tr:nth-child(" + i + ")").attr("state", "0");
                        }
                    }
                }
                else {
                    for (i = 1; i <= $("tr").length-1; i++) {
                        if ($("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name") && $("tr:nth-child(" + i + ")").attr("id") == ("list" + sid)) {
                            j++;
                            continue;
                        }
                        if (j == 1 && $("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name")) {
                            j++;
                            break;
                        }
                        switch (j) {
                            case 1:
                                if (state == "0") {
                                    if ($("tr:nth-child(" + i + ")").attr("name") != "list0") {
                                        $("tr:nth-child(" + i + ")").css("display", "none");
                                        $("tr:nth-child(" + i + ")").attr("state", "0");
                                    }
                                }
                                else {
                                    $(".list" + sid).css("display", "");
                                    $("tr:nth-child(" + i + ")").attr("state", "1");
                                }
                                break;
                        }
                    }
                }
                if (state == "1")
                    $("#list" + sid).attr("state", "0");
                else
                    $("#list" + sid).attr("state", "1");
                if ($("#list" + sid).next().attr("name") == $("#" + $("#list" + sid).attr("name")).attr("name"))
                    $("#list" + sid).attr("state", "1");
            }
        </script>
        <style>
            .tdbgmouseover{ cursor:pointer;}
        </style>
    </form>
</body>
</html>
