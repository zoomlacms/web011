<%@ page language="C#" autoeventwireup="true" inherits="manage_AddCRM_CustomerList, App_Web_yrpnlfyh" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title><%=lang.LF("客户管理")%></title>

    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Plugins/JqueryUI/EasyDialog/easydialog.css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Common.js"></script>
    <script type="text/javascript" src="../../JS/jquery.js"></script>
    <script src="/Plugins/JqueryUI/EasyDialog/easydialog.min.js"></script>
    <script type="text/javascript" language="javascript">
        function getinfo(id) {
            location.href = 'ViewCustomer.aspx?FieldName=Person_Add&id=' + id;
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
<body>
    <form id="form1" runat="server">
    <div class="r_navigation">
    <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('47')" title="帮助"></a></div>
  <%} %> <span><%=lang.LF("后台管理")%></span>&nbsp;&gt;&gt;&nbsp;<span><asp:Literal ID="liTitle" runat="server"></asp:Literal></span>&nbsp;&gt;&gt;&nbsp;<span><a href="CustomerList.aspx?usertype=0"><%=lang.LF("客户管理")%></a></span>&nbsp;&nbsp;<a href="CustomerManage.aspx?FieldName=Person_Add" style="color:red;">[<%=lang.LF("添加客户")%>]</a>
        </div>
        <div class="divline" style="padding-left: 10px; display: block">
            选择Excel导入源：
    <asp:FileUpload ID="fileImp" runat="server" Style="margin-bottom: 2px;" />
            <asp:Button runat="server" ID="ExcelData" Text="从Excel导入数据" OnClick="ExcelData_Click"
                OnClientClick="if(document.getElementById('fileImp').value.length==0){alert('请选择Excel(CSV)文件,可下载模板!');return false};
                else {setTimeout(function () { document.getElementById('ExcelData').disabled = true;},50)}" 
                CssClass="C_input" />
            <asp:Button runat="server" ID="DownTemp" OnClick="Template_Click" Text="下载模板" CssClass="C_input" />
            <span style="color: red;">*</span>
            <span style="color: #0E529D;">(下载后用EXCEL打开,点击顶部[启用编辑],从第二行开始按规范填写并保存即可)</span>  
        </div>
    <div class="clearbox">
    </div>
        <table border="0" cellpadding="0" cellspacing="0">
                <tr style="text-align: center;">
                    <td class="titlemouseover" onclick="ShowTabs(this,1)">全部客户</td>
                    <td class="tabtitle" onclick="ShowTabs(this,2)">到期未跟进 </td>
                    <!--拥有分配跟进人权限才能见到此项-->
                    <td class="tabtitle" onclick="ShowTabs(this,3)">未分配跟进人 </td>
                </tr>
            </table>
        <div>
        <div id="tab1">
        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
        <tbody id="Tbody1">
            <tr class="tdbg">
                <td align="center" colspan="8" class="title" width="100%">
                    <%=lang.LF("客户列表")%></td>
            </tr>
            <tr class="tdbg">
                <td align="center" class="tdbgleft" style="height: 24px; width: 5%; font-weight: bold">
                    ID
                </td>
                <td align="center" class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
                    <%=lang.LF("客户名称")%>
                </td>
                <td align="center" class="tdbgleft" style="height: 24px; width: 10%; font-weight: bold">
                    <%=lang.LF("客户组别")%>
                </td>
                <td align="center" class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
                    <%=lang.LF("客户编号")%>
                </td>
                 <td align="center" class="tdbgleft" style="height: 24px; width: 10%; font-weight: bold">
                    <%=lang.LF("客户组别")%>
                </td>
                <td align="center" class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
                    <%=lang.LF("客户来源")%>
                </td>
                  <td align="center" class="tdbgleft" style="height: 24px; width: 15%; font-weight: bold">
                    跟进人
                </td>
                <td align="center" class="tdbgleft" style="height: 24px; width: 10%; font-weight: bold">
                    <%=lang.LF("操作")%>
                </td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" ondblclick="getinfo(<%#Eval("Flow")%>);">
                        <td align="center" style="height: 24px;">
                           <%#Eval("Flow")%>
                        </td>
                         <td align="center" style="height: 24px; cursor:pointer">
                           <a href="ViewCustomer.aspx?FieldName=Person_Add&id=<%#Eval("Flow") %>"><%#Eval("P_name")%></a>
                        </td>
                        <td align="center" style="height: 24px;">
                           <%#Eval("Client_Type","{0}")=="1"?"企业":"个人"%>
                        </td>
                        <td align="center" style="height: 24px;">
                            <%#Eval("Code")%>
                        </td>
                        <td align="center" style="height: 24px;">
                           <%#Eval("Client_Group")%>
                        </td>
                        <td align="center" style="height: 24px;">
                            <%#Eval("Client_Source")%>
                        </td>
                         <td align="center" style="height: 24px;">
                            <%#GetAdminTrueName(Eval("FPManID").ToString())%>
                        </td>
                        <td align="center" style="height: 24px;">
                           <a href="CustomerManage.aspx?FieldName=Person_Add&menu=edit&id=<%#Eval("Flow") %>"><%=lang.LF("修改")%></a>　<a href="?menu=delete&code=<%#Eval("Code") %>" onclick="return confirm('你确定要将所有选择删除吗？');"><%=lang.LF("删除")%></a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td align="center" class="tdbg" style="height: 24px;" colspan="8">
                   <%=lang.LF(" 共")%> <asp:Label ID="Allnum" runat="server" Text=""></asp:Label><%=lang.LF("条数据")%>
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" /> <%=lang.LF("页次")%>：
                        <asp:Label ID="Nowpage" runat="server" Text="" />/
                        <asp:Label ID="PageSize" runat="server" Text="" /> <%=lang.LF("页")%>
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                            Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox> 
                        <%=lang.LF("条数据")%>/<%=lang.LF("页")%> <%=lang.LF("转到第")%>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <%=lang.LF("页")%><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                            ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                </td>
            </tr>
        </tbody>
    </table>
        </div>
        <div id="tab2" style="display:none;">
            <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                <tr class="tdbg">
                    <td colspan="6" align="center" style="height: 24px;" class="title">到期未跟进</td>
                </tr>
            </table>
            <ZL:ExGridView ID="EGV" runat="server" DataSourceID="expireData" AllowPaging="True" RowStyle-CssClass="tdbg" AutoGenerateColumns="False"
                CellPadding="2" CellSpacing="1" ForeColor="Black" CssClass="border" Width="100%"
                GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" AllowSorting="True"
                EnableModelValidation="True" SerialText="" CheckBoxFieldHeaderWidth="3%">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="跟进内容" DataField="UserInfo" HtmlEncode="false" />
                    <asp:TemplateField HeaderText="跟进时间">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("BeginTime")).ToString("yyyy年MM月dd日") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="下次跟进时间">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("CompletionTime")).ToString("yyyy年MM月dd日") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="跟进人" DataField="fpman" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="CustomerManage.aspx?FieldName=Person_Add&menu=edit&id=<%#Eval("TargetID") %>">客户信息|</a>
                            <a href="javascript:;" onclick="if (confirm('确定跟进后将不会再提示')){postToCS('FP', '<%#Eval("ID") %>',this)}">确认跟进</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
            <asp:ObjectDataSource runat="server" ID="expireData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCrmExpireList" TypeName="GetDSData">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="disType" QueryStringField="disType" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <div id="tab3" style="display:none;">
                  <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                <tr class="tdbg">
                    <td colspan="6" align="center" style="height: 24px;" class="title">未分配跟进人</td>
                </tr>
            </table>
            <ZL:ExGridView ID="EGV3" runat="server" DataSourceID="noFPManData" AllowPaging="True" RowStyle-CssClass="tdbg" AutoGenerateColumns="False"
                CellPadding="2" CellSpacing="1" ForeColor="Black" CssClass="border" Width="100%"
                GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" AllowSorting="True"
                EnableModelValidation="True" SerialText="" CheckBoxFieldHeaderWidth="3%" IsHoldState="True">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="Flow" />
                    <asp:BoundField HeaderText="客户名称" DataField="p_name" />
                    <asp:BoundField HeaderText="客户编号" DataField="Code" />
                    <asp:BoundField HeaderText="客户来源" DataField="Client_Source" />
                    <asp:TemplateField HeaderText="添加时间">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("Add_Date")).ToString("yyyy年MM月dd日") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="CustomerManage.aspx?FieldName=Person_Add&menu=edit&id=<%#Eval("Flow") %>">分配跟进人</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
            <asp:ObjectDataSource runat="server" ID="noFPManData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCrmNoFPManList" TypeName="GetDSData">
            </asp:ObjectDataSource>
            </div>
        <script type="text/javascript">
            function ShowTabs(obj,id) {//Div切换
                $(obj).addClass("titlemouseover").siblings().removeClass("titlemouseover").addClass("tabtitle");
                $("#tab" + id).show().siblings().hide();
            }
            $().ready(function () {
                $.ajax({
                    type: "post",
                    url: "CustomerList.aspx",
                    data: { action: "getExpireNum" },
                    success: function (data) { if(data!=1)disRemind(data); }
                });
            });

            function disRemind(s) {
                easyDialog.open({
                    container: {
                        header: '提醒',
                        content: s,
                        yesFn: true,
                        noFn: true
                    }
                });
            }

            function postToCS(a, id,obj) {
                $.ajax({
                    type: "Post",
                    url: "CustomerList.aspx",
                    data: { action: a, pid: id },
                    success: function (data) { if (data == 1) { $(obj).parent().parent().remove(); } else alert(data);},
                    error: function (data) { alert(data); }
                });
            }
        </script>
   </form>
</body>
</html>
