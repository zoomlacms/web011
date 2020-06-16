<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_TaskInfoView, App_Web_t0xlctza" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>查看任务事件</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div id="Meno">
<div class="dialog_head"><a href="javascript:void(0)" onclick="javascript:Window.Close();"> [关闭窗口]</a><span>查看任务事件</span>  </div>
    <div>  [任务] <a href="TaskView.aspx?ID=<%=Request["TID"] %>"><asp:Label ID="lblName" runat="server"></asp:Label></a> </div>
<div class="popup_headti"> [<asp:Label ID="lblType" runat="server"></asp:Label>] <asp:Label ID="lblTitle" runat="server"></asp:Label>   </div>
<div class="myoper">
 <a href="AddTaskInfo.aspx?ID=<%=Request["ID"] %>&TID=<%=Request["TID"] %>" >[编辑]</a><asp:LinkButton ID="lbtSetSta" runat="server" Text="[设置完成]" OnClick="lbtSet_Click"></asp:LinkButton>  
</div>

<div class="popup_ti"><strong> 基本信息</strong></div>
<table width="100%" class="tsktab">
<tr>
<th align="right" width="10%">当前状态 :</th><td align="left"><asp:Label ID="lblProStatus" runat="server"></asp:Label> </td>
<th align="right">创建人 :</th><td align="left"><asp:Label ID="lblInputer" runat="server"></asp:Label></td>
<th align="right">创建时间 :</th><td align="left"> <asp:Label ID="lblCreateTime" runat="server"></asp:Label></td>   
</tr>
<tr> 
<th align="right" width="10%">紧要程度 :</th><td align="left"  colspan="5"><asp:Label ID="lblLevel" runat="server"></asp:Label></td>
</tr>
<tr>
<td  align="left" colspan="6"  class="popup_ti"> <strong> 描述:</strong> </td> </tr>
<tr><td colspan ="6"><asp:Label ID="lblContent" runat="server"></asp:Label></td> </tr>
</table>        
<%-- <div class="myoper">[追加记录]</div>
    <div id="commentContentTab" class="elements">
        
#1 发表时间:今天 10:10   编辑引用 

颜飞  gghhhh 

    </div>
    
    追加记录
    <asp:TextBox ID="" runat="server" ></asp:TextBox>
    --%>

</form>
</body>
</html>
