<%@ page language="C#" autoeventwireup="true" inherits="MIS_Task_TaskInfoView, App_Web_znlyx4aw" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>查看讨论</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js" ></script>
<script src="../../Plugins/Ckeditor/ckeditor.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="Meno">
<div class="dialog_head"><a href="javascript:void(0)" onclick="javascript:Window.Close();"> [关闭窗口]</a><span>查看讨论</span>  </div>
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
<tr><th align="right">参与人 :</th><td align="left" colspan="5"><asp:Label ID="lblJoiner" runat="server"></asp:Label></td>  
</tr>
<tr>
<td  align="left" colspan="6"  class="popup_ti"> <strong> 描述:</strong> </td> </tr>
<tr><td><asp:Label ID="lblContent" runat="server"></asp:Label></td> </tr>
</table>  
    
<div class="myoper">   <a href="#"></a>[发表看法]  </div>
<div class="backList">
    <table class="arr" width="100%" border="0"> 
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
    <tr><td><div class="arr_posi" id="comment_217608">
     <table   width="100%" border="0"> 
    <tbody>
    <tr>
    <td colspan="2">
        <div class="ti">
        <div class="fl">
        <span><b>#1</b> </span>
        发表时间:<%#Eval("CreateTime","{0:M月d日 hh:mm}") %>
        </div>
        <div class="fr"> 			    		
        <a class="" href="AddTalk.aspx?ID=<%#Eval("ID") %>">编辑</a>
        <a class="" href="javascript:void(0)" >引用</a>				 
        <a class="" href="javascript:void(0)" >加入索引</a> 
        </div>
        </div>	
    </td>
    </tr>					
    <tr>
    <td  >
        <div class="img_bg_le ln_per_bg">
        </div>
        <div class="cb"></div>
        <div class="pers_mess">
        <span style="cursor:pointer;" ><b class="ico_le ub_offline_ico"></b><a rel="1212861" class="ub_comm" href="javascript:void(0);"><%#Eval("Inputer") %></a></span>
        </div>
        </td>
        <td class="arr_text">
        <div class="text" id='commentContent_217608'>
        <div><%#Eval("Content") %></div>
        </div>
        <div class="cb"></div>
        <div class="fl">						
        </div>
        <div class="fr">
        <div class="txt_oper" onclick="scroll(0,0)">
        <b class="sico_btn stop_bico"></b><a href="#top">回到顶端</a> 
        </div>
        </div>
        <div class="cb"></div>
    </td>
    </tr>
    </tbody>
    </table>
    </div></td></tr>
</ItemTemplate>
</asp:Repeater> 
    <tr class="tdbg">
<td class="tdbgleft" colspan="6" align="center" >共
<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
条信息
<asp:Label ID="Toppage" runat="server" Text="" />
<asp:Label ID="Nextpage" runat="server" Text="" />
<asp:Label ID="Downpage" runat="server" Text="" />
<asp:Label ID="Endpage" runat="server" Text="" />
页次：
<asp:Label ID="Nowpage" runat="server" Text="" />
/
<asp:Label ID="PageSize" runat="server" Text="" />
页
<asp:Label ID="pagess" runat="server" Text="" />
条信息/页 转到第
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
页 </td>
</tr></table>
 <div class="clear"></div>
</div>         
<div class="popup_ti"><strong> 发表看法</strong></div> 
 <div id="">
 <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
   <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td  align="right" colspan="2">   <asp:TextBox TextMode="MultiLine" ID="TextProContent" runat="server" width="500px" height="200px"></asp:TextBox></td></tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td   class="tdbgleft" align="right" ><strong>附件：</strong></td>
    <td> 
        <asp:FileUpload ID="Files" runat="server" class="M_input" onkeydown="event.returnValue=false;"   onpaste="return false" />
        <asp:Label ID="lbMsg" runat="server" ForeColor="Red" ></asp:Label> 
        </td>
    </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td colspan="2"><asp:Button Text="确定"  runat="server" ID="BtnCommit" CssClass="i_bottom"  OnClick="Button_Click"/></td>
    </tr>
    </div>
  <script id="headscript" type="text/javascript">
      //<![CDATA[
      CKEDITOR.replace('TextProContent',
{
    enterMode: 2,
    width: '100%',
    shiftEnterMode: 2,
    toolbar: [['Source', '-', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
});
      //]]>
</script>

</form>
</body>
</html>
