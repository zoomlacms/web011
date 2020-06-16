<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_AddModelField, App_Web_gqexlk3x" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<title>字段管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
<ol class="breadcrumb">
<li><a href="<%=customPath2 %>I/Main.aspx">工作台</a></li>
<li><a href="<%=customPath2 %>I/Config/SiteOption.aspx">系统设置</a></li>
<li><a href="ModelManage.aspx?ModelType=<%=Request.QueryString["ModelType"] %>"><%=bll.GetModelType(Convert.ToInt32(Request.QueryString["ModelType"]))%></a></li>
<li><a href="ModelField.aspx?ModelId=<%=Request.QueryString["ModelID"] %>&ModelType=<%=Request.QueryString["ModelType"] %>">字段列表</a></li>
<li><asp:Label ID="lblModel" runat="server" Text="Label"></asp:Label>当前表:<asp:Label ForeColor="Red" Style="margin-left: 5px;" ID="Label1" runat="server" Text=""></asp:Label></li>
<%= Call.GetHelp(64) %>
</ol>
<table class="table table-striped table-bordered table-hover">
<tr>
	<td style="width: 200px;">
		<strong>字段别名：</strong>
	</td>
	<td>
		<asp:TextBox ID="Alias" runat="server" Width="200" CssClass="form-control pull-left" MaxLength="20" onkeyup="Getpy('Alias','Name')"></asp:TextBox>
		<span class="tips" style="color: #ff0066;">*</span>
		<span class="tips" style="color: #808000">如：文章标题</span>
	</td>
</tr>
<tr>
	<td>
		<strong>字段名称：</strong>
	</td>
	<td>
		<asp:TextBox ID="Name" MaxLength="50" Width="200" CssClass="form-control pull-left" runat="server"></asp:TextBox>
		<span class="tips" style="color: #ff0066;">*</span>
		<span class="tips" style="color: #808000">字段名由字母、数字、下划线组成，不接受空格</span>
	</td>
</tr>
<tr>
	<td>
		<strong>字段提示：</strong>
	</td>
	<td>
		<asp:TextBox ID="Tips" CssClass="form-control pull-left" Width="200" MaxLength="50" runat="server"></asp:TextBox>
		<span class="tips" style="color: #808000">显示在字段别名下方作为重要提示的文字</span>
	</td>
</tr>
<tr>
	<td>
		<strong>字段描述：</strong>
	</td>
	<td>
		<asp:TextBox ID="Description" Style="max-width: 300px;" CssClass="form-control pull-left" runat="server" Columns="40" Rows="6" TextMode="MultiLine" Height="78px"></asp:TextBox>
	</td>
</tr>
<tr>
	<td>
		<strong>是否必填：</strong>
	</td>
	<td>
		<input type="checkbox" runat="server" id="IsNotNull" class="switchChk" />
	</td>
</tr>
<tr>
	<td>
		<strong>是否复制：</strong>
	</td>
	<td>
		<div>
			<input type="checkbox" runat="server" id="rblCopy" class="switchChk" />
			<span style="color: #808000;">当复制模型时，该字段是否允许复制</span>
		</div>
	</td>
</tr>
<tr>
	<td>
		<strong>设为下载专用字段：</strong>
		
	</td>
	<td>
		<input type="checkbox" runat="server" id="SetDownFiled" class="switchChk" onchange="$('#SetDownFiled_Btn').click();" /><span style="color: #808000;"> 启用此选项将关联下载服务器↓↓</span>
		<asp:Button runat="server" ID="SetDownFiled_Btn" style="display:none;" OnClick="RadioButtonList1_SelectedIndexChanged" />
	</td>
</tr>
<tr class="tdbg" id="downserver" runat="server" visible="false">
	<td>
		<strong>关联下载服务器：</strong><br />
		[<a href="../file/DownServerManage.aspx" target="_blank">管理下载服务器</a>]
	</td>
	<td>
		<asp:DropDownList ID="serverlist" runat="server" Style="max-width: 300px;" CssClass="form-control pull-left"></asp:DropDownList>
	</td>
</tr>
<tr>
	<td>
		<strong>是否在前台显示：</strong>
	</td>
	<td>
		<div>
			 <input type="checkbox" runat="server" id="IsShow" class="switchChk" checked="checked" />
			<span style="color: #808000">选择“否”可作为相关隐藏识别符而不能输出在前台(仅能后台录入)</span>
		</div>
	</td>
