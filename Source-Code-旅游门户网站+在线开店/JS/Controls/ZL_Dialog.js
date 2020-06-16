//支持系统图标选择
var ZL_DialogCount = 0;
var ZL_Dialog = function () {
    var opts = arguments.length > 0 ? arguments[0] : {};
    this.id = opts.id ? opts.id : "mymodal" + (ZL_DialogCount++);
    this.title = opts.title;
    this.backdrop = opts.backdrop ? opts.backdrop : false;//背景点击是否关闭
    this.preajaxurl = "";//上次加载的ajaxurl,避免重复加载相同页
    this.ajaxurl = "";
    this.url = "";//iframe url
    this.maxbtn = opts.maxbtn ? opts.maxbtn : true;//是否显示全屏按钮
    this.isBigClose = opts.isBigClose ? opts.isBigClose : true;//关闭按钮
    this.content = opts.content;//自定义div
    this.body = "";//自定义html
    this.width = opts.width;//设定为" "则默认600,否则调用width1100
    this.height = opts.height;//已作废
    this.keyboard = opts.keyboard;
    this.foot = opts.foot;//是否使用底部
    this.obj = undefined;
    this.reload = true;//强制刷新
};
ZL_Dialog.prototype = {
    ShowModal: function () {
        var ref = this;
        var ifrurl = $("#" + ref.id).find("iframe").attr("src");
        var flag = ref.reload || (ref.url && ifrurl && ref.url != ifrurl) || (ref.ajaxurl&&ref.ajaxurl!=ref.preajaxurl);//未初始化,已指定强制刷新,url改变
        if (!flag) {
            $("#" + ref.id).find(".modal-title").text(ref.title);
            $("#" + ref.id).modal({}); return;
        }
        var bodyTlp = "<div class='modal' id=" + ref.id + " @backdrop><div class='modal-dialog @width'><div class='modal-content'><div class='modal-header'>@header</div><div style='height:auto;overflow-y:auto;' class='modal-body'>@body</div>@Foot</div></div></div>";
        var header = "<button type='button' class='close' data-dismiss='modal'>@close</button>@Opion<span class='modal-title'>@Title</span>";
        var bodyhtml = "", Opion = "", foot = "", closeStyle = ref.isBigClose ? "<span class='glyphicon glyphicon-remove-sign'>Close</span>" : "×";
        if (ref.ajaxurl && ref.ajaxurl != "") {//ajax加载
            bodyhtml = "<img src='/App_Themes/AdminDefaultTheme/images/loading.gif' />";
            setTimeout(function () { $("#" + ref.id).find(".modal-body").load(ref.ajaxurl); }, 200);
            ref.preajaxurl = ref.ajaxurl;
        }
        else if (ref.url && ref.url != "") {//iframe加载
            bodyhtml = "<iframe class='modal_ifr' style='width:100%;border:none;' src='" + ref.url + "'></iframe>";
            Opion = ref.maxbtn ? "<button type='button' id='BigOpion' title='全屏' class='close' style='width:30px;'><i class='glyphicon glyphicon-fullscreen'></i></button>" : "";
        } else if (ref.body != "") {
            bodyhtml = ref.body;
        }
        else {//直接加载html
            bodyhtml = $("#" + ref.content).html();
            $("#" + ref.content).remove();
            ref.body = bodyhtml;
        }
        if (ref.foot != "" && ref.foot != undefined) {
            foot = "<div class='modal-footer'>" + ref.foot + "</div>";
        }
        var widths = ref.width ? ref.width : "width1100";
        bodyTlp = bodyTlp.replace(/@width/, widths).replace(/@header/, header).replace(/@body/, bodyhtml).replace(/@Title/, ref.title).replace(/@Opion/, Opion).replace(/@Foot/, foot)
        .replace(/@backdrop/, ref.backdrop ? "data-backdrop='static'" : "").replace(/@close/,closeStyle);
        if (ref.obj == undefined) {
            ref.obj = $(bodyTlp);
            $("form").append($(ref.obj));
        } else {
            $(ref.obj).html($(bodyTlp).html());
        }
        $(ref.obj).modal({});
        $(ref.obj).find("#BigOpion").click(function () {
            window.location = ref.url;
        });
        ref.reload = false;
        $("#" + ref.id + " .modal_ifr").load(function () {//iframe自适应
            var $obj = $(this);
            var iframeHeight =ref.height?ref.height:$obj.contents().height();
            $obj.height(iframeHeight + 'px');
        });
    },
    CloseModal: function () {
        $("#" + this.id).modal("hide");
    },
}