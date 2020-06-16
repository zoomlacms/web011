<%@ page language="C#" autoeventwireup="true" inherits="manage_User_RegionManage, App_Web_evybsxrg" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery.js"></script>
    <title>管理员地区设置</title>
    <style>
        .list {width:100%;height:400px;padding:5px;margin-left:5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">后台管理&gt;&gt; <a href="AdminManage.aspx">管理员管理</a> &gt;&gt; <a href="javascript:">地区设置</a>&nbsp;
            <span style="color: #1e860b">[当未给管理员指定区域，默认拥有全部权限]</span>
        </div>
        <div>
            <div style="float: left; margin-left: 2%; width: 35%">
                <div style="text-align: center; float: left; width: 30%;">
                    <input type="button" onclick="selectAll('ProvinceList')" value="全选" class="C_input" /><br />
                    <asp:ListBox runat="server" ID="ProvinceList" TextMode="MultiLine" CssClass="list" OnSelectedIndexChanged="ProvinceList_SelectedIndexChanged"
                        AutoPostBack="true" SelectionMode="Multiple" />
                </div>
                <div style="text-align: center; float: left; width: 30%; margin-left: 3%">
                    <input type="button" onclick="selectAll('CityList')" value="全选" class="C_input" /><br />
                    <asp:ListBox runat="server" ID="CityList" TextMode="MultiLine" CssClass="list" OnSelectedIndexChanged="CityList_SelectedIndexChanged"
                        AutoPostBack="true" SelectionMode="Multiple" />
                </div>
                <div style="text-align: center; float: left; width: 30%; margin-left: 3%">
                    <input type="button" onclick="selectAll('CountyList')" value="全选" class="C_input" /><br />
                    <asp:ListBox runat="server" ID="CountyList" TextMode="MultiLine" CssClass="list"  OnSelectedIndexChanged="CountyList_SelectedIndexChanged"
                        AutoPostBack="true" SelectionMode="Multiple" />
                </div>
            </div>
            <div style="float: left; text-align: center; width:5%; margin-top:10%;" >
                <asp:Button runat="server" ID="LtoR" Text="添加" OnClick="LtoR_Click"  CssClass="C_input"/><br /> <!--换为两个大号按钮-->
                <asp:Button runat="server" ID="RtoL" Text="移除" OnClick="RtoL_Click" Style="margin-top: 20px;"  CssClass="C_input"/><br />
                <asp:Button runat="server" ID="OK" Text="保存更改" OnClick="OK_Click" Style="margin-top: 20px;"  CssClass="C_input"/>
            </div>
            <div style="margin-left: 45%;width:40%;" >
                <div style="margin-left:12%">
                <input type="button" onclick="selectAll('MeAllCounty')" value="全选" class="C_input" /><br /></div>
                  <asp:ListBox runat="server" ID="MeAllCounty" SelectionMode="Multiple" CssClass="list" Width="30%" />
            </div>
        </div>
        <script type="text/javascript">
            function selectAll(id) {
                $("#"+id).children().each(function () { $(this).attr("selected", "selected") });
            }
        </script>
    </form>
</body>
</html>
