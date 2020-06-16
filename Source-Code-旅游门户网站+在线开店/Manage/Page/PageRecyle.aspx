<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Page.PageRecyle, App_Web_y1nkzetg" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

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
        <div class="clearbox"></div>
        <div class="user_t">
            <ZL:ExGridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                RowStyle-CssClass="tdbg" DataKeyNames="GeneralID" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" Width="100%" Height="20px" AllowSorting="True"
                CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EmptyDataText=""
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
                            <asp:LinkButton ID="Btn_Rec" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>'>修改</asp:LinkButton>
                            <asp:LinkButton ID="Btn_Del" runat="server" CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick="return confirm('你确定将该数据彻底删除吗？')">彻底删除</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle BorderColor="White" />
                        <ItemStyle HorizontalAlign="Center" BorderColor="White" />
                    </asp:TemplateField>
                </Columns>

                <PagerSettings Visible="False" />
                <RowStyle Height="24px" />
                <HeaderStyle Font-Bold="True" ForeColor="#E7E7FF" BackColor="#FFFFFF" Height="30px" Font-Overline="False" />
            </ZL:ExGridView>
        </div>
    <asp:Button ID="Bat_Rec" runat="server" Text="批量还原"  CssClass="C_input" OnClick="btnRecAll_Click" OnClientClick="if(!IsSelectedId()){alert('请选择还原项');return false;}else{return confirm('你确定要将所选中的项还原吗？')}"  UseSubmitBehavior="true" />
     <asp:Button ID="Bat_Del" Text="批量删除" runat="server"  CssClass="C_input" OnClick="Bat_Del_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所选中的项删除吗？')}"  />
    </form>
</body>
</html>