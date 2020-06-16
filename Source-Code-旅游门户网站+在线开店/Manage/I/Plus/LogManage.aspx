<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Log.LogManage, App_Web_0t1uxiqn" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>日志管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ZL:ExGridView ID="EGV" class="table table-striped table-bordered table-hover" DataKeyNames="LogID" runat="server" AutoGenerateColumns="False"
            AllowPaging="True" PageSize="20" Width="100%"  OnPageIndexChanging="Egv_PageIndexChanging"
            OnRowCommand="Lnk_Click" EmptyDataText="无相关数据">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:CheckBox ID="idchk" runat="server" />
                    </ItemTemplate>
                    <ItemStyle CssClass="TdWrap" HorizontalAlign="Center" />
                    <HeaderStyle Width="3%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="View" CommandArgument='<%# Eval("LogID") %>'><%# Eval("Title")%></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="rap" HorizontalAlign="left" />
                    <HeaderStyle Width="12%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型">
                    <ItemTemplate>
                        <%# GetCate(Eval("Category", "{0}"))%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="8%" />
                </asp:TemplateField>
                <asp:BoundField DataField="ScriptName" HeaderText="访问地址">
                    <ItemStyle HorizontalAlign="left" />
                </asp:BoundField>
                <asp:BoundField DataField="Timestamp" HeaderText="操作时间">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="UserIP" HeaderText="IP地址">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="操作人">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="6%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="查看">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="View" CommandArgument='<%# Eval("LogID") %>'>查看</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                    <HeaderStyle Width="5%" />
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
     
    </div>
    <asp:Button ID="btndelete" class="btn btn-primary" runat="server" OnClientClick="return confirm('确定要删除选中的日志吗？')" Text="删除日志" OnClick="btndelete_Click" />
    <asp:HiddenField ID="HdnCate" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        HideColumn("3,4,5");
    </script>
</asp:Content>