</tr>
<tr>
	<td>
		<strong>是否批量添加：</strong>
	</td>
	<td>
		<div>
			 <input type="checkbox" runat="server" id="Islotsize" class="switchChk" />
			 <span style="color: #808000;">字段类型只允许文本类型</span>
		</div>
	</td>
</tr>
<tr>
	<td>
		<strong>是否允许内链：</strong>
	</td>
	<td>
		 <input type="checkbox" runat="server" id="IsChain" class="switchChk" />
	</td>
</tr>
<tbody runat="server" id="tbSearch" style="" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
	<tr>
		<td>
			<strong>是否在搜索表单显示：</strong>
		</td>
		<td>
			 <input type="checkbox" runat="server" id="IsSearchForm" class="switchChk" />
		</td>
	</tr>
</tbody>
<tr>
	<td>
		<strong>字段类型：</strong>
	</td>
	<td>
		<asp:RadioButtonList ID="Type" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" onclick="SelectModelType()"></asp:RadioButtonList>
	</td>
</tr>
<!--  单行文本   -->
<tbody id="DivTextType" runat="server">
	<tr>
		<td>
			<strong>文本框长度：</strong>
		</td>
		<td>
			<asp:TextBox ID="TitleSize" CssClass="form-control pull-left" Width="70" runat="server" Columns="10" MaxLength="4">35</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>是否为密码：</strong>
		</td>
		<td>
			 <input type="checkbox" runat="server" id="IsPassword" class="switchChk" />
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="TextType_DefaultValue" Style="max-width: 200px;" CssClass="form-control pull-left" runat="server" Columns="10"></asp:TextBox>
			<span class="tips">[<a href="javascript:void(0);" onclick="checkDef();">当前用户名</a>]
				[<a href="javascript:void(0);" onclick="checkDef('匿名');">匿名</a>]
				[<a href="javascript:void(0);" onclick="checkDef('本站作者');">本站作者</a>]
			</span>
		</td>
	</tr>
</tbody>
<!--  多行文本(不支持Html)    -->
<tbody runat="server" id="DivMultipleTextType" style="display: none">
	<tr>
		<td>
			<strong>显示的宽度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MultipleTextType_Width" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">500</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的高度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MultipleTextType_Height" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">200</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
</tbody>
<!--  多行文本(支持Html)    -->
<tbody runat="server" id="DivMultipleHtmlType" style="display: none">
	<tr>
		<td>
			<strong>编辑器类型：</strong>
		</td>
		<td>
			<asp:DropDownList ID="IsEditor" CssClass="form-control" Style="max-width: 150px;" runat="server">
				<asp:ListItem Value="1">简洁型编辑器</asp:ListItem>
				<asp:ListItem Value="2">标准型编辑器</asp:ListItem>
				<asp:ListItem Value="3">增强型编辑器</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许Word转换：</strong>
		</td>
		<td>
			<input type="checkbox" id="AllowWord_Chk" runat="server" checked="checked" class="switchChk" />
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的宽度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MultipleHtmlType_Width" runat="server" CssClass="form-control pull-left" Style="max-width: 80px;" Columns="10" MaxLength="4">715</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的高度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MultipleHtmlType_Height" runat="server" CssClass="form-control pull-left" Style="max-width: 80px;" Columns="10" MaxLength="4">400</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
</tbody>
<!--  单选项    -->
<tbody id="DivOptionType" style="display: none" runat="server">
	<tr>
		<td>
			<strong>分行键入每个选项：</strong>
		</td>
		<td onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<input id="Button3" type="button" value="从数据字典中选择选项" class="btn btn-primary" onclick="SelectDictionary('RadioType_Content');" />
			<input id="Button5" type="button" value="添加数据字段" class="btn btn-primary" style="width: 150px;" onclick='SubPage("RadioType_Content");' /><br />
			<asp:TextBox ID="RadioType_Content" runat="server" Style="margin-top: 5px;" TextMode="MultiLine" Columns="40" Rows="6" Width="320px" CssClass="form-control pull-left" Height="80px"></asp:TextBox>
			<span style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="RadioType_Default" CssClass="form-control pull-left" Style="max-width: 320px;" runat="server"></asp:TextBox>
			<span class="tips" style="color: #808000">注：没有数据录入的默认值，与前台显示无关.</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示选项：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="RadioType_Type" runat="server" RepeatColumns="2">
				<asp:ListItem Selected="True" Value="1">单选下拉列表框</asp:ListItem>
				<asp:ListItem Value="2">单选按钮</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>是否设置属性值：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="RadioType_Property" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="True" Selected="True">是</asp:ListItem>
				<asp:ListItem Value="False">否</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
