<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="manage_Shop_MtrlsMrktng, App_Web_k5dq03lr" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>节日提醒</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">推广返利</li>
    </ol>
    <div>
        <asp:GridView ID="gvCard" runat="server" AutoGenerateColumns="False"
            class="border" AllowSorting="true" CellPadding="2" CellSpacing="1" BackColor="White"
            ForeColor="Black" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" GridLines="None"
            Width="100%" RowStyle-CssClass='tdbg' HeaderStyle-Height="28px">
            <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="推广人" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbUserID" runat="server"><%#getUserNameById(ZoomLa.Common.DataConverter.CLng(Eval("UserID").ToString()))%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="总额" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblNum" runat="server" Text=""><%#Eval("Money")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="返利比例" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblgu" runat="server" Text=""><%#(Eval("Scale"))%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="返利金额" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text=""><%#Eval("BalanceMoney")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="tdbg" align="center">
        你的返利金额为:
    <asp:Label runat="server" ID="MoneyID" Text=""></asp:Label>
    </div>
    <div class="tdbg" align="center">
        <span></span><span style="text-align: center">共
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
    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" Height="24px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条数据/页 转到第
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
            页
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </span>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        function getinfo(id) {
            location.href = "Stock.aspx?menu=edit&id=" + id + "";
        }
    </script>
</asp:Content>
