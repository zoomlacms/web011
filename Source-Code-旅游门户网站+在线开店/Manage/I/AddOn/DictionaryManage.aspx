<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.AddOn.DictionaryManage, App_Web_uw5yi4gb" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据字典管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" IsHoldState="false"
        class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" OnRowEditing="Gdv_Editing" OnRowDataBound="EGV_RowDataBound"  
        OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click">
        <Columns>
            <asp:TemplateField HeaderText="选中">                            
                <ItemTemplate>
                    <asp:CheckBox ID="chkSel" runat="server" />
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
                <HeaderStyle Width="5%" />
            </asp:TemplateField>
            <asp:BoundField DataField="DicCateID" HeaderText="序号">
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            <HeaderStyle Width="5%" />
            </asp:BoundField>                                               
            <asp:TemplateField HeaderText="分类名">
                <ItemTemplate>                                
                   <%# Eval("CategoryName")%>
                </ItemTemplate>
                 <ItemStyle  CssClass="tdbg" HorizontalAlign="Left" />
                 <HeaderStyle Width="50%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="是否启用">
                <ItemTemplate>
                  <%# GetUsedFlag(Eval("IsUsed","{0}")) %>
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
                <HeaderStyle Width="10%" />
            </asp:TemplateField>                                      
            <asp:TemplateField HeaderText="操作">
            <HeaderStyle Width="19%" />
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("DicCateID") %>'>修改</asp:LinkButton> | 
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("DicCateID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton> | 
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DicList" CommandArgument='<%# Eval("DicCateID") %>'>字典项目列表</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center"/>
            <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>     
    <table  class="table table-striped table-bordered table-hover" id="sleall">
    <tr>
        <td style="height: 21px">                   
          <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="全选" />
            <asp:Button ID="btndelete" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="批量删除" OnClick="btndelete_Click" class="btn btn-primary"/>                
            <asp:Button ID="btnSetUsed" runat="server" Text="批量启用" OnClick="btnSetUsed_Click" class="btn btn-primary"/>
            <asp:Button ID="btnSetUnUsed" runat="server" Text="批量停用" OnClick="btnSetUnUsed_Click" class="btn btn-primary"/>
            <asp:Button ID="btnSetAllUsed" runat="server" Text="全部启用" OnClick="btnSetAllUsed_Click" class="btn btn-primary"/>
        </td>
    </tr>                
</table>   
<table class="table table-striped table-bordered table-hover" id="Table1">
<tr>
    <td style="height: 21px">
        分类名：<asp:TextBox ID="txtCategoryName" runat="server" Width="200px" class="form-control"></asp:TextBox>
        <asp:HiddenField ID="HdnDicCateID" Value="0" runat="server" />
        <asp:Button ID="btnSave" runat="server" Text="添 加" OnClick="btnSave_Click" class="btn btn-primary"/></td>
</tr>
</table>        
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>