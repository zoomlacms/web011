<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_OfficeManage, App_Web_5xj5wdms" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>公文管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" OnRowCommand="EGV_RowCommand" Width="100%" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True" EmptyDataText="无相关信息！！">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <%#Eval("ID") %><input type="hidden" name="idHid" value="<%#Eval("ID") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="发文类型" Visible="false">
                    <ItemTemplate>
                        <%#GetType(Eval("Type", "{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
                <asp:BoundField HeaderText="标题" DataField="Title" />
                <asp:TemplateField HeaderText="密级">
                    <ItemTemplate>
                        <%#GetSecret( Eval("Secret","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="紧急程度">
                    <ItemTemplate>
                        <%# GetUrgency(Eval("Urgency","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="重要程度">
                    <ItemTemplate>
                        <%# GetImport(Eval("Importance","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="Drafting.aspx?Edit=1&AppID=<%#Eval("ID") %>">修改</a>|
                    <a href="javascript:;" onclick="openWin('<%#Eval("ID") %>');">分发</a>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="del1" CommandArgument='<%# Eval("ID") %>'>删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" CssClass="tdbg" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
    <div id="foo" style="position: fixed; top: 50%; left: 30%; display: block;"></div>
    <asp:Button runat="server" ID="singleBtn" OnClick="singleBtn_Click" Style="display: none;" /><!--后台前测，前台只有提交请求权-->
    <asp:HiddenField runat="server" ID="pageData" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Plugins/JqueryUI/spin/spin.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("tr:gt(1):not(:last)").addClass("tdbg");
            $("tr:gt(1):not(:last)").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
            $("tr:gt(1):not(:last)").dblclick(function () { v = $(this).find("[name='idHid']").val(); location = "Drafting.aspx?Edit=1&appID=" + v; });//绑定双击事件
        });
        function displayToolbar() {
            $("#toolbar1").toggle("fast");
        }
        function openWin(v) {
            var url = "<%=CustomerPageAction.customPath2+"Common/NodeList.aspx?ModelID="+ZoomLa.Components.OAConfig.ModelID%>";
            var iTop = (window.screen.availHeight - 30 - 550) / 2;
            var iLeft = (window.screen.availWidth - 10 - 960) / 2;
            window.open(url, "_win", 'height=550, width=500,top=' + iTop + ',left=' + iLeft + ',toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
            $("#pageData").val(v);
        }
        function ParentFunc(v) {
            v = $("#pageData").val() + ":" + v;
            $("#pageData").val(v);
            $("#singleBtn").trigger("click");
        }
    </script>
</asp:Content>
