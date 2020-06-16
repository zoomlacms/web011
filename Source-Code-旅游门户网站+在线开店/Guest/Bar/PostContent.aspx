<%@ page language="C#" autoeventwireup="true" inherits="Guest_Bar_PostContent, App_Web_s4ng4gaf" masterpagefile="~/Guest/Guest.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<link href="/Plugins/Ueditor/third-party/video-js/video-js.min.css" rel="stylesheet" />
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/JS/jquery-ui.min.js"></script>
<title><asp:Literal runat="server" ID="Title_L"></asp:Literal></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
    <div class="post_div">
        <div id="contentDiv">
            <div class="barcon">
                <div class="pull-left">
                    <a href="<%="/"+CreateUrl(1,Cid) %>" title="贴吧图片"><img id="BarImage_img" class="card_head_img headimg" onerror="this.src='/Images/nopic.gif';" /></a>
                    <a runat="server" id="Return_a2" href="#" class="relButton" title="返回贴吧"><asp:Label runat="server" ID="BarName_L" /></a>
                    <%--<input type="button" style="margin-left: 10px;" class="btn btn-warning" value="+关注" disabled="disabled" />--%>
                    <span class="headNum">
                        本版主题：<span id="Mcount_Span" runat="server" class="card_menNum"></span>,
                        本版回复数：<span id="Rcount_Span" runat="server" class="card_menNum"></span>
                    </span>
                </div>
                <div class="bar_date">
                    <div class="disinline">
                        <input type="button" class="btn btn-lg btn-primary" id="sinin_bu" value="签到" onclick="SinIn(this)" /></div>
                    <div class="date">
                        <span><%:DateTime.Now.ToString("MM月dd日") %></span><br />
                        <span class="sinDays">未签到</span>
                    </div>
                </div>
                <div class="clearboth"></div>
            </div>
            <div class="post_div_num">
                <div class="pull-left"><span class="card_menNum" runat="server" id="replynum_span1"></span>回复贴，共<span class="card_menNum" runat="server" id="pagenum_span1"></span>页，点击数:<span class="card_menNum" runat="server" id="hitcount_span"></span></div>
                <div class="pull-right">
                    <asp:HyperLink runat="server" ID="ReturnBar_a"></asp:HyperLink>
                </div>
                <div class="clearboth"></div>
            </div>
            <div class="post_div_title">
                <div class="title"><asp:Label runat="server" ID="PostName_L" /></div>
                <a href="javascript:;" id="copyhref" class="opition" title="复制链接">[复制链接]</a>
                <div class="pull-right">
                    <a href="<%:CreateUrl(2,Pid) %>&Filter=OnlyLayer" class="btn btn-xs btn-primary">只看楼主</a>
                    <input type="button" value="收藏" id="liketie" onclick="LikeTie(this,'<%=Pid %>')" class="btn btn-xs btn-primary" />
                    <input type="button" value="回复" class="btn btn-xs btn-primary" onclick="FocusMsg();" />
                </div>
                <div class="clearboth"></div>
            </div>
            <asp:Repeater runat="server" ID="MsgRepeater" OnItemDataBound="MsgRepeater_ItemDataBound" EnableViewState="false">
                <ItemTemplate>
                    <div class="msgmain_div" id="msgmain_div_<%#Eval("ID") %>">
                        <div class="msg_left_div padding0 col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <img class="imgface_mid" src='<%#GetUserFace() %>' onerror="this.src='/Images/userface/noface.gif';" />
                            <div class="postName"><a <%#GetHref() %>><%#Eval("CUName") %></a></div>
                        </div>
                        <div class="msg_content_div padding0 col-lg-10 col-md-10 col-sm-10 col-xs-12">
                            <div class="post_msg">
                                <div class="msg_content_article_div"><%#GetMsg()%></div>
                            </div>
                            <div class="post_msg_foot">
                                  <span class="layer"><%#GetDel() %></span><span><%#Eval("Layer") %>楼</span>
                                  <%#Convert.ToDateTime(Eval("CDate")).ToString("yyyy年MM月dd日 HH:mm") %>
                                  <%#GetReply() %>
                            </div>
                            <div id='reply_<%#Eval("ID") %>' class="post_reply">
                                <div id="reply_content_div_<%#Eval("ID") %>">
                                    <asp:Literal runat="server" ID="ReplyList_L" EnableViewState="false"></asp:Literal>
                                </div>
                                <div class="post_reply_msg" id="reply_main_bottom_<%#Eval("ID") %>">
                                    <div class="text-right">
                                        <input type="button" name="sayword_btn" data-id="<%#Eval("ID") %>" value="我也说一句" class="btn btn-xs btn-primary" onclick="DisReplyul(<%#Eval("ID")%>);" /></div>
                                   <% if(!HidePost){%>
                                     <ul style="display: none;" class="list-unstyled" id="reply_bottom_ul_<%#Eval("ID") %>">
                                        <li>
                                            <textarea id="reply_ul_txt_<%#Eval("ID") %>" class="form-control" placeholder="说一句吧..."></textarea></li>
                                        <li class="reply_send">
                                            <input type="button" value="发表" class="btn btn-xs btn-primary" onclick="AddMessage(<%#Eval("ID")%>);" />
                                        </li>
                                    </ul>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                        <div class="clearboth"></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="post_foot_num">
            <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
            <span class="card_menNum" runat="server" id="Span1"></span>回复贴，共<span class="card_menNum" runat="server" id="Span2"></span>页
        </div>
        <div runat="server" class="send_div" id="send_div"><!--回复主贴-->
<div class="bdsharebuttonbox pull-right"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"2","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
            <div>
                <div class="text-left"><span class="glyphicon glyphicon-comment padding_l_5"></span><strong>发表回复</strong></div>
            </div>
            <div class="clearboth"></div>
            <div class="padding_b_5"><asp:TextBox runat="server" ID="MsgContent_T" TextMode="MultiLine" style="height:200px;" /></div>
			<asp:TextBox ID="TxtValidateCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="form-control"></asp:TextBox>
			<img src="/Common/ValidateCode.aspx"  title="点击刷新验证码" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()" />
			<asp:Button runat="server" ID="PostMsg_Btn" Text="发表主题" OnClick="PostMsg_Btn_Click" OnClientClick="return CheckData();" CssClass="btn btn-primary" />
        </div>
        <div runat="server" id="noauth_div" visible="false">你尚未登录,或者没有发权限</div>
        <%=Call.GetUEditor("MsgContent_T",4) %>
       </div>
</div>
<div class="container footer">
Copyright &copy;<script>
var year = ""; mydate = new Date(); myyear = mydate.getYear(); year = (myyear > 200) ? myyear : 1900 + myyear; document.write(year);
</script>
<a href="<%:ZoomLa.Components.SiteConfig.SiteInfo.SiteUrl %>" target="_blank"><%:Call.SiteName %></a>版权所有
</div>
<div class="floattool">
    <ul>
        <!--<a href="javascript:;"><span class="txtSpan">回 到 顶 部</span></a>-->
        <li title="回到顶部" onclick="returnTop()" onmouseout="hideTxt(this)" onmouseover="showTxt(this)"><a href="javascript:;"><span class="glyphicon glyphicon-arrow-up"></span></a><span class="txtSpan">回 到 顶 部</span></li>
        <li title="刷新" style="position: relative;" onclick="returnDown()" onmouseout="hideTxt(this)" onmouseover="showTxt(this)"><a href="<%:Request.RawUrl %>"><span class="glyphicon glyphicon-plus"></span></a><span class="txtSpan">发 表 帖 子</span></li>
        <li title="贴吧列表" onclick="returnPost()" onmouseout="hideTxt(this)" onmouseover="showTxt(this)"><a href="<%=GetRouteUrl("BarIndex", new { })%>" class="last"><span class="glyphicon glyphicon-th"></span></a><span class="txtSpan">回 到 社 区</span></li>
    </ul>
</div>
    <div runat="server" id="barowner_div" visible="false"  class="zIndex9">
    <div class="panel panel-primary candrag">
        <div class="panel-heading">
            <h3 class="panel-title"><span class="glyphicon glyphicon-remove-con pull-left"></span>版面管理</h3>
        </div>
        <div class="panel-body">
                <div style="padding: 5px;">
                    <asp:Button runat="server" ID="Dels" Text="删除" OnClick="Bar_Btn_Click" CommandArgument="Del" CssClass="btn btn-primary" />
                    <asp:Button runat="server" OnClick="Bar_Btn_Click" Text="屏蔽" CommandArgument="Hidden" CssClass="btn btn-primary" />
                    <asp:Button runat="server" OnClick="Bar_Btn_Click" Text="取消屏蔽" CommandArgument="CancelHidden" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="SetJing" OnClick="Bar_Btn_Click" Text="精华" CommandArgument="AddRecom" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="CancelJing" OnClick="Bar_Btn_Click" Text="取消精华" CommandArgument="RemoveRecom" CssClass="btn btn-primary" />
                </div>
                <div style="padding: 5px;">
                    <asp:Button runat="server" ID="SetTop" OnClick="Bar_Btn_Click" Text="置顶" CommandArgument="AddTop" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="CancelTop" OnClick="Bar_Btn_Click" Text="取消置顶" CommandArgument="RemoveTop" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="SetDown" OnClick="Bar_Btn_Click" Text="沉底" CommandArgument="AddBottom" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="CancelDown" OnClick="Bar_Btn_Click" Text="取消沉底" CommandArgument="RemoveBottom" CssClass="btn btn-primary" />
                </div>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/ZL_ValidateCode.js"></script>
<script type="text/javascript">
    $().ready(function(){
        $("input[name=sayword_btn]").each(function(){
            var id=$(this).attr("data-id");
            var len=$("#reply_content_div_"+id).find("div").length;
            if(len==0)//回复区下有内容
            {
                $(this).hide();
                $("#msg_toggle_a_"+id).text("回复");
            }
        });
        $("#TxtValidateCode").ValidateCode();
        $.post("/API/UserSinIn.ashx",{action: "sinstatu", localtion: "1"},function(data){
            if (data != "none") {
                $("#sinin_bu").val("已签到").attr("disabled", "disabled");
                $(".sinDays").text("连续" + data + "天");
            }
        },"json");
        $('#copyhref').zclip({
            path: '/JS/ZeroClipboard.swf',
            copy: function () { 
                return $("#PostName_L").text()+"\n"+location.href; },
            afterCopy: function () { alert("复制完成"); }
        });
        $(":checkbox[name=idchk]").click(function () {
            if ($(":checkbox[name=idchk]:checked").length > 0)
                $("#barowner_div").show();
            else $("#barowner_div").hide();
        });
        $(".candrag").draggable
           ({
               addClasses: false,
               axis: false,
               cursor: 'crosshair',
               containment: 'document'
           });
        PostToCS('CheckLike','<%=Pid %>',function(data){
            if (data=="1") {
                $("#liketie").addClass("liked");
                $("#liketie").val("取消收藏");
            }
        })
    });
    function showTxt(data){
        $(data).children().first().hide();
    }
    function hideTxt(data){
        $(data).children().first().show();
    }
    function returnPost(){
        window.location="<%=GetRouteUrl("BarIndex", new { })%>";
    }
    function returnTop() {
        setTimeout(setScollTop, 1);
    }
    function setScollTop() {
        if ($(window).scrollTop()>1) {
            $(window).scrollTop($(window).scrollTop() - 30);
            setTimeout(setScollTop,1);
        }

    }
    function returnDown(){
        window.location="/EditContent?ID=-<%=Cid %>";
    }
    function DisReply(id) {
        var t=$(event.srcElement);
        if(t.text()=="回复"){t.text("收起回复");$("#reply_"+id).show("middle"); $("#reply_bottom_ul_"+id).show();}
        else{t.text("回复");$("#reply_"+id).hide("middle");}
    }
    function DisReplyul(id)
    {
        $("#reply_bottom_ul_"+id).toggle("middle");
    }
    function CheckData()
    {
        var msg=$("#MsgContent_T").val();
        if(msg.replace(" ","")==""){alert("内容不能为空");return false;}
        if($("#TxtValidateCode").val()==""){alert("验证码不能为空");return false;}
    }
    function FocusMsg()
    {
        $(window).scrollTop($(document).height());
        $("MsgContent_T").focus();
    }
    function SinIn(e) {
        $.ajax({
            url: "/API/UserSinIn.ashx",
            data: { action: "sinin",localtion:"1" },
            type: "POST",
            success: function (d) {
                if (d!=""&&d!="-1") {
                    $(e).val("已签到");
                    $(e).attr("disabled", "disabled");
                    $("#sinDays").text("连续" + d + "天");
                }else{
                    alert("您尚未登录！！");
                }
                    
            }
        });
            
    }
	function GetMsgMainID(id)
	{
		return "msgmain_div_"+id;
	}
	function ShowDiv(id) {
		if ($("#" + id).is(":visible"))
			$("#" + id).hide();
		else
		{
			switch(id)
			{
				case "ImgFace_Div":
					if($("#ImgFace_if").attr("src")==""){
						$("#ImgFace_if").attr("src","/Plugins/Ueditor/dialogs/emotion/ImgFace.html");
					}
					break;
			}
			$("#" + id).show();
		}
	}
	function ReplyHer(mid,uname)
	{
		$("#reply_bottom_ul_"+mid).show();
		$("#reply_ul_txt_"+mid).val("回复 "+uname+" :").focus();
	}
	//-------
	function PreView(vpath)
	{
		$("#Model_Btn").click();
		if (vpath != $("#preview_down_a").attr("href"))//如果预览的文件变更，则重新加载
		{
			$("#preview_down_a").attr("href", vpath);
			$("#preview_if").attr("src", "/PreView.aspx?vpath=" + escape(vpath));
		}
	}
	function ShowFileUP(t)
	{
		$("#FileUP_Title").text(t);
		$("#FileUP_Btn").click();
	}
	function LoadReply(pid,pageSize,pageIndex)
	{
		$("#reply_content_div_" + pid).load("/Guest/Bar/ReplyList.aspx?code="+Math.random()+"&pid=" + pid + "&PageSize=" + pageSize + "&PageIndex=" + pageIndex + " start");
	}
	var pageSize =<%=replyPageSize%>
	//----------------AJAX区
	function PostDelMsg(msgid,reload)
	{
		if(confirm("确定要删除该条信息吗!!"))
		{
			$("#reply_div_"+msgid).remove();
			PostToCS("DeleteMsg",msgid,function(data){if(data=="failed")alert("删除失败,当前用户无权限!");});
			if(reload==1)  location="<%:CreateUrl(1,Cid)%>";
			else if(reload==2)
			{
				location=location;
			}
		}
	}
	function CollFunc(obj,id)//收藏,取消收藏
	{
		if ($(obj).hasClass("colled"))//如已收藏,取消收藏
		{
			$(obj).removeClass("colled").addClass("nocolled");
			PostToCS("CancelColl", id, function () { });
		}
		else//加入收藏
		{
			$(obj).removeClass("nocolled").addClass("colled");
			PostToCS("AddColl", id, function () { });
		}
	}
	function LikeTie(obj,id){
	    if($(obj).hasClass("liked"))
	        PostToCS("ReColl",id,function(data){
	            if (data=="1") {
	                $(obj).removeClass("liked");
	                $(obj).val("收藏");
	            }
	        })
        else
	    PostToCS("AddColl", id, function (data) { 
	        switch (data) {
	            case "0":
	                break;
	            case "1":
	                $(obj).addClass("liked");
	                $(obj).val("取消收藏");
	                break;
	            case "-1":
	                alert("您还未登录！");
	                break;
	        }
	    });
	}

	function AddReply(id) {//回复主信息
		var msg = $("#MsgContent_" + id).val();
		if (msg == "") { alert('信息不能为空!!'); return; }
		var value = id + ":" + msg;
		PostToCS("AddReply", value, function () { LoadReply(id, pageSize, 1); });
	}
	function AddMessage(pid) {//对回复者回复
		var msg = $("#reply_ul_txt_"+pid).val();
		if (msg == "") { alert('信息不能为空!!'); return; }
		if(pid==""){alert('未指定回复对象!!'); return;}
		var value = pid + "$" + msg;
		PostToCS("AddReply2", value, function () { LoadReply(pid, pageSize, 1); });
		$("#reply_bottom_ul_"+pid).hide();
		$("#reply_ul_txt_"+pid).val("");

	}
	function PostToCS(a, v, CallBack) {
		PostToCS2("/Guest/Bar/PostContent.aspx?Pid=<%:Pid%>",a,v,CallBack);
	}//Post To CS end;
	function PostToCS2(u,a,v,CallBack)
	{
		$.ajax({
			type: "Post",
			url:u,
			data: { action: a, value: v },
			success: function (data) {
				CallBack(data);
			},
			error: function (data) {
			}
		});
	}
	function GetSource() { return "bar"; }
</script>
<script type="text/javascript" src="/JS/jquery.zclip.min.js"></script>
</asp:Content>