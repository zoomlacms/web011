<%@ page language="C#" debug="true" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ContentManage, App_Web_z5hlghoj" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%--<%@ OutputCache Duration="100" VaryByParam="*"%>--%>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.LF("内容管理")%></title>
<link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<style>
.C_schmor {background: url(/App_Themes/AdminDefaultTheme/images/exten.gif) repeat-x scroll center;overflow: visible;border: none;cursor: pointer;_padding-top:0px; width:16px; height:16px;_padding-bottom:0px;  }
.r_navigation #browse { display:block; width:18px; height:18px;}
#showsearch:hover{cursor:pointer;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>--%>
            <div id="divTranPross" style="display: none; z-index: 998; filter: alpha(opacity=40,style=0);opacity: 0.4; background-color: #77C6FE; text-align: center; height: 150%; width: 100%; border: 0px solid black; position: absolute; left: 0px; right: 0px;"></div>
            <div id="divBackPross" style="display: none; z-index: 999; text-align: center; height: 150%;width: 100%; border: 0px solid black; position: absolute; left: 0px; top: 0px;">
                <table style="height: 50%; width: 100%;">
                    <tr>
                        <td style="vertical-align: middle;">
                            <div style="margin-left: auto; margin-right: auto; line-height: 30px; vertical-align: middle; width: 200px; height: 30px; background-color: #0D6FC3; position: relative;">
                                <div id="divPross" style="width: 10px; height: 30px; background-color: #77C6FE; position: absolute; left: 0px; top: 0px;"></div>
                                <%=lang.LF("正在导入")%>...
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
<%--        </ContentTemplate> </asp:UpdatePanel>--%>
<div id="nav_box">
    <div class="r_navigation">
        <table style="float: right;margin-right: 20px;"><tr>
            <td><a href="SchedTask.aspx" title="查看计划任务" style="display:block; width:16px; height:16px; margin-right:5px;"><img src="../../../Images/ModelIcon/taskview.gif" alt="" /></a></td>
            <td style="width:18px;">
                <a id="showsearch" style="display:block; width:16px; height:16px;" title="显示扩展搜索" onclick="displayToolbar()"><img src="/App_Themes/AdminDefaultTheme/images/exten.gif" alt="" /></a>
            </td><td>
            <%=GetOper()%>
             </td>
            <td>
            <a onclick="opentitle('EditNode.aspx?NodeID=<%=CNodeID %>','配置本节点')"
                href="javascript:void(0);" title="配置本节点">                
                <%=lang.LF("配置本节点")%></a>
        </td></tr></table>
                    <%=lang.LF("后台管理")%> &gt;&gt; <span><a href="ContentManage.aspx">
                        <%=lang.LF("内容管理")%></a></span> &gt;&gt; <span>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></span>
    </div>         
  <script type="text/javascript">
      function displayToolbar() {
          $("#toolbar1").toggle("fast");
          $("#toolbar3").toggle("fast");
      }
  </script>
