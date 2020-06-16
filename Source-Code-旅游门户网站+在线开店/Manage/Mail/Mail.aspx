<%@ page language="C#" debug="true" autoeventwireup="true" inherits="manage_Mail, App_Web_0aufvvwl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>邮箱</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/thickbox.css" rel="stylesheet" />
<script type="text/javascript">
    function dialogOpen(str) { 
        document.getElementById("Import").style.display = "block";
        document.getElementById("ImpTip").style.display = "block";
        
    } 
function CheckAll(spanChk)//CheckBox全选
{
    var oItem = spanChk.children;
    var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
    xState = theBox.checked;
    elm = theBox.form.elements;
    for (i = 0; i < elm.length; i++)
        if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
            if (elm[i].checked != xState)
                elm[i].click();
        }
}
</script>

<style type="text/css"media="screen">
#lblKai {position: absolute;width: 218px;visibility: visible;z-index: 301;background-color:#fff;padding-left:5px;top:0;left:0;}
</style>
</head>
<body>
<form id="form1" runat="server">  
    <div class="r_navigation" >
<asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
<table width="100%" border="0" cellpadding="0" cellspacing="1" >
      <tr>
        <td>
    后台管理&gt;&gt;邮箱列表 
 &nbsp;&nbsp;&nbsp;<a href="MailSet.aspx">添加邮箱</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="MailType.aspx">添加类别</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="TypeSet.aspx">类别列表</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0)" onclick="dialogOpen()">导入邮址</a>
        </td>
    </tr>
</table>

    </div>
<div class="clearbox"></div>
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="border">
    <tr class="tdbg">
        <td  style="height: 19px;width:60px">
            类别分类：
        </td>
        <td style="height: 19px;">
            <span> <a href="Mail.aspx">所有邮箱&nbsp;&nbsp;</a></span>|
            <asp:Label ID="lblLabel" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>  
<div class="clearbox"></div>
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
<tr>
<td  colspan="7">
    <div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"> </asp:UpdatePanel>
    <div id="Import"  style="float:left; display:none;">  <asp:FileUpload ID="fileImps" runat="server" /> <asp:Button ID="btnImport" runat="server" OnClientClick="if(document.getElementById('fileImps').value.length==0){alert('请选择Excel(CSV)文件,可下载模板!');return false};"  Text="导入" CausesValidation="true" Width="75px" Height="19px"  OnClick="btnImport_Click"/>
        </div>
      <div id="ImpTip" style="float:left;position:relative; display:none;">
<asp:LinkButton ID="LinkButton1" runat="server" 
CausesValidation="False" OnClick="lbtnSaveTempter_Click"><font color="red">*</font>
<font style="color:#0E529D;">下载[邮箱列表]的邮箱模型CSV导入模板</font>  
</asp:LinkButton>(下载后用EXCEL打开从第二行开始按规范填写并保存即可)       
          <asp:Label ID="lblKai" runat="server" Style="color: Red; font-size:14px;" Text=""></asp:Label>
    </div>
    </div>   
</td>
</tr>
<tr class="gridtitle" align="center" style="height: 25px;"><th  width="50" >选择</th><th  width="50" >ID</th><th  width="200" >别名</th><th  width="400">邮箱</th><th  width="120">类别</th><th  width="200">时间</th><th  width="150">操作</th></tr>
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Lnk_Click">
<ItemTemplate>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" 
    ondblclick="location.href('MailSet.aspx?ID=<%#Eval("ID") %>')">
     <td align="center"> 
          <input name="Item" type="checkbox" value='<%# Eval("id")%>' />
                        
                        <asp:Label ID="LabelHiddenID" runat="server" Text='<%#Eval("ID")%>' Visible="false"></asp:Label>
                    </td>
    <td align="center" style="cursor: pointer" ><%#Eval("ID") %></td>
    <td align="center" title="双击修改" style="cursor: pointer"><%#Eval("FromName") %></td>
<td align="center"  title="双击修改" style="cursor: pointer"><%#Eval("ReEmail") %></td>
<td width="100" align="center"  title="双击修改" style="cursor: pointer"><%#Eval("TypeName") %></td>
<td width="100" align="center" style="cursor: pointer"><%#Eval("CreateTime") %></td>
<td width="150" align="center"> <a href="MailSet.aspx?ID=<%#Eval("ID") %>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteAdmin" OnClientClick=" return confirm('确实要删除此邮箱吗？');" CommandArgument='<%# Eval("ID")%>'>删除</asp:LinkButton> </td></tr>
</ItemTemplate>
</asp:Repeater>
<tr class="tdbg">
    <td style="height: 22px; text-align: center;" colspan="7" class="tdbgleft">
        <span style="text-align: center">共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
        条数据
        <asp:Label ID="Toppage" runat="server" Text="" />
        <asp:Label ID="Nextpage" runat="server" Text="" />
        <asp:Label ID="Downpage" runat="server" Text="" />
        <asp:Label ID="Endpage" runat="server" Text="" />
        页次：
        <asp:Label ID="Nowpage" runat="server" Text="" />/
        <asp:Label ID="PageSize" runat="server" Text="" />页
        <asp:Label ID="pagess" runat="server" Text="" />
        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="26px"
            Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
        条数据/页 转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
    </span>
    </td>
    </tr>
</table> 

全选：<input id="Checkall" type="checkbox" name="Checkall" onclick="javascript: CheckAll(this);" />
<asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click"
    OnClientClick="return confirm('你确定要将所有选择的邮箱删除吗？')" class="C_input" Style="width: 100px;"
    UseSubmitBehavior="true" />  
    <input id="MoveView" value="批量移动" type="button" class="C_input"  onclick="ontips()"   />
 
<div id="Divtips" style="display:none;"  >  
    <div>
    <a id="fancybox-close" style="display: inline;" onclick="tb_remove()" href="javascript:void(0);" >  </a>
 <asp:DropDownList ID="drtype" runat="server"><asp:ListItem ></asp:ListItem></asp:DropDownList> <asp:Button ID="Button1" runat="server" Text="确定" OnClick="btnMove_Click"
    OnClientClick="return confirm('你确定要将所有选择的邮箱移动吗？')" class="C_input" Style="width: 100px;"
 UseSubmitBehavior="true" /> </div></div><br />
</form>
<script>

    function ontips() {
      
     
        document.getElementById("Divtips").style.display = "";
    }
    function tb_remove() {
        document.getElementById("Divtips").style.display = "none";
    }
</script>
</body>
</html>
