<%@ page language="C#" autoeventwireup="true" inherits="manage_iServer_BiServer, App_Web_1npjerrz" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
     <title><%=lang.LF("有问必答")%></title>
     <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
     <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
     <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
     <script src="../../JS/Dialog.js"></script>
     <script type="text/javascript">
             function opentitle(url, title) {
                 var diag = new Dialog();
                 diag.Width = 600;
                 diag.Height = 400;
                 diag.Title = title;
                 diag.URL = url;
                 diag.show();
             }
             function checkAll() {
                 xstatus = document.getElementById("cbAll").checked;
                 var checkBoxs = document.getElementsByName("Btchk");
                 for (i = 0; i < checkBoxs.length; i++) {
                     checkBoxs[i].checked = xstatus;
                 }

             }
             function isAnyOneChecked() {
                 var checkBoxs = document.getElementsByName("Btchk");
                 for (i = 0; i < checkBoxs.length; i++) {
                     if (checkBoxs[i].checked) return true;
                 }
             }
     </script>
<style>
    th
    {
        background: url(Images/title.gif) #E7F3FF repeat-x top; /*line-height: 120%;*/
        padding: 2px;
        color: #656766;
    }
    .style1
    {
        height: 2px;
    }


</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
    <form id="Form1" runat="server">
    <div class="r_navigation">
        <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('49')" title="帮助"></a></div>
  <%} %>
        <span><%=lang.LF("后台管理")%></span>&gt;&gt;<span><a href="BiServer.aspx"><%=lang.LF("有问必答")%></a></span>&nbsp;<span style="color:red;"><a href="AddQuestionRecord.aspx" style=" color:Red;">[添加问题记录]</a></span>
    </div>
    <div class="clearbox">
    </div>
    <table width="100%">
        <div id="viewPanel">
            <!-- v3.0.2 -->
            <table width="100%">
                <tr>
                    <td colspan="2" style="text-align: center">
                        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                            <tr>
                                <td colspan="2" class="title" align="center"><%=lang.LF("问题摘要")%></td>
                            </tr>
                            <tr align="left" class="tdbg" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=-3&strTitle='" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                                                class="tdbg">
                                <td width="100" align="right"><a href="BselectiServer.aspx?num=-3&strTitle="><%=lang.LF("总数")%></a>：</td>
                                <td>
                                    <asp:Label ID="lblAllNum" runat="server" Text="0" style=" cursor:pointer" onclick="javascript:window.location.href='BselectiServer.aspx?num=-3&strTitle='"></asp:Label>
                                </td>
                            </tr>
                            <asp:Panel ID="panel_w" runat="server" Visible="false">
                                <tr align="left" class="tdbg" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=-1&strTitle='" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                                                class="tdbg">
                                    <td class="TitleTD"  align="right">
                                        <a href="BselectiServer.aspx?num=-1&strTitle="><font color="red"><%=lang.LF("未解决")%></font></a>：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblnum_w" runat="server" Text="" style=" cursor:pointer" onclick="javascript:window.location.href='BselectiServer.aspx?num=-1&strTitle='"></asp:Label>
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="panel_ch" runat="server" Visible="false">
                                <tr align="left" class="tdbg" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=-2&strTitle='" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                                                class="tdbg">
                                    <td class="TitleTD" align="right">
                                        <a href="BselectiServer.aspx?num=-2&strTitle="><font color="brown"><%=lang.LF("处理中")%></font></a>：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblNum_ch" runat="server" Text="" style=" cursor:pointer" onclick="javascript:window.location.href='BselectiServer.aspx?num=-2&strTitle='"></asp:Label>
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="panel_y" runat="server" Visible="false">
                                <tr align="left" class="tdbg" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=-4&strTitle='" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                                                class="tdbg">
                                    <td class="TitleTD" align="right">
                                        <a href="BselectiServer.aspx?num=-4&strTitle="><font color="green"><%=lang.LF("已解决")%></font></a>：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblnum_y" runat="server" Text="" style=" cursor:pointer" onclick="javascript:window.location.href='BselectiServer.aspx?num=-4&strTitle='"></asp:Label>
                                    </td>
                                </tr>
                            </asp:Panel>
                        </table>
                        <br />
                        <%--<table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                            <tr ><td>最近5条未解决问题</td></tr>
                            <tr>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                        <br />--%>
                        
                        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                            <tr class="tdbg">
                                <td >
                                <span style=" float:left; margin-left:10px;">最近5条未解决问题</span>
                                  
                                    <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;float:left;margin-left:25px;" class="l_input"><tr ><td> 

<%--                                    <asp:TextBox ID="TextBox1"  runat="server" BorderColor="#fff" CssClass="l_inpnon" ></asp:TextBox>--%>
                                        <input   type="text"  id="TextBox1" runat="server" style="border-color:#fff;color:#666;" class="l_inpnon" value="请输入标题关键字" 
