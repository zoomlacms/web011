<%@ page language="C#" autoeventwireup="true" inherits="Guest_Bar_PostList, App_Web_s4ng4gaf" masterpagefile="~/Guest/Guest.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link href="/Plugins/Ueditor/third-party/video-js/video-js.min.css" rel="stylesheet" />
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script src="/Plugins/Ueditor/third-party/video-js/video.js"></script>
<script type="text/javascript" src="/JS/jquery-ui.min.js"></script>
<title><asp:Literal runat="server" ID="Title_L" />_<%:Call.SiteName+"贴吧" %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<div class="bar_RelButton">
<a href="<%=GetRouteUrl("BarIndex", new { })%>" title="返回列表">&lt;&lt;返回社区列表</a>
</div>
<div id="bar_hdiv" class="bar_hdiv">
    <div class="bar_imgDiv" >
        <img id="BarImage_img" onerror="this.src='/Images/nopic.gif';"/>
    </div>
    <div class="bar_Title">
        <div>
            <a href="javascript:;" onclick="location=location;" title="贴吧"><asp:Label runat="server" ID="BarName_L" /></a>
            <span runat="server" id="totalspan" class="countInfo">主题总数：<span class="card_menNum" runat="server" id="dnum_span2"></span>&nbsp&nbsp回复数：<span id="replycount" class="card_menNum" runat="server"></span></span>
        </div>
        <div><asp:Label runat="server" ID="BarInfo_L" /></div>
    </div>
    <div class="bar_date">
        <div class="disinline">
            <input type="button" id="sinin_bu" class="btn btn-lg btn-primary" onclick="SinIn(this)" value="签到"  />
        </div>
        <div class="date">
            <span><%:DateTime.Now.ToString("MM月dd日") %></span><br />
            <span class="sinDays" id="sinDays">未签到</span>
        </div>
    </div>
    <div class="clearboth"></div>
</div>
<div id="childBar" runat="server">
<h5 class="well well-sm"><strong>子版块</strong></h5>
<asp:Repeater runat="server" ID="ChildRPT"  EnableViewState="false">
<HeaderTemplate>
<table class="table bar_table">
</HeaderTemplate>
<ItemTemplate>
<tr>
<td class="bar_imgDiv"><img src="<%#Eval("BarImage") %>" onerror="this.src='/Images/nopic.gif';" /></td>
<td class="barname">
<a href="<%#CreateUrl(1,Eval("CateID")) %>"><%#Eval("CateName") %></a>
</td>
<td>
<span class="card_menNum" title="主题"><%#Eval("ItemCount") %></span><span class="reply_num" title="回贴">/<%#Eval("ReCount") %></span>
</td>
<td class="tie_info">
<div>
最新帖子：<a href="<%#CreateUrl(2,Eval("PostID")) %>" target="_blank"><%#Eval("Title") %></a>
</div>
<div class="tie_date">
发表时间：<%#ConverDate(Eval("CDate"),"yyyy年MM月dd日 HH:mm") %>
</div>
</td>
</tr>
</ItemTemplate>
<FooterTemplate></table></FooterTemplate>
</asp:Repeater>
</div>
<div id="emptydiv" class="emptydiv" runat="server" visible="false">
    <span class="glyphicon glyphicon-comment margin-right5"></span>
    <span>当前还没有内容,快点发一条吧</span>
