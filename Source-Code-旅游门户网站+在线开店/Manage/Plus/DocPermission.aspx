<%@ page language="C#" autoeventwireup="true" inherits="DocPermission, App_Web_ka5t45ft" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>权限管理</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <link href="/App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
    <script src="../../JS/jquery.js"></script>
    <script type="text/javascript">
        function Modify(id) {
            location.href = "Permissionadd.aspx?menu=edit&id=" + id;
        }

        function closes() {
            document.getElementById("model_main").style.display = "none";
        }
        function blocks() {
            document.getElementById("model_main").style.display = "";
        }
    </script>
    <style type="text/css">
        .spclass {
            margin-left: 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="r_navigation">后台管理&gt;&gt; 文件工厂&gt;&gt;<a href="DocPermission.aspx">权限管理</a>
            &nbsp;&nbsp;<a href="javascript:blocks()" style="color: red;">[添加用户组]</a></div>
        <div id="model_main" style="display: none">
            <div id="modelGroup">
                <div class="Group_tit"><span><a href="JavaScript:void(0)" onclick="closes()">关闭</a></span><strong>添加用户组</strong></div>
                <div class="Group_c">
                    组名称：<asp:TextBox ID="groupName" runat="server" CssClass="i_input" />
                    <asp:Button ID="GroupBtn" runat="server" CssClass="i_bottom" OnClick="GroupBtn_Click" Text="添加" 
                        Width="40"  OnClientClick="setTimeout(function () { document.getElementById('groupName').disabled = true;},50)" />
                    <br /><br />
                    <span class="spclass">能看别人文章：</span><input type="checkbox" value="OnlyMe" name="cg" />
                    <span class="spclass">新建：</span><input type="checkbox" checked="checked" value="CreateAble" name="cg" />
                    <span class="spclass">修改：</span><input type="checkbox" checked="checked" value="UpdateAble" name="cg" />
                    <span class="spclass">删除：</span><input type="checkbox" value="DeleteAble" name="cg" />
                </div>
            </div>
        </div>
        <table class="border" cellspacing="1" cellpadding="0" width="100%" border="0" align="center">
            <tr class="gridtitle" align="center" style="height: 25px;">
                <td height="26" colspan="8"><strong>角色管理</strong></td>
            </tr>
            <tr class="tdbgleft">
                <td style="width: 3%; height: 24px; text-align: center"><strong>ID</strong></td>
                <td style="width: 10%; height: 24px; text-align: center"><strong>用户组</strong></td>
                <td style="width: 5%; height: 24px; text-align: center"><strong>能看别人文章</strong></td>
                <td style="width: 5%; height: 24px; text-align: center"><strong>新建</strong></td>
                <td style="width: 5%; height: 24px; text-align: center"><strong>修改</strong></td>
                <td style="width: 5%; height: 24px; text-align: center"><strong>删除</strong></td>
                <td style="width: 20%; height: 24px; text-align: center"><strong>操作</strong></td>
                <td style="width: 20%; height: 24px; text-align: center"><strong>备注</strong></td>
            </tr>
            <asp:Repeater ID="Pagetable" runat="server" OnItemCommand="Pagetable_ItemCommand" OnItemDataBound="Pagetable_ItemDataBound">
                <ItemTemplate>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="cursor: pointer;" title="双击修改">
                        <td style="height: 24px; text-align: center;"><%#Eval("ID") %>
                            <asp:HiddenField runat="server" ID="dataKey" Value='<%#Eval("ID") %>' />
                        </td>
                        <td style="height: 24px; text-align: center;">
                            <asp:Label ID="GName" runat="server" Text='<%#Eval("GroupName") %>' />
                            <asp:TextBox ID="EditName" runat="server" Text='<%#Eval("GroupName") %>' Visible="false" /></td>
                        <td style="height: 24px; text-align: center;"><%#getIsAble(Eval("OnlyMe").ToString())%>
                            <%#getIsAble2(Eval("OnlyMe").ToString(),Eval("ID").ToString(),0)%></td>
                        <td style="height: 24px; text-align: center;"><%#getIsAble(Eval("CreateAble").ToString())%>
                            <%#getIsAble2(Eval("CreateAble").ToString(),Eval("ID").ToString(),1)%></td>
                        <td style="height: 24px; text-align: center;"><%#getIsAble(Eval("UpdateAble").ToString())%>
                            <%#getIsAble2(Eval("UpdateAble").ToString(),Eval("ID").ToString(),2)%></td>
                        <td style="height: 24px; text-align: center;"><%#getIsAble(Eval("DeleteAble").ToString())%>
                            <%#getIsAble2(Eval("DeleteAble").ToString(),Eval("ID").ToString(),3)%></td>
                        <td style="height: 24px; text-align: center;">
                            <asp:LinkButton ID="Assign" CommandName="Assign" CommandArgument='<%#Eval("ID") %>' Text="分配权限|"
                                OnClientClick="location=location.toString().split('?')[0];" runat="server" />
                            <asp:LinkButton CommandName="ViewUsers" CommandArgument='<%#Eval("ID") %>' Text="查看用户|"
                                OnClientClick="location=location.toString().split('?')[0];" runat="server" />
                            <asp:LinkButton ID="Edit" CommandName="Edit" CommandArgument='<%#Eval("ID") %>' Text="修改|" runat="server" />
                            <asp:LinkButton ID="Save" CommandName="Save" CommandArgument='<%#Eval("ID") %>' Text="保存|" runat="Server" Visible="False" />
                            <asp:LinkButton CommandName="Del" CommandArgument='<%#Eval("ID") %>'
                                Text="删除" runat="server" OnClientClick="return confirm('你确定要删除该组吗!');" />
                        </td>
                        <td style="height: 24px; text-align: center;"><%#Eval("Remind")%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td class="tdbgleft" colspan="8" align="center">共
                    <asp:Label ID="Allnum" runat="server" Text="" />条信息
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />/
                    <asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged" Width="30px" />条信息/页  转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>页 
                </td>
            </tr>
        </table>
        <div style="display: none;">
            <input type="button" id="openEdit" value="修改权限" onclick="openEditPre('per_ck')" />
            <asp:Button ID="savePer" Text="保存修改" runat="server" OnClick="savePer_Click" />
        </div>
        <div id="egvDiv">
            <asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False" CssClass="border"
                DataKeyNames="UserID" Width="100%" AllowSorting="true" GridLines="None"
                RowStyle-CssClass="tdbg" CellPadding="2" CellSpacing="1">
                <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
                <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <input type="checkbox" name="Btchk" value="<%#Eval("UserID")%>" />
                        </ItemTemplate>
                        <HeaderStyle Width="3%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserID" HeaderText="ID" SortExpression="UserID" HeaderStyle-Width="3%">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="会员名">
                        <ItemTemplate>
                            <a href="UserInfo.aspx?id=<%# Eval("UserID") %>">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label></a>
                        </ItemTemplate>
                        <HeaderStyle Width="8%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="所属权限组">
                        <ItemTemplate>
                            <%#getOwnGroupName(Eval("OwnGroupID","{0}")) %>
                        </ItemTemplate>
                        <HeaderStyle Width="8%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="RegTime" HeaderText="注册时间" DataFormatString="{0:yyyy-MM-dd}">
                        <HeaderStyle Width="10%" />
                        <ItemStyle HorizontalAlign="Center" CssClass="tdbg" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate><%# GetStatus(Eval("Status","{0}")) %> </ItemTemplate>
                        <HeaderStyle Width="7%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle CssClass="title" Font-Bold="True" BorderStyle="None" Height="30px" Font-Overline="False" />
            </asp:GridView>
            <table class="border" cellspacing="1" cellpadding="0" width="100%" border="0" align="center">
                <tr class="tdbg">
                    <td class="tdbgleft">
                        <input type="checkbox" onclick="allSelect('Btchk', this);" style="margin-left: 20px;" id="all" />
                        <label for="all" style="margin-left: 3px;">全选</label>
                        <asp:Button ID="MoveGroup" Text="确定" OnClick="MoveUserGroup_Click" runat="server" CssClass="C_input" />
                    </td>
                    <td class="tdbgleft" colspan="7" align="center">共
                        <asp:Label ID="Allnum2" runat="server" />条信息
                        <asp:Label ID="Toppage2" runat="server" />
                        <asp:Label ID="Nextpage2" runat="server" />
                        <asp:Label ID="Downpage2" runat="server" />
                        <asp:Label ID="Endpage2" runat="server" />页次：
                        <asp:Label ID="Nowpage2" runat="server" />/
                        <asp:Label ID="PageSize2" runat="server" />页
                        <asp:TextBox ID="txtPage2" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged" Width="30px" />条信息/页  转到第
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" />页 
                    </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="SelectedGroupID" runat="server" />
        <script type="text/javascript">
            function openEditPre(name) {
                var ckArrary = document.getElementsByName(name);
                for (i = 0; i < ckArrary.length; i++) {
                    ckArrary[i].style.display = '';
                }
            }

            function allSelect(name, obj) {
                var arr = document.getElementsByName(name);
                for (b = 0; b < arr.length; b++) {
                    arr[b].checked = obj.checked;
                }
            }
        </script>
    </form>
</body>
</html>
