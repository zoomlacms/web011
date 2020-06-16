<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ModelField, App_Web_i3fxcuwj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>字段列表</title>
    <link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/main.css" />
    <link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/Guide.css" />
    <link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/index.css" />
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            $("#FieldList tr td:contains('系统')").parent().hide();
        }
        function ShowList() {
            $("#FieldList tr td:contains('系统')").parent().toggle();
            $("#ShowLink").text($("#ShowLink").text() == "[显示所有字段]" ? "[隐藏系统字段]" : "[显示所有字段]");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="nav_box">
            <div class="r_navigation">
                <%if (GetOpenHelp.IsopenHelp() == "1")
                  { %>
                <div id="help"><a onclick="help_show('63')" title="帮助"></a></div>
                <%} %>后台管理&nbsp;&gt;&gt;&nbsp;系统设置&nbsp;&gt;&gt;&nbsp;<a href="ModelManage.aspx?ModelType=<%=Request["ModelType"] %>">

                    <asp:Label ID="name" runat="server"></asp:Label></a>&nbsp;&gt;&gt;&nbsp;
            
            <asp:Literal ID="LModelName" runat="server"></asp:Literal>字段列表&nbsp;&nbsp;&nbsp;
            
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;&nbsp;<span class="red"><a id="ShowLink" href="javascript:ShowList()">[显示所有字段]</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="red"><a href="AddModelField.aspx?ModelID=<%=Request.QueryString["ModelID"] %>&ModelType=<%=Request["ModelType"] %>">[添加字段]</a></span>
            </div>
        </div>
        <div style="margin-top: 24px;">
            <table border="0" id="FieldList" cellpadding="0" cellspacing="1" class="border" style="text-align: center; width: 100%">
                <tr class="gridtitle" align="center" style="height: 25px;">
                    <th style="width: 10%; height: 20px;">
                        <strong>字段名</strong>
                    </th>
                    <th style="width: 10%">
                        <strong>字段别名</strong>
                    </th>
                    <th style="width: 10%">
                        <strong>字段类型</strong>
                    </th>
                    <th style="width: 8%">
                        <strong>字段级别</strong>
                    </th>
                    <th style="width: 5%">
                        <strong>是否必填</strong>
                    </th>
                    <th style="width: 5%">
                        <strong>是否显示</strong>
                    </th>
                    <th style="width: 5%">
                        <strong>可复制</strong>
                    </th>
                    <th style="width: 7%">
                        <strong>批量添加</strong>
                    </th>
                    <th style="width: 7%">
                        <strong>允许内链</strong>
                    </th>
                    <th style="width: 10%">
                        <strong>排序</strong>
                    </th>

                    <th style="width: 15%">
                        <strong>编辑</strong>
                    </th>
                </tr>
                <asp:Repeater ID="rptSystemModel" runat="server">
                    <ItemTemplate>
                        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <td><%#Eval("FieldName")%></td>
                            <td align="center"><%#Eval("FieldAlias")%></td>
                            <td align="center"><%# Eval("FieldType", "{0}")%></td>
                            <td align="center"><span style="color: #339900">系统</span></td>
                            <td align="center"></td>

                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <%-- 使用UpdatePanel 更改ImageButton的图像， 实现局部刷新 --%>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <asp:Repeater ID="rptModelField" runat="server" OnItemCommand="rptModelField_ItemCommand">
                    <ItemTemplate>
                        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                            ondblclick="location.href='AddModelField.aspx?FieldID=<%# Eval("FieldID") %>&ModelID=<%# Eval("ModelID") %>&ModelType=<%=Request["ModelType"] %>'">
                            <td>
                                <%#Eval("IsShow", "{0}") == "False" ? "<font color=#999999>" :""%><%#Eval("FieldName")%><%#Eval("IsShow","{0}")=="False"?"</font>":"" %>
                            </td>
                            <td align="center">
                                <%#Eval("FieldAlias")%>
                            </td>
                            <td align="center">
                                <%# GetFieldType(Eval("FieldType", "{0}"))%>
                            </td>
                            <td align="center">

                                <%# Get_sum(Eval("Sys_type", "{0}")) ? "自定义" : "系统"%>
                            </td>

                            <%-- 以下 由CommandArgument 为 LinkButton 传递多个参数：  判断所属ID + 指定的列， 注意下格式 --%>
                            <td align="center">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="imgbtnCanNull" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | Null" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("IsNotNull", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td align="center">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>

                                        <asp:ImageButton ID="imgbtnCanShow" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | Show" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("ShowList", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td align="center">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="imgbtnCanCopy" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | Copy" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("IsCopy", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td align="center">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="imgbtnCanBadd" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | BatchAdd" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("Islotsize", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </td>
                            <td align="center">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="ChangeValue" CommandArgument='<%# Eval("FieldID")+ " | BatchAdd" %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("IsChain", "{0}")) +".gif" %>' OnClick="ImageButton_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td align="center">
                                <asp:LinkButton ID="lbtnMove" runat="server" CommandName="UpMove" CommandArgument='<%# Eval("FieldID") %>' Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '>上移 |</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DownMove" CommandArgument='<%# Eval("FieldID") %>' Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '>下移</asp:LinkButton>
                            </td>


                            <td align="center">

                                <a href="AddModelField.aspx?FieldID=<%# Eval("FieldID") %>&ModelID=<%# Eval("ModelID") %>&ModelType=<%=Request["ModelType"] %>">修改</a>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("FieldID") %>' OnClientClick="return confirm('确定删除此字段吗?\r\n\r\n删除后请更新相应字段输出配置以确保应用')" Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '>| 删除</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </table>
        </div>
        <div class="clearbox"></div>
        <table cellpadding="2" cellspacing="1" class="border" style="width: 100%">
            <tr class="tdbg">
                <td style="width: 30%">
                    <asp:TextBox ID="TxtTemplate" CssClass="l_input" MaxLength="255" runat="server" Columns="50"></asp:TextBox>
                    <input type="button" value="选择模板" class="C_input" style="width: 100px;" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtTemplate') + '&FilesDir=', 650, 480)" />
                    <asp:Button ID="Button1" runat="server" CssClass="C_input" Style="width: 100px;" Text="设定模板" OnClick="SetTemplate" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
