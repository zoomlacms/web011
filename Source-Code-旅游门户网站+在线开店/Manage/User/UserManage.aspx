<%@ page language="C#" autoeventwireup="true" inherits="Manage_User_UserManage2, App_Web_evybsxrg" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会员管理</title>
    <link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/main.css" />
    <link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/index.css" />
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>  
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        #showsearch{display:block; float:right; margin-top:4px; margin-right:5px; width:16px; height:16px;}
        #showsearch:hover{cursor:pointer;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="nav_box">
            <div class="r_navigation">
                <%if (GetOpenHelp.IsopenHelp() == "1")
                  { %>
                <div id="help"><a onclick="help_show('37')" title="帮助"></a></div>
                <%} %>
                <a id="showsearch" title="显示扩展搜索" onclick="displayToolbar()">
                    <img src="/App_Themes/AdminDefaultTheme/images/exten.gif" alt="" /></a>
                后台管理 &gt;&gt; <a href="AdminManage.aspx">用户管理</a> &gt;&gt;<a href="UserManage.aspx">会员管理</a><asp:Label ID="LblGroup" runat="server" Text=""></asp:Label><span class="red">[<asp:Label ID="lblAddUser" runat="server" Text=""></asp:Label>]</span>
            </div>
        </div>
        <div style="height: 27px;"></div>
        <div class="border" style="display:none">
<ul>
    <li class="tdbg">
    <div style="display:none"> 选择等级：
        <asp:DropDownList ID="SelectGroup" runat="server" DataValueField="GroupID" DataTextField="OtherName"  CssClass="x_input"> </asp:DropDownList>
        <asp:Button ID="Rank" runat="server" Text="设置等级" CssClass="C_input"  onclick="Rank_Click" />
    </div>
    </li>
</ul>
</div>
<div id="search" style="display:none;">
    <table cellpadding="2" cellspacing="1" class="border" style="background-color: white;" width="100%">
        <tr class="tdbgleft" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td>
                <div style="float:left;">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="text">
                <asp:ListItem Value="1" Selected="True">按会员组查找</asp:ListItem>
                <asp:ListItem Value="2">按登陆日期查找</asp:ListItem>
            </asp:DropDownList>
            <strong id="strtime" runat="server" visible="false">
            <asp:TextBox ID="sTime_T" runat="server" Width="102px" onclick="calendar()" class="l_input"></asp:TextBox>
            到
            <asp:TextBox ID="eTime_T" runat="server" Width="102px" onclick="calendar()" class="l_input"></asp:TextBox>
            </strong> <strong id="strgroup" runat="server" visible="true">
            <asp:DropDownList ID="ddlGroup" runat="server" DataTextField="GroupName" DataValueField="GroupID" CssClass="x_input"> </asp:DropDownList>
            </strong>
            <asp:LinkButton ID="Button1" runat="server" Text="查  找" OnClick="Button1_Click1"  Width="35px" class="C_input"  />
            &nbsp;</div>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="x_input">
                    <asp:ListItem Selected="True" Value="UserName">会员名</asp:ListItem>
                    <asp:ListItem Value="UserID">ID</asp:ListItem>
                    <asp:ListItem Value="Email">Email</asp:ListItem>
                </asp:DropDownList>
                <table cellpadding="2" border="0" cellspacing="1" style="background:#fff; float:left;margin-left:5px;margin-right:5px;" class="l_input"><tr ><td>
            <asp:TextBox ID="IDName" runat="server" Width="150px"  BorderColor="#fff" CssClass="l_inpnon"></asp:TextBox>
            <asp:Button ID="Button2" runat="server"  class="C_sch"  OnClick="Button2_Click" />
                </td></tr></table>
                <asp:DropDownList ID="ProvinceDP" runat="server"  CssClass="x_input" AutoPostBack="true"> </asp:DropDownList>
            </td>
        </tr>
    </table>
