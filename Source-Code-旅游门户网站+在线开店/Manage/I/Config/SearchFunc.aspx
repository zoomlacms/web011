<%@ page language="C#" autoeventwireup="true" inherits="manage_Search_SearchFunc, App_Web_gsi5yeuj" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>便捷导航管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="divbox" id="nocontent" runat="server" style="display: none">暂无导航信息</div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
        <tr align="left">
            <td style="width: 10%" class="tdbg">欢迎您使用便捷导航模块；<br />
                在此位置您可以对索引目录进行观察位置、删除目录及管理目录的索引文件。<br />
                <p style="color: Red">凡是文件未启用，站内链接不存在该文件则无法链接到指定的页面。</p>
            </td>
        </tr>
    </table>
    <div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging"
            CssClass="table table-striped table-bordered table-hover" IsHoldState="false" OnRowDataBound="gvCard_RowDataBound">
            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <input type="checkbox" name="chkSel" title="" value='<%#Eval("id") %>' />
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="名称" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <a href='<%#Eval("id","AddSearch.aspx?menu=edit&id={0}") %>' title="点击编辑导航"><%#Eval("Name") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="文件或地址路径">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlLink" runat="server" NavigateUrl='<%#Eval("flieUrl") %>' Text='<%#Eval("flieUrl") %>' ToolTip='<%# Eval("Name") %>' Visible="false" />
                        <a href="<%# Eval("flieUrl") %>" title="<%# Eval("Name") %>"><%#Eval("flieUrl") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="图标地址">
                    <ItemTemplate>
                        <asp:Label ID="lblpic" runat="server" Text='<%# Eval("ico") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="支持移动" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                      <ItemTemplate>
                          <%#IsMobile(Eval("Mobile")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="连接类型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Image ID="imgLinkType" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="创建时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblTime" runat="server" Text='<%# getDate(Eval("time","{0}"))%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    <div class="text-center">
        <asp:Button ID="BtnDelete" runat="server" CssClass="btn btn-primary" OnClick="BtnDelete_Click" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" Text="删除导航"/>
        <asp:Button ID="Button1" runat="server" Text="批量启用" CssClass="btn btn-primary" OnClick="Btnuse_Click" />
        <asp:Button ID="Button2" runat="server" Text="批量停用" CssClass="btn btn-primary" OnClick="Btnstop_Click" />
    </div>
     <style>
        th{ text-align:center;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        $().ready(function () {
            $("#gvCard tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        })
    </script>
</asp:Content>