</tbody>
<!--  多选项    -->
<tbody runat="server" id="DivListBoxType" style="display: none">
	<tr>
		<td>
			<strong>分行键入每个选项：</strong>
		</td>
		<td onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<input id="Button4" type="button" value="从数据字典中选择选项" class="btn btn-primary" onclick="SelectDictionary('ListBoxType_Content');" />
			<input id="Button6" type="button" value="添加数据字段" class="btn btn-primary" onclick="SubPage('ListBoxType_Content');" /><br />
			<asp:TextBox ID="ListBoxType_Content" Style="margin-top: 5px;" runat="server" TextMode="MultiLine" Columns="40" Rows="6" Height="80px" Width="285px" CssClass="form-control pull-left"></asp:TextBox>
			<span style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示选项：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="ListBoxType_Type" runat="server" RepeatColumns="3">
				<asp:ListItem Selected="True" Value="1">复选框</asp:ListItem>
				<asp:ListItem Value="2">多选列表框</asp:ListItem>
				<asp:ListItem Value="3">多填选项框</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
</tbody>
<!--  日期型    -->
<tbody runat="server" id="DivDateType" style="display: none">
	<tr>
		<td>
			<strong>日期类型：</strong>
		</td>
		<td>
			<table cellspacing="0" cellpadding="0" width="100%" border="0" style="">
				<tr class="tdbg">
					<td>
						<asp:RadioButtonList ID="DateSearchType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="0" Selected="True">默认空</asp:ListItem>
							<asp:ListItem Value="1">自抽取</asp:ListItem>
						</asp:RadioButtonList>
					</td>
				</tr>
				<tr>
					<td>
						<asp:TextBox ID="DateSearchRang" CssClass="form-control pull-left" runat="server" TextMode="MultiLine" Columns="40" Rows="6" Height="78px" Width="248px" Visible="false"></asp:TextBox>
						<asp:RadioButtonList ID="DateSearchUnit" runat="server" RepeatDirection="Horizontal" Visible="false">
							<asp:ListItem Value="0" Selected="True">小时</asp:ListItem>
							<asp:ListItem Value="1">天</asp:ListItem>
							<asp:ListItem Value="2">月</asp:ListItem>
							<asp:ListItem Value="3">年</asp:ListItem>
						</asp:RadioButtonList>
					</td>
					<td>
						<span style="color: red; display: none;">选择了自定范围时请输入此项内容,格式：范围名|范围<br />
							分行输入范围，单位选择 天 如：<br />
							3天内|0-3<br />
							7天内|0-7<br />
							7天-15天|7-15<br />
							1个月内|0-30</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</tbody>
<!--  图片类型    -->
<tbody runat="server" id="DivPicType" style="display: none">
	<tr>
		<td>
			<strong>图片是否加水印：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="RBLPicWaterMark" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="1">是</asp:ListItem>
				<asp:ListItem Selected="True" Value="0">否</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>开启选择已上传文件：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="rblSelUpfile" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="1">是</asp:ListItem>
				<asp:ListItem Selected="True" Value="0">否</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的图片大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtSPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024"></asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的图片类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtPicExt" CssClass="form-control pull-left" Style="max-width: 200px;" Text="jpg|png|gif|bmp|jpeg" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  多图片    -->
<tbody runat="server" id="DivMultiPicType" style="display: none">
	<tr>
		<td>
			<strong>缩略图选项：</strong>
		</td>
		<td>
			<span class="tips" style="float: left; margin-left: 0;">
				<asp:CheckBox ID="ChkThumb" runat="server" Text="是否保存缩略图地址" />保存缩略图地址字段：</span>
			<asp:TextBox ID="TxtThumb" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" Columns="20"></asp:TextBox>
			<span style="color: Red; display: none;">保存缩略图地址字段名不能与主字段名重复！</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>图片是否加水印：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="RBLWaterMark" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="1">是</asp:ListItem>
				<asp:ListItem Selected="True" Value="0">否</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的图片大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024"></asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的图片类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TextImageType" CssClass="form-control pull-left" Text="jpg|png|gif|bmp|jpeg" Style="max-width: 200px;" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  图片入库    -->