onclick="if (this.value == '请输入标题关键字') { this.value = ''; this.style.color = 'black'; }"/>

                                    <asp:Button ID="Button1" runat="server"  class="C_sch" Text="" OnClick="Button1_Click" /></td></tr></table>
                                    <span style="float: right; margin-right:20px;">
                                        <a href="BselectiServer.aspx?num=-1&OrderID=<%=Request.QueryString["OrderID"] %>&menu=<%=Request.QueryString["menu"] %>&strTitle=">更多>></a>
                                        <%--input type="button" onclick="javascript:location.href='BselectiServer.aspx?num=-1&OrderID=<%=Request.QueryString["OrderID"] %>&menu=<%=Request.QueryString["menu"] %>&strTitle='"
                                            value="更多" class="C_input" />--%>
                                     </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Repeater ID="resultsRepeater_w" runat="server">
                                        <HeaderTemplate>
                                            <table width="100%"  cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                                              
                                                    <tr class="tdbg" align="center">
                                                        <th class="title"><%=lang.LF("编号")%></th>
                                                        <th class="title"><%=lang.LF("标题")%></th>
                                                        <th class="title">提交者</th>
                                                        <th class="title"><%=lang.LF("优先级")%></th>
                                                        <th class="title"><%=lang.LF("问题类型")%></th>
                                                        <th class="title"><%=lang.LF("已读次数")%></th>
                                                        <th class="title"><%=lang.LF("提交时间")%></th>
                                                        <th class="title"><%=lang.LF("状态")%></th>
                                                        <th class="title"><%=lang.LF("操作")%></th>
                                                    </tr>
                                             
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" class="tdbg" align="center" ondblclick="javascript:window.location.href='BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>'">
                                                <td>
                                                    <%# Eval("QuestionId")%>
                                                </td>
                                                <td >
                                                <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>" >
                                                      <%# ZoomLa.Common.BaseClass.CheckInjection(Eval("Title", "{0}"))%></a>
                                                </td>
                                                <td>
                                                <a onclick="opentitle('/manage/User/Userinfo.aspx?id=<%#Eval("UserId") %>','查看会员')" href="###" title="查看会员"><%#GetUserName(Eval("UserId","{0}"))%></a>
                                                    </td>
                                                <td><%# Eval("Priority")%></td>
                                                <td><%# Eval("Type")%></td>
                                                <td><%# Eval("ReadCount")%></td>
                                                <td> <%# Eval("SubTime")%></td>
                                                <td>
                                                    <asp:Label ID="lblState" runat="server" ForeColor="Red" Text='<%# Eval("State")%>'></asp:Label>
                                                </td>
                                                <td>
<a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>" ><%=lang.LF("编辑")%></a> &nbsp;&nbsp;
<a href="BIServerDel.aspx?QuestionId=<%#Eval("QuestionId")%>" onclick="return confirm('确认要删除此项?')">
                                     <%=lang.LF("删除")%></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody> </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                            <tr class="tdbg">
                                <td>
                                <span style=" float:left; margin-left:10px;">最近5条处理中问题</span>
                                     
<table  cellpadding="2" border="0" cellspacing="1" 
    style="background:#fff;float:left; margin-left:25px;" class="l_input"><tr><td> 

                                     <input   type="text"  id="TextBox2" runat="server" style="border-color:#fff;color:#666;" class="l_inpnon" value="请输入标题关键字" 
onclick="if (this.value == '请输入标题关键字') { this.value = ''; this.style.color = 'black'; }"/>

                                    <asp:Button ID="Button2" runat="server" class="C_sch" Text="" OnClick="Button2_Click" /></td></tr></table>
                                    <span style="float: right; margin-right:20px;">
                                        <a href="BselectiServer.aspx?num=-2&menu=<%=Request.QueryString["menu"] %>&OrderID=<%=Request.QueryString["OrderID"] %>&strTitle=">更多>></a>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Repeater ID="resultsRepeater_ch" runat="server">
                                        <HeaderTemplate>
                                            <table  width="100%"  cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                                                <thead>
                                                    <tr align="center">
                                                        <th class="title"><%=lang.LF("编号")%></th>
                                                        <th class="title"><%=lang.LF("标题")%></th>
                                                        <th class="title">提交者:</th>
                                                        <th class="title"><%=lang.LF("优先级")%></th>
                                                        <th class="title"><%=lang.LF("问题类型")%></th>
                                                        <th class="title"><%=lang.LF("已读次数")%></th>
                                                        <th class="title"><%=lang.LF("提交时间")%></th>
                                                        <th class="title"><%=lang.LF("状态")%></th>
                                                        <th class="title"><%=lang.LF("操作")%></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr align="center" class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" ondblclick="javascript:window.location.href='BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>'">
                                                <td>
                                                    <%# Eval("QuestionId")%>
                                                </td>
                                                <td >
                                                    <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>" >
                                                      <%# ZoomLa.Common.BaseClass.CheckInjection(Eval("Title", "{0}"))%></a>
                                                </td>
                                                <td>
                                                <a onclick="opentitle('/manage/User/Userinfo.aspx?id=<%#Eval("UserId") %>','查看会员')" href="#" title="查看会员"><%#GetUserName(Eval("UserId","{0}"))%></a>
                                                </td>
                                                <td>
                                                    <%# Eval("Priority")%>
                                                </td>
                                                <td>
                                                    <%# Eval("Type")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ReadCount")%>
                                                </td>
                                                <td>
                                                    <%# Eval("SubTime")%>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblState" runat="server" ForeColor="Red" Text='<%# Eval("State")%>'></asp:Label>
                                                </td>
                                                <td>
                                                    <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>"><%=lang.LF("编辑")%></a>&nbsp;&nbsp;<a
                                                        href="javascript:void(0)" onclick="return alert('处理中的问题不允许删除!')"><%=lang.LF("删除")%></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody> </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </table>
    </form>
</body>
</html>