</div>
<div id="contentdiv" runat="server" visible="false">
    <asp:Repeater runat="server" ID="RPT">
        <ItemTemplate>
            <div class="tie_list">
                <div class="checks">
                    <div class="rcountnum"><span class="margin-right5"><%#Eval("RCount") %></span>
                        <%#DisCheckBox() %>
                    </div>
                </div>
                <div class="subdiv">
                    <div><%#GetTitle()%><span><%#GetTieStaues() %></span></div>
                    <div id="sub_div_<%#Eval("ID") %>" class="subtitle" data-id="<%#Eval("ID") %>">
                        <%#Eval("SubTitle") %></div>
                    <div id="sub_video_div_<%#Eval("ID") %>" style="display: none;">
                        <div class="font12">
                            <span><span class="glyphicon glyphicon-upload"></span><a href="javascript:;" onclick="Collapse();">收起</a></span>
                        </div>
                        <div class="video_div"></div>
                    </div>
                    <div id="sub_qvideo_div_<%#Eval("ID") %>" style="display: none;">
                         <div class="font12">
                             <span><span class="glyphicon glyphicon-upload" ></span><a href="javascript:;" onclick="Collapse();">收起</a><span class="sperspan">|</span></span>
                             <span><span class="glyphicon glyphicon-th-large"></span><a class="fullscreen_href" href="#" target="_blank" >全屏</a></span>
                         </div>
                         <div class="qvideo_div"></div>
                     </div>
                    <div id="view_div_<%#Eval("ID") %>" class="view_div" style="display: none;">
                        <div class="font12">
                            <span><span class="glyphicon glyphicon-upload"></span><a href="javascript:;" onclick="Collapse();">收起</a><span class="sperspan">|</span></span>
                            <span><span class="glyphicon glyphicon-th-large"></span><a href="javascript:;" onclick="ViewImg(<%#Eval("ID") %>);">查看大图</a></span>
                        </div>
                        <div><span><img id="view_img_<%#Eval("ID") %>" src="#" onclick="Collapse();" /></span></div>
                    </div>
                </div>
                <div class="font12 tie_rel_count">
                    <div><span class="glyphicon glyphicon-user"></span><a href="<%#CreateUrl(1,"")+"?searchstr="+Eval("CUser") %>"><%#Eval("CUName") %></a>
                        <span title="点击数/回复数"><%#Eval("HitCount")==DBNull.Value?0:Convert.ToInt32(Eval("HitCount")) %>/<%#Eval("RCount") %></span>
                    </div>
                    <div><%#Convert.ToDateTime(Eval("CDate")).ToString("yyyy年MM月dd日 HH:mm") %></div>
                </div>
                <div class="clearboth"></div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<div runat="server" class="send_div" id="send_div">
    <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
    <div class="barcount">共有主题数<span class="card_menNum" runat="server" id="dnum_span"></span>个，共<span class="card_menNum" runat="server" id="pagenum_span1"></span>页</div>
    <div id="SendDiv" runat="server">
    <div class="tie_title">
        <span class="glyphicon glyphicon-comment"></span><strong>发表贴子</strong>
        <span runat="server" id="Anony_Span" visible="false" class="card_menNum font12">[匿名发帖模式]</span></div>
    <div><asp:TextBox runat="server" ID="MsgTitle_T" data-type="normal" CssClass="form-control"/></div>
    <div class="tiecontent">
        <asp:TextBox runat="server" ID="MsgContent_T" data-type="normal" TextMode="MultiLine" style="height: 200px;width:100%;"/></div>
    
	  <asp:TextBox ID="TxtValidateCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="form-control"></asp:TextBox>
      <img src="/Common/ValidateCode.aspx" title="点击刷新验证码" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()"/>
      <asp:Button runat="server" ID="PostMsg_Btn" Text="发表主题"  OnClick="PostMsg_Btn_Click" class="disinline"  OnClientClick="return CheckData();" CssClass="btn btn-primary" />
    </div>
</div>
<div id="noauth_div" runat="server" visible="false">你尚未登录,或者没有发权限</div>
<%=Call.GetUEditor("MsgContent_T",4)%>
<div class="floattool">
    <ul>
        <!--<a href="javascript:;"><span class="txtSpan">回 到 顶 部</span></a>-->
        <li onclick="returnTop()" onmouseout="hideTxt(this)" onmouseover="showTxt(this)"><a href="javascript:;"><span class="glyphicon glyphicon-arrow-up"></span></a><span class="txtSpan">回 到 顶 部</span></li>
        <li onclick="returnDown()" onmouseout="hideTxt(this)" onmouseover="showTxt(this)"><a href="<%:Request.RawUrl %>"><span class="glyphicon glyphicon-plus"></span></a><span class="txtSpan">发 表 帖 子</span></li>
        <li onclick="returnPost()" onmouseout="hideTxt(this)" onmouseover="showTxt(this)"><a href="<%=GetRouteUrl("BarIndex", new { })%>" class="last"><span class="glyphicon glyphicon-th"></span></a><span class="txtSpan">回 到 社 区</span></li>
    </ul>
</div>

