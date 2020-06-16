<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Content_VideoHouseVerify, App_Web_bqdihibb" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>待审核视频房间列表</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
  

   <div class="clearbox">
</div>
<div class="r_navigation">
        <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">待审核视频房间</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 


<table class="table table-bordered table-hover table-striped">
  <tr align="center">
    <td width="10%" class="title">房间编号</td>
    <td width="20%" class="title">房间名称</td>
    <td width="20%" class="title">职位名称</td>   
    <td width="20%" class="title">房间人数</td> 
    <td width="20%" class="title">企业编号</td>     
    <td width="40%" class="title"> 操作</td>
  </tr>
    <ZL:ExGridView AllowPaging="true" OnPageIndexChanging="gvCard_PageIndexChanging"  AutoGenerateColumns="false" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="<font color='red'>当前没有信息!!</font>"  ID="gvCard" runat="server" > 
        <Columns>
            <asp:TemplateField HeaderText="操作">
    <ItemTemplate>
  <tr>   
    <td height="22" align="center"><%#Eval("Rid")%></td>    
    <td height="22" align="center"><%#Eval("Rname")%></td>
    <td height="22" align="center"><%#Getjobname(Eval("RJob","{0}"))%></td>
    <td height="22" align="center"><%#Eval("RMinSize")%>-<%#Eval("RMaxSize")%></td>
    <td height="22" align="center"><%#Eval("ComapnyID")%></td>
    <td height="22" align="center">
    <a href="VideoHouseVerify.aspx?menu=open&id=<%#Eval("Rid")%>">通过审核</a>
    <a href="VideoHouseVerify.aspx?menu=del&id=<%#Eval("Rid")%>" >删除</a>
    </td>
  </tr>
    </ItemTemplate>
            </asp:TemplateField>
            </Columns>
    </ZL:ExGridView>
</table>
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
