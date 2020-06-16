<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_VideoVerify, App_Web_bqdihibb" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>视频审核</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">视频申请列表</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 
    <div class="clearbox">
    </div>
<table class="table table-bordered table-hover table-striped">
  <tr align="center">
    <td width="10%" class="title">视频编号</td>
    <td width="30%" class="title">视频名称</td>
    <td width="20%" class="title">视频状态</td>   
    <td width="40%" class="title"> 操作</td>
  </tr>
    <Zl:ExGridView  CssClass="table table-striped table-bordered table-hover" ID="gvCard" AllowPaging="true" OnPageIndexChanging="gvCard_PageIndexChanging"  runat="server"  EmptyDataText="<font color='red'>暂时没有数据！</font>"> 
        <Columns><asp:TemplateField HeaderText="操作">
    <ItemTemplate>
  <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">   
    <td height="22" align="center"><%#Eval("Vid")%></td>    
    <td height="22" align="center"><%#Eval("VidTitle")%></td>
    <td height="22" align="center"><%#GetStatus(Eval("State").ToString())%></td>
    <td height="22" align="center"> 
    <a href="../video/ViewVideo.aspx?videoid=<%#Eval("Vid")%>" >查看</a>&nbsp;&nbsp;  
    <a href="VideoVerify.aspx?ok=<%#Eval("Vid")%>" >审核通过</a>&nbsp;&nbsp;
    <a href="VideoVerify.aspx?del=<%#Eval("Vid")%>" >删除</a>
    </td>
  </tr>
    </ItemTemplate>
            </asp:TemplateField>
            </Columns>
    </Zl:ExGridView>
</table>
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
    
