<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_StructList, App_Web_oxnlb5iw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>组织结构</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div>
            当前结构:<asp:Label runat="server" ID="curStr_L" style="color:green;"></asp:Label>
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <input type="checkbox" name="idChk" value="<%#Eval("ID") %>"/><asp:Label ID="Lbl" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="ID" DataField="ID"/>
                    <asp:TemplateField HeaderText="名称">
                        <ItemTemplate>
                            <a href="AddStruct.aspx?ID=<%#Eval("ID") %>"><%#Eval("Name") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="创建人">
                        <ItemTemplate>
                            <%#getName(Eval("UserID").ToString()) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="创建时间">
                        <ItemTemplate>
                        <%#Eval("AddTime") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="开放">
                        <ItemTemplate>
                            <%#getOpen(Eval("Opens").ToString()) %> 
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%#getStatus(Eval("Status").ToString()) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="成员数量">
                        <ItemTemplate>
                            <%#GetCount(Eval("ID")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="StructMenber.aspx?id=<%#Eval("ID") %>" title="查看成员">查看成员</a>
                            |<asp:LinkButton ID="Add_lbn" CommandName="Add" CommandArgument='<%#Eval("ID") %>' Text="添加子级" runat="server"></asp:LinkButton>
                            |<a <%#IsHasChild(Eval("ID")) %> >查看子级</a>
                            |<a href="../User/CompetenceAdd.aspx?id=<%#Eval("UserID") %>" title="权限设置">权限设置</a>
                            |<asp:LinkButton ID="Edit_lbn" CommandName="Edit" CommandArgument='<%#Eval("ID") %>' Text="修改" runat="server"></asp:LinkButton>
                            |<asp:LinkButton ID="Del_lbn" CommandName="Del" CommandArgument='<%#Eval("ID") %>' Text="删除" runat="server"></asp:LinkButton><img src="/App_Themes/AdminDefaultTheme/images/fancy_title_over.png" onload="ADD_none('<%#Eval("ID") %>')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
       <asp:Button ID="Button1" class="btn btn-primary" Text="批量排除" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('不可恢复性数据,你确定将该成员从此结构中排除吗？');}" OnClick="Button1_Click" /></td>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
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
    </script>
</asp:Content>
