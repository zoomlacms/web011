<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.GroupManage, App_Web_rvziairi" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>会员组管理</title>
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../Plugins/JqueryUI/spin/spin.js"></script>
    <script type="text/javascript" src="../../JS/jquery.js"></script>
    <style>
        .tabga {
            margin-left: 5px;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            <%if (GetOpenHelp.IsopenHelp() == "1")
              { %>
            <div id="help"><a onclick="help_show('38')" title="帮助"></a></div>
            <%} %> 后台管理&gt;&gt;会员管理&gt;&gt; 会员组管理 &gt;&gt;[<a href="Group.aspx" style="color: Red">添加会员组</a>]
        </div>
        <div>
            <div id="foo" style="position: fixed; top: 50%; left: 30%; display: block;"></div>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" class="border" align="center">
                <tr class="gridtitle" align="center" style="height: 25px;">
                    <td style="width: 3%; text-align: center;"><strong>ID</strong></td>
                    <td style="width: 30%;"><strong>会员组名</strong></td>
                    <td style="width: 10%;"><strong>会员组说明</strong></td>
                    <td style="width: 6%; height: 20px;"><strong>注册可选</strong></td>
                    <td style="width: 3%;"><strong>默认</strong></td>
                    <td style="width: 6%;"><strong>会员数</strong></td>
                    <td style="width: 45%"><strong>操作</strong></td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr class="tdbg list<%#Eval("ParentGroupID") %>" id="list<%#Eval("GroupID") %>" style="height: 24px;" onmouseover="this.className='tdbgmouseover list<%#Eval("ParentGroupID") %>'" onmouseout="this.className='tdbg list<%#Eval("ParentGroupID") %>'" name="list<%#Eval("ParentGroupID") %>" onclick="getGroupList(this,'grouplist','<%#Eval("GroupID") %>');" <%# ShoworHidden(Eval("GroupID","{0}"),Eval("ParentGroupID","{0}")) %>>
                            <td style="text-align: center;"><%# Eval("GroupID","{0}") %></td>
                            <td style="text-align: left;"><%# GetIcon(Eval("GroupName","{0}"),Eval("GroupID","{0}"),Eval("ParentGroupID","{0}")) %></td>
                            <td style="text-align: center;"><%# Eval("Description") %></td>
                            <td style="text-align: center;"><%# GetReg(Eval("RegSelect","{0}")) %></td>
                            <td style="text-align: center;"><%# GetDefault(Eval("IsDefault","{0}"))%></td>
                            <td style="text-align: center;"><%# GetUserNum(Eval("GroupID","{0}")) %></td>
                            <td style="text-align: center;"><%# GetOper(Eval("GroupID","{0}")) %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td class="tdbg" colspan="7">
                        <div style="text-align: center">
                            <span style="text-align: center">
                                <%=lang.LF("共")%>
                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                                <%=lang.LF("条数据")%>
                                <asp:Label ID="Toppage" runat="server" Text="" />
                                <asp:Label ID="Nextpage" runat="server" Text="" />
                                <asp:Label ID="Downpage" runat="server" Text="" />
                                <asp:Label ID="Endpage" runat="server" Text="" />
                                <asp:HiddenField ID="CurrentPage" runat="server" Value="1" />
                                <asp:HiddenField ID="HiddenNodeID" runat="server" />
                                <%=lang.LF("页次")%>：
                                <asp:Label ID="Nowpage" runat="server" Text="1" />/
                                <asp:Label ID="PageSize" runat="server" Text="" /><%=lang.LF("页")%>
                                <asp:Label ID="pagess" runat="server" Text="" />
                                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged" Width="30px"></asp:TextBox>
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
    </form>
    <script type="text/javascript">
        function showlist(sid) {
            var i = 0;
            var j = 0;
            var state = $("#list" + sid).attr("state");
            if (sid == "0") {
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
                for (i = 1; i <= $("tr").length; i++) {
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
                            if (state == "1") {
                                if ($("tr:nth-child(" + i + ")").attr("name") != "list0") {
                                    $("tr:nth-child(" + i + ")").css("display", "none");
                                    $("tr:nth-child(" + i + ")").attr("state", "1");
                                }
                            }
                            else {
                                $(".list" + sid).css("display", "");
                                $("tr:nth-child(" + i + ")").attr("state", "0");
                            }
                            break;
                    }
                }
            }
            if (state == "1") {
                $("#list" + sid).attr("state", "0");
            } else {
                $("#list" + sid).attr("state", "1");
            }
        }
        var opts = {
            lines: 8, // The number of lines to draw
            length: 6, // The length of each line
            width: 2, // The line thickness
            radius: 5, // The radius of the inner circle
            color: '#000', // #rbg or #rrggbb
            speed: 1, // Rounds per second
            trail: 100, // Afterglow percentage
            shadow: true // Whether to render a shadow
        };
        var trCode = "<tr onclick=\"getGroupList(this,'grouplist','{gid}');\" class=\"tdbg list{pid}\" id=\"list{gid}\" name=\"list{pid}\" align=\"center\" onmouseover=\"this.className='tdbgmouseover list{pid}'\" onmouseout=\"this.className='tdbg list{pid}'\"  state=\"1\" ondblclick=\"showlist('{gid}');\">"
                    + "<td>{gid}</td>"
                    + "<td style=\"text-align:left;\">"
                    + "{icon}"
                    + "</td>"
                    + "<td>{describe}</td>"
                    + "<td>{reg}</td>"
                    + "<td>{defalut}</td>"
                    + "<td>{usernum}</td>"
                    + "<td>{oper}"
                    + "</td></tr>";
        function getGroupList(obj, a, groupid) {
            var target = document.getElementById('foo');
            var spinner = new Spinner(opts).spin(target);
            $.ajax({
                type: "Post",
                url: "GroupManage.aspx",
                data: { want: a, gid: groupid },
                dataType: "json",//json
                success: function (data) {
                    spinner.stop();
                    if (!data) return;
                    for (var i = 0; i < data.length; i++) {
                        newTr = trCode.replace(/{gid}/g, data[i].GroupID);
                        newTr = newTr.replace(/{pid}/g, data[i].ParentGroupID);
                        newTr = newTr.replace(/{icon}/, data[i].icon);
                        newTr = newTr.replace(/{describe}/g, data[i].Description);
                        newTr = newTr.replace(/{reg}/, data[i].reg);
                        newTr = newTr.replace(/{defalut}/, data[i].isdef);
                        newTr = newTr.replace(/{usernum}/, data[i].usernum);
                        newTr = newTr.replace(/{oper}/, data[i].oper);
                        $(obj).after(newTr);
                    }
                },
                error: function (data) {
                    spinner.stop();
                    alert("自定错误" + data);
                }
            })
            obj.onclick = "";
        }
    </script>
</body>
</html>
