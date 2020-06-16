<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content._Default, App_Web_pa2vy3y0" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>内容管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">企业黄页</li>
    </ol>
    <div style="width: 100%">
        <div style="width: 25%; float: left">
            <iframe style="height:600px;width:100%;border:none;" src="NodeTree.aspx"  id="main_left" name="main_left"></iframe>
        </div>
        <div style="width: 75%; float: left">
            <iframe style="width:100%;" ondatabinding="dyniframesize()"
                src="MyContent.aspx" frameborder="0" name="main_right1" id="main_right1"></iframe>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        var iframeids = ["main_right1"];
        function dynSizeByContent() {//滚动条在父窗口
            for (i = 0; i < iframeids.length; i++) {
                var dyniframe = document.getElementById(iframeids[i]);
                if (dyniframe && !window.opera) {
                    dyniframe.style.display = "block";
                    if (dyniframe.contentDocument && dyniframe.contentDocument.body.offsetHeight)
                    {
                        dyniframe.style.height = (dyniframe.contentDocument.body.offsetHeight + 5) + "px";
                    }
                    else if (dyniframe.Document && dyniframe.Document.body) 
                    {
                        if (dyniframe.Document.body.scrollHeight) {
                            dyniframe.style.height = dyniframe.Document.body.scrollHeight + 5;
                        }
                    }
                }
            }//for end;
        }
        window.onload = dynSizeByParent;
        function dynSizeByParent()//滚动条在框架内
        {
            for (i = 0; i < iframeids.length; i++) {
                var dyniframe = document.getElementById(iframeids[i]);
                if (dyniframe && !window.opera) {
                    dyniframe.style.display = "block";
                    if (dyniframe.contentDocument && dyniframe.contentDocument.body.offsetHeight)
                    {
                        dyniframe.height = document.documentElement.clientHeight-140;
                    }
                    else if (dyniframe.Document && dyniframe.Document.body)
                    {
                        dyniframe.height = document.documentElement.clientHeight - 140;
                    }
                }
            }
        }
    </script>
</asp:Content>