</div>
  <div class="clearbox"></div>
    <div>
        <ZL:ExGridView runat="server" ID="EGV" DataKeyNames="UserID" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false" EmptyDataText="无用户信息!!"
            Width="100%" GridLines="None" RowStyle-CssClass="tdbg" CellPadding="2" CellSpacing="1"
            OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" OnSorting="EGV_Sorting">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="Btchk" id="Btchk" runat="server" value='<%#Eval("UserID") %>' />
                    </ItemTemplate>
                    <HeaderStyle Width="3%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserID" HeaderText="ID" SortExpression="UserID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="会员名">
                    <ItemTemplate>
                        <a href="UserInfo.aspx?id=<%# Eval("UserID") %>"><%# Eval("UserName","{0}") %></a>
                    </ItemTemplate>
                    <HeaderStyle />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="WorkNum" HeaderText="工号" SortExpression="WorkNum">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="会员组">
                    <ItemTemplate>
                        <a href="UserManage.aspx?GroupID=<%#Eval("GroupID","{0}") %>">
                        <%# GetGroupName(Eval("GroupID","{0}")) %></a> </ItemTemplate>
                    <HeaderStyle Width="8%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="Purse" HeaderText="资金余额" DataFormatString="{0:F2}">
                    <HeaderStyle Width="80" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="RegTime" HeaderText="注册时间" SortExpression="RegTime" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="80" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="UserExp" HeaderText="积分">
                    <HeaderStyle Width="40" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="LoginTimes" HeaderText="登录次数" SortExpression="LoginTimes">
                    <HeaderStyle Width="7%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="LastLockTime" HeaderText="最后登录时间" SortExpression="LastLockTime">
                    <HeaderStyle Width="12%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate><%# GetStatus(Eval("Status","{0}")) %> </ItemTemplate>
                    <HeaderStyle Width="7%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="聚合认证">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Visible="false" Text='<%# GetState(Eval("State", "{0}"))%>'></asp:Label>
                        <%# GetState(Eval("State", "{0}"))%>
                    </ItemTemplate>
                    <HeaderStyle Width="8%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate><a href='UserSitePermission.aspx?uid=<%# Eval("UserID")%>'>权限</a><a href='UserConfirm.aspx?uid=<%#Eval("UserID") %>&IsConfirm=<%#Eval("IsConfirm") %>'><%# GetConfirm(Eval("GroupID").ToString())%></a>|<a href="javascript:void(0)" onclick="javascript:window.open('../../Space/Default.aspx?id=<%# Eval("UserID")%>')"><%=Getspacename() %></a> | <a href='CertificateAuditInfo.aspx?UserID=<%# Eval("UserID")%>'>证件</a></ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" CssClass="tdbg" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
        <div style="height:10px;"></div>
        <asp:DropDownList ID="UserGroup_DP" runat="server" DataValueField="GroupID" DataTextField="GroupName" AutoPostBack="true" OnSelectedIndexChanged="UserGroup_DP_SelectedIndexChanged"></asp:DropDownList>
        <asp:Button ID="GroupMove" runat="server" Text="批量移动" OnClick="GroupMove_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="C_input" />
        <asp:Button ID="Enable" runat="server" Text="启用" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="C_input" OnClick="btnCan_Click" />
        <asp:Button ID="Disable" runat="server" Text="禁用" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="C_input" OnClick="btnLock_Click" />
        <asp:Button ID="RenoVate" runat="server" Text="刷新用户" CssClass="C_input" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" OnClick="RenoVate_Click" />
        <asp:Button ID="Approve" runat="server" Text="认证用户" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="C_input" OnClick="Approve_Click" />
        <asp:Button ID="ApproveFailure" runat="server" Text="取消认证" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="C_input" OnClick="ApproveFailure_Click" />
        <asp:Button ID="btnLock" runat="server" Text="批量锁定" OnClick="btnLock_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="C_input" />
        <asp:Button ID="btnDel" runat="server" Text="批量删除" OnClick="btnDel_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" class="C_input" />
        <asp:Button ID="btnNormal" runat="server" Text="批量解锁" OnClick="btnNormal_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="C_input" />
        <asp:Button ID="Export" runat="server" Text="Excel导出" CssClass="C_input" OnClick="Export_Click" />
        <input class="C_input" type="button" onclick="inputuserinfo()" value="Excel导入" />
        <asp:HiddenField ID="HdnGroupID" runat="server" />
        <asp:HiddenField ID="Search_Hid" runat="server"/>
        <script type="text/javascript">
            function inputuserinfo() {//Excel导入
                var diag = new Dialog();
                diag.Width = 800;
                diag.Height = 600;
                diag.Title = "导入会员[ESC键退出当前操作]";
                diag.URL = "InputUser.aspx";
                diag.show();
            }
            function CheckAll(obj) {
                $("#EGV tr").find("input[type=checkbox]").each(function () { this.checked = obj.checked; });
            }
            function IsSelectedId() {
                var chkArr = $("#EGV").find("input[type=checkbox]:checked");
                if (chkArr.length > 0)
                    return true;
                else
                    return false;
            }
            function displayToolbar() {
                var dr = document.getElementById("search");
                if (dr.style.display == "none") {
                    dr.style.display = "block";
                    $("#Search_Hid").val("1");
                }
                else {
                    $("#Search_Hid").val("0");
                    dr.style.display = "none";
                }
            }
            function open_title() {
                var diag = new Dialog();
                diag.Width = 800;
                diag.Height = 600;
                diag.Title = "添加会员[ESC键退出当前操作]";
                diag.URL = "AddUser.aspx";
                diag.show();
            }
            $().ready(function () {
                var searchFlag = $("#Search_Hid").val();
                if (searchFlag && searchFlag == "1")
                {
                    displayToolbar();
                }
                $("#EGV tr th:eq(0)").html("<input type='checkbox' name='cbAll' onclick='CheckAll(this);' />");
            });
        </script>
    </form>
</body>
</html>
