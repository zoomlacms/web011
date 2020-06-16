<%@ page language="C#" autoeventwireup="true" inherits="manage_Common_CutPic, App_Web_snpqvf0q" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="../JS/jquery-1.9.1.min.js"></script>
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<title>图片截取</title>
<style>
    .opitnButton{width:50%;text-align:center; margin-top:5px;float:left;color:white;}
    .opitnButton *{margin:3px;}
</style>
<script type="text/javascript">
    var isIE = (document.all) ? true : false;
    var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0]== 6);
    //var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0][1] == 6);

    var $ = function (id) {
        return "string" == typeof id ? document.getElementById(id) : id;
    };

     
    var Class = {
        create: function () {
            return function () { this.initialize.apply(this, arguments); }
        }
    }

    var Extend = function (destination, source) {
        for (var property in source) {
            destination[property] = source[property];
        }
    }

    var Bind = function (object, fun) {
        return function () {
            return fun.apply(object, arguments);
        }
    }

    var BindAsEventListener = function (object, fun) {
        var args = Array.prototype.slice.call(arguments).slice(2);
        return function (event) {
            return fun.apply(object, [event || window.event].concat(args));
        }
    }

    var CurrentStyle = function (element) {
        return element.currentStyle || document.defaultView.getComputedStyle(element, null);
    }

    function addEventHandler(oTarget, sEventType, fnHandler) {
        if (oTarget.addEventListener) {
            oTarget.addEventListener(sEventType, fnHandler, false);
        } else if (oTarget.attachEvent) {
            oTarget.attachEvent("on" + sEventType, fnHandler);
        } else {
            oTarget["on" + sEventType] = fnHandler;
        }
    };

    function removeEventHandler(oTarget, sEventType, fnHandler) {
        if (oTarget.removeEventListener) {
            oTarget.removeEventListener(sEventType, fnHandler, false);
        } else if (oTarget.detachEvent) {
            oTarget.detachEvent("on" + sEventType, fnHandler);
        } else {
            oTarget["on" + sEventType] = null;
        }
    };
    function retn(url) {
        if (parent.window.frames['main_right'].document.getElementById('Img_pic')) {
            parent.window.frames['main_right'].document.getElementById('Img_pic').src = url + "?d=z";
            parent.closdlg();
        }
        else {
            parent.document.frames['main_right'].document.getElementById('Img_pic').src = url + "?d=z";
            parent.closdlg();
        }
    }
     </script>
      
</head>
<body>
<div class="cutbox">
<form id="form1" runat="server"> 
<div id="imgBox">
<div id="bgDiv" style="min-width:100%;min-height:400px;overflow:auto;">
<div id="dragDiv">
    <div id="rRightDown"> </div>
    <div id="rLeftDown"> </div>
    <div id="rRightUp"> </div>
    <div id="rLeftUp"> </div>
    <div id="rRight"> </div>
    <div id="rLeft"> </div>
    <div id="rUp"> </div>
    <div id="rDown"></div>
</div>
</div></div>
<div style="width:50%;float:left;color:white;">
 <div id="imgBox_pre">
<strong>预览</strong>
<div id="viewDiv" style="width:200px;height:150px; border:3px solid #ccc;"> </div>
</div>
</div>

<div class="opitnButton" >
<div>
    <button class="btn btn-primary" onclick="ZoomSmall()" type="button">缩放50%</button>
    <button class="btn btn-primary" onclick="ZoomBig()" type="button">放大50%</button>
    <button class="btn btn-primary" onclick="SetHeadSize()" type="button">标准头像</button>
    <button class="btn btn-primary" onclick="SetRegSize()" type="button">正方图</button>
    <asp:Button ID="BtnCut" runat="server" Text="裁剪" CssClass="btn btn-primary" OnClientClick="return Create();"  OnClick="Cut_Click" />  
