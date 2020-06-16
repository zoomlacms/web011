<%@ page language="C#" autoeventwireup="true" inherits="Manage_Content_SchedTask, App_Web_zxhe1krl" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/jquery.js"></script>
<title>计划任务</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">  
    function ShowTabs(type)
    {
        if (type == 1)
        { location.href = 'SchedTask.aspx'; }
        else {
            location.href = 'SchedTask.aspx?type=' + type;
        }
    }
</script>
<style>
    .Task_c td{ width:80px; height:24px; line-height:24px; background:url(/App_Themes/AdminDefaultTheme/images/titlebg2.gif) left no-repeat;}
    .Task_c .cur<%=Request.QueryString["type"] %>{ background:url(/App_Themes/AdminDefaultTheme/images/titlebg1.gif) left no-repeat; color:#fff;}
    .Task_c td:hover{ cursor:pointer;}
     th{ text-align:center;}
    .task_input{ margin-top:5px; margin-bottom:5px;}
</style>
<style>
   
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
	<span>后台管理</span> &gt;&gt;&nbsp;<span><a href="ContentManage.aspx">内容管理</a></span>&nbsp;&gt;&gt;
	&nbsp;<span><a href="SchedTask.aspx">计划任务</a></span>
	<asp:HiddenField ID="HdnModelID" runat="server" />
</div>
    <div>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr align="center" class="Task_c">
                <td id="Td2" class="cur" onclick="ShowTabs(1)">全部任务</td>           
                <td id="TabTitle0" class="cur0" onclick="ShowTabs(0)">未执行 </td>            
                <td id="Td1" class="cur10" onclick="ShowTabs(10)">已执行</td>               
            </tr>
        </table>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" RowStyle-CssClass="tdbg" MouseOverCssClass="tdbgmouseover" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" OnRowCancelingEdit="EGV_RowCancelingEdit" EnableTheming="False"  GridLines="None" Width="100%" CssClass="border" EmptyDataText="当前无计划任务!" OnPageIndexChanging="EGV_PageIndexChanging" BackColor="White" CellPadding="2" CellSpacing="1">
				<Columns>
					<asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true" />
                <asp:TemplateField HeaderText="任务类型">
                    <ItemTemplate>
                        <%# GetTaskType(Eval("TaskType").ToString()) %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="tooltip-demo">
                            <asp:TextBox CssClass="form-control task_input input-sm" data-toggle="tooltip" data-placement="top" Width="100" title="1为定时发布" runat="server" ID="eTaskType" Text='<%#Eval("TaskType") %>'></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="任务内容">
                    <ItemTemplate>
                        <%#Eval("TaskContent") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="tooltip-demo">
                            <asp:TextBox CssClass="form-control task_input input-sm" data-toggle="tooltip" data-placement="top" Width="100" title="输入内容ID" runat="server" ID="eTaskContent" Text='<%#Eval("TaskContent") %>'></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="执行时间">
                    <ItemTemplate>
                        <%#Eval("ExecuteTime") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="tooltip-demo">
                            <asp:TextBox CssClass="form-control task_input input-sm" data-toggle="tooltip" data-placement="top" Width="150" title="执行时间" runat="server" ID="eExecuteTime" Text='<%#Eval("ExecuteTime") %>' onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' })"></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status").ToString()) %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="tooltip-demo">
                            <asp:TextBox CssClass="form-control task_input input-sm" data-toggle="tooltip" data-placement="top" Width="100" title="0为未执行，10为已执行" runat="server" ID="eStatus" Text='<%#Eval("Status") %>'></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                 </asp:TemplateField>
					<asp:TemplateField HeaderText="操作">
						<ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit1" CommandArgument='<%# Container.DisplayIndex %>'>修改</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗');">删除</asp:LinkButton>					    
						</ItemTemplate>
                        <EditItemTemplate>
                     <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("ID") %>'>更新</asp:LinkButton>
                     <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                    </EditItemTemplate>
					</asp:TemplateField>
				</Columns>
				<PagerStyle HorizontalAlign="Center" />
				<RowStyle Height="24px" HorizontalAlign="Center" />
			</ZL:ExGridView>
    </div>
    </form>
    <script src="../../JS/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script >
        !function ($) {
            $(function () {
                // tooltip demo
                $('.tooltip-demo').tooltip({
                    selector: "[data-toggle=tooltip]",
                    container: "body"
                })
            })
        }(jQuery)
    </script>

</body>
</html>
