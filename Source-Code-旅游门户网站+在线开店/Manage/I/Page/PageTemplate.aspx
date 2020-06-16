<%@ page language="C#" autoeventwireup="true" inherits="manage.Page.PageTemplate, App_Web_0fbyacen" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>栏目管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="addtree" runat="server" Visible="false"></asp:Label>
        <table  class="table table-striped table-bordered table-hover">
            <tbody id="Tbody1">
                <tr class="tdbg">
                    <td align="center" class="title" style="width: 10%"><span class="tdbgleft">栏目ID</span></td>
                    <td style="width:40%;" align="center" class="title"><span class="tdbgleft">栏目名称</span></td>
                    <td style="width: 10%" align="center" class="title"><span class="tdbgleft">启用状态</span></td>
                    <td style="width: 15%" align="center" class="title"><span class="tdbgleft">节点类型</span></td>
                    <td style="width: 25%" align="center" class="title"><span style="background-color: #e0f7e5">相关操作</span></td>
                </tr>
                <tr class="tdbg list0" name="list0" state="1" id="list0">
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
                        <a href="AddPageTemplate.aspx">添加节点</a> | <a href="javascript:SetIF(0);">节点排序</a>
                    </td>
                </tr>
                <asp:Repeater ID="Temptable" runat="server">
                    <ItemTemplate>
                        <tr class="tdbg list<%# Eval("ParentID") %>" name="list<%# Eval("ParentID") %>" state="1" id="list<%#Eval("templateID")%>" onclick="showlist('<%# Eval("templateID") %>')">
                            <td style="height: 24px" align="center"><%#Eval("templateID")%></td>
                            <td style="height: 24px" align="left">
                                <img src="/Images/TreeLineImages/t.gif" /><img alt="" src='<%# getnodesrc(Eval("templateID","{0}"))%>' />
                                <a href="AddPageTemplate.aspx?menu=edit&sid=<%#Eval("templateID") %>"><%#gettempname(Eval("templateID", "{0}"))%></a>
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
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>个
                    <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />/
                    <asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:Label ID="pagess" runat="server" Text="" />个/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>页
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Panel ID="updatetemplate" runat="server" Width="100%">
            <br />
            <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                <tr>
                    <td align="center" style="height: 24px">首页模板地址：
                    <asp:TextBox ID="templateUrl" CssClass="form-control" runat="server" Width="230px"></asp:TextBox>
                        <input type="button" value="选择模板" class="btn btn-primary" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('templateUrl') + '&FilesDir=', 650, 480)" />
                        <asp:Button ID="Button1" runat="server" Text="更新" CssClass="btn btn-primary" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 900px; margin: auto;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">黄页节点排序</h4>
                </div>
                <div class="modal-body">
                    <iframe id="oif" src="SetNodeOrder.aspx?ParentID=0" style="width: 100%; height: 500px;"></iframe>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    <button id="modBtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="display:none;"></button>
        <script>
            function SetIF(id)
            {
                var url = "SetNodeOrder.aspx?ParentID=" + id;
                $("#oif").attr("src", url);
                $("#modBtn").click();
            }
            $().ready(function () {
                for (i = 2; i <= $("tr").length - 1; i++) {
                    if ($("tr:nth-child(" + i + ")").attr("name") != "list0") {
                        $("tr:nth-child(" + i + ")").css("display", "none");
                    }
                }
            })
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
                    for (i = 1; i <= $("tr").length - 1; i++) {
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
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
</asp:Content>
