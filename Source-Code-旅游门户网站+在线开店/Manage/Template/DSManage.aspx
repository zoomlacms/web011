<%@ page language="C#" autoeventwireup="true" inherits="manage_Template_DSManage, App_Web_fx1qjkh2" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据源管理</title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css"  rel="stylesheet" />
<script type="text/javascript" src="../../JS/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            <div id="help"><a onclick="help_show('25')" title="帮助"></a></div>
            <span>后台管理</span>&gt;&gt;<span> 系统设置 </span>&gt;&gt; <a href="DSManage.aspx">外部数据库源</a>&gt;&gt;
           <a href="DSManage.aspx?action=add"  style="color: red;"> [添加新数据库源]</a> 
        </div>
        <div class="clearbox" style="height:0;"></div>
        <div>
            <div id="addDSDiv" runat="server" visible="false">
                <table style="width: 100%; border:1px solid #4197e2;" class="tdbg" cellpadding="0" cellspacing="1" >
                    <tr>
                        <td colspan="2" class="spacingtitle">添加新数据库源</td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft" style="width: 5%;text-align:right;">名称： </td>
                        <td class="tdbgleft" style="width: 15%; height: 22px; text-align: left;">
                            <asp:TextBox ID="DSName" runat="server" CssClass="l_input"  MaxLength="20" width="30%"/> <span style="color:red">*</span>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DSName" ErrorMessage="数据源名称不能为空!" SetFocusOnError="True" Display="Dynamic" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft" style="text-align:right;" >类型： </td>
                        <td class="tdbgleft" style="height: 22px; text-align: left;">
                            <asp:DropDownList ID="DataSourceList" runat="server" width="30%" OnSelectedIndexChanged="DataSourceList_SIChanged" AutoPostBack="true">
                                <asp:ListItem Enabled="false" Selected="True">默认</asp:ListItem>
                                <asp:ListItem Value="1">外部SQL数据库</asp:ListItem>
                                <asp:ListItem Value="2">外部MYSQL数据库</asp:ListItem>
                                <asp:ListItem Value="3">外部Oracle数据库</asp:ListItem>
                                <asp:ListItem Value="4">Access数据库</asp:ListItem>
                                <asp:ListItem Value="5">XML</asp:ListItem>
                                <asp:ListItem Value="6">Excel</asp:ListItem>
                            </asp:DropDownList><span style="color:red;margin-left:5px;">*</span></td>
                    </tr>
                     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft" style="text-align:right;">描述： </td>
                        <td class="tdbgleft" style="height: 22px; text-align: left;">
                            <asp:TextBox ID="dsRemind" CssClass="l_input" Width="50%" runat="server" MaxLength="50"/>
                        </td>
                    </tr>
                     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft" style="text-align:right;"> 数据库源连接字符串： </td>
                        <td class="tdbgleft" style="height: 22px; text-align: left;">
                            <asp:TextBox ID="DBConnectText" CssClass="l_input" runat="server" Width="50%" Text="Data Source=(local);Initial Catalog=test;User ID=test;Password=test" />
                            <span style="color:red">*</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DBConnectText" ErrorMessage="连接字符串不能为空!" SetFocusOnError="True" Display="Dynamic" />
                            <label runat="server" id="remind"></label>                 
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft" style="text-align: right;">操作： </td>
                        <td class="tdbgleft" style="height: 22px; text-align: left;">
                            <asp:Button ID="TestConBtn" runat="server" UseSubmitBehavior="false" Text="测试连接" CssClass="C_input" OnClick="TestConBtn_Click" />
                            <asp:Button ID="AddDS" runat="server" Text="保存连接" CssClass="C_input" OnClick="AddDS_Click" UseSubmitBehavior="false" Style="margin-left: 10px;" />
                            <span>注：~/为根目录通配符</span>
                        </td>
                    </tr>
                </table>
                
            </div>
            <div id="sgv1Div" runat="server" visible="true">
                <ZL:ExGridView ID="sgv1" runat="server" DataSourceID="DSData" AllowPaging="True" AutoGenerateColumns="false" IsHoldState="false"
                    RowStyle-CssClass="tdbg" CellPadding="2" CellSpacing="1" ForeColor="Black" CssClass="border" Width="100%"
                    GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" SerialText=""  EnableModelValidation="True"
                    OnRowCommand="sgv1_RowCommand" OnRowDataBound="sgv1_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <input type="checkbox" name="idChk" style="float:left;" value="<%# Eval("ID") %>"/>
                                <%# Eval("ID") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DSName" HeaderText="名称"/>
                        <asp:TemplateField HeaderText="类型">
                            <ItemTemplate>
                                <%#getType(Convert.ToInt32(Eval("Type") as string))%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList runat="server" ID="editList">
                                    <asp:ListItem Value="1">外部SQL数据库</asp:ListItem>
                                    <asp:ListItem Value="2">外部MYSQL数据库</asp:ListItem>
                                    <asp:ListItem Value="3">外部Oracle数据库</asp:ListItem>
                                    <asp:ListItem Value="4">Access数据库</asp:ListItem>
                                    <asp:ListItem Value="5">XML</asp:ListItem>
                                    <asp:ListItem Value="6">Excel</asp:ListItem>
                                </asp:DropDownList>
                                <input type="hidden" runat="server" id="typeValue"  value='<%#Eval("Type") %>'/>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="连接字符串">
                            <ItemTemplate>
                                <%# Eval("ConnectionString") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="editConnStr" runat="server" Text='<%# Eval("ConnectionString") %>'  Width="90%" style="text-align:center;"/>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="创建时间">
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy年M月d日}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreateMan" HeaderText="创建者" ReadOnly="true" />
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:LinkButton ID="Edit" runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>' >修改|</asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="Del"   CommandArgument='<%# Eval("ID") %>' 
                                    OnClientClick="return confirm('你确定要删除该数据源吗!');">删除</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("ID") %>' >更新|</asp:LinkButton>
                                <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>' >取消</asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="描述" ItemStyle-Width="20%" >
                            <ItemTemplate>
                                <%# Eval("Remind") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="editRemind" Text='<%#Eval("Remind")%>' style="width:90%;text-align:left;" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                    <RowStyle Height="24px" HorizontalAlign="Center" />
                </ZL:ExGridView>
                <input type="checkbox" id="allChk" onclick="selectAll(this, 'idChk')"/><label for="allChk">全选</label>
                <input type="button" id="BatDel" value="批量删除" class="C_input"/>
            </div>
            <asp:ObjectDataSource ID="DSData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="getAllData" TypeName="GetDSData"></asp:ObjectDataSource>
        </div>
        <script type="text/javascript">
            function selectAll(obj,name)
            {
                allInput = document.getElementsByName(name);
                loopTime = allInput.length;
                for(i=0;i<loopTime;i++)
                {
                    allInput[i].checked = obj.checked;
                }
            }
            function getCheckValue(name)
            {
                allInput = document.getElementsByName(name);
                loopTime = allInput.length;
                dataArrary = "";
                for (i = 0; i < loopTime; i++)
                {
                    if (allInput[i].checked)
                    {
                        dataArrary += allInput[i].value + ",";
                    }
                }
               return dataArrary.substring(0,dataArrary.length-1);
            }

            function postToCS(name)
            {
                dataArrary = getCheckValue(name);
                $.ajax({
                    url: "DSManage.aspx",
                    type: "Post",
                    data: {
                        action: "del", data: dataArrary},
                    success: function (data) { if (data == "1") { alert("删除成功"); location = location; } },
                        error: function (data) { alert(data) }
                });
            }

            function checkedNum(name) {
                allInput = document.getElementsByName(name);
                loopTime = allInput.length;
                for (i = 0; i < loopTime; i++) {
                    if (allInput[i].type == "checkbox" && allInput[i].checked == true) {
                        return true;
                    }
                }
                alert("没有选择框被选择!");
                return false;
            }

            $(document).ready(function () {
                $("#BatDel").bind("click", { ckid: 'idChk' },
                    function (ev) {
                        if (checkedNum(ev.data.ckid)) { if (confirm("你确定要删除选定数据吗?")) { postToCS(ev.data.ckid); } }
                    });
               
            });
        </script>
    </form>
</body>

</html>
