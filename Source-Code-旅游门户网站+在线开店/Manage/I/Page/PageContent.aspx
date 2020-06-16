<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Page.PageContent, App_Web_0fbyacen" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>内容管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <span class="pull-left">
                    <%=lang.LF("排序") %>：
                    <asp:DropDownList ID="txtbyfilde" CssClass="form-control" Width="150" runat="server" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="txtbyOrder" runat="server" CssClass="form-control" Width="150" OnSelectedIndexChanged="txtbyOrder_SelectedIndexChanged">
                    </asp:DropDownList>
                </span>
                <span class="pull-left">
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150" runat="server">
                        <asp:ListItem Value="0" Selected="True">标题</asp:ListItem>
                        <asp:ListItem Value="1">ID</asp:ListItem>
                        <asp:ListItem Value="2">录入者检索</asp:ListItem>
                    </asp:DropDownList>
                </span>
                <span style="display:none;" class="pull-left"><%=lang.LF("按发布者地区筛选")%>： 
                    <select runat="server" id="selprovince" class="form-control" style="width:150px;" name="selprovince" onchange="javascript:area()"></select>
                    <asp:DropDownList ID="selcity" runat="server" CssClass="form-control" Width="150" AutoPostBack="true" OnSelectedIndexChanged="selcity_SelectedIndexChanged">
                    </asp:DropDownList>
                </span>
                <div>
                    <div class="input-group">
                        <asp:TextBox runat="server" ID="TextBox1" class="form-control" placeholder="请输入需要搜索的内容" />
                        <span class="input-group-btn" style="width:auto;">
                            <asp:LinkButton runat="server" CssClass="btn btn-default" ID="Button4" OnClick="Button4_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                        </span>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <ul class="nav nav-tabs" id="navul">
            <li class="active"><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"]+"&li=0" %>">内容列表</a></li>
            <li><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&flag=Audit&li=1">已审核内容</a></li>
            <li><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&flag=UnAudit&li=2">未审核内容</a></li>
            <li><a href="PageContent.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&flag=Elite&li=3">推荐内容</a></li>
    </ul>
    <div class="user_t">
        <ZL:ExGridView runat="server" ID="EGV" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="GeneralID" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" AllowSorting="True"
            CssClass="table table-striped table-bordered table-hover" IsHoldState="false">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <input type="checkbox" name="chkSel" title="" value='<%#Eval("GeneralID") %>' />
                    </ItemTemplate>
                    <HeaderStyle Width="4%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="GeneralID">
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                        <%# GetTitle(Eval("GeneralID", "{0}"), Eval("ModelID", "{0}"), Eval("Title", "{0}"))%>
                    </ItemTemplate>
                    <HeaderStyle Width="40%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="点击数" DataField="Hits">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status", "{0}")) %>
                    </ItemTemplate>
                    <HeaderStyle Width="10%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="已生成">
                    <ItemTemplate>
                        <%# GetCteate(Eval("IsCreate", "{0}"))%>
                    </ItemTemplate>
                    <HeaderStyle Width="10%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>'>修改</asp:LinkButton>
                        | 
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据删除到回收站吗？')">删除</asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="审核通过" OnClick="btnAudit_Click" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要审核选中内容吗？')}" />
    <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" OnClick="Button3_Click" Text="取消审核" OnClientClick="if(!IsSelectedId()){alert('请选择取消审核项');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" />
    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click"
        OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项放入回收站吗？')}" UseSubmitBehavior="true" />&nbsp;
    <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/ajaxrequest.js"></script>
    <script type="text/javascript" src="/JS/PassStrong.js"></script>
    <script type="text/javascript">
        function SetLI()
        {
            var id = '<%=Request.QueryString["li"]%>';
            $("#navul").children("li").removeClass("active");
            $("#navul").children("li:eq(" + id + ")").addClass("active");
            console.log(id);
        }
        $().ready(function () {
            $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
            SetLI();
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>

</asp:Content>