</div>
<div runat="server" id="barowner_div" visible="false" class="zIndex9">
    <div class="panel panel-primary candrag">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-remove-con pull-left"></span>版面管理</h3>
        </div>
        <div class="panel-body">
                <div style="padding: 5px;">
                    <asp:Button runat="server" Text="删除" CommandArgument="Del" OnClick="Bar_Btn_Click" CssClass="btn btn-primary" />
                    <asp:Button runat="server" Text="精华" CommandArgument="AddRecom" OnClick="Bar_Btn_Click" CssClass="btn btn-primary" />
                    <asp:Button runat="server" Text="取消精华" CommandArgument="RemoveRecom" OnClick="Bar_Btn_Click" CssClass="btn btn-primary" />
                    <input type="button" value="移动版块" class="btn btn-primary" onclick="$('#movediv').show();" />
                </div>
                <div style="padding: 5px;">
                    <asp:Button runat="server" Text="置顶" CommandArgument="AddTop" OnClick="Bar_Btn_Click" CssClass="btn btn-primary" />
                    <asp:Button runat="server" Text="取消置顶" CommandArgument="RemoveTop" OnClick="Bar_Btn_Click" CssClass="btn btn-primary" />
                    <asp:Button runat="server" Text="沉底" CommandArgument="AddBottom" OnClick="Bar_Btn_Click" CssClass="btn btn-primary" />
                    <asp:Button runat="server" Text="取消沉底" CommandArgument="RemoveBottom" OnClick="Bar_Btn_Click" CssClass="btn btn-primary" />
                </div>
        </div>
    </div>
    <div id="movediv" class="panel panel-primary candrag" style="width:300px;">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-remove-con text-left"></span>移动版面</h3>
        </div>
        <div class="panel-body">
             <asp:Button runat="server" ID="SureMove_Btn" Text="确定移动" OnClientClick="return CheckShift();" OnClick="SureMove_Btn_Click" class="btn btn-primary btn-xs pull-right" />
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle text-left" type="button" id="dropdown1" runat="server" data-toggle="dropdown" aria-expanded="true">
                    <span id="dr_text">请选择版面</span>
                    <span class="caret pull-right" style="margin-top: 7px;"></span>
                    <asp:HiddenField ID="selected_Hid" runat="server" />
                </button>
                <ul id="PCate_ul" runat="server" class="dropdown-menu bar-dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"></ul>
            </div>
        </div>
    </div>
