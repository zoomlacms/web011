<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_DataManage, App_Web_5arvbvnz" masterpagefile="~/Manage/Site/SiteMaster.master" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>数据库管理</title>
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="/dist/js/bootstrap.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#EGV tr:last >td>:text").css("line-height", "normal");
            $("#EGV tr:first >th").css("text-align", "center");
        });
    </script>
    <style type="text/css">
        #EGV tr th {color:black;background:url(""); }
        #nav_site {background:white;}
        .form-control {width:260px;}
        #site_nav .site05 a{ background:url(/App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site" style="margin-top:15px;"><p style="float: left;">站群中心 >> <a href="DBManage.aspx">数据库管理</a>(仅用于<a href="/Plugins/Domain/InquiryDomName.aspx" target="_blank" style="color:blue;">智能建站</a>生成的数据库)</p></div>
    <div id="site_main" style="margin-top: 5px;">
        <div id="dbListDiv" runat="server">
        <div class="input-group" style=" width:400px;float:left;margin-bottom:10px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control"/>
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click"/>
                <asp:Button runat="server" CssClass="btn btn-primary" ID="addBtn" Text="添加" OnClick="addBtn_Click"/>
            </span>
        </div>
        <div class="tab3">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="table border" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="数据库名" DataField="DBName"/>
                    <asp:BoundField HeaderText="站点名" DataField="SiteName" />
                    <asp:BoundField HeaderText="用户名" DataField="UserName" />
                    <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="DBManage.aspx?ID=<%#Eval("ID") %>" title="编辑">
                                <img src="/Images/ModelIcon/Edit.gif" /></a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                                <img src="/App_Themes/AdminDefaultTheme/images/del.png" /></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
         </div>   
   <div id="addDiv" runat="server" visible="false">
       <table class="table table-bordered table-hover" style="width:550px;">
            <tr><td style="width:120px;">数据库名：</td><td><asp:TextBox runat="server" ID="dbNameT" class="form-control"/></td></tr>
            <tr><td>帐户：</td><td><asp:TextBox runat="server" ID="dbUserT" class="form-control"/></td></tr>
            <tr><td>密码：</td><td>
                <asp:TextBox runat="server" ID="dbPwdT" class="form-control pull-left"/>
                <asp:Button runat="server" ID="cPwdBtn" class="btn btn-info" Text="重新生成" OnClick="cPwdBtn_Click" style="margin-left:10px;"/></td></tr>
            <tr><td colspan="2" style="text-align:center;">绑定信息(可稍后设置)</td></tr>
            <tr><td>绑定站点：</td><td>
                <asp:DropDownList runat="server" ID="bindSiteDP" Height="35px"></asp:DropDownList></td></tr>
            <tr><td>绑定会员：</td>
                <td><asp:TextBox runat="server" ID="bindUserT" class="form-control pull-left"/>
                    <asp:HiddenField runat="server" ID="bindUserD" />
                    <input type="button" class="btn btn-info" value="选择会员" onclick="showdiv('div_share', 'bindUser');" style="margin-left:10px;"/>
                </td></tr>
            <tr><td>绑定域名：</td>
                <td><asp:TextBox runat="server" ID="bindDomT" class="form-control" /></td></tr>
            <tr><td>操作：</td><td>
                <asp:Button runat="server" ID="saveBtn" Text="保存" OnClick="saveBtn_Click" CssClass="btn btn-primary"/>
                <input type="button" id="rtnBtn" value="返回" class="btn btn-primary"/><br />
                <span class="alert alert-danger" runat="server" visible="false" id="remindSpan" style="padding:9px;"></span></td></tr>
       </table>
    </div>
    </div>
        <div id="div_share" class="panel panel-primary" style="display:none; position:absolute;z-index:3;">
            <div class="panel-heading"><h3 class="panel-title">选择会员</h3></div>
            <div class="panel-body">
                <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:500px;" name="main_right" src="/Mis/OA/Mail/SelUser.aspx" frameborder="0"></iframe>
            </div>
        </div>
    <asp:HiddenField runat="server" ID="dataField" />
    <script type="text/javascript">
        function showdiv(div_id, f) {
            $("#dataField").val(f);
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight) / 2;
            var w = (document.documentElement.offsetWidth - 400) / 2;
            div_obj.animate({ opacity: "show", left: w, top: h, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        function hideDiv() {
            $("#div_share").hide();
        }

        function seluser(groupJson, userJson) {
            //var names = "";
            //var ids = "";
            //for (var i = 0; i < userJson.length; i++) {
            //    names += userJson[i].Uname + ",";
            //    ids += userJson[i].Uid + ",";
            //}
            var flag = $("#dataField").val();
            $("#" + flag + "T").val(userJson[0].Uname);
            $("#" + flag + "D").val(userJson[0].Uid);
            hideDiv();
        }
    </script>
</asp:Content>