<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_Arrive_ArriveManage, App_Web_15zmdlk5" enableviewstate="true" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>优惠劵管理</title>
<link href="../../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/jquery.js"></script>
<script type="text/javascript">
    function ShowTabs(Type)
    {
        var dt = Type;
        if (Type == 2) {
            location.href = 'ArriveManage.aspx'          
        }
        else
        {
            location.href = 'ArriveManage.aspx?type=' + Type;
        }      
    }
    function change(id)
    {       
        location.href = 'AddArrive.aspx?menu=update&id=' + id;
    }
</script>
<style type="text/css">
    .Arrive_c td{ width:80px; height:24px; line-height:24px; background:url(/App_Themes/AdminDefaultTheme/images/titlebg2.gif) left no-repeat;}
    .Arrive_c #cur<%=Request.QueryString["type"] %>{ background:url(/App_Themes/AdminDefaultTheme/images/titlebg1.gif) left no-repeat; color:#fff;}
    .Arrive_c td:hover{ cursor:pointer;}
.table{background-color:white; border:0px; border-color:#fff;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理 &gt;&gt; 商城管理 &gt;&gt; 优惠劵管理 <a href="AddArrive.aspx?menu=add" style="color:red;">[新增优惠劵]</a></div>
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
    <tr class="tdbg" width="70%" align="left">
    <td>优惠劵名称:<asp:TextBox ID="txtName" runat="server" class="l_input"></asp:TextBox>&nbsp;&nbsp;
    生成时间(有效时间)<asp:TextBox ID="txtCreateTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" class="l_input"></asp:TextBox>&nbsp;&nbsp;
    &nbsp;&nbsp;过期时间<asp:TextBox ID="txtEndTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" class="l_input"></asp:TextBox>
    <asp:Button ID="btnName" runat="server" Text="搜索" class="C_input" onclick="btnName_Click" />
    <asp:Button ID="Button1" runat="server" Text="清空" class="C_input" onclick="Button1_Click"/></td>
    </tr>
</table>
    <div class="clearbox"></div>
    <table  class="Arrive_c" border="0" cellpadding="0" cellspacing="0" >
        <tr align="center">
            <td onclick="ShowTabs(2)" id="cur" >全部</td>
            <td onclick="ShowTabs(0)" id="cur0">现金卡</td>
            <td onclick="ShowTabs(1)" id="cur1">银币卡</td>
        </tr>
    </table>
<div class="divbox" id="nocontent" runat="server" style="display: none">
    暂无优惠劵信息</div>

<div>
    <ZL:ExGridView ID="gvCard" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" RowStyle-CssClass="tdbg" 
                    EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%"  EmptyDataText="当前无数据"
        OnRowCommand="gvCard_RowCommand" OnRowDataBound="gvCard_RowDataBound" OnPageIndexChanging="EGV_PageIndexChanging" CssClass="border">
        <Columns>
            <asp:TemplateField HeaderText="ID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <input type="checkbox" name="chk" value="<%# Eval("ID") %>" style="float:left;margin-left:20%;"/>
                    <asp:Label ID="Id" runat="server" Text='<%# Eval("ID") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="卡别名" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                  <%# Eval("ArriveName") %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编号" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%#Eval("ArriveNO") %>' />
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="密码" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblPwd" runat="server" Text='<%#Eval("ArrivePwd") %>' />
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="金额" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>' />
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属用户" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblUser" runat="server"></asp:Label>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="生效时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblAginTime" runat="server" Text='<%# Eval("AgainTime","{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="到期时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblEndTime" runat="server" Text='<%#Eval("EndTime","{0:yyyy-MM-dd}") %>'></asp:Label>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="使用时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblUseTime" runat="server" Text='<%#GetUseTime(Eval("UseTime","{0}")) %>'></asp:Label>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblState" runat="server"></asp:Label>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <asp:Label ID="lblType" runat="server"></asp:Label>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <a id="abc" href='<%#Gethref(Eval("ID","{0}")) %>'>修改</a>
                    <a id="a1" href='<%#del(Eval("ID","{0}")) %>'>删除</a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
    <asp:Button runat="server" ID="batActive" OnClick="batActive_Click" Text="批量激活" CssClass="C_input"/>
    <asp:Button runat="server" ID="batBtn" OnClick="BtnDelete_Click" Text="批量删除" CssClass="C_input" OnClientClick="return confirm('确定要删除选中吗');" style="margin-left:20px;"/>
    <script type="text/javascript">
        $().ready(function () {
            $("#<%=gvCard.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll' style='margin-left:20%;float:left;'/>ID");//EGV顶部
            $("#chkAll").click(function () {//EGV 全选
                selectAll(this, "chk");
            });
            $("table tr").mousemove(function () { this.className = 'tdbgmouseover'; }).mouseout(function () { this.className = 'tdbg'; });
        });

        function selectAll(obj, name) {
            var allInput = document.getElementsByName(name);
            var loopTime = allInput.length;
            for (i = 0; i < loopTime; i++) {
                if (allInput[i].type == "checkbox") {
                    allInput[i].checked = obj.checked;
                }
            }
        }
    </script>
</div>
</form>
</body>
</html>