</div>
<div class="container footer">
Copyright &copy;<script>
var year = ""; mydate = new Date(); myyear = mydate.getYear(); year = (myyear > 200) ? myyear : 1900 + myyear; document.write(year);
</script>
<a href="<%:ZoomLa.Components.SiteConfig.SiteInfo.SiteUrl %>" target="_blank"><%:Call.SiteName %></a>版权所有
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/ZL_ValidateCode.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    $("#TxtValidateCode").ValidateCode();
    function CheckData() {
        var title = $("#MsgTitle_T").val().replace(" ", "");
        var msg = $("#MsgContent_T").val().replace(" ", "");
        if (title == "") { alert("标题不能为空"); return false; }
        if (msg == "") { alert("内容不能为空"); return false; }
        if ($("#TxtValidateCode").val() == "") { alert("验证码不能为空"); return false; }
        return true;
    }
    //移贴前检测
    function CheckShift() {
        var flag = true;
        var len = $(":checkbox[name=idchk]:checked").length;
        var cid = $("#selected_Hid").val();
      
        if (len < 1 || !cid || cid == "")
        { flag = false; }
        if (!flag)
        { alert("请先选定需要移往的版块");}
        return flag;
    }
    $().ready(function () {
        $(".subtitle img").click(function () {
            var type = $(event.srcElement).attr("data-type");
            switch (type) {
                case "video":
                    ShowVideo();
                    break;
                case "quotevideo":
                    ShowQVideo();
                    break;
                default:
                    ShowImgView();
                    break;
            }
        });//click end;
        $("#MsgTitle_T").focus();
        $.ajax({
            url: "/API/UserSinIn.ashx",
            data: { action: "sinstatu", localtion: "1" },
            type: "POST",
            success: function (d) {
                if (d != "none") {
                    $("#sinin_bu").val("已签到").attr("disabled", "disabled");
                    $("#sinDays").text("连续" + d + "天");
                }
            }
        });
        $(".subtitle img").attr("title", "点击预览");
        $(":checkbox[name=idchk]").click(function () {
            if ($(":checkbox[name=idchk]:checked").length > 0) $("#barowner_div").show();
            else $("#barowner_div").hide();
        });
        //版面下拉
        $(".barli").click(function () {
            $("#selected_Hid").val($(this).data("barid"));
            $("#dr_text").text($(this).text());
        });
        $(".candrag").draggable
           ({
               addClasses: false,
               axis: false,
               cursor: 'crosshair',
               containment: 'document'
           });
    });
    function showTxt(data) {
        $(data).children().first().hide();
    }
    function hideTxt(data) {
        $(data).children().first().show();
    }
    function returnPost() {
        window.location = "<%=GetRouteUrl("BarIndex", new { })%>";
}
function returnTop() {
    setTimeout(setScollTop, 1);
}
function setScollTop() {
    if ($(window).scrollTop() > 1) {
        $(window).scrollTop($(window).scrollTop() - 30);
        setTimeout(setScollTop, 1);
    }

}
function returnDown() {
    setTimeout(setScollDown, 1);
}
function setScollDown() {
    var top = $(window).scrollTop();
    $(window).scrollTop($(window).scrollTop() + 30);
    if (top != $(window).scrollTop())
        setTimeout(setScollDown, 1);
}
//<embed type="application/x-shockwave-flash" class="edui-faked-video" pluginspage="http://www.macromedia.com/go/getflashplayer" src="http://player.youku.com/player.php/sid/XODU2MDQwMTc2/v.swf" width="420" height="280" wmode="transparent" play="true" loop="false" menu="false" allowscriptaccess="never" allowfullscreen="true">
//引用视频预览
function ShowQVideo() {
    var tlp = "<embed type='application/x-shockwave-flash' class='edui-faked-video' pluginspage='http://www.macromedia.com/go/getflashplayer' src='@src' width='420' height='280' allowfullscreen='true' allowscriptaccess='never'"
        + "menu='false' loop='false' play='true' wmode='transparent'>";
    var pobj = $(event.srcElement).closest(".subtitle");
    var id = pobj.attr("data-id");
    var content = $(event.srcElement).attr("data-content");
    pobj.find("img").hide();
    $("#sub_qvideo_div_" + id).find(".fullscreen_href").attr("href", content);
    $("#sub_qvideo_div_" + id).find(".qvideo_div").html("").append(tlp.replace("@src", content));
    $("#sub_qvideo_div_" + id).show();
}
//--------图片预览
function ShowImgView() {
    var pobj = $(event.srcElement).closest(".subtitle");
    var id = pobj.attr("data-id");
    pobj.find("img").hide();
    $("#view_img_" + id).attr("src", $(event.srcElement).attr("src"));
    $("#view_div_" + id).show();
}
//--------视频预览开始
function ShowVideo() {
    var tlp = "<video width='534' height='386' class='edui-upload-video  vjs-default-skin video-js' src='@src' preload='none' controls='' data-setup='{}'><source src='@src' type='video/mp4'></video>";
    var pobj = $(event.srcElement).closest(".subtitle");
    var id = pobj.attr("data-id");
    var content = $(event.srcElement).attr("data-content");
    pobj.find("img").hide();
    $("#sub_video_div_" + id).find(".video_div").html("").append(tlp.replace(/@src/g, content));
    $("#sub_video_div_" + id).show();
}
//------视频预览结束
function Collapse(id) {
    $obj = $(event.srcElement).parent().parent().parent();
    $obj.hide().siblings(".subtitle").find("img").show();
}
var ViewDiag = new ZL_Dialog();
function ViewImg(id) {
    ViewDiag.title = "图片预览";
    ViewDiag.url = "/Common/PreView/PicView.aspx?ID=" + id;
    ViewDiag.ShowModal();
}
function FocusMsg() {
    $(window).scrollTop($(document).height());
    $("MsgContent_T").focus();
}
function SinIn(e) {
    $.ajax({
        url: "/API/UserSinIn.ashx",
        data: { action: "sinin", localtion: "1" },
        type: "POST",
        success: function (d) {
            if (d != "" && d != "-1") {
                $(e).val("已签到");
                $(e).attr("disabled", "disabled");
                $("#sinDays").text("连续" + d + "天");
            } else {
                alert("您尚未登录！！");
            }

        }
    });
}
function GetSource() { return "bar"; }
</script>
</asp:Content>