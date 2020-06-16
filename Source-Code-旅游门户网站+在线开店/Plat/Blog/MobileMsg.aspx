<%@ page language="C#" autoeventwireup="true" inherits="test_test, App_Web_yqt4rj4s" masterpagefile="~/Plat/Empty.master" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<script type="text/javascript" src="/JS/Mobile/upload.js"></script>
<script type="text/javascript" src="/JS/Mobile/mobileBUGFix.mini.js"></script>
<title>简洁分享</title>
<style>
a { text-decoration: none; }
a:hover { text-decoration: none; }
.img_pre { min-width: 300px; max-width: 450px; height: 300px; cursor: pointer; margin-bottom: 10px; }
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid">
<div class="row">
  <div>
    <asp:TextBox TextMode="MultiLine" placeholder="今天说点什么?" Width="100%" Height="150" Style="border-radius: 0px; max-width: 100%;" Rows="5" ID="Content_T" runat="server"></asp:TextBox>
    <div class="msg_opdiv" style="top: -5px; border-right: 1px solid #dadada;"></div>
    <div id="img_div" style="text-align:center;max-width:960px;margin:auto;"> <img src="/Images/userface/noface.gif" data-id="1" class="img_pre col-lg-4 col-md-4 col-sm-4 col-xs-12" onclick="ShowFile(1)" /> <img src="/Images/userface/noface.gif" data-id="2" class="img_pre col-lg-4 col-md-4 col-sm-4 col-xs-12" onclick="ShowFile(2)" /> <img src="/Images/userface/noface.gif" data-id="3" class="img_pre col-lg-4 col-md-4 col-sm-4 col-xs-12" onclick="ShowFile(3)" /> </div>
    <asp:LinkButton runat="server" CssClass="btn btn-primary one" Style="width: 100%; padding-top: 15px; padding-bottom: 15px; margin-top: 10px;" OnClientClick="return CheckEmpy()" OnClick="SaveContent_Click"> <span class="glyphicon glyphicon-globe" style="font-size:1.2em;margin-right:5px;"></span>分享</asp:LinkButton>
  </div>
</div>
<div id="upfile_div" style="display: none;">
  <input data-id="1" type="file" accept="image/*" class="upfile" />
  <input data-id="2" type="file" accept="image/*" class="upfile" />
  <input data-id="3" type="file" accept="image/*" class="upfile" />
  <asp:HiddenField runat="server" ID="imgurl_hid" />
</div>
</div>
<script>
$().ready(function () {
    $('.upfile').UploadImg({
        url: 'MobileMsg.aspx',
        width: '320',
        height: '300',
        quality: '0.5', //压缩率，默认值为0.8
        // 如果quality是1 宽和高都未设定 则上传原图
        mixsize: '3000000',//最大支持3M,需要增加小于一定数，则直接上传不压缩
        //type : 'image/png,image/jpg,image/jpeg,image/pjpeg,image/gif,image/bmp,image/x-png',
        before: function (blob) {
            //上传前返回图片blob
            $("#img_div").find("img[data-id=" + curid + "]").attr("src", blob);
        },
        error: function (res) {
            //上传出错处理
            $('#img').attr('src', '');
            $('#error').html(res);
        },
        success: function (res) {
            //上传成功处理
            var v = $('#imgurl_hid').val();
            $('#imgurl_hid').val(v + "|" + res);
            console.log($('#imgurl_hid').val());
        }
    });
});
var curid = 1;
function ShowFile(id) {
    $("#upfile_div").find("input[data-id=" + id + "]").click();
    curid = id;
}
function CheckEmpy() {
    if ($("#file").val()==""&&($("#Content_T").val()=="")) {
        alert("发送图片或内容不能为空！");
        return false;
    }
    return true;
}
</script> 
</asp:Content>