<tbody runat="server" id="DivSqlType" style="display: none">

	<tr>
		<td>
			<strong>允许上传的图片大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024"></asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：仅支持2005及更高SQL Server版本</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的图片类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtPicSqlType" CssClass="form-control pull-left" Style="max-width: 200px;" Text="jpg|png|gif|bmp|jpeg" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  文件入库    -->
<tbody runat="server" id="DivSqlFile" style="display: none">

	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMSqlFileSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024"></asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：仅支持2005及更高SQL Server版本</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtSqlFiletext" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|zip|doc|docx等等</span>
		</td>
	</tr>
</tbody>
<!--  文件类型    -->
<tbody runat="server" id="DivSmallFileType" style="display: none">
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxFileSizes" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024"></asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>开启选择已上传文件：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="rblSelUploadFile" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="1">是</asp:ListItem>
				<asp:ListItem Selected="True" Value="0">否</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileTypes" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  下拉文件类型    -->
<tbody runat="server" id="DivPullFileType" style="display: none">
	<tr>
		<td>
			<strong>文件路径：</strong>
		</td>
		<td>
			<asp:TextBox ID="PullFileText" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server"></asp:TextBox>
			<span class="tips" style="color: Blue">填写图片存储的路径如：UploadFiles/demo</span>
		</td>
	</tr>
</tbody>
<!--  多文件类型    -->
<tbody runat="server" id="DivFileType" style="display: none">
	<tr>
		<td>
			<strong>保存文件大小设置：</strong>
		</td>
		<td>
			<span style="float: left; line-height: 32px;">
				<asp:CheckBox ID="ChkFileSize" runat="server" Text="是否保存文件大小" Checked="false" /><strong style="margin-left: 5px;">保存文件大小字段名：</strong></span>
			<asp:TextBox ID="TxtFileSizeField" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" Columns="20"></asp:TextBox>
			<span style="color: Red; display: none;">注：字段名由字母、数字、下划线组成，并且仅能字母开头，不以下划线结尾。不能与已有字段名重复</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>选项：</strong>
		</td>
		<td>
			<asp:CheckBox ID="IsSwfFileUpload" runat="server" Text="是否智能多文件上传" Checked="false" /><br />
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxFileSize" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="5" Text="1024"></asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileType" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
</tbody>
<!--  单选 多选    -->
<tbody runat="server" id="DivOperatingType" style="display: none">
	<tr>
		<td>
			<strong>分行键入</strong><br />
			每个平台选项：
		</td>
		<td>
			<asp:TextBox ID="TxtOperatingOption" CssClass="form-control pull-left" runat="server" TextMode="MultiLine" Style="max-width: 300px;" Columns="40" Rows="6"></asp:TextBox>
			<span style="color: red">*</span> <span style="color: blue">注：一行一个默认项</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>文本框长度：</strong>
		</td>
		<td>
			<asp:TextBox ID="OperatingType_TitleSize" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="10" MaxLength="4">35</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="OperatingType_DefaultValue" Text="Win2000|XP|Win2003" Style="max-width: 200px;" CssClass="form-control pull-left" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: green">例：Win2000|XP|Win2003</span>
		</td>
	</tr>
</tbody>
<!--  超链接    -->
<tbody runat="server" id="DivSuperLinkType" style="display: none">
	<tr>
		<td>
			<strong>文本框长度：</strong>
		</td>
		<td>
			<asp:TextBox ID="SuperLinkType_TitleSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">50</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="SuperLinkType_DefaultValue" runat="server" Columns="30" Style="max-width: 200px;" CssClass="form-control pull-left"></asp:TextBox>
			<span class="tips" style="color: green">例：http://127.0.0.1/</span>
		</td>
	</tr>
</tbody>
<!--  多级选项    -->
<tbody runat="server" id="DivGradeOptionType" style="display: none">
	<tr>
		<td>
			<strong>选择分级数据分类：</strong>
		</td>
		<td>
			<asp:DropDownList ID="GradeOptionType_Cate" CssClass="form-control" runat="server" Style="max-width: 200px;"></asp:DropDownList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>选项下拉框排列格式化：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="GradeOptionType_Direction" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="0" Selected="True">一行横排</asp:ListItem>
				<asp:ListItem Value="1">多行竖排</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
