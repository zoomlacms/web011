<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_TemplateManage, App_Web_5nkxzgmd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
    <table width="100%" class="table table-bordered">
        <tr>
            <td align="left">当前目录：<asp:Label ID="lblDir" runat="server" Text="Label"></asp:Label></td>
            <td align="right">
                <asp:Literal ID="LitParentDirLink" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table table-striped table-bordered table-hover" align="center">
        <tr class="gridtitle" align="center" style="height: 25px;">
            <td width="45%">名称</td>
            <td width="10%">大小</td>
            <td width="10%">类型</td>
            <td width="20%">修改时间</td>
            <td>操作</td>
        </tr>
        <asp:Repeater ID="repFile" runat="server" OnItemCommand="repFileReName_ItemCommand">
            <ItemTemplate>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'"  ondblclick="dd('<%# Eval("Name").ToString()%>')"  id="chk_<%# Eval("Name").ToString()%>" onmouseout="this.className='tdbg'">
                    <td align="left">
                        <img alt="" src=' <%# System.Convert.ToInt32(Eval("type")) == 1 ? "/App_Themes/AdminDefaultTheme/Images/Node/closefolder.gif" :"/App_Themes/AdminDefaultTheme/Images/Node/singlepage.gif" %>' />
                        <a id="hre_<%# Eval("Name").ToString()%>"  <%#isimg(Eval("content_type").ToString().Trim())?" class=\"lightbox\" href=\"" + TemplateDir+Request.QueryString["Dir"] +"/"+ Eval("Name").ToString(): "href=\""+(System.Convert.ToInt32(Eval("type")) == 1 ?  "TemplateManage.aspx?setTemplate="+Server.UrlEncode(TemplateDir)+"&Dir=" + Server.UrlEncode(Request.QueryString["Dir"] +"/"+ Eval("Name").ToString()):"TemplateEdit.aspx?setTemplate="+Server.UrlEncode(TemplateDir)+"&filepath="+ Server.UrlEncode(Request.QueryString["Dir"] +"/"+ Eval("Name").ToString())) %>">
                        <%# Eval("Name") %></a>
                    </td>
                    <td align="center">
                        <%# System.Convert.ToInt32(Eval("type")) == 1 ? "" : GetSize(Eval("size").ToString())%>
                    </td>
                    <td align="center">
                        <asp:HiddenField ID="HdnFileType" Value='<%#Eval("type") %>' runat="server" />
                        <%# System.Convert.ToInt32(Eval("type")) == 1 ? "文件夹" : Eval("content_type").ToString() + "文件" %>
                    </td>
                    <td align="center">
                        <%#Eval("lastWriteTime")%>
                    </td>
                    <td align="center">&nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "":"DownFiles" %>' Enabled='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false:true %>'>下载</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>' OnClientClick="return confirm('你确认要删除该文件夹或文件吗？')">删除</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "CopyDir":"CopyFiles" %>' Enabled='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false:true %>'>复制</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <div class="clearfix"></div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center">
        <tr class="tdbg">
            <td width="285" align="right">
                <span class="tips pull-left">目录名称：</span>
            <asp:TextBox ID="txtForderName" class=" form-control pull-left" runat="server" Width="200"></asp:TextBox>
            </td>
            <td align="left" width="15%">
                <asp:Button ID="btnCreateFolder" class="btn btn-primary" runat="server" Text="创建目录" OnClick="btnCreateFolder_Click" />
                <asp:HiddenField ID="HdnPath" runat="server" />
            </td>
            <td width="235" align="right">
                <asp:FileUpload ID="fileUploadTemplate" runat="server" />
            </td>
            <td width="10%">
                <asp:Button ID="btnTemplateUpLoad" class="btn btn-primary" runat="server" Text="上传模板" OnClientClick="return confirm('即将覆盖同名模板，是否继续？');" OnClick="btnTemplateUpLoad_Click" />
            </td>
            <td align="right">
                <asp:Button ID="BackGrup" class="btn btn-primary" runat="server" Text="备份当前方案" OnClick="BackGrup_Click" OnClientClick="if(!this.disabled) return confirm('是否创建备份？(提示：备份同名文件会覆盖！)');" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/Common.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
            $(".lightbox").lightbox({
                fitToScreen: true,
                imageClickClose: false
            });
        });
        function dd(id) {
            document.getElementById("hre_" + id + "").click(); 
        }
 
    </script>

</asp:Content>
