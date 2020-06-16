<%@ page language="C#" autoeventwireup="true" inherits="MIS_Plan_PlanInfoView, App_Web_rf4ejtbp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>计划内容</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script src="/JS/MisView.js"></script>  
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
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="Meno">
 <span class="fr"> - 未完成 - 已完成 - 已取消</span>[ <asp:Label ID="lblPre" runat="server"></asp:Label> | <asp:Label ID="lblNext" runat="server"></asp:Label> | <a href="javascript:void" onclick="javascript:history.go(-1)">返回</a> ]
<div class="popup_headti">       <asp:Label ID="lblTitle" runat="server"></asp:Label>  </div>
   
<div class="myoper"> <asp:LinkButton ID="lbtEditV" runat="server" Text="[修改计划]" OnClick="lbtEditV_Click"></asp:LinkButton> 
   <a href="#">[发表评论]</a> </div>
<table width="100%" class="tsktab " border="1" style="border-collapse:collapse; border-color:#EEE;">
<tr><th width="10%" align="right">计划类型</th><td><asp:Label ID="lblType" runat="server"></asp:Label></td>
<th width="10%" align="right">计划时间</th><td><asp:Label ID="lblStartTime" runat="server"></asp:Label>-<asp:Label ID="lblEndTime" runat="server"></asp:Label></td>
<th width="10%" align="right">当前版本</th><td><asp:Label ID="lblVersion" runat="server"></asp:Label></td>
</tr>
<tr><th align="right">计划部门</th><td><asp:Label ID="lblDepart" runat="server"></asp:Label></td>
<th align="right">计划人</th><td><asp:Label ID="lblInputer" runat="server"></asp:Label></td>
<th align="right">最后编辑时间</th><td><asp:Label ID="lblEditTime" runat="server"></asp:Label></td>
</tr>
</table>
<table class="border staff_frm" width="100%" >
<tr height="25" class="title" style="background-image: none; background-attachment: scroll; background-repeat: repeat; background-position-x: 0%; background-position-y: 0%; background-color: rgb(231, 243, 255);">
<th width="100"></th> <th width="60%">详细内容</th> <th width="180">编辑时间</th> </tr>
   
<tr><td width="100" align="right" valign="top">内容 </td><td id="log_box" colspan="2"> 
  
<div id="dayList"> 
<ul>
<asp:Repeater ID="Repeater1" runat="server" >
<ItemTemplate> 
<li><div class="greybg"><strong> <%#Eval("Title") %> </strong></div>
<span><%#Eval("CreateTime","{0:MM-dd hh:mm}") %>  </span>
<%#Eval("Content") %> 
</li> 
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
</td></tr>
<tr><td align="center" valign="top">总结 </td>
<td id="end_box"  colspan="2">
<div id="DaiJie">
<ul>
<asp:Repeater ID="Repeater2" runat="server" >
<ItemTemplate> 
<li><span><%#Eval("CreateTime","{0:MM-dd hh:mm}") %>  </span> <%#Eval("Title") %><%#Eval("Content") %> 
</li> 
</ItemTemplate>
</asp:Repeater>
</ul></div></td></tr>
<tr><td align="center" valign="top"> 附件 </td><td  colspan="2">
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
