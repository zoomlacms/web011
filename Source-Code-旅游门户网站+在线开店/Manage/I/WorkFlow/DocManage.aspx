<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_DocManage, App_Web_5xj5wdms" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>公文管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="margin-bottom: 10px;">
        <div class="input-group" style="width: 300px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass=" form-control" />
            <span class="input-group-btn">
                <asp:Button runat="server" Text="搜索" CssClass="btn btn-primary" ID="Button1" />
            </span>
        </div>
    </div>
    <div style="margin-bottom: 5px;">
        <ZL:ExGridView runat="server" ID="EGV" DataKeyNames="GeneralID" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table table-striped table-bordered table-hover" AllowUserToOrder="true" BackColor="White" EmptyDataText="没有任何数据!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <input type="checkbox" name="idChk" value="<%#Eval("GeneralID") %>" />
                        <%#Eval("GeneralID") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="标题" ItemStyle-CssClass="text-left">
                    <ItemTemplate>
                        <a href="ViewContent.aspx?Gid=<%#Eval("GeneralID") %>" title="<%#Eval("Title") %>"><%#Eval("Title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="录入者" DataField="Inputer" />
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus( Eval("Status","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="创建时间">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"CreateTime","{0:yyyy年MM月dd日 hh:mm}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="更新时间">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem,"UpDateTime","{0:yyyy年MM月dd日 hh:mm}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandName="read" CommandArgument='<%#Eval("GeneralID") %>' runat="server">修改</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" CssClass="tdbg" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
    <asp:Button runat="server" ID="batDelBtn" CssClass="btn btn-primary" Text="移入回收站" OnClick="batDelBtn_Click" OnClientClick="return confirm('确定要删除吗?');" />

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $().ready(function () {
            $("tr:gt(1):not(:last)").addClass("tdbg");
            $("tr:gt(1):not(:last)").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
            $("tr:gt(1):not(:last)").dblclick(function () { v = $(this).find("[name='idChk']").val(); location = "Drafting.aspx?Edit=1&appID=" + v; });//绑定双击事件
        });
    </script>
</asp:Content>
