//用于支持标签{pubCode/}
function checkCode(obj) {
    error = "<img src='/App_Themes/AdminDefaultTheme/PromptSkin/images/err.gif' style='height:14px;width:14px;position:relative;margin-top:2px;' title='验证码不正确'/>";
    right = "<img src='/App_Themes/AdminDefaultTheme/PromptSkin/images/right.gif' style='height:14px;width:14px;position:relative;margin-top:2px;' title='验证码正确'/>";

    if ($(obj).val().length < 6) { $(obj).siblings("#codeCheck").empty().append(error); return; }
    a = "checkcode";
    v = $(obj).val();
    $.ajax({
        type: "Post",
        url: "/Common/ValidateCode.aspx",
        data: { action: a, value: v },
        success: function (data) {
            if (data == 0)
                $(obj).siblings("#codeCheck").empty().append(error);
            else if (data == 1)
                $(obj).siblings("#codeCheck").empty().append(right);
        },
        error: function () { }
    });
}

//判断验证码是否正确,参数为验证码字符串
function codeIsRight(v)//默认返回true,判断后错误返回false
{
    a = "checkcode";
    var r = true;
    $.ajax({
        async: false,
        type: "Post",
        url: "/Common/ValidateCode.aspx",
        data: { action: a, value: v },
        success: function (data) {
            if (data == 0)
                r = false;
            else r = true;
        },
        error: function () { return true; }
    });
    return r;
}