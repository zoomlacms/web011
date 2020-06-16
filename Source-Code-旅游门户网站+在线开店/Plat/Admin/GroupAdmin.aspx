<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_GroupAdmin, App_Web_2m435bxa" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>部门管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><span class="glyphicon glyphicon-home" style="color:black;margin-right:5px;"></span><a title="首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="管理中心" href="/Plat/Admin/">管理中心</a></li>
<li class="active"><a href="/Plat/Admin/GroupAdmin.aspx">部门管理</a></li>
</ol>
  <div class="child_head"> <span class="child_head_span1"></span> <span class="child_head_span2">群组列表</span> <a href="javascript:;" data-toggle="modal" data-target="#myModal" class="child_head_a">+创建新群组</a> </div>
  <div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
            class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
            OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
      <Columns>
      <asp:TemplateField HeaderText="">
        <ItemTemplate>
          <input type="checkbox" name="idChk" value="<%#Eval("ID") %>" />
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="部门名">
        <ItemTemplate><a href="GroupDetail.aspx?ID=<%#Eval("ID") %>"><%#Eval("GroupName") %></a></ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="成员人数">
        <ItemTemplate> <%#Eval("MemberIDS").ToString().Split(new char[]{','},StringSplitOptions.RemoveEmptyEntries).Length %> </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="创建人">
        <ItemTemplate> <%#Eval("UserName") %> </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="管理员">
        <ItemTemplate> <%#Eval("UserName") %> </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="操作">
        <ItemTemplate> <a href="GroupDetail.aspx?ID=<%#Eval("ID") %>" title="修改信息">修改</a> |
          <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del2">删除</asp:LinkButton>
        </ItemTemplate>
      </asp:TemplateField>
      </Columns>
      <PagerStyle HorizontalAlign="Center" />
      <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
  </div>
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title">添加新任务</h4>
        </div>
        <div class="modal-body">
          <table class="table table-bordered">
            <tr>
              <td>父组：</td>
              <td><asp:DropDownList runat="server" ID="PGroup_DP" EnableViewState="false" DataTextField="GroupName" DataValueField="ID"></asp:DropDownList></td>
            </tr>
            <tr>
              <td>组名：</td>
              <td><asp:TextBox runat="server" ID="GroupName_T" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ID="Valid1" ControlToValidate="GroupName_T" ValidationGroup="add" ErrorMessage="组名不能为空" ForeColor="Red"/></td>
            </tr>
            <tr>
              <td>描述：</td>
              <td><asp:TextBox runat="server" ID="GroupDesc_T" CssClass="form-control" /></td>
            </tr>
            <tr>
              <td>管理员：</td>
              <td><input type="text" id="ManageIDS_T" class="form-control"/>
                <input type="button" value="选择" onclick="selRuser();" class="btn btn-primary" style="margin-left:5px;" />
                <asp:HiddenField runat="server" ID="ManageIDS_Hid" />
                <asp:HiddenField runat="server" ID="HiddenField1" /></td>
            </tr>
            <tr>
              <td>组成员：</td>
              <td><input type="text" id="MemberIDS_T" class="form-control"/>
                <input type="button" value="选择" onclick="selCuser();" class="btn btn-primary" style="margin-left:5px;"/>
                <asp:HiddenField runat="server" ID="MemberIDS_Hid" /></td>
            </tr>
          </table>
        </div>
        <div class="modal-footer">
          <asp:Button runat="server" ID="GroupAdd_Btn" Text="添加" OnClick="GroupAdd_Btn_Click" CssClass="btn btn-primary" ValidationGroup="add"/>
          <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
        </div>
      </div>
    </div>
  </div>
  <div id="select" style="position: absolute; display: none; width: 800px; background: #FFF; border: 1px solid #ddd; top: 20%; left: 20%; z-index: 99999;">
    <div id="Free_Div" runat="server" class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title" style="text-align: center; width: 600px; float: left;">请选择用户</h3>
        <span style="float: right; cursor: pointer;" class="glyphicon glyphicon-remove" title="关闭" onclick="$('#select').hide();"></span>
        <div class="clearfix"></div>
      </div>
      <div class="panel-body">
        <iframe runat="server" id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 430px;" name="main_right" src="/Plat/Common/SelUser.aspx?Type=AllInfo" frameborder="0"></iframe>
      </div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.child_head { margin-top: 20px; border-bottom: 1px solid #7fB2E5; padding-bottom: 5px; }
.child_head_span1 { display: inline-block; background-color: #0066cc; width: 3px; height: 20px; margin-left: 5px; }
.child_head_span2 { font-size: 18px; }
.child_head_a { float: right; }
</style>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
    function selRuser() {
        $("#select").css("margin-top", $(document).scrollTop());
        $("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#ReferUser");
        $("#User_IFrame")[0].contentWindow.ClearChk();
        $("#select").show();
    }
    function selCuser() {
        $("#select").css("margin-top", $(document).scrollTop());
        $("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#CCUser");
        $("#User_IFrame")[0].contentWindow.ClearChk();
        $("#select").show();
    }
    function UserFunc(json, select) {
        var uname = "";
        var uid = "";
        for (var i = 0; i < json.length; i++) {
            uname += json[i].UserName + ",";
            uid += json[i].UserID + ",";
        }
        if (uid) uid = uid.substring(0, uid.length - 1);
        if (select == "ReferUser") {
            $("#ManageIDS_T").val(uname);//管理员
            $("#ManageIDS_Hid").val(uid);
        }
        if (select == "CCUser") {
            $("#MemberIDS_T").val(uname);//组成员
            $("#MemberIDS_Hid").val(uid);
        }
        $("#select").hide();
    }
    $().ready(function () {
        $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
        $("#chkAll").click(function () {selectAllByName(this, "idChk"); });
    });
</script>
</asp:Content>