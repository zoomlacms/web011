<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.editListContent, App_Web_z5hlghoj" enableviewstatemac="false" validaterequest="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>会员组模型</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
     <div class="us_seta" style="margin-top:10px;" id="manageinfo" runat ="server">
         <ZL:ExGridView ID="Egv"  runat="server" AutoGenerateColumns="False" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True" EmptyDataText="无相关信息！！">
             <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <input type="checkbox" name="chkSel" title="" value='<%#Eval("FieldName") %>' />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField HeaderText="字段别名" DataField="FieldAlias" />
                 <asp:BoundField HeaderText="字段名" DataField="FieldName" />
             </Columns>
             <RowStyle HorizontalAlign="Center" />
             <PagerStyle HorizontalAlign="Center" />
         </ZL:ExGridView>   
        <table style="width: 100%; margin: 0 auto;" cellpadding="0" cellspacing="0" class="border">
            <tr class="tdbg">
                <td colspan="2" style="line-height:30px">
           		<h1 style="text-align:center; font-size:14px;"><asp:Label ID="LblModelName" runat="server" Text=""></asp:Label></h1>
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal><tr class="tdbgbottom border">
			<td colspan="2" style="height: 84px">                    
				<asp:HiddenField ID="HdnModel" runat="server" />
		        <asp:HiddenField ID="HdnModelName" runat="server" />
				<asp:HiddenField ID="HdnID" runat="server" />
				<asp:HiddenField ID="HdnType" runat="server" />
				<asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
				<asp:Button ID="EBtnSubmit" class="C_input"  Text="保存" OnClick="EBtnSubmit_Click" runat="server" />   
			    <asp:Button ID="Button1" class="C_input"  Text="返回"  runat="server" onclick="Button1_Click" />               
			</td>
            </tr>
        </table>
         <script>
             $().ready(function () {
                 $("#Egv tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
                 //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
                 $("#chkAll").click(function () {//EGV 全选
                     selectAllByName(this, "chkSel");
                 });
             })
        </script>
    </div>
        
    </form>
</body>
</html>