</tbody>
<!--  数字类型    -->
<tbody runat="server" id="DivNumType" style="display: none">
	<tr>
		<td>
			<strong>文本框长度：</strong>
		</td>
		<td>
			<asp:TextBox ID="NumberType_TitleSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">35</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>数字类型：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="NumberType_Style" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Selected="True" Value="1" onclick="show(this.value);">整数</asp:ListItem>
				<asp:ListItem Value="2" onclick="show(this.value);">小数</asp:ListItem>
				<asp:ListItem Value="3" onclick="show(this.value);">货币</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr class="tdbg" id="showdec" style="display: none" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<td>
			<strong>小数位：</strong>
		</td>
		<td>
			<asp:TextBox ID="txtdecimal" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Text="0"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>
			<strong>默认值：</strong>
		</td>
		<td>
			<asp:TextBox ID="NumberType_DefaultValue" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" Columns="10"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>
			<strong>搜索设置：</strong>
		</td>
		<td>
			<asp:RadioButtonList ID="NumSearchType" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="1" Selected="True">精确搜索</asp:ListItem>
				<asp:ListItem Value="0">范围搜索</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<td>
			<strong>搜索范围：</strong>
		</td>
		<td>
			<table cellspacing="0" cellpadding="0" width="100%" border="0" style="text-align: center">
				<tr class="tdbg">
					<td>
						<asp:RadioButtonList ID="NumRangType" runat="server" RepeatDirection="Horizontal">
							<asp:ListItem Value="1" Selected="True">下限-上限</asp:ListItem>
							<asp:ListItem Value="0">自定范围</asp:ListItem>
						</asp:RadioButtonList>
					</td>
					<td>
						<span style="color: red">选择了范围搜索时，此设置才有效</span>
					</td>
				</tr>
				<tr>
					<td>
						<asp:TextBox ID="NumSearchRange" CssClass="form-control pull-left" runat="server" TextMode="MultiLine" Columns="40" Rows="6" Height="87px" Width="255px"></asp:TextBox><br />
					</td>
					<td>
						<span style="color: red">选择了自定范围时请输入此项内容,格式：范围名|范围<br />
							分行输入范围如：<br />
							500元以下|0-500<br />
							500元-1000元|500-1000<br />
							1000元以上|1000</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</tbody>
<!-- 双时间字段 -->
<tbody id="DivDoubleDateType" style="display: none" runat="server"></tbody>
<!--颜色代码-->
<script type="text/javascript">
	function SelectColor(t, clientId) {
		var url = "../Common/SelectColor.aspx?d=f&t=6";
		var old_color = (document.getElementById(clientId).value.indexOf('#') == 0) ? '&' + document.getElementById(clientId).value.substr(1) : '&' + document.getElementById(clientId).value;
		var color = "";
		if (document.all) {
			color = showModalDialog(url + old_color, "", "dialogWidth:18.5em; dialogHeight:16.0em; status:0");
			if (color != null) {
				document.getElementById(clientId).value = color;
			} else {
				document.getElementById(clientId).focus();
			}
		} else {
			color = window.open(url + '&' + clientId, "hbcmsPop", "top=200,left=200,scrollbars=yes,dialog=yes,modal=no,width=300,height=260,resizable=yes");
		}
	}
</script>
<tbody id="DivColorType" style="display: none" runat="server">
	<tr>
		<td>
			<strong>默认颜色值：</strong>
		</td>
		<td>
			<asp:TextBox ID="ColorDefault" CssClass="form-control pull-left" runat="server" Style="max-width: 100px;" MaxLength="7" Columns="7"></asp:TextBox>
			<img alt="" onclick="SelectColor(this,'ColorDefault');" src="/App_Themes/AdminDefaultTheme/Images/selectclolor.gif" style="vertical-align: middle; border-width: 0px; margin-top: 8px; margin-left: 5px; cursor: pointer" />
		</td>
	</tr>
</tbody>
<!--Office转换为falsh-->
<tbody runat="server" id="DivUpload" style="display: none">
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TextBox2" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TextBox3" CssClass="form-control pull-left" Style="max-width: 200px;" Text="doc|docx|txt|pdf|xls|xlsx" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：doc|xls|pdf等等</span>
		</td>
	</tr>
