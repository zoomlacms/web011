<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_SpecList, App_Web_pyrhy5wd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>专题列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="nonspc" class="divbox" style="display: none" runat="server"><font color="red">暂时没有专题</font></div>
    <div id="spclist" runat="server">
        <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" DataKeyNames="SpecID" PageSize="10" AllowPaging="true" OnPageIndexChanging="GV_PageIndexChanging" OnRowEditing="Egv_RowEditing" OnRowDeleting="GV_RowDeleting" OnRowCommand="Lnk_Click" Width="100%" CssClass="table table-striped table-bordered table-hover"  GridLines="None" CellPadding="2" CellSpacing="1">
            <Columns>
                <asp:BoundField DataField="SpecID" HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="6%" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="SpecName" HeaderText="专题名称" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="20%" />

                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="SpecDir" HeaderText="专题目录" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="10%" />

                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="打开方式" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                    <ItemTemplate>
                        <%# GetOpenType(DataBinder.Eval(Container, "DataItem.OpenType", "{0}"))%>
                    </ItemTemplate>

                    <HeaderStyle Width="10%"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="SpecDesc" HeaderText="专题描述" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle Width="30%" />

                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href='/Special_<%# Eval("SpecID")%>/Default.aspx' target="_blank">前台浏览</a>

                        |
				<asp:LinkButton ID="LnkModify" CommandName="Modify" CommandArgument='<%# Eval("SpecID")%>' runat="server">修改</asp:LinkButton>
                        |
				<asp:LinkButton ID="LnkDelete" runat="server" CommandName="Del" OnClientClick="if(!this.disabled) return confirm('确实要删除此专题吗？');" CommandArgument='<%# Eval("SpecID")%>'>删除</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div style="text-align: center" class="tdbg">
            <span style="text-align: center">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />
                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Height="24" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </span>
        </div>
    </div>
    <style>
        th{ text-align:center;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>