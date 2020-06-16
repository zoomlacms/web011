<%@ page language="C#" autoeventwireup="true" inherits="manage_iServer_BselectiServer, App_Web_1npjerrz" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>有问必答</title>
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
</head>
<body>
    <form id="form1" runat="server" >
    <div class="r_navigation">
        <span>后台管理</span>&gt;&gt;<span><a href="BiServer.aspx">有问必答</a></span>&gt;&gt;<span>问题列表</span>
    </div>
    
        <div >

    
        <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;float:left;margin-left:5px;margin-right:5px;" class="l_input"><tr ><td> 
        <input  type="text"  name="search_title" style="border-color:#fff;color:#666;" class="l_inpnon" value="请输入标题关键字" onclick="if (this.value == '请输入标题关键字') { this.value = ''; this.style.color = 'black'; }">
<asp:Button ID="Button1" class="C_sch" runat="server" Text="" OnClick="Button1_Click" />
            </td></tr></table>
            </div>
       <table style="float:left;"><tr><td> 通知方式：</td></tr></table>
        <asp:Button ID="btnEmailNotice" CssClass="C_input" runat="server" Text="启用邮件通知" OnClick="btnEmailNotice_Click" />
        <asp:Button ID="btnSMSNotice" runat="server" CssClass="C_input" Text="启用短信通知" OnClick="btnSMSNotice_Click" />
       
        <asp:DropDownList ID="DropDownList2" CssClass="x_input" runat="server" AutoPostBack="True" onselectedindexchanged="MyBind">
            <asp:ListItem Value="所有状态">所有状态</asp:ListItem>
            <asp:ListItem Value="未解决">未解决</asp:ListItem>
            <asp:ListItem Value="处理中">处理中</asp:ListItem>
            <asp:ListItem Value="已解决">已解决</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="x_input" AutoPostBack="True" onselectedindexchanged="MyBind">
            <asp:ListItem Selected="True" Value="所有优先级">所有优先级</asp:ListItem>
            <asp:ListItem Value="低">低</asp:ListItem>
            <asp:ListItem Value="中">中</asp:ListItem>
            <asp:ListItem Value="高">高</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="true" onselectedindexchanged="MyBind">
            <asp:ListItem Selected="True" Value="所有类别">所有类别</asp:ListItem>
            <asp:ListItem Value="电话">电话</asp:ListItem>
            <asp:ListItem Value="E-mai">E-mail</asp:ListItem>
            <asp:ListItem Value="网页表单">网页表单</asp:ListItem>
            <asp:ListItem Value="直接面谈">直接面谈</asp:ListItem>
            <asp:ListItem Value="其它">其它</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList5" runat="server" CssClass="x_input" AutoPostBack="true" onselectedindexchanged="MyBind">
            <asp:ListItem Selected="True" Value="所有来源">所有来源</asp:ListItem>
            <asp:ListItem Value="其它">其它</asp:ListItem>
            <asp:ListItem Value="咨询">咨询</asp:ListItem>
            <asp:ListItem Value="投诉">投诉</asp:ListItem>
            <asp:ListItem Value="建议">建议</asp:ListItem>
            <asp:ListItem Value="要求">要求</asp:ListItem>
            <asp:ListItem Value="界面使用">界面使用</asp:ListItem>
            <asp:ListItem Value="bug报告">bug报告</asp:ListItem>
            <asp:ListItem Value="订单">订单</asp:ListItem>
            <asp:ListItem Value="财务">财务</asp:ListItem>
            <asp:ListItem Value="域名">域名</asp:ListItem>
            <asp:ListItem Value="主机">主机</asp:ListItem>
            <asp:ListItem Value="邮局">邮局</asp:ListItem>
            <asp:ListItem Value="DNS">DNS</asp:ListItem>
            <asp:ListItem Value="MSSQL">MSSQL</asp:ListItem>
            <asp:ListItem Value="MySQL">MySQL</asp:ListItem>
            <asp:ListItem Value="IDC">IDC</asp:ListItem>
            <asp:ListItem Value="网站推广">网站推广</asp:ListItem>
            <asp:ListItem Value="网站制作">网站制作</asp:ListItem>
        </asp:DropDownList>
        
    <div class="divbox" id="nocontent" runat="server" style="display: none">
        暂无问题</div>
     <table  width="100%" border="0" cellpadding="2" cellspacing="1"  class="border">

    <asp:Repeater ID="resultsRepeater_w" runat="server">
        <HeaderTemplate>
            <table width="100%" cellpadding="2" cellspacing="1" class="border" style="background-color: white;">
                <tr class="title" style="text-align: center; height: 25px;">
                    <td>
                        
                    </td>
                    <td>
                        编号
                    </td>
                    <td>
                        标题
                    </td>
                    <td>
                        用户名
                    </td>
                    <td>
                        用户类型
                    </td>
                    <td>
                        优先级
                    </td>
                    <td>
                        问题类型
                    </td>
                    <td>
                        已读次数
                    </td>
                    <td>
                        提交时间
                    </td>
                    <td>
                        状态
                    </td>
                    <td>
                        操作
                    </td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr align="center" class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" ondblclick="javascript:window.location.href='BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>'">

                <td align="center" ><input type="checkbox" name="Btchk"  value='<%# Eval("QuestionId") %>' /></td>
                <td>
                    <%# Eval("QuestionId")%>
                </td>
                <td style=" text-align:left;">
                    <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>">
                        <%# ZoomLa.Common.BaseClass.CheckInjection(Eval("Title", "{0}"))%></a>
                </td>
                <td>
                    <a onclick="opentitle('/manage/User/Userinfo.aspx?id=<%#Eval("UserId") %>','查看会员')"
                              href="###" title="查看会员"><%#GetUserName(Eval("UserId","{0}"))%></a>
                </td>
                <td>
                    <%# GetGroupName()%>
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
                    <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>">编辑</a> &nbsp;&nbsp;
                    <a href="BIServerDel.aspx?QuestionId=<%#Eval("QuestionId")%>" onclick="return confirm('确认删除此项?')">
                        删除</a>
                </td>
            </tr>
        </ItemTemplate>
        
    </asp:Repeater>
         <tr class="tdbg">
<td  align="center" class="tdbgleft">
<asp:CheckBox ID="cbAll" runat="server" Font-Size="9pt" Text="" onclick="javascript:checkAll()"/></td>
<td height="24" align="center" class="tdbgleft" colspan="15">
<div style=" float:left; width:100px; text-align:left; padding-left:0.8%; height: 24px;"> 
<asp:Button ID="batDel"  class="C_input" Font-Size="9pt"  Text="批量删除" runat="server"   OnClientClick="if(!isAnyOneChecked()){alert('未选中任何内容');return false;}else{return confirm('你确定要删除选中内容吗？')}" OnClick="batDel_Click"/>
</div>
共
<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
条信息
<asp:Label ID="Toppage" runat="server" Text="" />
<asp:Label ID="Nextpage" runat="server" Text="" />
<asp:Label ID="Downpage" runat="server" Text="" />
<asp:Label ID="Endpage" runat="server" Text="" />
页次：
<asp:Label ID="Nowpage" runat="server" Text="" />
/
<asp:Label ID="PageSize" runat="server" Text="" />
页 <span style="text-align: center">
<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px"  ontextchanged="txtPage_TextChanged"></asp:TextBox>
</span>条信息/页  转到第
>条信息/页  转到第
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
页 </td>
</tr>
        </table>


    </form>
</body>
</html>
