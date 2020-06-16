<%@ page language="C#" autoeventwireup="true" inherits="manage_Template_CloudPush, App_Web_fx1qjkh2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>应用推送</title>
<link type="text/css"  href="../../App_Themes/AdminDefaultTheme/main.css"rel="stylesheet" />
<link type="text/css"  href="../../App_Themes/AdminDefaultTheme/Default.css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
</head>
<body  >
<form id="form1" runat="server"> 
  <div class="r_navigation">
 <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('23')" title="帮助"></a></div>
  <%} %> 后台管理&gt;&gt;系统设置&gt;&gt;<a href="TemplateSet.aspx">方案管理</a>&gt;&gt;从云端免费获取全站方案</div>
<div id="toptem"> <span class="panel_tui" ><a href="CloudLead.aspx" class="btn_tui" target="_self"> </a></span></div>

<div id="appdiv"> 
<h1>应用推送</h1>
    <div id="phone">
       <div id="phnifm"> <iframe id="Viewhtml" width="272" height="405" frameborder="0" scrolling="no" src="appTemp.aspx?dtype=1&d=1"></iframe></div> 
    </div>
<div id="appform">
<ul>
<li><h3 class="hline mvt24px">App名称</h3> <asp:TextBox ID="appName" runat="server" CssClass="inp_text"></asp:TextBox></li>
<li><h3 class="hline mvt24px">模版设置</h3> 
    <span class="nav_item  slide checked"  id="nav01" onclick="getdata(1)" data-type="1"><em></em></span>
    <span class="nav_item  all" id="nav02" onclick="getdata(2)" data-type="2"><em></em></span>
    <span class="nav_item  down" id="nav03" onclick="getdata(3)" data-type="3"><em></em></span>
    <span class="nav_item  navstyle4" id="nav04" onclick="getdata(4)" data-type="4"><em></em></span>
    <span class="nav_item  navstyle5" id="nav05" onclick="getdata(5)" data-type="5"><em></em></span>
</li>
<li><h3 class="hline mvt24px">底部设置</h3> 
    <input name="checkbox-pc" checked="checked" type="checkbox" /><label> 电脑版链接 </label>
    <input  class="searchbox-pc" name="searchbox-pc" checked="checked" type="checkbox" /> <label> 百度搜索框 </label>
    <input  class="searchbox-pc" name="helpbox-pc" checked="checked" type="checkbox" /> <label> 逐浪助手</label> 
    <br /> 
    <input id ="optionPhone" type="checkbox" /><label id="tel"> 电话号码 </label> <input id="optionTel" for="tel" type="text" placeholder="例如：010-56651667" class="inp_text" /> 
    <input id ="optionAfax" type="checkbox" /><label id="fax"> 传真 </label> <input id="optionFax" for="fax" type="text" class="inp_text"  /><br /> 
        <input id ="optionAemail" type="checkbox" /><label id="email"> 邮箱 </label> <input id="optionEmail" for="email" type="text" class="inp_text"  /><br /> 
        <input id ="optionCopyright" type="checkbox" /> <label id="copy"> 版权信息 </label> <input id="optionCopy" for="copyright" type="text" name="copyright" class="inp_text" /><span id="copyHint">最多输入15个汉字</span><span class="cWarning" style="display:none">已经超过15个汉字的长度</span><br /> 
           <%-- <div><input id ="optionAddress" type="checkbox" /><label id="addr"> 地址 </label><textarea id="optionAddr" for="addr" type="text" class="area_text"  ></textarea></div> --%>
</li>
<li class="skinli"><h3 class="hline mvt24px">皮肤</h3> 
        <span class="color grey checked" id="col01" onclick="getskin(1)"><em></em></span>
        <span class="color green" id="col02" onclick="getskin(2)"><em></em></span>
        <span class="color red" id="col03" onclick="getskin(3)"><em></em></span>
        <span class="color blue" id="col04" onclick="getskin(4)"><em></em></span>
</li>
<li><h3 class="hline mvt24px">生成</h3>  
<input id="ando" name="Creatc" type="radio" value="Andorid" />Andorid
<input id="ios"  name="Creatc" type="radio" value="IOS" />IOS
<input id="winp"  name="Creatc" type="radio" value="Windwos Phone" /> Windwos Phone  
</li>
<li><h3 class="hline mvt24px">传递到</h3>  
<input id="PhoneGap" name="appPlay"  type="radio" value="1" />PhoneGap
<input id="baiduAPP" name="appPlay" type="radio" value="2" />百度APP
<input id="Googleplay" name="appPlay" type="radio" value="3" />Google play
<input id="zuixin" name="appPlay" type="radio" value="4" />追信 
</li>
<li><input type="button" id="CreateOn" onmousemove="chagetext()" onmouseout="outtext()" value="生成" class="app_btn out_btn" onclick="javascript: window.open('http://www.zoomla.cn/shop/');"  /> </li>
</ul>    
</div>
    <input type="hidden" id="dtype" value="1" />
    <input type="hidden" id="dcol" value="1" />
</form>
   
    <script>
        function chagetext()
        {
            $("#CreateOn").val("非认证版本，点此购买商业认证");
            $("#CreateOn").removeClass("out_btn");
            $("#CreateOn").addClass("on_btn");
        }
        function outtext() {
            $("#CreateOn").val("生成");
            $("#CreateOn").removeClass("on_btn");
            $("#CreateOn").addClass("out_btn");
        } 
        var nitem=$(".nav_item"); 
        function getdata(d) {
            $("#dtype").val(d);
            $(".nav_item").removeClass("checked");
            for (var i = 0; i < nitem.length; i++) {
                if (d == (i + 1)) {
                    $("#nav0" + d).addClass("checked");
                } 
            } 
            document.getElementById("Viewhtml").src = "appTemp.aspx?dtype=" + $("#dtype").val() + "&d=" + $("#dcol").val();
        }
        function getskin(c) {
            $("#dcol").val(c); 
            $(".color").removeClass("checked");
            for (var i = 0; i < $(".color").length; i++) {  
                if ((c - 1) == i) {
                    $("#col0" + c).addClass("checked");
                } 
            } 
            document.getElementById("Viewhtml").src = "appTemp.aspx?dtype=" + $("#dtype").val() + "&d=" + $("#dcol").val();
             
        }
    </script>
</body>
</html>