<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_FakeCode, App_Web_gf0bki5t" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>防伪码验证</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/User/Info/UserInfo.aspx">账户管理</a></li>
        <li class="active">防伪验证<a href="/Scha.aspx">[前置查询]</a></li>
    </ol>
    <div class="us_topinfo">
        <span style="float:left;line-height:32px;">请输入防伪码:</span><asp:TextBox ID="FakeCode" CssClass="form-control pull-left" runat="server" onkeyup="value=value.replace(/[^\d\.]/g,'')"></asp:TextBox>
        <asp:Button ID="Sub" runat="server" Text="提交验证" OnClick="sub_Click" class="btn btn-primary pull-left" />
        <asp:Label ID="Remind" CssClass="tips" runat="server" Text="" Style="color: red; font-size: 15px;"></asp:Label>
    </div>
    <br />
    <label style="float:left;line-height:32px;">从</label>
    <asp:TextBox ID="startDate" CssClass="form-control pull-left" runat="server" onclick="WdatePicker();"></asp:TextBox>
    <label style="float:left;line-height:32px;">至</label>
    <asp:TextBox ID="endDate" CssClass="form-control pull-left" runat="server" onclick="WdatePicker();"></asp:TextBox>
    <asp:Button ID="Search" runat="server" Text="查询" OnClick="Search_Click" OnClientClick="return checkIsEmpty()" class="btn btn-primary pull-left" />
    <script type="text/javascript">
        function checkIsEmpty()//日期为空不上传
        {
            flag = true;
            if (document.getElementById("endDate").value == "")
                flag = false;
            else if (document.getElementById("startDate").value == "")
                flag = false;
            return flag;
        }
    </script>
    <asp:Label runat="server" ID="topInfo"></asp:Label>
    <asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False" border="0" CellSpacing="1" AllowSorting="False" EnableTheming="False" Width="100%" HeaderStyle-Height="28px" CssClass="table table-striped table-bordered table-hover" EnableModelValidation="True" BorderColor="White" BorderStyle="Solid">
        <HeaderStyle Height="28px"></HeaderStyle>
        <RowStyle Height="35px"></RowStyle>
        <Columns>
            <asp:TemplateField HeaderText="防伪码" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="30%">
                <ItemTemplate><%#Eval("Remark") %>  </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="分值" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="20%">
                <ItemTemplate><%#Eval("score") %>   </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="验证成功时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="30%">
                <ItemTemplate><%# DataBinder.Eval(Container.DataItem, "HisTime", "{0:yyyy年M月d日 HH:mm:ss}")%>  </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%"></ItemStyle>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <table id="Conten" runat="server" width="100%" border="0" cellpadding="2" cellspacing="1" style="margin: 0 auto;">
        <tr class="bottom" align="center">
            <td>共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />
                /
            <asp:Label ID="PageSize" runat="server" Text="" />
                页
            <asp:TextBox ID="txtPage" runat="server" class="l_input" Width="16px" Height="16px" OnTextChanged="txtPage_TextChanged" ReadOnly="true"></asp:TextBox>
                条数据/页 </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
</asp:Content>