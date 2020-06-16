<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Pub_PubExcel, App_Web_xczopl2y" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>互动Excel导出配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
        class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID"/>
            <asp:BoundField HeaderText="表名" DataField="TableName"/>
            <asp:BoundField HeaderText="字段名(中文)" DataField="CNames"/>
            <asp:BoundField HeaderText="字段名(数据库)" DataField="Fields"/>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                     <asp:LinkButton runat="server" CommandName="Edit2" CommandArgument='<%#Eval("ID") %>' ToolTip="修改">修改</asp:LinkButton>
                    |<asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
    <div class="modal" id="add_div" style="position: fixed; top: 10%;">
        <div class="modal-dialog">
            <div class="modal-content" style="width:900px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong>添加Excel输出规则</strong></span>
                </div>
                <div class="modal-body">
                    <asp:HiddenField runat="server" ID="ID_Hid"/><!--标识是修改还是添加-->
                    <table class="table table-bordered table-striped">
                        <tr><td>表名：</td><td><asp:TextBox runat="server" ID="TableName_T" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="r1" ErrorMessage="表名不能为空" ForeColor="Red" ValidationGroup="add" Display="Dynamic" ControlToValidate="TableName_T" /></td></tr>
                        <tr><td>字段名(数据库)：</td><td><asp:TextBox runat="server" ID="Fields_T" TextMode="MultiLine" style="width:500px;height:100px;"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="r2" ErrorMessage="字段名不能为空" ForeColor="Red" ValidationGroup="add" Display="Dynamic" ControlToValidate="Fields_T" />
                            示例:UserID,UserName</td></tr>
                        <tr><td>字段名(中文)：</td><td><asp:TextBox runat="server" ID="CNames_T" TextMode="MultiLine" style="width:500px;height:100px;"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="r3" ErrorMessage="字段名(中文)不能为空" ForeColor="Red" ValidationGroup="add" Display="Dynamic" ControlToValidate="CNames_T" />
                            示例:用户ID，用户名</td></tr>
                    </table>
                </div>
                <div class="modal-footer" style="text-align: left; padding-left: 100px;">
                    <asp:Button runat="server" ID="Add_Btn" Text="保存" OnClick="Add_Btn_Click"  CssClass="btn btn-primary" ValidationGroup="add" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <a href="javascript:;" data-toggle='modal' data-target='#add_div' id="model_a"></a>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function ShowModel()
        {
            $("#model_a").click();
        }
        function Clear()
        {
            $("#ID_Hid").val("");
            $("#TableName_T").val("");
            $("#Fields_T").val("");
            $("#CNames_T").val("");
            $("#model_a").click();
        }
    </script>
</asp:Content>