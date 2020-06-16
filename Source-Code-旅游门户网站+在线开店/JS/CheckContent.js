var http_request = false;
function createRequest() {

    try//IE
    {
        http_request = new ActiveXObject("Msxml2.XMLHTTP");
    }
    catch (e) {
        try {
            http_request = new ActiveXObject("Microsoft.XMLHTTP");
        }
        catch (e2) {
            http_request = false;
        }
    }
    if (!http_request && typeof XMLHttpRequest != 'undefined') //FireFox
    {
        http_request = new XMLHttpRequest();
    }
}
function callserver() {
    createRequest();
    var strText = document.getElementById("TxtCom").value;
    if (strText == "" || strText == null)
        return;
    var url = "CheckCon.aspx?strtxt=" + escape(strText);
    http_request.onreadystatechange = updatepage;
    http_request.open("GET", url, true);
    http_request.send(null);
}
function updatepage() {
    var obj = document.getElementById("LblNewMessage");
    if (http_request.readyState == 4) {
        if (http_request.status == 200) {
            var response = http_request.responseText;
            if (response.indexOf("regok") != -1) {
                //验证通过
                obj.className = "Right";
                obj.innerText = '该内容存在 可以添加';

            }
            else {
                //验证未通过
                obj.className = "Error";
                obj.innerText = '该内容不存在';
            }
        }
    }
    else {   //异步传输失败
        obj.innerText = '该内容未能检测，可以尝试添加。';
    }
}
