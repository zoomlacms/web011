<%@ page language="C#" autoeventwireup="true" inherits="manage_User_RegionManage, App_Web_ub3q0ybo" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>管理员地区设置</title>
    <style>
        .DataList{width:202px;height:400px;}
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div>
            <div style="float: left; margin-left: 2%; width: 35%" >
                <div style="text-align: center; float: left; width: 30%;">
                    <input type="button" onclick="selectAll('ProvinceList')" value="全选" class="btn btn-primary"/><br />
                    <asp:ListBox runat="server" ID="ProvinceList" TextMode="MultiLine" Height="400" CssClass="list DataList" OnSelectedIndexChanged="ProvinceList_SelectedIndexChanged"
                        AutoPostBack="true" SelectionMode="Multiple" />
                </div>
                <div style="text-align: center; float: left; width: 30%; margin-left: 3%">
                    <input type="button" onclick="selectAll('CityList')" value="全选" class="btn btn-primary"/><br />
                    <asp:ListBox runat="server" ID="CityList" TextMode="MultiLine" Height="400" CssClass="list DataList" OnSelectedIndexChanged="CityList_SelectedIndexChanged"
                        AutoPostBack="true" SelectionMode="Multiple" />
                </div>
                <div style="text-align: center; float: left; width: 30%; margin-left: 3%">
                    <input type="button" onclick="selectAll('CountyList')" value="全选" class="btn btn-primary" /><br />
                    <asp:ListBox runat="server" ID="CountyList" TextMode="MultiLine" CssClass="list DataList" Height="400"  OnSelectedIndexChanged="CountyList_SelectedIndexChanged"
                        AutoPostBack="true" SelectionMode="Multiple" />
                </div>
            </div>
            <div style="float: left; text-align: center; width:5%; margin-top:10%;" >
                <asp:Button runat="server" ID="LtoR" Text="添加" OnClick="LtoR_Click"  class="btn btn-primary"/><br /> <!--换为两个大号按钮-->
                <asp:Button runat="server" ID="RtoL" Text="移除" OnClick="RtoL_Click" Style="margin-top: 20px;"  class="btn btn-primary"/><br />
                <asp:Button runat="server" ID="OK" Text="保存更改" OnClick="OK_Click" Style="margin-top: 20px;"  class="btn btn-primary"/>
            </div>
            <div style="margin-left: 45%;width:40%;" >
                <div style="margin-left:12%">
                <input type="button" onclick="selectAll('MeAllCounty')" value="全选" class="btn btn-primary" /><br /></div>
                  <asp:ListBox runat="server" ID="MeAllCounty" SelectionMode="Multiple" Height="400" CssClass="list" Width="30%" />
            </div>
        </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="../../JS/jquery.js"></script>
            <script type="text/javascript">
                function selectAll(id) {
                    $("#" + id).children().each(function () { $(this).attr("selected", "selected") });
                }
        </script>
</asp:Content>