</div>
<div style="height:27px;"></div>
    <div class="divline" id="toolbar1" style="padding-left: 5px; height: 25px;display:none; ">
        <ul>
            <li style="float: left;"><a href="ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>">
                <%=lang.LF("内容列表")%></a> <a href="ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&flag=Elite">
                <%=lang.LF("推荐列表")%></a> 
                 <a href="javascript:void(0)"> <%=lang.LF("排序") %>：</a> 
            </li>
            <li style="float: left; margin-left:10px;">
                <asp:DropDownList ID="txtbyfilde" runat="server" CssClass="x_input" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged" AutoPostBack="true">
                     <asp:ListItem Value="" Selected="True">选择字段</asp:ListItem>
                     <asp:ListItem Value="GeneralID">内容</asp:ListItem>
                     <asp:ListItem Value="CreateTime">添加时间</asp:ListItem>
                     <asp:ListItem Value="UpDateTime">更新时间</asp:ListItem>
                     <asp:ListItem Value="Hits">点击数</asp:ListItem>
                     <asp:ListItem Value="EliteLevel">推荐级别</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="txtbyOrder" runat="server" CssClass="x_input" OnSelectedIndexChanged="txtbyOrder_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="">排列顺序</asp:ListItem>
                    <asp:ListItem Value="Asc">升序</asp:ListItem>
                    <asp:ListItem Value="Desc">降序</asp:ListItem>
                </asp:DropDownList>
            </li>
            <li style="float: left; margin-left:10px;"> 
                <asp:DropDownList ID="DropDownList1" CssClass="x_input" runat="server">
                    <asp:ListItem Value="0" Selected="True">标题</asp:ListItem>
                    <asp:ListItem Value="1">ID</asp:ListItem>
                    <asp:ListItem Value="2">录入者检索</asp:ListItem>
                </asp:DropDownList>
                </li>
            <li style="float: left; margin-left:10px;">
                <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 
                <asp:TextBox ID="TextBox1" runat="server" Width="90px" Height="15px" BorderColor="#fff" CssClass="l_inpnon"></asp:TextBox></td><td>
                    <asp:Button ID="Button4" runat="server" Text="" OnClick="Button4_Click"  class="C_sch" Style=""/> 
             </td></tr></table>
                </li>    
              <li style="float: left; margin-left:10px;">  <%=lang.LF("按发布者地区筛选")%>：
 <select runat="server" id="selprovince" name="selprovince" onchange="javascript:area()"></select>
           <asp:DropDownList ID="selcity" runat="server" AutoPostBack="true" onselectedindexchanged="selcity_SelectedIndexChanged" />
            <li style="float: right;"></li>
        </ul>
    </div> 
    <div class="divline" id="toolbar2" style="padding-left: 5px; margin-top:5px;">
        <table width="99%">
            <tr>
                <td>
                    <b onclick="OpenAddContent()"><%=lang.LF("内容操作")%>：</b>
                    <asp:Label ID="lblAddContent" runat="server" Text=""></asp:Label>
                </td>
                <td align="right">
                    <div id="toolbar3" style="display:none">
                    <%=lang.LF("审核原因")%>：
                    <asp:TextBox ID="TextBox3" runat="server" Width="147px" CssClass="l_input"></asp:TextBox>
                    <asp:Button ID="Button15" runat="server" class="C_input" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要审核选中内容吗？')}" Text="审核通过" OnClick="Button15_Click" Width="80px" />
                    <asp:Button ID="Button16" runat="server" class="C_input" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" Text="审核失败" OnClick="Button16_Click" Width="80px" />
                    </div>
                </td>
                 <td  align="right">
                     <%=lang.LF("文章数")%>:<asp:Label ID="WZS" runat="server"></asp:Label><%=lang.LF("点击数")%>:<asp:Label ID="DJS" runat="server"></asp:Label>
                </td> 
            </tr>
        </table>
    </div>
        <div class="clearbox"></div>
    <% if (Request.QueryString["isDivImp"] != null && Request.QueryString["isDivImp"] == "1")
       { %>
    <div id="divImp" class="divline" style="padding-left: 10px; display: block">
        <%=lang.LF("选择CSV导入源")%>：<asp:FileUpload ID="fileImp" runat="server" />
        <asp:Button ID="btnCurrentImport" runat="server" OnClientClick="if(document.getElementById('fileImp').value.length==0){alert('请选择Excel(CSV)文件,可下载模板!');return false};"
            OnClick="btnCurrentImport_Click" Text="导入" CausesValidation="true" Width="75px"
            Height="19px" />
        <asp:LinkButton ID="lbtnSaveTempter" runat="server" OnClick="lbtnSaveTempter_Click" CausesValidation="False"><font color="red">*</font>
                <font style="color:#0E529D;"><%=lang.LF("下载")%>[<%=getNodeName()%>]的<%=this.bmode.GetModelById(ZoomLa.Common.DataConverter.CLng(int.Parse(this.Request.QueryString["ModelID"]))).ItemName %><%=lang.LF("模型CSV导入模板")%></font>                
        </asp:LinkButton>(<%=lang.LF("下载后用EXCEL打开从第二行开始按规范填写并保存即可")%>)
    </div>
    <div class="clearbox">
    </div>
    <%} %>
    <div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr align="center">
                <td id="TabTitle0" class="titlemouseover" onclick="ShowTabs(0)">
                    <%=lang.LF("所有内容")%>
                </td>
                <td id="TabTitle5" class="tabtitle" onclick="ShowTabs(5)">
                    工作流审批
                </td>
                <td id="TabTitle1" class="tabtitle" onclick="ShowTabs(1)">
                    <%=lang.LF("草稿")%>
                </td>
                <td id="TabTitle2" class="tabtitle" onclick="ShowTabs(2)">
                    <%=lang.LF("待审核")%>
                </td>
                <td id="TabTitle3" class="tabtitle" onclick="ShowTabs(3)">
                    <%=lang.LF("已审核")%>
                </td>
                <td id="TabTitle4" class="tabtitle" onclick="ShowTabs(4)">
                    <%=lang.LF("退稿")%>
                </td>                
                <td align="right">
                    <%=lang.LF("工作流")%>：<asp:Label runat="server" ID="lab1" Text=""></asp:Label>
                    &gt;&gt;<asp:Label runat="server" ID="lab2" Text=""></asp:Label>
                    &gt;&gt;<asp:Label runat="server" ID="lab3" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
