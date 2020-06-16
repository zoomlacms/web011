<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ContentRecycle, App_Web_zxhe1krl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("内容回收站")%></title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
<script type="text/javascript">
    function opentitle(url, title) {
        var dt = <%=ViewState["NodeID"]%>;
        switch (dt)
        {
            case 0:
                alert("此节点为根节点,无法配置");
                break;
            default:
                var diag = new Dialog();
                diag.Width = 800;
                diag.Height = 600;
                diag.Title = title;
                diag.URL = url;
                diag.show();
                break;
        }
    }
    function editnode(NodeID) {
        var dt = <%=ViewState["NodeID"]%>;
        switch(dt)
        {
            case 0:
                window.open("/");
                break;
            default:
                var answer = confirm("该栏目未绑定模板，是否立即绑定");
                if (answer == false) {
                    return false;
                }
                else {
                    open_page(NodeID, "EditNode.aspx?NodeID=");
                }
                break;
        }
    }
    function open_page(NodeID, strURL) {
        var diag = new Dialog();
        diag.Width = 800;
        diag.Height = 600;
        diag.Title = "添加节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = strURL + NodeID;
        diag.show();
    }
</script>
<style type="text/css">
#Egv td, #Egv th {  border: 1px solid #fff;  width: auto;  padding-left: 10px; }
#viewtask { float:left;padding-top:4px;display:block; width:16px; height:16px; margin-right:5px;}
#helpshow {z-index:500;}
#browse{ float:left;padding-top:3px; padding-right:5px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="nav_box">
        <div class="r_navigation">
            <div id="help">
                <%if (GetOpenHelp.IsopenHelp() == "1")
              { %>
            <a onclick="help_show('93')" title="帮助"></a>
            <%} %>
            </div>
            <span style="float:right; padding-right:4px;">
                <a href="SchedTask.aspx" id="viewtask" title="查看计划任务"><img src="../../../Images/ModelIcon/taskview.gif" alt="" /></a>
                <%=GetOper()%>
                <a onclick="opentitle('EditNode.aspx?NodeID=<%=ViewState["NodeID"]%>','配置本节点')"
                href="javascript:void(0);" title="配置本节点">
                <%=lang.LF("配置本节点")%></a>
            </span><span><%=lang.LF("后台管理") %></span> &gt;&gt; <span><%=lang.LF("系统设置") %></span> &gt;&gt; <span><a href="ContentManage.aspx"><%=lang.LF("内容管理")%></a></span> &gt;&gt;<span><a href="ContentRecycle.aspx"><%=lang.LF("回收站")%></a></span>
        </div>
        </div>
        <div style="height:24px;"></div>
        <div class="clearbox">
        </div>
            <asp:GridView ID="Egv" CssClass="border" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="100" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%">
                <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
                <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSel" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="5%" />
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_CheckedChanged" ToolTip="全选" />
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GeneralID" HeaderText="ID">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="标题">
                        <HeaderStyle Width="50%" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="所属栏目">
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <%# GetNodeName(Eval("NodeID", "{0}")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="内容模型">
                        <HeaderStyle Width="10%" />
                        <ItemTemplate>
                            <%# GetModelName(Eval("ModelID", "{0}")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Inputer" HeaderText="输入人">
                        <HeaderStyle Width="10%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据彻底删除吗？')">删除</asp:LinkButton>
                            &nbsp;|&nbsp;
				<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Reset" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据还原吗？')">还原</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
                <PagerSettings Visible="false"/>
            </asp:GridView>
            <div id="divPager" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="tdbg">
                        <div style="text-align: center">
                            <span style="text-align: center">
                                <%=lang.LF("共")%>
                                <asp:Label ID="lblTotalCnts" runat="server" Text=""></asp:Label>
                                <%=lang.LF("条数据")%>&nbsp;&nbsp;
                                <asp:LinkButton ID="lbtnFirstPage" CommandName="First" OnClick="LbtnAlterPage_Click" runat="server">首页</asp:LinkButton> &nbsp;
                                <asp:LinkButton ID="lbtnPrePage" CommandName="Previous" OnClick="LbtnAlterPage_Click" runat="server">上一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lbtnNextPage" CommandName="Next" OnClick="LbtnAlterPage_Click" runat="server">下一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lbtnLastPage" CommandName="Last" OnClick="LbtnAlterPage_Click" runat="server">尾页</asp:LinkButton>&nbsp; &nbsp;
                                <%=lang.LF("页次")%>：
                        <asp:Label ID="lblCurntPageNum" runat="server"/>/
                        <asp:Label ID="lblPageCnts" runat="server"/>
                                <%=lang.LF("页")%>&nbsp; &nbsp;
                                <asp:Label ID="lblPages" runat="server" Text="" />
                                <%=lang.LF("每页显示：")%>
                                <asp:TextBox ID="txtPageSize" runat="server" AutoPostBack="true" class="l_input" Width="30px" ToolTip="所输入的数据小于100" OnTextChanged="txtPageSize_TextChanged"></asp:TextBox> 
                                <%=lang.LF("条数据")%> &nbsp; &nbsp;
                                <%=lang.LF("转到第")%>
                                <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%=lang.LF("页")%>
                               &nbsp; &nbsp; <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="txtPageSize" ErrorMessage="数据不合法！" Type="Integer" MaximumValue="100" MinimumValue="1"></asp:RangeValidator></span>
                        </div>
                    </td>
                </tr>
            </table>
                </div>
            <div class="clearbox" />        
        <div id="divBtns" runat="server">
        <asp:Button ID="btnRevert" Style="width: 110px;" class="C_input" runat="server" Text="还原选中内容" OnClick="btnRevert_Click" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定要还原所选中的内容? \n\t还原后请进入内容对信息进行审核！')}" />&nbsp;
        <asp:Button ID="btnRevertAll" Style="width: 110px;" class="C_input" runat="server" Text="还原所有内容" OnClientClick="return confirm('确定要还原所有内容?\n\t还原后请进入内容对信息进行审核！')" OnClick="btnRevertAll_Click" />
        &nbsp;
        <asp:Button ID="btnClear" Style="width: 110px;" class="C_input" runat="server" Text="清除选中内容" OnClick="btnClear_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('数据删除后不可恢复，确认要删除选中项？')}" UseSubmitBehavior="true" />&nbsp;
        <asp:Button ID="btnClearAll" Style="width: 110px;" class="C_input" runat="server" Text="清空回收站" OnClick="btnClearAll_Click" OnClientClick="return confirm('数据删除后不可恢复，确认清空？')" />
            </div>
    </form>
</body>
</html>
