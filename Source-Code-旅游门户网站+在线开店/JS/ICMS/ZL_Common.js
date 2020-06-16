function disBtn(o, t) {
    if (arguments.length == 1) { setTimeout(function () { o.disabled = true; $(o).css("color", "#808080"); }, 50); }
    else if (arguments.length == 2) { var color = $(o).css("color"); setTimeout(function () { o.disabled = true; $(o).css("color", "#808080"); }, 50); setTimeout(function () { o.disabled = false; $(o).css("color", color); }, t); }
}
function GetEnterCode(a, id) {
    if (event.keyCode == 13) {
        switch (a) { case "click": $("#" + id).trigger("click"); break; case "focus": $("#" + id).focus(); break; }
        return false;
    }
    else { return true; }
}
function getParam(paramName) {
    paramValue = ""; isFound = false; if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = decodeURI(this.location.search).substring(1, this.location.search.length).split("&"); i = 0; while (i < arrSource.length && !isFound) {
            if (arrSource[i].indexOf("=") > 0) { if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) { paramValue = arrSource[i].split("=")[1]; isFound = true; } }
            i++;
        }
    }
    return paramValue;
}
function setCookie(name, value) {
    var today = new Date()
    var expires = new Date()
    expires.setTime(today.getTime() + 1000 * 60 * 60 * 24 * 365)
    document.cookie = name + "=" + escape(value) + "; expires=" + expires.toGMTString()
}
function getCookie(cookie_name) {
    var allcookies = document.cookie; var cookie_pos = allcookies.indexOf(cookie_name); if (cookie_pos != -1) {
        cookie_pos += cookie_name.length + 1; var cookie_end = allcookies.indexOf(";", cookie_pos); if (cookie_end == -1) { cookie_end = allcookies.length; }
        var value = unescape(allcookies.substring(cookie_pos, cookie_end));
    }
    return value;
}
function GetRanPass(length, special) {
    var iteration = 0; var password = ""; var randomNumber; if (special == undefined) { var special = false; }
    while (iteration < length) {
        randomNumber = (Math.floor((Math.random() * 100)) % 94) + 33; if (!special) {
            if ((randomNumber >= 33) && (randomNumber <= 47)) { continue; }
            if ((randomNumber >= 58) && (randomNumber <= 64)) { continue; }
            if ((randomNumber >= 91) && (randomNumber <= 96)) { continue; }
            if ((randomNumber >= 123) && (randomNumber <= 126)) { continue; }
        }
        iteration++; password += String.fromCharCode(randomNumber);
    }
    return password;
}
function GetRandomNum(Min, Max) { var Range = Max - Min; var Rand = Math.random(); return (Min + Math.round(Rand * Range)); }
function GetExName(fname) { var s = fname.lastIndexOf(".") + 1; return fname.substring(s, fname.length).replace(/" "/g, "").toLowerCase(); }
function GetFname(fname, num) {
    var result = fname; if (fname.indexOf("/") > -1 || fname.indexOf("\\") > -1)
    { fname = fname.replace("\\", "/"); var s = fname.lastIndexOf("/") + 1; result = fname.substring(s, fname.length); }
    if (num && num > 1 && result.length > num) result = result.substring(0, (num - 1)) + ".."; return result;
}
function GetCurSize() {
    var w = (document.body.clientWidth || document.documentElement.clientWidth); var result = ""; if (w >= 1170)
        result = "lg"; else if (w >= 970)
            result = "md"; else if (w >= 750)
                result = "sm"; else
                result = "xs"; return result;
}
function HideColumn(value, cls, id) {
    if (!cls || cls == "") cls = "hidden-xs hidden-sm"; if (!id) id = "EGV"; var arr = value.split(','); for (var i = 0; i < arr.length; i++) {
        $("#" + id + " tr").each(function ()
        { $(this).find("td:eq(" + arr[i] + ")").addClass(cls); $(this).find("th:eq(" + arr[i] + ")").addClass(cls); });
    }
}
function SetEditor(ids, wp, mw) { var idsArr = ids.split(','); if (!wp) wp = 0.7; if (!mw) mw = 400; var width = (document.body.clientWidth || document.documentElement.clientWidth) * wp; if (width < mw) width = mw; for (var i = 0; i < idsArr.length; i++) { var id = idsArr[i]; var uu = UE.getEditor(id); uu.destroy(); var editor = new UE.ui.Editor({ initialFrameWidth: width }); editor.render(id); } }
function SetTxt(ids) { if (ids && ids != "") { var idsArr = ids.split(','); for (var i = 0; i < idsArr.length; i++) { console.log(idsArr[i]); $("#" + idsArr[i]).css("width", "80%"); } } }
function SetEditorByClass(wp, mw, cs) {
    if (!wp) wp = 0.65; if (!mw) mw = 400; if (!cs) cs = ".ueditor"; var width = (document.body.clientWidth || document.documentElement.clientWidth) * wp; if (width < mw) width = mw; ueArr = $(cs); for (var i = 0; i < ueArr.length; i++) {
        if (ueArr[i].id == "" || ueArr[i].id == undefined) { continue; }
        $(ueArr[i]).removeClass("form-control"); var uu = UE.getEditor(ueArr[i].id); uu.destroy(); var editor = new UE.ui.Editor({ initialFrameWidth: width }); editor.render(ueArr[i].id);
    }
}
var Num = 0; var nn = 0; function help_show(helpid) {
    Num++; var newDiv = document.createElement('div'); var str = "<div id='help_content'  style='z-index:999;'></div><div id='help_hide'  style='z-index:999;'><a onclick='help_hide(Num)' style='width:20px;color:#666' title='关闭'><span class='glyphicon glyphicon-remove'></span></a></div> "; newDiv.innerHTML = str; newDiv.setAttribute("Id", "help_div" + Num); nn = Num - 1
    jQuery("#help").append(newDiv); help_hide(nn); jQuery("#help_content").load("/manage/help/" + helpid + ".html", function () { jQuery("#help").show(); });
}
function help_hide(Num) { jQuery("#help_div" + Num).remove(); }
function DealwithUploadPic(path, id) {
    if (parent.document.getElementById(id)) { parent.document.getElementById(id).value = path; }
    else { document.getElementById(id).value = path; }
}
function DealwithUploadImg(path, id) { document.getElementById(id).src = path; }