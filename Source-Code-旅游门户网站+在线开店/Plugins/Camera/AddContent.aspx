<%@ page language="C#" autoeventwireup="true" inherits="manage_Mobile_AddContent, App_Web_vpmshry0" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<head>
    <title></title>
</head>

<body>
<form id="form1" runat="server" visible="false">
<div data-role="page" >
<div data-role="header"  data-position="fixed">
    <h1 runat="server" id="topWord"></h1>
</div>
<!-- /header -->
<div data-role="content" id="main" style="display:none;">
    <p><label for="UserID">标题：</label></p>
    <asp:TextBox ID="txtTitle" style="width:350px;"  runat="server"></asp:TextBox>  
    <p><label for="UserPwd">内容：</label></p>
    <p><asp:TextBox ID="txt_Content" TextMode="MultiLine" style="width:350px;height:500px;"  runat="server"></asp:TextBox> </p>
  
    <p style="display:none;"> 
    <asp:LinkButton ID="logBtn" runat="server" Text="添加" OnClick="Add_Click"></asp:LinkButton>
    </p>
    <p><input type="button" value="添加" data-inline="true" onclick="PostToCS()"/></p>
    
<script type="text/javascript">
    
    function DivTab()
    {
        $("#Complete").toggle("fast");
        $("#main").toggle("fast");
    }
    function PostToCS()
    {
        //$.ajax({
        //    type: "Post", url: "AddContent.aspx/SayHello", contentType: "application/json; charset=utf-8",
        //    dataType: "json",success: function (data) {alert(data);},
        //            error: function (err) {alert(err);}
        //        });   
        
        //document.getElementById("logBtn").click();
        var xtitle  = $("#txtTitle").val();
        var xcontent = $("#txt_Content").val();
        $.post("AddContent.aspx", { action: "save", title: xtitle, content: xcontent, modelid: "<%=Request.QueryString["modelid"]%>", nodeid: "<%=Request.QueryString["NodeID"]%>" },
            function (data) {
                switch(data)
                {
                    case "-1":
                        alert("请输入标题和正文");
                        break;
                    case "-2":
                        alert("添加文章失败");
                        break;
                    default:    //成功
                        $("#txtTitle").val("");
                        $("#txt_Content").val("");
                        DivTab();
                        $("#readContent").click(function ()
                        { location.href = "Article.aspx?GID=" + data + "&modelid=2"; });          
                }
            }); //Post End;    
    }
</script>
   
       
</div>
  <div id="mainPicture" >  
    <video id="video" autoplay="autoplay" style="width:75%; float:left;margin-left:50px;"></video>
        
  <div id="result" style="float:right;">
        
  </div> 
    
       <div>
    <input type="button" value="拍照" onclick="shoot()"  style="width:20%;height:150px;margin-left:150px;"/>
    <input type="button" value="上传"  style="width:20%;height:150px;margin-left:150px;"/>
       </div>
  
    <script type="text/javascript">
       
        
        var imgArray=new Array();
        var video = document.getElementById("video");
        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;
        if (navigator.getUserMedia) //  
        {
            if (navigator.webkitURL)//  
            {
                navigator.getUserMedia({ video: true }, function (stream) {
                    video.src = window.webkitURL.createObjectURL(stream);
                }, function (error) { alert(error); });
            }
            else //  
            {
                navigator.getUserMedia({ video: true }, function (stream) {
                    video.src = window.webkitURL.createObjectURL(stream);
                }, function (error) { alert(error); });
            }
        }

        //執行拍照
        function shoot() {
            var video = $("#video")[0];
            var canvas = capture(video);    
            //$("#result").empty();
            //呈現圖像(拍照結果)
            var imgData = canvas.toDataURL("image/jpg");
            var base64String = imgData.substr(22); //取得base64字串

            //上傳，儲存圖片
            $.ajax({
                url: "AddContent.aspx",
                type: "post",
                data: { data: base64String, type: "image" },
                async: true,
                success: function (htmlVal) {//htmlVal
                    //$("#result").append(canvas);
                    imgArray[imgArray.length] = canvas;
                    var img = "<img style='width:150px;height:150px;' src='"
                    img+=htmlVal;
                    img += "' /><br/>";
                    $("#result").append(img);
                }, error: function (e) {
                    alert(e.responseText); //alert錯誤訊息
                }

            });
        }

        //從video元素抓取圖像到canvas
        function capture(video) {
            var canvas = document.createElement('canvas'); //建立canvas js DOM元素
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            var ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0);
            return canvas;
        }

        //function preView()
        //{
        //    for (i = 0; i < imgArray.length; i++)
        //    {
        //        //$("#result").append("<div id='pic1' style='width:150px;height:150px;'></div>");
        //        // $("#pic1").append(imgArray[i]);

        //        $("#result2").append(imgArray[i]);
        //    }
        //}
</script>
      

<div id="Complete" style="display:none;">
       <div style="margin-top:50px;"></div>
<!--添加完成后显示该页，看继续添加，还是查看内容-->
       <div style="font-size:large"><label>添加成功，你是要继续添加，还是查看刚添加的内容</label></div>
       <input type="button" value="继续添加"  onclick="DivTab()"/>
           <br />
       <asp:Button ID="readContent" runat="server" text="查看内容" />
           <br />
       <input type="button" value="返回首页"  onclick="location.href='default.aspx'"/>
           </div>
       <input type="hidden" value="" id="Info" runat="server" />
<!-- /content -->
<div data-role="footer"  data-position="fixed">
    <h6>&copy Shanghai Zoomla!CMS Software technology Co., LTD all rights reserved</h6>
</div>
<!-- /footer -->
</div>
<!-- /page -->
   
</form>
</body>
</html>
