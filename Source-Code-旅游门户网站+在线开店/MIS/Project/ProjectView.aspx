<%@ page language="C#" autoeventwireup="true" inherits="MIS_ProjectView, App_Web_1230bsik" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>项目概览</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script src="../../Plugins/Ckeditor/ckeditor.js"  type="text/javascript" ></script>
<script src="../../Plugins/Ckeditor/EditFile/sample.js" type="text/javascript"></script>
<link href="../../Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" type="text/css" />
<script>
    function loadPage(id, url) {
        $("#" + id).addClass("loader");
        $("#" + id).append("Loading......");
        $.ajax({
            type: "get",
            url: url,
            cache: false,
            error: function () { alert('加载页面' + url + '时出错！'); },
            success: function (msg) {
                $("#" + id).empty().append(msg);
                $("#" + id).removeClass("loader");
            }
        });
    }
    loadPage("pro_left", "Pro_left.aspx");
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="I_main">
<div id="pro_left"> 
    <asp:Label ID="Label1" runat="server"></asp:Label>
</div>
<div id="pro_right">
    <div class="Pro_tit">
        <div class="Sico"></div>
        <div class="PTit">
    <asp:Label ID="lblProName" runat="server"></asp:Label>
         </div>
        <div class="Pro_li" style="display:none">
            <ul><li><a href="#">返回项目列表</a></li>
                <li><a href="#">新建子项目</a></li>
                <li><a href="#">撤销项目</a></li>
                <li><a href="#">完成项目</a></li>
                <li><a href="#">分配项目</a></li>
            </ul>

        </div>
    </div>
<div class="tab">
<ul>
<li class="log_tab"> <a href="/Mis/Project/ProjectView.aspx?ID=<%=Request["ID"] %>" class="clk">项目概览</a></li>
<li ><a href="javascript:void(0)" onclick="loadPage('see', '/Mis/Project/MisInfo.aspx?ProID=<%=Request["ID"] %>&MID=<%=Request["MID"] %>&Type=5')" class="clk" >协商</a></li>
<li ><a href="javascript:void(0)" onclick="loadPage('see', '/Mis/FilesList.aspx?ProID=<%=Request["ID"] %>&MID=<%=Request["MID"] %>&Type=6')"  class="clk">文档</a></li>
<li ><a href="javascript:void(0)"  onclick="loadPage('see', '/Mis/Project/Menber.aspx?ID=<%=Request["ID"] %>')"  class="clk">人员</a></li>
<li ><a   href="javascript:void(0)" onclick="loadPage('see', '/Mis/Project/subProject.aspx')"   class="clk">子项目</a></li>
<li  ><a href="javascript:void(0)"  class="clk">活动记录</a></li>
</ul></div> 
<div id="see">
<table width="100%" class="dialog" border="0" cellSpacing="8" cellPadding="0">
<tr><th align="right" width="180">负责人 : </th><td><asp:Label ID="lblLeader" runat="server"></asp:Label> </td></tr>
<tr><th align="right">项目级别 :</th><td><asp:Label ID="lblLevel" runat="server"></asp:Label> </td></tr>
<tr><th align="right">进度 : </th><td><div id="baseInfoProcess" style="background-color: rgb(255, 255, 194);" ><asp:Label ID="lblRating" runat="server"></asp:Label>% </div></td></tr>
<tr><th align="right">状态 : </th><td><asp:Label ID="lblProStatus" runat="server"></asp:Label> </td></tr>
<tr><th align="right">开始时间 : </th><td><asp:Label ID="lblBeginTime" runat="server"></asp:Label> </td></tr>
<tr><th align="right">计划完成时间 : </th><td><asp:Label ID="lblCompletionTime" runat="server"></asp:Label></td></tr>
<tr><th align="right">项目描述 : </th><td><asp:Label ID="lblRequirements" runat="server"></asp:Label> </td></tr>
</table>
</div>
</div>
</div>
</form>  
</body>
</html>
