<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_CollectionInfoPage, App_Web_x2m1jeiy" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>采集配置字段设置</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <table width="100%" border="0"  class="border">
<tr align="center">
<td colspan="2">
    <asp:DropDownList runat="server" ID="Link_DP" CssClass="form-control" style="width:400px;float:left;" AutoPostBack="true" OnSelectedIndexChanged="Link_DP_SelectedIndexChanged"></asp:DropDownList><br />
	<%=type%><asp:HiddenField ID="HiddenField1" runat="server" />
</td>
</tr>
<tr class="tdbg">
<td colspan="2">
	<table class="table table-bordered table-hover table-striped">
		<tr class="tdbg">
            <td>
                <asp:Label runat="server" ID="CurLink_L" Style="color: green;"></asp:Label>
                <asp:TextBox ID="txtHtml" CssClass="form-control" runat="server" TextMode="MultiLine" style="width:98%;height:420px;max-width:98%"></asp:TextBox>
            </td>
			<td valign="top">
				<table width="240px" border="0" cellpadding="0" cellspacing="0">
					<tr align="center">
						<td id="TabTitle0" class="titlemouseover" onclick="ShowTabs(0)">
							字段设置
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
				</table>
				<table width="240px" border="0" cellpadding="0" cellspacing="0" class="border">
					<tbody id="Tabs0">
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;字段开始：
								<asp:RequiredFieldValidator ID="r1" runat="server" ErrorMessage="字段开始不能为空！" ForeColor="Red" ControlToValidate="txtListStart" ValidationGroup="Add"></asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;<asp:TextBox ID="txtListStart" CssClass="form-control" runat="server" TextMode="MultiLine" Width="230px" Rows="5" Height="60px"></asp:TextBox></td>
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;字段结束：                
								<asp:RequiredFieldValidator ID="r2" runat="server" ErrorMessage="字段结束不能为空！" ForeColor="Red" ControlToValidate="txtListEnd" ValidationGroup="Add"></asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
                            <asp:TextBox ID="txtListEnd" CssClass="form-control" runat="server" TextMode="MultiLine" Width="230px" Rows="5" Height="60px"></asp:TextBox></td>
						</tr>
					<tbody id="Tbody1">
						<tr class="tdbg">
							<td class="tdbgleft">
								&nbsp;排除规则：
                                <asp:DropDownList ID="DropGui" runat="server" CssClass="form-control">
								<asp:ListItem  Value="1">不选择排除</asp:ListItem>
								<asp:ListItem Value="2">选择排除</asp:ListItem>
								</asp:DropDownList>
							</td>
						</tr>
						<tr class="tdbg">
						<td class="tdbgleft">&nbsp;公用过滤项目：&nbsp;&nbsp;私有过滤项目：</td>
						
						</tr>
						<tr class="tdbg">
							<td class="tdbgleft">
							    <asp:ListBox ID="ListBox2" CssClass="form-control pull-left" Width="50%"  runat="server" EnableTheming="True" Height="162px">
                                    <asp:ListItem Value="no">不设置过滤</asp:ListItem>
                                </asp:ListBox>
                                <asp:ListBox ID="listPrivate" CssClass="form-control pull-left" Width="50%" runat="server" EnableTheming="True" Height="163px" SelectionMode="Multiple">
								    <asp:ListItem Value="iframe">过滤内联页</asp:ListItem>
								    <asp:ListItem Value="flash">过滤Flash</asp:ListItem>
								    <asp:ListItem Value="script">过滤脚本</asp:ListItem>
								    <asp:ListItem Value="css">过滤样式</asp:ListItem>
								    <asp:ListItem Value="div">过滤Div容器</asp:ListItem>
								    <asp:ListItem Value="span">过滤Span容器</asp:ListItem>
								    <asp:ListItem Value="table">过滤表格</asp:ListItem>
								    <asp:ListItem Value="img">过滤图片</asp:ListItem>
								    <asp:ListItem Value="font">过滤字体</asp:ListItem>
								    <asp:ListItem Value="a">过滤链接</asp:ListItem> 
								    <asp:ListItem Value="html">过滤html元素</asp:ListItem>  
								</asp:ListBox>
							</td>
						</tr>
						<tr class="tdbg">
							<td>
								<asp:Button ID="Button5" CssClass="btn btn-primary"  style="width:110px;"  runat="server" Text="测试字段" OnClick="Button5_Click" OnClientClick="return checkList('txtListStart','txtListEnd')" ValidationGroup="Add" />
							</td>
						</tr>
				</table>
			</td>
		</tr>
		<tr class="tdbg">
			<td colspan="2" align="center">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="Button2" class="btn btn-primary" type="button" value="保  存" onclick="SetConfig()"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="Button3" type="button" value="取  消" class="btn btn-primary"    onclick="window.close();" />
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
    <script type="text/javascript">
        function SetConfig() {
            var v = document.getElementById("HiddenField1").value;
            var str = GetList();
            opener.SetHr(v, document.getElementById("txtListStart").value, document.getElementById("txtListEnd").value, str);
            window.close();
        }

        function GetList() {
            var ddl = document.getElementById("DropGui");
            var selectvalue = ddl.options[ddl.selectedIndex].value
            if (selectvalue == "2") {
                var objlist = document.getElementById("listPrivate");
                var str = "";
                for (var i = 0; i < objlist.length; i++) {
                    if (objlist.options[i].selected) {
                        str += objlist.options[i].value + ",";
                    }
                }
                if (str.substring(str.length - 1, str.length) == ',') {
                    str = str.substring(0, str.length - 1);
                }
                return str;
            }
            else {
                return "";
            }
        }
    </script>
</asp:Content>