</tbody>
<!--google地图-->
<tbody runat="server" id="DivGoogleMapType" style="display: none">
	<tr>
		<td>
			<strong>显示的宽度：</strong>
		</td>
		<td>
			<asp:TextBox ID="WidthTxt" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="10" MaxLength="4">500</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的高度：</strong>
		</td>
		<td>
			<asp:TextBox ID="HeigthTxt" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="10" MaxLength="4">200</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
</tbody>
<!--智能多文件上传-->
<tbody runat="server" id="DivSwfFileUpload" style="display: none">
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxFileSize1" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileType1" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|jpg|gif|bmp" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
</tbody>
<!--远程文件-->
<tbody runat="server" id="DivRemoteFile" style="display: none">
	<tr>
		<td>
			<strong>允许上传的文件大小：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtMaxFileSize2" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>允许上传的文件类型：</strong>
		</td>
		<td>
			<asp:TextBox ID="TxtUploadFileType2" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|jpg|gif|bmp" runat="server" Columns="30"></asp:TextBox>
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>FTP服务器名：</strong>
		</td>
		<td>
			<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="150">
			</asp:DropDownList>
		</td>
	</tr>
</tbody>
<!--  手机短信    -->
<tbody id="DivMobileSMS" style="display: none">
	<tr>
		<td>
			<strong>显示的宽度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MobileSMSType_Width" class="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">500</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>显示的高度：</strong>
		</td>
		<td>
			<asp:TextBox ID="MobileSMSType_Height" class="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">200</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
</tbody>
<tbody id="DivTableField" style="display: none">
	<tr>
		<td>
			<strong>字段值(Text)：</strong>
		</td>
		<td>
			<asp:TextBox ID="TableField_Text" class="form-control pull-left" runat="server" /><span style="line-height: 30px;"> *示例：ZL_User.UserName，出现在下拉列表中值。</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>实际入库值(Value)：</strong>
		</td>
		<td>
			<asp:TextBox ID="TableField_Value" class="form-control pull-left" runat="server" /><span style="line-height: 30px;">示例：ZL_User.UserID，可为空，用于实际的Value存值使用</span>
		</td>
	</tr>
	<tr>
		<td>
			<strong>筛选条件：</strong>
		</td>
		<td>
			<asp:TextBox ID="Where_Text" class="form-control pull-left" runat="server" /><span style="line-height: 30px;"> T-Sql条件筛选如：UserID<10 （仅支持单条件不可录入and等属性）</span>
		</td>
	</tr>
</tbody>
<tr class="tdbg">
	<td align="center" colspan="2" width="100%" style="padding-top: 2px;">
		<asp:Button ID="Button1" runat="server" Text=" 添加字段 " CssClass="btn btn-primary" OnClientClick="return isok()" OnClick="Button1_Click" />

		<input id="Button2" type="button" value=" 返回字段列表 " class="btn btn-primary" onclick="javascript:window.location.href='ModelField.aspx?ModelID=<%=Request.QueryString["ModelID"] %>    &ModelType=<%=Request.QueryString["ModelType"] %>    '" />
		<asp:HiddenField ID="HdfModelID" runat="server" />
		<asp:HiddenField ID="HdfTableName" runat="server" />
		<asp:HiddenField ID="HdfFieldID" runat="server" />
	</td>
</tr>
</table>
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<script type="text/javascript" src="/JS/ModelField.js"></script>
<script type="text/javascript" src="/JS/chinese.js"></script>
<style type="text/css">
.m {display: none;}
.tips {line-height: 32px;margin-left: 5px;} 
#TxtSqlPic {float: left;}
#oltopdiv{display:none;}
.mysite{display:none;}
</style>
<style id="sty" runat="server" type="text/css"></style>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript">
function checkDef(df) {
	if (df == null) {
		document.getElementById("TextType_DefaultValue").value = "{nowuser}";
	} else {
		document.getElementById("TextType_DefaultValue").value = df;
	}
}
function show(chvalue) {
	if (chvalue == '1') {
		document.getElementById('showdec').style.display = 'none';
	}
	else {
		document.getElementById('showdec').style.display = '';
	}
}
function Getpy(ontxt, id) {
	if (!document.getElementById(id).disabled) {

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