suspendcode="<DIV id=lovexin1 style='Z-INDEX: 10; LEFT: 0; POSITION: absolute; TOP: 550px; width: 100; height:300px;'><a href='http://www.cnzz.cn' target='_blank'><img src='/Template/Travel/style/images/side_ad5.jpg' width='100' height='300' border='0'></a><br/><img src='/Template/Travel/style/images/close.gif' onClick='javascript:window.hide()' width='100' height='14' border='0' vspace='3' alt='�رն������'></DIV>"
document.write(suspendcode);

suspendcode="<DIV id=lovexin2 style='Z-INDEX: 10; right:0; POSITION: absolute; TOP: 550px; width: 100; height:300px;'><a href='http://www.cnzz.cn' target='_blank'><img src='/Template/Travel/style/images/side_ad6.jpg' width='100' height='300' border='0'></a><br/><img src='/Template/Travel/style/images/close.gif' onClick='javascript:window.hide()' width='100' height='14' border='0' vspace='3' alt='�رն������'></DIV>"
document.write(suspendcode);

//flash��ʽ���÷���
//<EMBED src='flash.swf' quality=high  WIDTH=100 HEIGHT=300 TYPE='application/x-shockwave-flash' id=ad wmode=opaque></EMBED>

lastScrollY=0;
function heartBeat(){
diffY=document.body.scrollTop;
percent=.3*(diffY-lastScrollY);
if(percent>0)percent=Math.ceil(percent);
else percent=Math.floor(percent);
document.all.lovexin1.style.pixelTop+=percent;
document.all.lovexin2.style.pixelTop+=percent;
lastScrollY=lastScrollY+percent;
}
function hide()  
{   
lovexin1.style.visibility="hidden"; 
lovexin2.style.visibility="hidden";
}
window.setInterval("heartBeat()",1);
