<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_NiteHouse, App_Web_ks1ruwvi" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="Head" runat="Server">
   <title>视频房间管理</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
  

        <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">视频房间管理</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 


<table class="table table-bordered table-hover table-striped">
  <tr align="center">
    <td width="10%" class="title">房间编号</td>
    <td width="20%" class="title">房间名称</td>
    <td width="20%" class="title">职位名称</td>   
    <td width="10%" class="title">房间人数</td> 
    <td width="20%" class="title">企业编号</td>     
    <td width="20%" class="title"> 操作</td>
  </tr>
    <ZL:ExGridView CssClass="table table-bordered table-hover table-striped" AllowPaging="true" OnPageIndexChanging="gvCard_PageIndexChanging" EmptyDataText="<font color='red'>暂无数据</font>" ID="gvCard" runat="server" > 
        <Columns><asp:TemplateField HeaderText="操作">
    <ItemTemplate>
  <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">   
    <td height="22" align="center"><%#Eval("Rid")%></td>    
    <td height="22" align="center"><%#Eval("Rname")%></td>
    <td height="22" align="center"><%#Getjobname(Eval("RJob","{0}"))%></td>
    <td height="22" align="center"><%#Eval("RMinSize")%>-<%#Eval("RMaxSize")%></td>
    <td height="22" align="center"><%#Eval("ComapnyID")%></td>
    <td height="22" align="center">
    <a href="NiteHouse.aspx?menu=reok&id=<%#Eval("Rid")%>" onclick="return confirm('确定要取消审核该房间吗?');">取消审核</a>
    <%#Getbotton(Eval("Rid","{0}")) %>
    <a href="NiteHouse.aspx?menu=del&id=<%#Eval("Rid")%>" onclick="return confirm('确定删除该信息吗？删除后该信息不可恢复!');">删除</a>
    </td>
</table></ItemTemplate></asp:TemplateField></Columns></ZL:ExGridView>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
