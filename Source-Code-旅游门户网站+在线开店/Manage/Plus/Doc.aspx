<%@ page language="C#" autoeventwireup="true" inherits="User_Cloud_wordpage, App_Web_ka5t45ft" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>智能文档生成平台</title>
    <link href="/App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
    <link href="/Plugins/Uploadify/style.css" rel="stylesheet" type="text/css" />
    <link href="/App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/jquery.js"></script>
    <script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
    <script type="text/javascript" src="../../JS/DocManage.js"></script>
    <script type="text/javascript">
        function displayDiv(id) {
            document.getElementById(id).style.display = "";
        }
  
    function closes(){
		document.getElementById("model_main").style.display="none";
 		}
		  function blocks(){
		document.getElementById("model_main").style.display="";
 		}
		
     </script>
    <style type="text/css">
        p.MsoNormal {
            margin-bottom: .0001pt;
            text-align: justify;
            text-justify: inter-ideograph;
            font-size: 10.5pt;
            font-family: "Calibri", "sans-serif";
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
		#WebBlock li{ height:138px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="all">
        
          <div class="word_bg">
         <ul><li class='item  tigger' id='nav1'><a href="javascript:void(0)" onClick="blocks()" style="cursor: hand;width:100px;height:100px;" >
                     添加模板组+ </a> </li>
                        <li><div id="uploadDiv" runat="server">
                <input type="file" name="file_upload" id="file_upload_1" runat="server" />
            </div></li>
         <li class='item' id='nav2'><a href="Doc.aspx" style="width:100px;height:100px;"> 返回 </a>
                    </li>
                        </ul>
                        <div style="clear:both"></div>
            </div>
        
          
           <div id="model_main" style="display:none"> 
             <div id="modelGroup">
             <div class="Group_tit"><span><a href="JavaScript:void(0)" onClick="closes()">关闭</a></span><strong>添加模版组</strong></div>
             <div class="Group_c">模版组名称:
            <asp:TextBox ID="groupName" runat="server" CssClass="l_input" /><br/><br/>
                    <asp:Button ID="GroupBtn" runat="server" CssClass="C_input" OnClick="GroupBtn_Click" Text="添加" /> 
            </div></div></div>

            <div id="WebBlock">
                <ul class='itemContainer'>

                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li class='item'>
                                <%# Eval("status").ToString().Equals("1") ? "<a href='Doc.aspx?parentID=" + Eval("ID") + "&status=" + Eval("status") + "&dirName=" + Eval("DocName") + "'>" + Eval("DocName") + "</a>"+
                               "<input type='checkbox' name='hadCheck'  value='"+Eval("ID")+"'/>" :"<a href='javascript:openDoc(\""+Eval("DocName")+"\")'>" + Eval("DocName").ToString().Split('.')[0] + "</a>"+
                               "<input type='checkbox' name='hadCheck'  value='"+Eval("ID")+"'/>" %>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <div class='itemNext'>
                </div>
                <div class="clear"></div>
            </div>
            <div>
            <input type="button" id="allCheckBox" value="全选" class='C_input' onclick="allCheck('hadCheck')" runat="server"  />
            <asp:Button ID="delDoc" runat="server" Text="批量删除" class="C_input" OnClick="delDoc_Click" visible="false" /> 
            <asp:Button ID="delDocArrary" runat="server" Text="批量删除模板组"  class="C_input"  OnClick="delDocArrary_Click"/>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $("#file_upload_1").uploadify({
                    //按钮宽高
                    width: 120,
                    height: 35,
                    auto: true,
                    swf: '/Plugins/Uploadify/uploadify.swf',
                    uploader: '/Plugins/Uploadify/UploadFileHandler.ashx',
                    buttonText: "上传到:<%=dirName%>",
                    buttonCursor: 'hand',
                    fileTypeExts: "*.doc;*.docx;*.dot",
                    fileTypeDesc: "请选择模板文件",
                    fileSizeLimit: "50000KB",
                    formData: { "userName": "<%=dirName%>", "passwd": "<%=parentID%>" },
                    queueSizeLimit: 50,
                    removeTimeout: 2,
                    multi: true,
                    onUploadStart: function (file) { },
                    onQueueComplete: function (queueData) {location = location; },
                    onUploadError: function (file) { alert(file.name + "上传失败"); }
                });
            });

            var flag = true;
            function allCheck(name) {
                var checkBoxarr = document.getElementsByName(name);
                for (i = 0; i < checkBoxarr.length; i++) {
                    checkBoxarr[i].checked = flag;
                }
                document.getElementById("allCheckBox").value = document.getElementById("allCheckBox").value == "全选" ? "全清" : "全选";
                flag = !flag;
            }

        </script>
        <iframe src="/Edit/Edit.aspx" id="wordManage" style="width: 1px; height: 1px;"></iframe>
    </form>
</body>
<script type="text/javascript" src="/JS/fai.js"></script>
<script type="text/javascript">
    function openDoc(title) {
        document.getElementById("wordManage").style.width = "100%";
        document.getElementById("wordManage").style.height = "750px";
        document.getElementById("all").style.display = "none";
        wordManage.window.openWord3(title);
    }
    function closeDoc() {
        document.getElementById("wordManage").style.width = "1px";
        document.getElementById("wordManage").style.height = "1px";
        document.getElementById("all").style.display = "";
    }var a='<%Call.Label("{$GetRequest(parentID)$}"); %>';
		if(a==''){
			document.getElementById("uploadDiv").style.display="none";
			document.getElementById("nav2").style.display="none";
 			}
			else{document.getElementById("nav1").style.display="none";}

</script>
</html>
