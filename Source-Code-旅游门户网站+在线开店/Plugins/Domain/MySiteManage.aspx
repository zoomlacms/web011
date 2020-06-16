<%@ page language="C#" autoeventwireup="true" inherits="Plugins_Domain_MySiteManage, App_Web_cpqz3j25" masterpagefile="~/Manage/Site/OptionMaster.master" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="/dist/js/bootstrap.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $(":button").addClass("btn btn-primary");
            $(":submit").addClass("btn btn-primary");
            $("#EGV tr:last >td>:text").css("line-height", "normal");
            $("#EGV tr:first >th").css("text-align", "center");
        });
    </script>
    <style type="text/css">
        #EGV tr th {color:black;background:url(""); }
        #nav_site {background:white;}
        body {font-family:'Microsoft YaHei';}
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pageContent">
        <div id="m_site" style="margin-top:15px;"><p style="float: left;">站群中心 >>智能建站 >> <a href="MySiteManage.aspx">站点管理</a></p></div>
    <div id="site_main" style="margin-top: 5px;">
        <div class="input-group" style=" width:400px;float:left;margin-bottom:10px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control"/>
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click"/>
            </span>
        </div>
        <div class="tab3">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="table border" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="数据库名" DataField="DBName"/>
                    <asp:BoundField HeaderText="站点名" DataField="SiteName" />
                    <asp:BoundField HeaderText="绑定域名" DataField="Remind" />
                    <asp:BoundField HeaderText="用户名" DataField="UserName" />
                    <asp:BoundField HeaderText="初始密码" DataField="DBInitPwd" />
                    <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                           <a href='<%#"http://"+Eval("Remind") %>'>前往站点</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                   </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
</asp:Content>