<table id="EGV" cellspacing="1" cellpadding="2" style="color:Black;background-color:White;width:100%;text-align:center;"  class="border">
            <tr class="tdbg" style="height:25px;">
                <th style="width:5%;"><input type="checkbox" id='chkAll'/></th>
                <th style="width:5%;">ID</th>
                <th style="width:41%;">标题</th>
                <th style="width:6%;">录入者</th>
                <th style="width:6%;">点击数</th>
                <th style="width:6%;">推荐</th>
                <th style="width:6%;">状态</th>
                <th style="width:8%;">排序</th>
                <th>操作</th>
            </tr>
        <ZL:Repeater ID="RPT" runat="server" PageSize="10" PagePre="<tr><td colspan='9' class='tdbg'>" PageEnd="</td></tr>" OnItemDataBound="RPT_ItemDataBound" OnItemCommand="RPT_ItemCommand">
            <ItemTemplate>
                <tr ondblclick="location='ShowContent.aspx?GID=<%#Eval("GeneralID") %>&modeid=<%#Eval("ModelID") %>';" class="tdbg" style="height:25px;">
                    <td> <input type="checkbox" name="chkSel" title="" value='<%#Eval("GeneralID") %>' /></td>
                    <td><%#Eval("GeneralID") %></td>
                    <td style="text-align:left;">
                        <%# GetPic(Eval("ModelID", "{0}"))%>
                        <%# GetTitle(Eval("GeneralID", "{0}"), Eval("NodeID", "{0}"), Eval("Title", "{0}"), Eval("ModelID", "{0}"))%>
                    </td><!--标题-->
                    <td><%#Eval("inputer") %></td>
                    <td><%#Eval("Hits") %></td>
                    <td><%#GetElite(Eval("EliteLevel", "{0}")) %></td>
                    <td><!--状态-->
                        <asp:HiddenField ID="hfstatus" runat="server" Value='<%#Eval("Status") %>' />
                        <%#GetStatus(Eval("Status", "{0}")) %></td>
                    <td><!--排序-->
                        <asp:LinkButton ID="lbtnUpMove" runat="server" CommandName="DownMove" CommandArgument='<%# Eval("GeneralID") %>'>上移 |</asp:LinkButton>
                        <asp:LinkButton ID="lbtnDownMove" runat="server" CommandName="UpMove" CommandArgument='<%# Eval("GeneralID") %>'>下移</asp:LinkButton></td>
                    <td><!--操作-->
                             <%# GetTitles(Eval("GeneralID", "{0}"), Eval("ModelID", "{0}"))%>
                    |
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID").ToString()+","+Eval("ModelID").ToString() %>'
                        Enabled='<%# getenabled(Eval("Status").ToString()) %>' CausesValidation="false">修改</asp:LinkButton>
                        |
                    <asp:LinkButton ID="lbDelete" runat="server" Enabled='<%#getenabled(Eval("GeneralID").ToString()) %>'
                        CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>' OnClientClick='<%#getdel() %>'>删除</asp:LinkButton>
                        |
                    <asp:LinkButton ID="lbCheck" runat="server" CommandName="check" CommandArgument='<%#Eval("GeneralID") %>'><%#lang.LF("浏览")%></asp:LinkButton>
                        <asp:Label ID="viewspan" runat="server" Text=" | "></asp:Label>
                        <asp:LinkButton ID="lbUpdate" runat="server">删除HTML</asp:LinkButton>
                        <asp:LinkButton ID="lbBid" runat="server" CommandName="bider" CommandArgument='<%#Eval("GeneralID") %>'
                            Visible='<%#getBid(Eval("GeneralID")) %>'> |生成Html</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:Repeater>
        </table>
    <div class="clearbox">
    </div>
        <asp:Button ID="btnDeleteAll" Style="width: 110px;" CausesValidation="false" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项放入回收站吗？')}" CssClass="C_input" />&nbsp;
        <input type="button" id="timeReBtn" style="width: 110px;" value="定时发布" class="C_input" onclick="$('#timeReDiv').show();"/>
        <asp:Button ID="btnPdf" CausesValidation="false" Style="width: 110px;" runat="server" Text="生成PDF" CssClass="C_input" OnClientClick="if(!IsSelectedId()){alert('请选择生成项');return false;}else{return confirm('你确定要生成选中内容吗？')}" OnClick="btnPdf_Click" />&nbsp;
    <asp:Button ID="btnAudit" CausesValidation="false" Style="width: 110px;" runat="server" Visible="false"
        Text="审核通过" CssClass="C_input" OnClick="btnAudit_Click" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要审核选中内容吗？')}" />&nbsp;
    <asp:Button ID="btnUnAudit" CausesValidation="false" Style="width: 110px;" runat="server"
        Text="取消审核" CssClass="C_input" OnClick="btnUnAudit_Click" OnClientClick="if(!IsSelectedId()){alert('请选择审核项');return false;}else{return confirm('你确定要取消审核选中内容吗？')}" />&nbsp;
    <asp:Button ID="Button2" CausesValidation="false" Style="width: 110px;" runat="server"
        Text="批量推荐" OnClientClick="if(!IsSelectedId()){alert('请选择项');return false;}else{return confirm('你确定要将所有选择项设为推荐吗？')}"
        CssClass="C_input" OnClick="Button2_Click" />&nbsp;
    <asp:Button ID="Button3" CausesValidation="false" Style="width: 110px;" runat="server"
        Text="取消推荐" OnClientClick="if(!IsSelectedId()){alert('请选择项');return false;}else{return confirm('你确定要取消所有选择项推荐吗？')}"
        CssClass="C_input" OnClick="Button3_Click" />&nbsp;
    <asp:Button ID="btnMove" Style="width: 110px;" CausesValidation="false" runat="server"
        Text="批量移动" OnClick="btnMove_Click" OnClientClick="if(!IsSelectedId()){alert('请选择移动项');return false;}else{return true}"
        CssClass="C_input" />&nbsp;
    <asp:Button ID="btnAddToSpecial" Style="width: 110px;" CausesValidation="false" runat="server"
        Text="添加到专题" OnClick="btnAddToSpecial_Click" OnClientClick="if(!IsSelectedId()){alert('请选择添加到专题的内容');return false;}else{return true}"
        CssClass="C_input" />&nbsp;
    <asp:Button ID="Button1" Style="width: 110px;" CausesValidation="false" runat="server"
        Text="批量修改" CssClass="C_input" OnClientClick="if(!IsSelectedId()){alert('请选择修改项');return false;}else{return confirm('你确定要修改选中内容吗？')}"
        OnClick="Button1_Click" />
        <asp:Button ID="btnEsc" Style="width: 60px;" CausesValidation="false" runat="server"
            Text="退稿" OnClick="btnEsc_Click" class="C_input" />&nbsp;&nbsp;
    <asp:Button ID="btnRead" CausesValidation="false" Style="width: 60px;" runat="server"
        Text="投递" CssClass="C_input" OnClientClick="if(!IsSelectedId()){alert('请选择投递项');return false;}else{return confirm('你确定要投递选中内容吗？')}"
        OnClick="btnRead_Click" />
    &nbsp;
        <div visible="false" runat="server" id="audit_Div" style="margin-top:8px;">
            <asp:Button runat="server" CssClass="C_input" ID="NextStep_Btn" OnClick="NextStep_Btn_Click" Text="工作流批量审批" OnClientClick="return confirm('确定要批量审批吗!');" />
            <asp:Button runat="server" CssClass="C_input" ID="StepReject_Btn" OnClick="StepReject_Btn_Click" Text="工作流批量拒绝" OnClientClick="return confirm('确定要批量拒绝吗!');" />
        </div>
    <asp:HiddenField ID="HiddenNodeID" runat="server" />
        <div id="timeReDiv" style="display:none;background-color:#E8F5FF;" >
          <ul>
              <li>
                 <strong>时间：</strong><input type="text" id="timeReBTime" name="timeReBTime" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" maxlength="50" style="margin-left:6px;"/>
              </li>
              <li>
                 <strong>操作：</strong>
                 <asp:Button runat="server" ID="timeReConfBtn" OnClick="timeReConfBtn_Click" CssClass="C_input" Text="添加任务" CausesValidation="false"/>
                 <input type="button" value="取消" onclick="closeDiv()" class="C_input"/>
              </li>
          </ul>
        </div>
        <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
        <script type="text/javascript" src="/JS/Popmenu.js"></script>
        <script type="text/javascript" src="/js/Drag.js"></script>
        <script type="text/javascript" src="/js/Dialog.js"></script>
        <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
        <script type="text/javascript" src="/JS/pacalendar.js"></script>
        <script type="text/javascript" src="/JS/jquery.js"></script>
        <script type="text/javascript">
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
            function editnode(NodeID) {
                var answer = confirm("该栏目未绑定模板，是否立即绑定");
                if (answer == false) {
                    return false;
                }
                else {
                    open_page(NodeID, "EditNode.aspx?NodeID=");
                }
            }
            function open_page(NodeID, strURL) {
                var diag = new Dialog();
                diag.Width = 800;
                diag.Height = 600;
                diag.Title = "添加节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
                diag.URL = strURL + NodeID;
                diag.show();
            }
        </script>
        <script type="text/javascript">
            var tID = 0;
            var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5");
            window.onload = function () {
                pload();
            }
            function ShowTabs(ID) {
                location.href = 'ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
    }
    function pload() {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            $("#" + arrTabTitle[tID]).attr("class", "tabtitle");
            $("#" + arrTabTitle[ID]).attr("class", "titlemouseover");
            tID = ID;
        }
    }
    function dialogOpen() {
        document.getElementById("divTranPross").style.display = "block";
        document.getElementById("divBackPross").style.display = "block";
    }
    function dialogClose() {
        document.getElementById("divTranPross").style.display = "none";
        document.getElementById("divBackPross").style.display = "none";
    }
        </script>
        <script type="text/javascript">
            //chk服务端控件,解析后是放在span中的，以后将其改为html
            function closeDiv() {
                $("#timeReDiv").hide();
            }
            $().ready(function () {
                $("#chkAll").click(function () {//EGV 全选
                    selectAll(this, "chkSel");
                });
                $("#EGV tr").mousemove(function () { this.className = 'tdbgmouseover'; }).mouseout(function () { this.className = 'tdbg'; });
            });
            function selectAll(obj, name) {
                var allInput = document.getElementsByName(name);
                var loopTime = allInput.length;
                for (i = 0; i < loopTime; i++) {
                    if (allInput[i].type == "checkbox") {
                        allInput[i].checked = obj.checked;
                    }
                }
            }
            function area() {
                $.ajax({
                    type: "POST",
                    url: "ContentManage.aspx",
                    data: "action=area&value=" + $("#selprovince option:selected").val(),
                    success: function (msg) {
                        var s = new Array();
                        s = msg.split("|");
                        var str = "";
                        for (var i = 0; i < s.length; i++) {
                            if (s[i] != null && s[i] != "")
                                str += "<option>" + s[i] + "</option>"
                        }
                        $("#selcity").html(str);
                    },
                    Error: function (msg) {
                        alert("地址获取失败");
                    }
                });
            }
        </script>
    </form>
</body>
</html>