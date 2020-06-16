<%@ page language="C#" autoeventwireup="true" inherits="MIS_OA_FramePage, App_Web_2wydnesy" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>排班</title>
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
function selGroup(v)
{
    $("#main_right").attr("src", "/Mis/OA/Sched/PBManage.aspx?gid="+v);
}
</script>
</head>
<body>
    <form id="form1" runat="server">
  <div class="mainDiv">
    <div id="site_main">
        <div id="leftDiv" style="float:left;width:14%;">
            <iframe src="/Mis/OA/Mail/SelGroup.aspx?Type=null" style="width:100%;height:760px;" frameborder="0"></iframe>
        </div>
        <div id="rightDiv" style="float:right;width:84%;">
         <iframe id="main_right" src="/Mis/OA/Sched/PBManage.aspx" style="width:100%;height:760px;" frameborder="0"></iframe>
</div><!--RighDiv-->
</div>

      <div style="clear:both;"></div>
</div><!--MainDiv-->
    </form>
</body>
</html>
