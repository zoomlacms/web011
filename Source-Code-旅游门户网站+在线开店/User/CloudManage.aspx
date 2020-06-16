<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Cloud_CloudManage, App_Web_wp4exovk" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>网络云盘</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">网络云盘</li>
    </ol>
    <span runat="server" id="OpenCloud" visible="false">您还没有云盘，请先
        <asp:LinkButton ID="Open" runat="server" OnClick="OpenCloud_Click" ForeColor="Red">开通云盘</asp:LinkButton>
    </span>
    <div id="Cloud" runat="server" visible="false">
        <div class="us_seta" id="us_seta" style="text-align: left;" runat="server">
            <input id="back" type="button" runat="server" class="btn btn-primary" value="返 回" onclick="javascript:history.back();" />
            <input type="button" class="btn btn-primary" name="demoCode04-3" value="上传"
                onclick="NewFormd('文件上传','Uploadify.aspx?Type=<%:Request.QueryString["Type"]+"&content=MaxFileSize=1024000,Dir="+Server.UrlEncode(CurrentDir)+",UploadFileExt="+UploadType%>    ')" />
            <input id="newFile" type="button" class="btn btn-primary" value="新建文件夹"
                onclick="NewFormd('新建文件夹','NewFolder.aspx?Dir=<%=Server.UrlEncode(CurrentDir)+"&Type="+Request.QueryString["Type"]%>    ')" />
        </div>
        <div class="clearfix"></div>
        <div>
            <%= string.IsNullOrEmpty(ParentDir) ? "<a disabled='true'><span class='glyphicon glyphicon-circle-arrow-left'></span></a>" : "<a href='CloudManage.aspx?type="+Request.QueryString["Type"]+"&Dir=" + ParentDir + "'><span class='glyphicon glyphicon-circle-arrow-left'></span></a>"%>
            <span id="navv" runat="server" style="margin-left: 10px;"></span>
            <asp:HiddenField ID="HdnPath" runat="server" />
        </div>
        <asp:Repeater ID="RptFiles" runat="server" OnItemCommand="RptFiles_ItemCommand">
            <HeaderTemplate>
                <table class="table table-bordered table-striped table-hover">
                    <tr class="title" align="center" style="height: 24px">
                        <td>文件名</td>
                        <td style="width: 15%">大小</td>
                        <td style="width: 20%">创建时间</td>
                        <td style="width: 25%">操作</td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr style="height: 24px" class="tdbg" onmouseover="this.className='tdbgmouseover';"
                    onmouseout="this.className='tdbg';">
                    <td align="left">
                        <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<img src='/App_Themes/AdminDefaultTheme/Images/Folder/mfolderclosed.gif'>" : GroupPic.GetShowExtension(Eval("content_type").ToString())%>
                        <%#GetLink(Eval("type").ToString(),Eval("content_type").ToString(),Eval("Name").ToString()) %></td>
                    <td align="center"><%# GetSize(Eval("size").ToString())%></td>
                    <td align="center"><%# Eval("createTime")%></td>
                    <td align="center"><%--[<a href='javascript:' onclick='javascript:parent.NewFormd(\"文件分享\" ,\"/Common/File.aspx?T=f&FD=" + FileJiaM(CurrentDir+"/"+Eval("Name").ToString()) + "\")'>分享</a>]--%>
                        <%#GetDownUrl() %>
                        <%if (GetDelAuth())
                          { %>
			 [<asp:LinkButton ID="LbtnDelList" CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>' CommandArgument='<%# Eval("Name")%>'
                 OnClientClick="if(!this.disabled) return confirm('确定要删除吗？');" runat="server">删除</asp:LinkButton>]</td>
                    <%} %>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td style="height: 22px; text-align: center;" colspan="10" class="tdbgleft">
                <span style="text-align: center">共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
					<asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />页次：
					<asp:Label ID="Nowpage" runat="server" Text="" />/
					<asp:Label ID="PageSize" runat="server" Text="" />页
					<asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" Width="22px" Height="22px"></asp:TextBox>
                    条数据/页 转到第
					<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                    页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                </span>
            </td>
        </tr>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="../JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        (function () {
            var _skin, _jQuery;
            var _search = window.location.search;
            if (_search) {
                _skin = _search.split('demoSkin=')[1];
                _jQuery = _search.indexOf('jQuery=true') !== -1;
                if (_jQuery) document.write('<scr' + 'ipt src="jquery-1.6.2.min.js"></sc' + 'ript>');
            };
            document.write('<scr' + 'ipt src="artDialog.source.js?&skin=' + (_skin || 'aero') + '"></sc' + 'ript>');
        })();
        function NewFormd(title, content) {
            if ($("iframe").eq(2).html() == null) {
                $(".aui_title").html(title);
                art.dialog.data('homeDemoPath', './_doc/');
                if (title == "新建文件夹") {
                    art.dialog.open(content, { title: title, width: "360" }, true);
                    $("iframe").eq(2).css({ "width": "360px", "height": "300px" });
                } else if (title == "文件上传") { 
                    art.dialog.open(content, { title: title, width: "440" }, true);
                    $("iframe").eq(2).css({  "width": "430px","height": "500px" });
                } else if (title == "音乐播放") {
                    art.dialog.open(content, { title: title, width: "300" }, true);
                    $("iframe").eq(2).css({ "width": "430px", "height": "500px" });
                    $('#back').remove();
                } else {
                    art.dialog.open(content, { title: title, width: "400" }, true);
                    $("iframe").eq(2).css({ "width": "430px", "height": "500px" });
                }
            } else {
                $("iframe").eq(2).attr("src", $("iframe").eq(2).attr("src"));
            }
        }
    </script>
    <script src="artDialog.iframeTools.source.js" type="text/javascript"></script>
    <script type="text/javascript">
        function myfunction() {
            $.get("CloudManage.aspx?DownUrl=" + escape(Url) + "&time=" + Date(), function (da) {
                alert(da);
            })
        }
        function UXml(mp, Url) {
            $.get("CloudManage.aspx?mpname=" +escape(mp) + "&time=" + Date()+"&Url="+escape(Url), function (data) {
            })
        }

        function open(path) {
            var titles = path.split('/');
            var title;
            for (var i = 0; i < titles.length; i++) {
                if (titles[i].indexOf('.') > 0)
                    title = titles[i];
            } 
            switch ('<%=Request["Type"] %>') {              
                case "file":
                    popAlert(path);
                    break;
                case "photo":
                    popAlert(path);
                    break;
                case "video":
                    NewFormd(title, "Cloud/Jwplayer/PlayM.aspx?MeUrl=" + path);
                    break;
                case "music":
                    NewFormd("音乐播放", "Cloud/Jwplayer/PlayM.aspx?MeUrl=" + path);
                    break;
                case "PF":
                    //根据后缀名来判断
                    result=checkFileType(path.split(".")[(path.split(".").length-1)]);
                    switch(result)
                    {
                        case 1:
                            parent.popAlert(path+"&Type=PF");
                            break;
                        case 2:
                            parent.NewFormd("音乐播放", "Cloud/Jwplayer/PlayM.aspx?MeUrl=" + path+"&Type=PF");
                            break;
                    }
                    break;
            }
        }
        function checkFileType(ex)//后缀名
        {
            var imgArr=["jpg","gif","png","bmp","txt"];
            var video=["mp3","wma","wmv","avi","mp4","f4v","m4v","rmvb","rm","flv","wm","ram","asf","wmv"];
            for (var i = 0; i < imgArr.length; i++) {
                if(imgArr[i]==ex)
                    return 1;
            }
            for (var i = 0; i < video.length; i++) {
                if(video[i]==ex)
                    return 2;
            }
        }
    </script>
    <script type="text/javascript">

        function popAlert(str) {
            //width="' + $(window).width() + '"
            $('<div id="popalert">' + '<iframe id="picture" name="picture" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"  src="/user/Cloud/ShowPhoto.aspx?Dir=' + str + '\" width="100%" height="100%"></iframe>' + '</div>').appendTo('body');
            var _popalert = $('#popalert');
            _popalert.css({
                position: 'absolute',
                height: ($(window).height() + $('body').scrollTop()) + 'px',
                width: ($(window).width()) + 'px',
                left: '0px',
                top: '0px'
            });
        }
        //窗口自适应
        window.onresize = function () {
            $('#popalert').css({
                position: 'absolute',
                height: ($(window).height()) + 'px',
                width: ($(window).width()) + 'px',
                left: '0px',
                top: '0px'
            });
        }
        //关闭浏览图片
        function close() {
            $('#popalert').remove();
        }
        //关闭弹出层
        function closeNewFile() {
            //alert(8);
            $('.aui_focus').remove();
            $('#back').remove();

        }
        //弹出层
        function NewFormd(title, content) {
            //alert(title);
            if ($("iframe").eq(2).html() == null) {
                $(".aui_title").html(title);
                art.dialog.data('homeDemoPath', './_doc/');
                if (title == "新建文件夹") {
                    art.dialog.open(content, { title: title, width: "360" }, true);
                    $("iframe").eq(2).css({ "width": "360px", "height": "200px" });
                } else if (title == "文件上传") {
                    art.dialog.open(content, { title: title, width: "360" }, true);
                    $("iframe").eq(2).css({ "height": "180px", "width": "360px" });
                } else if (title == "音乐播放") {
                    art.dialog.open(content, { title: title, width: "300" }, true);
                    $("iframe").eq(2).css({ "width": "300px", "height": "405px" });
                    $('#back').remove();
                } else {
                    art.dialog.open(content, { title: title, width: "400" }, true);
                    $("iframe").eq(2).css({ "width": "400px", "height": "300px" });
                }
            } else {
                $("iframe").eq(2).attr("src", $("iframe").eq(2).attr("src"));
            }
        }
    </script>

</asp:Content>