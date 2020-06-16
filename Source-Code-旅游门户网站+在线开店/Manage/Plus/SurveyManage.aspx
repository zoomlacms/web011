<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyManage, App_Web_ka5t45ft" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>问卷投票管理</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        //客户端实现 全选
        function SelectAll(gvName, bool) {
            var gv = document.getElementById(gvName);
            var checkbox = gv.getElementsByTagName('input');
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].type == 'checkbox') {
                    checkbox[i].checked = bool;
                }
            }
        }
        // 判断是否有选中的项目
        function HasChecked()
        {
            var flag = false;
            var chks = document.getElementById("gviewSurvey").getElementsByTagName("input");
            for (i = 0; i < chks.length; i++) {
                if (chks[i].type == 'checkbox' && chks[i].checked) {
                    flag = true;
                    break;
                }
            }
            return flag;
        }
        function CanDelete()
        {
            if (HasChecked())
            {
                return confirm("确定要删除选中的项目吗？");
            }
            alert("请先选中要删除的项目！");
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnSearch">
        <div class="r_navigation" style="height:25px;">
            <div style="float:left">
            后台管理&gt;&gt;问卷调查管理  &nbsp; &nbsp; [<a href="Survey.aspx">添加问卷</a>]
                </div> 
  <div style="float:right;">
      
      <div style="float:left;">   
              问卷投票名：
          </div>
      <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 

        <asp:TextBox ID="txtSurKey" BorderColor="#fff" CssClass="l_inpnon" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="" OnClick="btnSearch_Click" class="C_sch" />
          </td></tr></table>
                  <asp:HiddenField ID="HdnKey" runat="server" />
  </div>
        </div>
        <div class="clearbox" ></div>
        <asp:GridView ID="gviewSurvey" RowStyle-HorizontalAlign="Center" DataKeyNames="Surveyid" CellPadding="2" CellSpacing="1" BackColor="White" CssClass="border" GridLines="None" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" OnRowCommand="gviewSurvey_RowCommand" OnRowDataBound="gviewSurvey_RowDataBound" OnPageIndexChanging="gviewSurvey_PageIndexChanging">
            <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
            <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2"/>
        <Columns>                
            <asp:TemplateField>
                <HeaderStyle Width="5%" />
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" onclick="javascript:SelectAll('gviewSurvey',this.checked)" ToolTip="全选" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSel" runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />                    
                </asp:TemplateField>
             <asp:BoundField DataField="SurveyID" HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%" />  
            <asp:HyperLinkField DataTextField="Surveyname" HeaderText="问卷投票名" Target="_blank" DataNavigateUrlFields="Surveyid" DataNavigateUrlFormatString="~/Plugins/Vote.aspx?SID={0}" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30%"/>
             <asp:TemplateField HeaderText="类别">
                    <ItemTemplate><%# GetSurType(Eval("SurType","{0}"))%> </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
             </asp:TemplateField>
             <asp:TemplateField HeaderText="启用">
                    <ItemTemplate>                               
                        <asp:ImageButton ID="imgbtnCanNull" runat="server" CommandArgument='<%# Eval("SurveyID", "{0}") %>' ImageUrl='<%# "~/Images/" + BoolValueToImgName(Eval("Isopen", "{0}")) +".gif" %>' OnClick="imgbtnCanNull_Click"/>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("SurveyID") %>'>修改</asp:LinkButton> &nbsp;|&nbsp;
        <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("SurveyID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton>&nbsp;|&nbsp;
        <asp:LinkButton ID="lbtnList" runat="server" CommandName="QList" CommandArgument='<%# Eval("SurveyID") %>'>问题列表</asp:LinkButton>&nbsp;|&nbsp;
        <asp:LinkButton ID="LbtnAnalyze" runat="server" CommandName="Result" CommandArgument='<%# Eval("SurveyID") %>'>结果分析</asp:LinkButton>&nbsp;|&nbsp;
                        <asp:LinkButton ID="lbtnManage" runat="server" CommandName="Manage" CommandArgument='<%# Eval("SurveyID") %>'>问卷管理</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
        </Columns>
            <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
            <SelectedRowStyle BackColor="#def2dd" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="tdbg" BorderStyle="None"/>
            <HeaderStyle Font-Bold="True" ForeColor="#def2dd" BorderStyle="None" Height="30px" Font-Overline="False" />      
            <PagerSettings Visible="false" />      
        </asp:GridView>
        <div id="divPager" runat="server">
            <table style="width:100%;">
                <tr>                    
                    <td class="tdbg">
                        <div style="text-align: center">
                            <span style="text-align: center">
                                <%=lang.LF("共")%>
                                <asp:Label ID="lblTotalCnts" runat="server" Text=""></asp:Label>
                                <%=lang.LF("条数据")%>&nbsp;&nbsp;
                                <asp:LinkButton ID="lbtnFirstPage" CommandName="First" OnClick="LbtnAlterPage_Click" runat="server">首页</asp:LinkButton> &nbsp;
                                <asp:LinkButton ID="lbtnPrePage" CommandName="Previous" OnClick="LbtnAlterPage_Click" runat="server">上一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lbtnNextPage" CommandName="Next" OnClick="LbtnAlterPage_Click" runat="server">下一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lbtnLastPage" CommandName="Last" OnClick="LbtnAlterPage_Click" runat="server">尾页</asp:LinkButton>&nbsp; &nbsp;
                                <%=lang.LF("页次")%>：
                        <asp:Label ID="lblCurntPageNum" runat="server"/>/
                        <asp:Label ID="lblPageCnts" runat="server"/>
                                <%=lang.LF("页")%>&nbsp; &nbsp;
                                <asp:Label ID="lblPages" runat="server" Text="" />
                                <%=lang.LF("每页显示：")%>
                                <asp:TextBox ID="txtPageSize" runat="server" AutoPostBack="true" CssClass="l_input" Width="30px" ToolTip="所输入的数据小于100" OnTextChanged="txtPageSize_TextChanged"></asp:TextBox> 
                                <%=lang.LF("条数据")%> &nbsp; &nbsp;
                                <%=lang.LF("转到第")%>
                                <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%=lang.LF("页")%>
                               &nbsp; &nbsp; <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="txtPageSize" ErrorMessage="数据不合法！" Type="Integer" MaximumValue="100" MinimumValue="1"></asp:RangeValidator></span>
                        </div>
                    </td>
                </tr>
            </table>
                </div>  
        <div id="divBtns" runat="server">
        <br />&nbsp; &nbsp;
        <asp:Button ID="btndelete" runat="server" OnClientClick="return CanDelete();" Text="批量删除" OnClick="btndelete_Click" class="C_input" />
        </div>
    </form>
</body>
</html>
