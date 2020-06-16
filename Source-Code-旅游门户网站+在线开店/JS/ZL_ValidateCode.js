//1,页面上指定codeok,codeno两个样式
//2,$("#TxtValidateCode").ValidateCode();
(function ($) {
    $.fn.extend({
        ValidateCode: function (options, callback) {
            var opts = $.extend({}, $.fn.ValidateCode.defaults, options);
            var obj = this;
            $(obj).keyup(function () {
                a = "checkcode";
                v = $(obj).val();
                if (v.length < opts.num) { $(obj).removeClass(opts.okcss).removeClass(opts.nocss); return; }
                $.ajax({
                    type: "Post",
                    url: "/Common/ValidateCode.aspx",
                    data: { action: a, value: v },
                    success: function (data) {
                        if (data == 0) {
                            $(obj).removeClass(opts.okcss).addClass(opts.nocss);
                        }
                        else if (data == 1) {
                            $(obj).removeClass(opts.nocss).addClass(opts.okcss);
                        }
                    }
                });
            });//keyup end;
        }
    })//fn end;
    $.fn.ValidateCode.defaults = { okcss: "codeok", nocss: "codeno",num:6 };//参数赋值
})(jQuery)