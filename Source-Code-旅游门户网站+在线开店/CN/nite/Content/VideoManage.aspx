<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_CompanyVideo, App_Web_ks1ruwvi" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>视频列表</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
   <div class="us_topinfo">
     
        <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">视频管理 [<a href="AddVideo.aspx" ><font color="red">上传视频</font></a>]</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 
       <div class="cleardiv"> </div>
  </div>
  <div class="clearbox"> </div>
  <ZL:ExGridView ID="gvVideo" CssClass="table table-striped table-bordered table-hover" Width="100%" AllowPaging="true" OnPageIndexChanging="gvVideo_PageIndexChanging" runat="server" EmptyDataText="<font color='red'>暂时没有数据</font>" DataKeyNames="VID"  AutoGenerateColumns="False">
    <Columns>
    <asp:BoundField HeaderText="编号" DataField="Vid"  ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="60px" />
    <asp:TemplateField HeaderText="视频名称" ItemStyle-HorizontalAlign="Center">
      <ItemTemplate> <a href="ShowVideo.aspx?ID=<%#Eval("Vid") %>"><%#Eval("VidTitle")%></a> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center">
      <ItemTemplate><%#Eval("Vid").ToString()=="0"?"未审核":"已审核" %> </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField HeaderText="添加时间" DataField="Uploadtime" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center" />
    <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="100px" >
      <ItemTemplate> <a href="AddVideo.aspx?ID=<%#Eval("Vid") %>">修改</a> | <a href="ShowVideo.aspx?ID=<%#Eval("Vid") %>">预览</a> </ItemTemplate>
    </asp:TemplateField>
    </Columns>
  </ZL:ExGridView>
  </table>
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
