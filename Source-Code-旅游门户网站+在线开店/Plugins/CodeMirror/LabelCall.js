function hotkey() {
    var a = window.event.keyCode;
    if (window.event.altKey && a == 88) {
        opentitle("LabelPage.aspx", "选择标签[按ESC键关闭窗口]");
    }
} // end hotkey 
var editor = CodeMirror.fromTextArea(document.getElementById("textContent"), {
    mode: "text/html",
    tabMode: "indent",
    lineNumbers: true,
    styleActiveLine: true,
    matchBrackets: true,
    lineWrapping: true
});
editor.setOption("theme", "eclipse");
function cit() {
    var obj;;
    if (event && (event.srcElement)) {
        obj = event.srcElement;
    }
    else { return; }
    var code = GetCode(obj);
    PasteValue(code);
}
function cit2(type, code) {  var code = GetCode(type, code); PasteValue(code); }
var diagLabel = new ZL_Dialog();
function setdiagTitle(title) {
    $("#" + diagLabel.id).find(".modal-title").text(title);
}
function GetCode(obj) {
    var labeltype, code;
    if (arguments.length == 2) {
        labeltype = arguments[0]; code = arguments[1];
    }
    else { var $obj = $(obj); labeltype = $obj.attr("outtype"); code = $obj.attr("code"); }
    switch (labeltype) {
        case "1":
            code = "{ZL.Label id=\"" + code + "\"/}";
            break;
        case "2":
            var link = "Insertlabel.aspx?n=" + escape(code);
            diagLabel.width = "modal-sm";
            diagLabel.height = 180;
            diagLabel.maxbtn = false;
            diagLabel.isBigClose = false;
            diagLabel.foot = "<input type='button' value='Add' class='btn btn-primary' onclick=\"$('#" + diagLabel.id + "').find('iframe')[0].contentWindow.submitdate();\" />&nbsp;<input type='button' class='btn btn-default' value='Close' onclick='closeCuModal();' />"
            //diagLabel.title = "引用标签";
            diagLabel.url = link;
            diagLabel.ShowModal();
            //var ret = window.open(link, window, 'modal=yes,width=500,height=300,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no');
            code = "";
            break;
        case "3":
            code = "{ZL.Source id=\"" + code + "\"/}";
            break;
        case "4":
            code = "{ZL.Label id=\"" + code + "\"/}";
            break;
        case "5":
            code = "{ZL.Page id=\"" + code + "\"/}"
            break;
        case "6":
            code = "{ZL.Page id=\"" + code + "\" num=\"500\"/}"
            break;
        default:
            break;
    }
    return code;
}
function PasteValue(code) {
    if (code && code != "")
        editor.replaceSelection(code, null, "paste");
}
//--------------
$().ready(function () {
    $(".spanfixdiv,.spanfixdivchechk").attr("draggable", true);
    $(".spanfixdiv,.spanfixdivchechk").bind("dragstart", function () { drag(event); })
});
function drag(ev) {
    var code = GetCode(ev.target ? ev.target : ev.srcElement);
    ev.dataTransfer.setData("Text", code);
}
function addubb(code) { PasteValue(code); }
//function allowDrop(ev) {
//    ev.preventDefault();
//}
//function drop(ev) {
//    ev.preventDefault();
//    var data = ev.dataTransfer.getData("Text");
//    ev.target.appendChild(document.getElementById(data));
//}