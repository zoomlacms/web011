<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_AddEditModel, App_Web_x2m1jeiy" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<title>编辑模型</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table class="table table-striped table-bordered table-hover">
	<tr>
		<td class="spacingtitle" colspan="2" align="center">
			<asp:Literal ID="LTitle" runat="server" ></asp:Literal>
		</td>
	</tr>
	<tr class="tdbg">
		<td class="tdbgleft" style="width: 300px" >
			<strong><%=bll.GetModelType(Convert.ToInt32(Request["ModelType"])) %>名称：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtModelName" class="form-control pull-left" runat="server" Width="156" MaxLength="200" onkeyup="Getpy('TxtModelName','TxtTableName')" AutoPostBack="True" />
            <span class="spanl_30">
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">内容模型名称不能为空</asp:RequiredFieldValidator></span>
		</td>
	</tr>
	<tr class="tdbg">
		<td class="tdbgleft">
			<strong>创建的数据表名：</strong>
		</td>
		<td>
            <div class="input-group pull-left">
            <asp:Label CssClass="input-group-addon" ID="LblTablePrefix" runat="server"  />
            <asp:TextBox ID="TxtTableName" CssClass="form-control" runat="server" AutoPostBack="True" style="width:150px;" />
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtTableName">数据表名不能为空</asp:RequiredFieldValidator>
		</td>
	</tr>
    <tr class="tdbg" id="PubType1" visible="false" runat="server">
            <td class="tdbgleft">
                <strong>互动类型：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="PubType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">评论</asp:ListItem>
                    <asp:ListItem Value="1">投票</asp:ListItem>
                    <asp:ListItem Value="2">活动</asp:ListItem>
                    <asp:ListItem Value="3">留言</asp:ListItem>
                    <asp:ListItem Value="4">问券调查</asp:ListItem>
                    <asp:ListItem Value="5">统计</asp:ListItem>
                    <asp:ListItem Value="6">竞标</asp:ListItem>
                </asp:RadioButtonList>
             </td>
        </tr>
	<tr class="tdbg">
		<td class="tdbgleft">
			<strong>项目名称：</strong><br />
			例如：文章、软件、图片、商品
		</td>
		<td>
			<asp:TextBox ID="TxtItemName" runat="server" CssClass="form-control pull-left" Width="156" MaxLength="20" />
            <span class="spanl_30"><font color="red">*</font>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtItemName" ErrorMessage="RequiredFieldValidator">项目名称不能为空</asp:RequiredFieldValidator></span>
		</td>
	</tr>
	<tr class="tdbg">
		<td class="tdbgleft">
			<strong>项目单位：</strong>
			<br />
			例如：篇、个、张、件
		</td>
		<td>
			<asp:TextBox ID="TxtItemUnit" runat="server" CssClass="form-control pull-left" Width="156" MaxLength="20" />
            <span class="spanl_30"><font color="red">*</font>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtItemUnit" ErrorMessage="RequiredFieldValidator">项目单位不能为空</asp:RequiredFieldValidator></span>
		</td>
	</tr>
   <tr class="tdbg">
		<td class="tdbgleft">
			<strong>是否复制：</strong>
			  <br />
			  确定模型是否可以复制
		</td>
		<td>
           <input type="checkbox" runat="server" id="rblCopy" class="switchChk"  checked="checked" />
		</td>
	</tr>
    <tr class="tdbg">
		<td class="tdbgleft">
			<strong>是否批量添加：</strong>
			  <br />
			  确定用户中心是否可以批量添加
		</td>
		<td>
            <input type="checkbox" runat="server" id="rblIslotsize" class="switchChk"/>
		</td>
	</tr>
    <tr class="tdbg">
		<td class="tdbgleft">
			<strong>是否文件工厂:</strong>
			  <br />
			  文件工厂用于批量生成Word文档
		</td>
		<td>
            <input type="checkbox" runat="server" id="FileFactory" class="switchChk"/>
		</td>
	</tr>
	<tr class="tdbg">
		<td class="tdbgleft">
			<strong>项目图标：</strong><%--<br />
			图标存放在~/Images/ModelIcon/目录下--%>
		</td>
		<td>
			<asp:TextBox ID="TxtItemIcon" CssClass="form-control pull-left" Text="Default.gif" runat="server" Width="156" />
			<span class="spanl_30 pull-left" style="margin-right:5px;"><span id="imgIcon"></span><=</span>
            <button type="button" onclick="ShowIcon()" class="btn btn-primary">选择图标</button>
		</td>
	</tr>
	<tr class="tdbg">
		<td class="tdbgleft">
			<strong>模型描述：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Width="365px" Height="77px" Rows="6" />
		</td>
	</tr>
    <tr class="tdbg" ID="RBLMultiFlag1" runat="server" visible="false">
      <td class="tdbgleft"><strong>是否多条记录：</strong></td>
      <td>
          <asp:RadioButtonList ID="RBLMultiFlag" runat="server" RepeatDirection="Horizontal" >
              <asp:ListItem Selected="True" Value="0">一个用户只能输入一条此模型信息</asp:ListItem>
              <asp:ListItem Value="1">一个用户可以输入多条此模型信息</asp:ListItem>
          </asp:RadioButtonList>
      </td>
    </tr>
	<tr class="tdbgbottom">
		<td colspan="2" class="text-center">
			<asp:HiddenField ID="HdnModelId" runat="server" />
			<asp:Button ID="EBtnSubmit"  Text="保 存" CssClass="btn btn-primary"  OnClick="EBtnSubmit_Click" runat="server" />
			&nbsp;&nbsp;
			<input name="Cancel" type="button"  id="Cancel" class="btn btn-primary" value="取消" onclick="window.location.href='ModelManage.aspx?ModelType=<%=Request["ModelType"] %>';" />
		</td>
	</tr>
</table>
    <div id="icons" style="display:none"></div>
<style>.spanl_30{ line-height:36px; margin-left:5px;}</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<script type="text/javascript" src="/JS/chinese.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    $("body").ready(function(){
        $("#imgIcon").attr("class",$("#TxtItemIcon").val());
            
    });
    function LoadIcon(){
        $("[name=glyphicon]").click(function () {
            $("#TxtItemIcon").val($(this).prev().prev().attr("class"));
            $("#imgIcon").attr("class", $(this).prev().prev().attr("class"));
            diag.CloseModal();
        });
    }
    var diag=new ZL_Dialog();
    diag.title="选择图标";
    diag.ajaxurl="/Common/icon.html";
    function ShowIcon(){
        diag.ShowModal();
    }
function ChangeTxtItemIcon(icon)
{
    document.getElementById("<%= TxtItemIcon.ClientID %>").value = icon;
}
function Getpy(ontxt, id) {
    if ('<%=Request["ModelID"] %>' == "") {
        var str = document.getElementById(ontxt).value.trim();
        if (str == "") {
            document.getElementById(id).value = "";
            return;
        }
        var arrRslt = makePy(str);
        if (arrRslt.length > 0) {
            document.getElementById(id).value = arrRslt.toString().toLowerCase();
            if (document.getElementById(id).value.indexOf(',') > -1) {//判断栏目名称有多音字后栏目标识名“，”并去掉逗号后面的数据
                var str = document.getElementById(id).value;
                document.getElementById(id).value = str.split(',', 1);
            }
        }
    }
}
</script>
</asp:Content>