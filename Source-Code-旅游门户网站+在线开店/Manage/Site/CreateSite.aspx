<%@ page language="C#" autoeventwireup="true" inherits="manage_IISManage_CreateSite, App_Web_5arvbvnz" masterpagefile="~/Manage/Site/SiteMaster.master" title="创建新站点" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>配置管理</title>
<script src="../../JS/jquery.js"></script>
<style>#site_nav .site01 a{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}</style>
<script type="text/javascript" src="/JS/chinese.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div id="m_site"><p> 站群中心 >> 配置管理</p></div>  
<div id="site_main">
<div id="CSWSDiv" class="cswsDiv"><!--Create Single Web Site-->
	<ul><li><strong>站点名称：</strong><asp:TextBox runat="server" ID="CSWebName" CssClass="site_input" onKeyUp="get()" onblur="checkValue(this,'R1',1)" /><span style="color:red" id="R1">*</span></li>
	 <li><strong>物理路径：</strong><asp:TextBox runat="server" CssClass="site_input" ID="CSPhysicalPath" onblur="checkValue(this,'R2',2)"/><span style="color:red" id="R2">*非自动模式，必须在服务器上已经建立好文件夹，如:D:\WebSite\</span></li>
		 <li><strong>网站端口：</strong><asp:TextBox runat="server" ID="CSPort" CssClass="site_input"  MaxLength="6" txt="端口"  value="80" onblur="checkValue(this,'R3',3)"/><span style="color:red" id="R3">*默认为80，最多6位数字格式。</span></li>
		 <li><strong>动态域名：</strong><asp:TextBox runat="server" ID="CSDomain" CssClass="site_input"  txt="域名"/><span style="color:red">*例:www.zoomla.cn,需要绑定的域名</span></li>
		 <li id="batTr" style=" padding-left:240px;"><label for="newa">批量绑定</label>
		 <a href="javascript:" onclick="newadd()" title="添列一列" id="newa"><img src="../../App_Themes/AdminDefaultTheme/images/padd.jpg" /></a> </li>
   <li>应用程序池：<asp:TextBox runat="server" ID="CSAppPool" CssClass="site_input"  /><span style="color:red"></span></li>
   <li>立即启动网站： <input type="checkbox" name="chk" checked="checked"/> </li>
   <li>操作： <asp:Button runat="server" ID="CSWSBtn" Text="确定"  CssClass="site_button" OnClick="CSWSBtn_Click"  OnClientClick="return checkinfo('sitePort', 'Domain');"/>
			<input type="button" id="rBtn1" value="返回管理界面" class="site_button" onclick="back();"/>
       <input type="button" id="closeBtn" value="关闭" class="site_button" onclick="parent.closeDiv();"/>
   </li></ul>
  <script type="text/javascript">
      function get()
      {
          document.getElementById("<%= this.CSAppPool.ClientID%>").value = document.getElementById("<%= this.CSWebName.ClientID%>").value;
      }
	  $().ready(function () {
		  $("#<%=CSWebName.ClientID%>").keyup(function () { Getpy('<%=CSWebName.ClientID%>', '<%=CSAppPool.ClientID%>') });
	  });
	  function oldadd() {//Disuse
		  var tr = "<tr class='tdbg'><td><label>端口：</label><input type='text' name='sitePort'  txt='端口' style='width:40px;'/>" +
			  "</td><td><label>域名：</label><input type='text' name='Domain' txt='域名'/></td><td><a href='javascript:' onclick='remove(this)' title='移除'>" +
			  "<img src='../../App_Themes/AdminDefaultTheme/images/error.gif' /></a></td></tr>";
		  $("#batTable").append(tr);
	  }
	  function newadd() {
		  var tr = "<li><label>批量绑定：</label></td><td><label>端口：</label><input type='text' name='sitePort' value='80' class='site_input' style='width:40px;'  maxlength='6' txt='端口'/>" +
			 "<label> 域名：</label><input type='text' name='Domain' class='site_input' txt='域名'/><a href='javascript:' onclick='remove(this)' title='移除'>" +
			 "<img src='../../App_Themes/AdminDefaultTheme/images/error.gif' /></a></li>";
		  $("#batTr").after(tr);
	  }
	  function remove(obj) {
		  $(obj).parent().remove();
	  }
	  function checkinfo()//Detect whether the domains and ports is empty;
	  {
		  for (i = 0; i < arguments.length; i++) {
			  var arr = document.getElementsByName(arguments[i]);
			  for (j = 0; j < arr.length; j++) {
				  if (arr[j].value == "") { alert(arr[j].txt + "未填写"); arr[j].focus(); return false; }
			  }
		  }
		  return true;
	  }
	  function checkValue(obj, t, Mark)//要检测的控件对象,显示提示信息用的span,标识自身，以便后台调用相应方法处理
	  {
		  //为空也不前台判断，全交于后台判断，避免伪造信息
		  $.ajax({
			  type: "post",
			  url: "CreateSite.aspx",
			  data: { data: obj.value, mark: Mark },
			  success: function (data) { $("#" + t).html(data); },
			  error: {}
		  });//ajax end;
	  }

	  function disParent(url)//快云框架调用该页面,判断其自身是否被框架调用
	  {
	      if (parent == null)
	      { location = location; }
	      else
	      {
	          parent.closeDiv();
	          parent.location = url;
	      }
	  }
	  function back() {
	      url = "Default.aspx";
	      if (getParam("remote") == "true") {
	          url += "?remote=true"
	      }
	      location = url;
	  }
  </script>
 
</div>
</div>
</asp:Content>