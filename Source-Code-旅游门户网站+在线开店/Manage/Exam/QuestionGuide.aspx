<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_QuestionGuide, App_Web_oesmgb05" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.LF("在线考试系统")%></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
    function Switch(obj) {
        obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
        var nextDiv;
        if (obj.nextSibling) {
            if (obj.nextSibling.nodeName == "DIV") {
                nextDiv = obj.nextSibling;
            }
            else {
                if (obj.nextSibling.nextSibling) {
                    if (obj.nextSibling.nextSibling.nodeName == "DIV") {
                        nextDiv = obj.nextSibling.nextSibling;
                    }
                }
            }
            if (nextDiv) {
                nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none";
            }
        }
    }
    function OpenLink(lefturl, righturl) {
        if (lefturl != "") {
            parent.frames["left"].location = lefturl;
        }
        try {
            parent.MDIOpen(righturl); return false;
        } catch (Error) {
            parent.frames["main_right"].location = righturl;
        }
    }

    function gotourl(url) {
        try {
            parent.MDILoadurl(url); void (0);
        } catch (Error) {
            parent.frames["main_right"].location = "../" + url; void (0);
        }
    }
</script>
</head>
<body id="Guidebody" style="margin-left: 0px; margin-right: 0px; margin-top: 1px;
    margin-bottom: 0px">
    <form id="formGuide" runat="server">
    <div id="Div1">
        <ul>
		<li id="Guide_top">
			<div id="Guide_toptext"><%=lang.LF("考试管理")%></div>
		</li>
		<li id="Guide_main">
		       <%-- <div class="guideexpand" onclick="Switch(this)">
					分类管理
				     </div>
				     <div class="guide">
					<ul>
						<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
							<a href="javascript:gotourl('Exam/Question_Class_Manage.aspx');">分类管理</a></li>
						<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
							<a href="javascript:gotourl('Exam/AddQuestion_Class.aspx?menu=Add&C_id=0');">添加分类</a></li>
				</ul>
				</div>--%>
			<div id="Guide_box">
				<div class="guideexpand" onclick="Switch(this)"> <%=lang.LF("试卷管理")%> </div>
				<div class="guide">
					<ul>
						<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
						   <a href="../i/Exam/Papers_System_Manage.aspx" target="main_right"><%=lang.LF("试卷管理")%> </a></li>
						<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
						   <a href="../i/Exam/CoureseManage.aspx" target="main_right"><%=lang.LF("课程管理")%> </a></li>
					</ul>
				</div>
			  
				<div class="guideexpand" onclick="Switch(this)">
					<%=lang.LF("试题管理")%>
				</div>
				<div class="guide">
					<ul>
						<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
						   <a href="../i/Exam/QuestionManage.aspx" target="main_right"><%=lang.LF("试题管理")%></a></li>
					  <%--  <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
							<a href="../Exam/QuestionSouch.aspx" target="main_right">高级搜索</a></li>--%>
                      <%-- <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
							<a href="../Exam/AddQuestionForType.aspx" target="main_right">添加试题</a></li>--%>
							 <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
						   <a href="../i/Exam/Question_Class_Manage.aspx" target="main_right"><%=lang.LF("分类管理")%></a></li>
					   <%-- <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
							<a href="../Exam/AddQuestion_Class.aspx?menu=Add&C_id=0" target="main_right">添加分类</a></li>--%>
						<li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
					   <a href="../i/Exam/ExamPointManage.aspx" target="main_right"><%=lang.LF("考点管理")%></a></li>
						 <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
					   <a href="../i/Exam/QuestionTypeManage.aspx" target="main_right"><%=lang.LF("题型管理")%></a></li>
					</ul>
				</div>
			</div>
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
