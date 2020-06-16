<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ShowContent, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>预览内容</title>
<link href="/App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="/App_Themes/AdminDefaultTheme/thickbox.css" type="text/css" rel="stylesheet" />
<script src="/JS/Common.js" type="text/javascript"></script>
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
<style type="text/css">
    .pics {
        position: relative;
        left: 200px;
        top: -10px;
        display: block;
        height: 18px;
        background: #e8f5ff;
        width: 200px;
        text-align: left;
    }
.r_navigations
{
	border-style: none;
	margin-bottom: 0px;
	line-height: 24px;
	text-align: left;
	clear: both;
	color: #000;
}
.r_navigations a, #r_navigation:link{text-decoration: none;color: #000;	}
.r_navigations a:hover{	color: #c00;text-decoration: underline;}
    .auto-style1
    {
        border-left: 1px solid #e8f5ff;
        border-right: 1px solid #e8f5ff;
        border-top: 1px solid #e8f5ff;
        background: #CBE6FC;
        width: 130px;
        font-weight: bold;
        text-align: center;
        line-height: 20px;
        font-size: 12px;
        height: 22px;
        border-bottom-style: none;
        border-bottom-color: inherit;
        border-bottom-width: 0px;
    }
    .auto-style2
    {
        line-height: 20px;
        border-bottom: 1px solid #fff;
        height: 22px;
    }
    .Photo-style
    {
        width:200px; height:120px; margin-top:6px; border:#b6ff00 1px solid;
    }
    #browse
    {
         float:left;padding-top:3px; padding-right:5px;
    }
    #viewtask
    { 
        float:left;padding-top:4px;display:block; width:16px; height:16px; margin-right:5px;
    }
</style>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script language="JavaScript" type="text/JavaScript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2");
        function ShowTabs(ID) {
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                document.getElementById(arrTabs[tID].toString()).style.display = "none";
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                tID = ID;
            }
        }
        function showCustom(value) {
            var index = parseInt(value);

            for (i = 2; i <= 20; i++) {
                if (i <= index)
                    document.getElementById("Custom" + i).style.display ="";
                else
                    document.getElementById("Custom" + i).style.display ="none";
            }
        }
        var stID = 0;
        var sarrTabTitle = new Array("sTabTitle0", "sTabTitle1", "sTabTitle2");
         function sShowTabs(ID){
            if (ID != stID) {
                if (sarrTabTitle[stID] != null) {
                    document.getElementById(sarrTabTitle[stID].toString()).className = "tabtitle";
                }
                if (sarrTabTitle[ID] != null){
                    document.getElementById(sarrTabTitle[ID].toString()).className = "titlemouseover";
                }
                stID = ID;
            }
        }
        function sshowCustom(value) {
            var index = parseInt(value);

            for (i = 2; i <= 20; i++) {
                if (i <= index)
                    document.getElementById("sCustom" + i).style.display = "";
                else
                    document.getElementById("sCustom" + i).style.display = "none";
            }
        }
        var diag = new Dialog();
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function open_title(ModelID, NodeID) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = "添加内容<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
            diag.URL = "AddContent.aspx?ModelID=" + ModelID + "&NodeID=" + NodeID;
            diag.show();
        }
        function opentitle(url, title) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        }
        function closdlg() {
            Dialog.close();
        }
