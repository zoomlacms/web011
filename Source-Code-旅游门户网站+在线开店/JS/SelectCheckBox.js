// CheckBox,Radio,Select等JS文件,以后相关的方法放这
//各种控件操作方法
function CheckExcBox(box)    
{
   for (var i=0;i<document.form1.elements.length;i++)
   {
      var e = document.form1.elements[i];
      if ( (e.type=='checkbox') )
        {                    
           var o=e.name.lastIndexOf('ChkSelect');
                   
           if(o!=-1)
           {
			    e.checked = box.checked;
           }
         }
    }      
    if(document.form1.checkSel.checked==true)
    {
		ShowA.innerHTML="取消选择";
	}
	else
	{
		ShowA.innerHTML="选择全部";
	}
}
function CheckAll(spanChk)//CheckBox全选
{
    var oItem = spanChk.children;
    var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
    xState = theBox.checked;
    elm = theBox.form.elements;
    for (i = 0; i < elm.length; i++)
        if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
        if (elm[i].checked != xState)
            elm[i].click();
    }
}
//-------------Add By Coffee
//IsSelectByName('chkID');
function IsSelectByName(n)
{
    return $("input[name='" + n + "']:checked").length > 0;
}
//全选
function selectAllByName(obj, name) {
    var allInput = document.getElementsByName(name);
    var loopTime = allInput.length;
    for (i = 0; i < loopTime; i++) {
        if (allInput[i].type == "checkbox") {
            allInput[i].checked = obj.checked;
        }
    }
}
//全选,以click的方式,用于SelGroup,UserList等需要保持Checkbox状态的
function SelByName(obj, name) {
    $("input[name='" + name + "']").each(function () {
        if (this.checked != obj.checked)
            $(this).click();
    });
}
//------------Select/DropDownList

//------------Button
//--disBtn(this); disBtn(this,2000);
function disBtn(o, t) {
    if (arguments.length == 1) {
        setTimeout(function () { o.disabled = true; }, 50);
    }
    else if (arguments.length == 2) {
        setTimeout(function () { o.disabled = true; }, 50);
        setTimeout(function () { o.disabled = false; }, t);
    }
}
//------屏幕中部打开窗口
//openWin(url,550,500)
function openWin(url, h, w) {
    var iTop = (window.screen.availHeight - 30 - 550) / 2;
    var iLeft = (window.screen.availWidth - 10 - 960) / 2;
    window.open(url, "_win", 'height=' + h + ', width=' + w + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
}