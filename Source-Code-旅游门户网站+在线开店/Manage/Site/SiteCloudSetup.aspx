<%@ page language="C#" autoeventwireup="true" inherits="manage_Site_SiteColudSetup, App_Web_5arvbvnz" masterpagefile="~/manage/Site/SiteMaster.master" title="快云安装" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<meta charset="utf-8" />
<title>快云安装</title>
<script type="text/javascript" src="../../JS/jquery.js"></script>
<style>#site_nav .site04 a{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}</style>
<link href="/Plugins/JqueryUI/EasyDialog/easydialog.css" rel="stylesheet" />
<script src="/JS/jquery.js"></script>
<script src="/Plugins/JqueryUI/EasyDialog/easydialog.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div id="m_site">
	<p><a href="Default.aspx">站群中心</a> >> 配置管理 >> 快云安装 </p>
</div>
    <asp:ScriptManager runat="server" ></asp:ScriptManager>
<div id="site_main" class="cswsDiv">
<ul>
    <li>
        <strong>文件来源：</strong><asp:TextBox runat="server" ID="codeSource" CssClass="site_input" Style="width: 315px;"></asp:TextBox><asp:Button runat="server" Text="恢复为原始地址" OnClick="ResetUrl_Click" CssClass="site_button" />
    </li>
    <li>
        <strong>目标站点：</strong><asp:DropDownList runat="server" ID="siteListDP" onchange="dpChange(this);"></asp:DropDownList>
        <asp:Button runat="server" ID="setupBtn" Text="开始下载安装" style="display:none;" class="site_button" OnClick="setupBtn_Click"/>
    </li>
<%--    <li style="display: none;">
        <strong>绑定信息：</strong>
        <label runat="server" id="sitePort" style='position: relative; bottom: 5px;'>请选择站点</label>
        <label runat="server" id="domain" style='position: relative; bottom: 5px; margin-left: 8px;'></label>
    </li>--%>
    <li>
        <strong>存放地址：</strong><asp:TextBox runat="server" ID="zipSavePath" CssClass="site_input" Style="width: 315px;" />
          <asp:RegularExpressionValidator runat="server" ID="spValid" ControlToValidate="zipSavePath" ValidationExpression="^\\[\w\W]*\\$"
            ErrorMessage="格式不正确,必须以\开头以\结束例:\Zoomla\" Display="Dynamic" ForeColor="Red"/>
    </li>
    <li>
        <strong>服务器IP：</strong><asp:Label runat="server" ID="serverIP" />
    </li>
<%--    <li>
        <strong>安装路径：</strong><asp:TextBox runat="server" ID="setupPath" CssClass="site_input" Style="width: 315px;"></asp:TextBox>例:/为安装在网站根目录
        <asp:RegularExpressionValidator runat="server" ID="spValid" ControlToValidate="setupPath" ValidationExpression="^/[\w\W]*"
            ErrorMessage="格式不正确,必须以/开头" Display="Dynamic" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="setupPath" ErrorMessage="安装路径不能为空，推荐为/" Display="Dynamic" />
    </li>--%>
    <li><strong>管理操作：</strong>
        <asp:Button runat="server" ID="saveBtn" Text="保存" CssClass="site_button" OnClick="saveBtn_Click" />
        <input type="button" value="返回站点列表" onclick="location = 'Default.aspx'" class="site_button" />
    </li>
</ul>
<div id="CSDiv" style="display:none;" class="border">
    <iframe id="mainFrame" onload="frameInit(this);" src="CreateSite.aspx" frameborder=0 scrolling=no style="width:1000px;"></iframe>
 </div>
</div><!--Main End-->
    <script type="text/javascript">
        function dpChange(obj) 
        {
            var index = $(obj).find("option:selected").index();
            if (index > 2)
            {
                $("#<%=setupBtn.ClientID%>").css("display", "");
            }
            else if (index==1) {
                $("#<%=setupBtn.ClientID%>").css("display", "none");
                newSite();
            }
            else
            {
                $("#<%=setupBtn.ClientID%>").css("display", "none");
            }
        }

        function newSite() {//打开新站点，对话框
            easyDialog.open({
                container: 'CSDiv',
                fixed: false
            });
        }

        function frameInit(obj) {//设定高度，并隐藏iframe中的面包屑导航
            obj.height = window.frames["mainFrame"].document.body.scrollHeight * 0.95
            $doc = window.frames['mainFrame'].document;
            $($doc).find(".r_navigation").hide();
        }

        function closeDiv()
        {
            easyDialog.close();
        }
    </script>
</asp:Content>