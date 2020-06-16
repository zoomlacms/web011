<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_StructMenber, App_Web_oxnlb5iw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>结构成员</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <asp:HiddenField runat="server" ID="HiddenUser" />
    <asp:Button runat="server" ID="Sure_Btn" OnClick="Sure_Btn_Click" style="display:none;"/>
    当前结构:<asp:Label runat="server" ID="curStr_L" style="color:green;"></asp:Label>
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="UserID" 
        OnRowEditing="Egv_RowEditing" OnPageIndexChanging="Egv_PageIndexChanging" EmptyDataText="无相关信息！！" OnRowCommand="Lnk_Click" OnRowDataBound="Egv_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                    <input type="checkbox" name="idChk" value="<%#Eval("UserID") %>"/>
                </ItemTemplate>
                <ItemStyle Width="50" />
            </asp:TemplateField>
            <asp:BoundField DataField="UserID" HeaderText="ID">
                <ItemStyle Width="50"/>
            </asp:BoundField>
            <asp:TemplateField HeaderText="用户名" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="../User/UserInfo.aspx?id=<%#Eval("UserID") %>"><%#Eval("UserName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="邮箱" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                   <%#Eval("Email") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="单位" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate><%#GetStruct(Eval("StructureID").ToString()) %> </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="真名">
                <ItemTemplate>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="手机号">
                <ItemTemplate>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="LnkDelete" runat="server" CommandName="Remove" OnClientClick="if(!this.disabled) return confirm('确实要从本架构移除吗？');" CommandArgument='<%# Eval("UserID")%>'>移除</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="批量移除" OnClick="Button2_Click" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" />
<!--选择会员-->
    <div id="div_share" class="panel panel-primary" style="display: none; width: 900px; height: 600px; position: absolute; z-index: 1000;">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-remove pull-right" style="margin-top: 10px; cursor: pointer;" onclick="hidediv()" title="关闭"></span>
            <h3 class="panel-title">选择用户</h3>
        </div>
        <div class="panel-body">
            <iframe id="main_right" style="z-index: 1000; visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 450px;" name="main_right" src="/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo&Fid=<%:UserIDS %>" frameborder="0"></iframe>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        function showdiv(div_id, n) {
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight - 800) / 2;
            var w = (document.documentElement.offsetWidth - 800) / 2;
            div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        function UserFunc(json, select) {
            var uname = "";
            var uid = "";
            for (var i = 0; i < json.length; i++) {
                uname += json[i].UserName + ",";
                uid += json[i].UserID + ",";
            }
            if (uid) uid = uid.substring(0, uid.length - 1);
                //$("#TxtInceptUser").val(uname);
            $("#HiddenUser").val(uid);
            $("#Sure_Btn").trigger("click");
            $("#div_share").hide("fast");
        }
        function hidediv() {
            $("#div_share").hide("fast");
        }
        $().ready(function () {
            $("#EGV tr th:eq(0)").html("<input type='checkbox' id='chkAll'/>");
            $("#chkAll").click(function () { selectAllByName(this, "idChk") });
        });
    </script>
</asp:Content>