<button type="button" class="btn btn-primary" onclick="SaveUrl()">确认</button>
</div>
<div class="text-center" style="clear:both; margin-top:10px;">
<input id="iP" name="iP" runat="server"  value='<%=Request.Form["iP"] %>' type="hidden"/>
<input id="ix"  name="ix"  value='<%=Request.Form["ix"] %>'  type="hidden" />
<input id="iy"  name="iy" value='<%=Request.Form["iy"] %>' type="hidden"  />
<input id="iw" name="iw" value='<%=Request.Form["iw"] %>' type="hidden" />
<input id="ih" name="ih"   value='<%=Request.Form["ih"] %>' type="hidden" />
 <input id="ipw" name="ipw"  value='<%=Request.Form["ipw"] %>' type="hidden"  />
 <input id="iph" name="iph"  value='<%=Request.Form["iph"] %>' type="hidden" /></div>
</div>
<%--<input id="idPic" type="button" value="换图" />--%>
   <div style="width:0; display:none;"> <img id="img1" runat="server" src=''/></div> 
</form>
 </div>
<script type="text/javascript" src="/JS/ImgCropper.js"></script>
<script type="text/javascript" src="/JS/picDrag.js"></script>
<script type="text/javascript" src="/JS/Resize.js"></script> 
<script>  
    var ic = new ImgCropper("bgDiv", "dragDiv", "<%=Pic %>?<%=Request["d"]%>", {
        Height:400,
        Width: 763,
         Color: "#000",
        Resize: true,
        Right: "rRight", Left: "rLeft", Up: "rUp", Down: "rDown",
        RightDown: "rRightDown", LeftDown: "rLeftDown", RightUp: "rRightUp", LeftUp: "rLeftUp",
        Preview: "viewDiv", viewWidth: 200, viewHeight: 280
    });
    document.getElementById("img1").src = '<%=Pic %>?<%=Request["d"]%>';
    SetHeadSize();
function Create() {
    var p = ic.Url, o = ic.GetPos(); 
    x = o.Left,
    y = o.Top,
    w = o.Width,
    h = o.Height,
    pw = document.getElementById("img1").width;// ic._layBase.width,
    ph = document.getElementById("img1").height;//ic._layBase.height;
    var sca = 1;
    var sca1=pw/ic._layBase.width;
    var sca2=ph/ic._layBase.height;
    if (ic._layBase.width == 400) {
        sca = sca1;
    }
    else sca = sca2;
    document.getElementById("iP").value = ic.Url;
    document.getElementById("ix").value = x * sca;
    document.getElementById("iy").value = y * sca;
    document.getElementById("iw").value = pw; 
    document.getElementById("ih").value = ph;
    document.getElementById("ipw").value = w * sca;
    document.getElementById("iph").value = h * sca;
    return  true;
}
function ZoomSmall() {
    ic.Width = jQuery("#bgDiv").find("img").width() / 2;
    ic.Height = jQuery("#bgDiv").find("img").height() / 2;
    ic.SetSize();
    fixDIv();
}
function ZoomBig() {
    ic.Width = jQuery("#bgDiv").find("img").width() * 2;
    ic.Height = jQuery("#bgDiv").find("img").height() * 2;
    ic.SetSize();
    fixDIv();
}
function fixDIv() {
    jQuery("#bgDiv").height(ic.Height);
    jQuery("#bgDiv").width(ic.Width);
}
function SetHeadSize() {
    jQuery("#dragDiv").width(200);
    jQuery("#dragDiv").height(280);
    jQuery("#viewDiv").width(200).height(280);
}
function SetRegSize() {
    jQuery("#dragDiv").width(200);
    jQuery("#dragDiv").height(200);
    jQuery("#viewDiv").width(200).height(200);
}
function SaveUrl() {
    parent.setCutUrl(jQuery("#bgDiv").find("img").attr("src"));
    parent.closdlg();
}
</script> 
</body>
</html>