</script>
<script language="javascript">
        function svcode(obj) {
            var winname = window.open('', '_blank', 'height=1,width=1,top=200,left=300');
            winname.document.open('text/html', 'replace');
            winname.document.writeln(obj);
            winname.document.execCommand('saveas', '', 'code.txt');
            winname.close();
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
</head>
<body onload="sShowTabs(<%=Request.QueryString["type"] %>)">
<form id="form1" runat="server">
<div id="nav_box">
<div class="r_navigation">
<span style="float: right; padding-right: 5px;">
    <a href="SchedTask.aspx" id="viewtask" title="查看计划任务"><img src="../../../Images/ModelIcon/taskview.gif" alt="" /></a>
    <%=GetOper()%>
    <a onclick="opentitle('EditNode.aspx?NodeID=<%=ViewState["NodeID"]%>','配置本节点')"
                href="javascript:void(0);" title="配置本节点">
                <%=lang.LF("配置本节点")%></a></span> 
	<span>后台管理</span> &gt;&gt;&nbsp;<span><a href="ContentManage.aspx">内容管理</a></span>&nbsp;&gt;&gt;
	&nbsp;<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
	<asp:HiddenField ID="HdnModelID" runat="server" />
</div>
</div>
<div style="height:24px;"></div>
<div class="clearbox">
</div>
<table border="0" cellpadding="0" cellspacing="0">
	<tr align="center">
		<td id="TabTitle0" class="titlemouseover" onclick="ShowTabs(0)">
			基本信息
		</td>
		<td id="TabTitle1" class="tabtitle" onclick="ShowTabs(1)">
			信息属性
		</td>
		<td id="TabTitle2" class="tabtitle" onclick="ShowTabs(2)">
			流程控制
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="5" cellspacing="1" class="border">
	<tr class="tdbg">
		<td valign="top" style="margin-top: 0px; margin-left: 0px;">
			<table width="100%" cellpadding="2" cellspacing="1">
				<%-- 基本信息--%>
				<tbody id="Tabs0">
					<tr class="tdbg">
						<td class="tdlefttxt" style="width:130px;">所属节点</td>
						<td class="tdrighttxt">
							<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>                  
					<tr class="tdbg">
						<td class="tdlefttxt">ID</td>
						<td class="tdrighttxt">
							<asp:Label ID="GeneralID" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
					<tr class="tdbg">
						<td class="tdlefttxt">标题</td>
						<td  class="tdrighttxt">
							<asp:Label ID="Title" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
                  <%--  <tr class="tdbg">
						<td class="tdlefttxt">缩略图</td>
						<td  class="tdrighttxt">
                            <asp:Image ID="PicImage"  runat="server" CssClass="Photo-style" AlternateText="该内容暂无图片"  onerror="this.src='/UploadFiles/nopic.gif'" />
						</td>
					</tr>--%>
					<tr class="tdbg">
						<td colspan="2"> 
							<asp:DetailsView ID="DetailsView1"  runat="server" Width="100%" CellPadding="4" GridLines="None" Font-Size="12px" Style="margin-bottom: 0px; margin-top: 0px;"  CssClass="r_navigations" CellSpacing="1">
								<Fields>
								</Fields>
								<FooterStyle Font-Bold="True" BackColor="#FFF" />
								<CommandRowStyle Font-Bold="True" CssClass="r_navigations tdlefttxt"/>
								<RowStyle />
								<FieldHeaderStyle Font-Bold="True" />
								<PagerStyle HorizontalAlign="Center" />
								<HeaderStyle Font-Bold="True" />
								<EditRowStyle />
								<AlternatingRowStyle />
							 </asp:DetailsView> 
						</td>
					 </tr>
				</tbody>
				<%--信息属性--%>
				<tbody id="Tabs1" style="display:none">
					<tr class="tdbg">
						<td class="tdlefttxt">录入者</td>
						<td class="tdrighttxt">
							<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
					<tr class="tdbg">
						<td class="tdlefttxt">点击数</td>
						<td class="tdrighttxt">
							<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
					<tr class="tdbg">
						<td class="tdlefttxt">录入时间</td>
						<td class="tdrighttxt">
							<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
                    <tr class="tdbg">
						<td class="tdlefttxt">更新时间</td>
						<td class="tdrighttxt">
							<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
					<tr class="tdbg">
						<td  class="auto-style1">PDF查看</td>
						<td class="auto-style2">
							<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
				</tbody>
				<%--流程控制--%>
				<tbody id="Tabs2" style="display: none">
					<tr class="tdbg">
						<td class="tdlefttxt" >审核状态<br />
						</td>
						<td class="tdrighttxt">
							<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
					<tr class="tdbg">
						<td class="tdlefttxt" >推荐</td>
						<td class="tdrighttxt">
							<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
						</td>
					</tr>
				</tbody>
			</table>
			<br />
			<center>
				<asp:Button ID="Button5" class="C_input" runat="server" Text="修改/审核" OnClick="Button5_Click" />
				&nbsp;<asp:Button ID="delete" class="C_input" runat="server" Text="删除" OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"
					OnClick="delete_Click" />
				&nbsp;<asp:Button ID="delete1" class="C_input" runat="server" Text="直接退稿" OnClick="delete1_Click" />
				&nbsp;<asp:Button ID="delete2" class="C_input" runat="server" Text="取消审核" OnClick="delete2_Click" />
				&nbsp;<asp:Button ID="delete3" class="C_input" runat="server" Text="设为推荐" OnClick="delete3_Click" />
                &nbsp;<asp:Button ID="Button6" class="C_input" runat="server" Text="取消推荐" OnClick="Button6_Click" />
                &nbsp;<asp:Button ID="Button7" class="C_input" runat="server" Text="浏览文章" 
                    onclick="Button7_Click"/>
			</center>
		</td>
	</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td align="center">
			&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
		</td>
	</tr>
</table>
<div class="clearbox">
</div>
<asp:HiddenField ID="HiddenType" runat="server" />
<asp:HiddenField ID="HiddenModeid" runat="server" />
<asp:HiddenField ID="HiddenGID" runat="server" />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr align="center">
		<td id="sTabTitle0" class="titlemouseover" onclick="sShowTabs(0)">
			<a href="ShowContent.aspx?GID=<%=Request.QueryString["GID"] %>&type=0&modeid=<%=Request.QueryString["modeid"] %>">所有评论</a>
		</td>
		<td id="sTabTitle1" class="tabtitle" onclick="sShowTabs(1)">
			<a href="ShowContent.aspx?GID=<%=Request.QueryString["GID"] %>&type=1&modeid=<%=Request.QueryString["modeid"] %>">已审核评论</a>
		</td>
		<td id="sTabTitle2" class="tabtitle" onclick="sShowTabs(2)">
			<a href="ShowContent.aspx?GID=<%=Request.QueryString["GID"] %>&type=2&modeid=<%=Request.QueryString["modeid"] %>">待审核评论</a>
		</td>
		<td>&nbsp;
			
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="5" cellspacing="1" class="border">
	<tr class="tdbg">
		<td valign="top" style="margin-top: 0px; margin-left: 0px;">
			<table width="100%" cellpadding="2" cellspacing="1" style="background-color: white;">
				<%-- 基本信息--%>
				<tbody id="sTabs0">
					<tr class="tdbg">
						<td colspan="2">
							<table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
								<tr align="center">
									<td width="10%" class="title">
										<asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
									</td>
									<td width="10%" class="title">
										评论ID
									</td>
                                    <td width="10%" class="title" >
                                    评论者
                                    </td>
                                     <td width="10%" class="title">
                                    评论时间
                                    </td>
									<td width="10%" class="title">
										状态
									</td>
									<td width="30%" class="title">
										操作
									</td>
								</tr>
								<asp:Repeater ID="gvCard" runat="server">
									<ItemTemplate>
										<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
											<td height="22" align="center">
												<input name="Item" type="checkbox" value='<%# Eval("CommentID")%>' />
											</td>
											<td height="22" align="center">
												<%# Eval("CommentID")%>
											</td>
                                      <td height="22" align="center">
                                      <a href="/manage/User/UserInfo.aspx?id=<%# Eval("UserID") %>">    
				<%# GetUserName(Eval("UserID", "{0}"))%></a>
            </td>
            <td height="22" align="center">
                <%# Eval("CommentTime", "{0:yyyy-MM-dd}")%>	
            </td>
											
											<td height="22" align="center">
												<%#getcommend(Eval("Audited"))%>
                                            </td>
											<td height="22" align="center">
                                                <a href="ContentView.aspx?CommentID=<%#Eval("CommentID") %>&modeid=<%=HdnModelID.Value %>&GID=<%=HiddenGID.Value %>">预览</a>&nbsp;&nbsp;
                                                <a href="EditComment.aspx?CommentID=<%#Eval("CommentID") %>&modeid=<%=HdnModelID.Value %>&GID=<%=HiddenGID.Value %>">修改</a>&nbsp;&nbsp; 
                                                <a href="ShowContent.aspx?menu=<%# Eval("Audited") %>&CommentID=<%#Eval("CommentID") %>&modeid=<%=HdnModelID.Value %>&GID=<%=HiddenGID.Value %>">审核操作</a>&nbsp;&nbsp; 
                                                <a href="ShowContent.aspx?menu=del&CommentID=<%#Eval("CommentID") %>&modeid=<%=HdnModelID.Value %>&GID=<%=HiddenGID.Value %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
											</td>
										</tr>
									</ItemTemplate>
								</asp:Repeater>
								<tr class="tdbg">
									<td height="22" colspan="6" align="center" class="tdbgleft">
										共
										<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
										个信息
										<asp:Label ID="Toppage" runat="server" Text="" />
										<asp:Label ID="Nextpage" runat="server" Text="" />
										<asp:Label ID="Downpage" runat="server" Text="" />
										<asp:Label ID="Endpage" runat="server" Text="" />
										页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
											Text="" />页
										<asp:Label ID="pagess" runat="server" Text="" />个信息/页 转到第<asp:DropDownList ID="DropDownList1"
											runat="server" AutoPostBack="True">
										</asp:DropDownList>
										页
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
				<%# Eval("CommentID")%>
			</table>
		</td>
	</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td align="center">
			<br />
			<asp:Button ID="Button1" class="C_input" Text="批量删除" runat="server" OnClick="Button1_Click"
				OnClientClick="if(!IsSelectedId()){alert('请选择提交项');return false;}else{return confirm('你确定要提交选中内容吗？')}" />&nbsp;
			&nbsp;
			<asp:Button ID="Button3" class="C_input" Text="批量审核" runat="server" OnClick="Button3_Click"
				OnClientClick="if(!IsSelectedId()){alert('请选择提交项');return false;}else{return confirm('你确定要提交选中内容吗？')}" />&nbsp;
			&nbsp;
			<asp:Button ID="Button4" class="C_input" Text="批量取消审核" runat="server" OnClick="Button4_Click"
				OnClientClick="if(!IsSelectedId()){alert('请选择提交项');return false;}else{return confirm('你确定要提交选中内容吗？')}" />&nbsp;
			&nbsp;
			<input name="Cancel" type="button" class="C_input" id="Button2" value="取消" onclick="history.go('-1');" />
		</td>
	</tr>
</table> 
</form>  
<script>  
var type;
var typeDes;
$("#<%=DetailsView1.ClientID%> tr").each(function (trindex, tritem) { 
    $(tritem).find("td").each(function (tdindex, tditem) {  
        type = $(tditem).html(); 
        if (type.indexOf('<IMG') < 0 && type.indexOf('<img') < 0) {
        if (type.indexOf('.jpg') >= 0 || type.indexOf('.gif') >= 0 || type.indexOf('.png') >= 0 || type.indexOf('.bmp') >= 0 || type.indexOf('.jpeg') >= 0)
        {  
           // typeDes = "<a href='/UploadFiles/" + type + "' target='_blank'><img src='/UploadFiles/" + type + "' width='80' /></a>";
            if (type.indexOf('图片地址') >= 0||type.indexOf('文件地址') >= 0) {
                type = type.split("$");
                var strDes = "";
                for (var i = 0; i < type.length; i++) {
                    type[i] = type[i].split("|");
                    if (type[i].length > 0) { 
                        if (type[i][1].indexOf('http://') >= 0)
                            strDes += " <a href='" + type[i][1] + "' target='_blank'><img src='" + type[i][1] + "' width='80' /></a>";
                        else if (type[i][1].indexOf('UploadFiles/') >= 0)
                            strDes += " <a href='/" + type[i][1] + "' target='_blank'><img src='/" + type[i][1] + "' width='80' /></a>";
                        else
                            strDes += " <a href='/UploadFiles/" + type[i][1] + "' target='_blank'> <img src='/UploadFiles/" + type[i][1] + "' width='80' /></a>";
                    }
                }
                typeDes = strDes;
            }
            else  if (type.indexOf('http://') >= 0)
                typeDes = "<a href='" + type + "' target='_blank'><img src='" + type + "' width='80' /></a>";
            else if (type.indexOf('UploadFiles/') >= 0) {
                    typeDes = "<a href='/" + type + "' target='_blank'><img src='/" + type + "' width='80' /></a>";
            }
            else typeDes = "<a href='/UploadFiles/" + type + "' target='_blank'><img src='/UploadFiles/" + type + "' width='80' /></a>";
                $(tditem).html(typeDes);
            }
            } 
    });
});
</script>
</body>
</html>