<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Content_MyProduct, App_Web_lvsrob24" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的内容</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的内容</li>
    </ol>
    <div class="us_pynews">
        <div class="us_seta" style="margin-bottom:10px;">
            <asp:Label ID="lblAddContent" runat="server" Text="Label"></asp:Label>
            <a href="Myproduct.aspx?NodeID=<%=Request["NodeID"]%>&recycle=1">回收站</a>
        </div>
    </div>
    <div class="us_pynews">
        <div class="us_seta">
            <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="GeneralID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" CssClass="table table-striped table-bordered table-hover"
                OnRowCommand="Lnk_Click" Width="100%" CellPadding="4" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="选择">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSel" runat="server" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID">
                        <HeaderStyle Width="6%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="商品图片">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a href="ShowProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">
                                <%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名称">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a href="<%# GetUrl(Eval("ID", "{0}"))%>" target="_blank">
                                <%# Eval("Proname")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="单位">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# Eval("ProUnit")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="库存">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# Eval("stock")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="价格">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#formatcs(DataBinder.Eval(Container, "DataItem.LinPrice", "{0}"), Eval("ProClass", "{0}"), Eval("PointVal","{0}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="类型">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#formatnewstype(DataBinder.Eval(Container,"DataItem.ProClass","{0}"),Eval("id","{0}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="推荐">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#Eval("Dengji")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品属性">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#forisbest(DataBinder.Eval(Container,"DataItem.isbest","{0}"))%>
                            <%#forishot(DataBinder.Eval(Container,"DataItem.ishot","{0}"))%>
                            <%#forisnew(DataBinder.Eval(Container,"DataItem.isnew","{0}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="销售中">
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#formattype(DataBinder.Eval(Container,"DataItem.Sales","{0}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%# GetStatus(Eval("istrue", "{0}")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已生成">
                        <ItemTemplate>
                            <%# GetCteate(Eval("MakeHtml", "{0}"))%>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <%#GetStendCon(Eval("Nodeid", "{0}"), Eval("ModelID", "{0}"), Eval("id", "{0}"), Eval("isStand", "{0}"), Eval("UserShopID","{0}"))%>

                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>' Visible='<%#GetIsNRe(Eval("Recycler", "{0}")) %>'>修改 | </asp:LinkButton>

                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Del" CommandArgument='<%# Eval("ID") %>' Visible='<%#GetIsNRe(Eval("Recycler", "{0}")) %>'
                                OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"> 删除 | </asp:LinkButton>
                            <asp:LinkButton ID="ResetBtn" runat="server" CommandName="Reset" CommandArgument='<%# Eval("ID") %>' Visible='<%#GetIsRe(Eval("Recycler", "{0}")) %>'
                                OnClientClick="return confirm('你确定将该数据还原吗？')"> 还原 | </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast"
                    NextPageText="下一页" PreviousPageText="上一页" />
            </asp:GridView>
            <div style="margin-top: 5px;">
                <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
                    Text="选中本页显示的所有项目" />
                <asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click"
                    OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}"
                    CssClass="btn btn-primary" UseSubmitBehavior="true" />
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150" runat="server">
                    <asp:ListItem Value="0">按标题查找</asp:ListItem>
                    <asp:ListItem Value="1">按ID查找</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TxtSearchTitle" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Button ID="Btn_Search" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="Btn_Search_Click" />
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:HiddenField ID="HiddenField2" runat="server" />
            </div>
        </div>
    </div>

</asp:Content>
