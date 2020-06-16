<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Message, App_Web_mqugmdc1" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>收件箱</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="Message.aspx">消息中心</a></li>
        <li class="active">收件箱</li>
    </ol>
    <div class="btn-group">
        <a href="MessageSend.aspx" class="btn btn-primary">新消息</a>
        <a href="Message.aspx" class="btn btn-primary">收件箱</a>
        <a href="MessageOutbox.aspx" class="btn btn-primary">发件箱</a>
        <a href="MessageDraftbox.aspx" class="btn btn-primary">草稿箱</a>
        <a href="MessageGarbagebox.aspx" class="btn btn-primary">垃圾箱</a>
        <a href="Mobile.aspx" class="btn btn-primary">手机短信</a>
    </div>
    <div class="us_seta" style="margin-top:10px;">
        <div class="us_pynews">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" Width="100%" DataKeyNames="MsgID" OnRowCommand="Row_Command" CssClass="table table-bordered table-hover table-striped" EmptyDataText="无相关信息！">
                <Columns>
                    <asp:TemplateField HeaderText="选择" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
                        <ItemTemplate>
                            <asp:CheckBox ID="cheCk" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="5%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="主题">
                        <HeaderStyle Width="40%" />
                        <ItemTemplate><%# Eval("Title", "{0}")%>（<%#getStatus(Eval("ReadUser","{0}"))%>)</ItemTemplate>
                        <ItemStyle HorizontalAlign="left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="发件人">
                        <ItemTemplate>
                            <%# GetUserName(Eval("Sender","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PostDate" HeaderText="发送日期" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
                        <HeaderStyle Width="20%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此信息到垃圾箱吗？');" CommandArgument='<%# Eval("MsgID")%>' Text="删除"></asp:LinkButton>
                            <asp:LinkButton ID="lbRead" runat="server" CommandName="ReadMsg" CommandArgument='<%# Eval("MsgID")%>'><%#getMess(Eval("ReadUser","{0}"))%></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="20%"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
                    NextPageText="下一页" PreviousPageText="上一页" />
            </asp:GridView>
            <div class="text-center">
                共
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条信息
                        <asp:Label ID="Toppage" runat="server" Text="" />
                <asp:Label ID="Nextpage" runat="server" Text="" />
                <asp:Label ID="Downpage" runat="server" Text="" />
                <asp:Label ID="Endpage" runat="server" Text="" />
                页次：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 <span style="text-align: center">
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" Height="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        </span>条信息/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                页
            </div>
            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
                Text="全选" />
            <asp:Button ID="Button1" runat="server" class="btn btn-primary" Font-Size="9pt" Text="取消"
                OnClick="Button1_Click" />
            <asp:Button ID="Button2" class="btn btn-primary" runat="server" Font-Size="9pt" Text="批量删除"
                OnClick="Button2_Click" />
        </div>
    </div>
</asp:Content>
