<%@ page language="C#" autoeventwireup="true" inherits="Plat_DocContent, App_Web_yqt4rj4s" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
  <script type="text/javascript" src="/JS/jquery.validate.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a title="首页" href="/">首页</a></li>
<li><a title="信息中心" href="/Plat/Blog/">能力中心</a></li>
<li class="active">日程管理</li>
</ol>
<div class="col-lg-12">
<table class="table table-bordered" id="DateTable" style="width:70%;">
  <thead>
    <tr>
      <td colspan="7"><asp:Button runat="server" CssClass="btn btn-primary" Text="<" ID="PreMonth_Btn" OnClick="PreMonth_Btn_Click" ToolTip="上一月" />
        <strong style="font-size: 25px; position: relative; top: 4px;">
        <%:CurDate.ToString("yyyy年MM月") %>
        </strong>
        <asp:Button runat="server" CssClass="btn btn-primary" Text=">" ID="NextMonth_Btn" OnClick="NextMonth_Btn_Click" ToolTip="下一月" /></td>
    </tr>
    <tr>
      <td>周一</td>
      <td>周二</td>
      <td>周三</td>
      <td>周四</td>
      <td>周五</td>
      <td>周六</td>
      <td>周日</td>
    </tr>
  </thead>
  <tbody runat="server" id="DateBody" data-toggle="modal">
    <tr>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W1_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" id="Rep_W2_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W3_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W4_D7"></asp:Literal>
    </tr>
    <tr>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D1"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D2"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D3"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D4"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D5"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D6"></asp:Literal>
      <asp:Literal runat="server" EnableViewState="false" ID="Rep_W5_D7"></asp:Literal>
    </tr>
  </tbody>
</table>
</div>
<div class="modal fade" id="Add_Content">
<div class="modal-dialog">
  <div class="modal-content" style="width:500px;height:100%;border-radius:0px;">
    <p style="margin-left: 1em;" class=" h4"> 新建日程 <a href="#"><span style="float: right; margin-right: 1em;"  data-dismiss="modal" class="glyphicon glyphicon-remove"></span></a></p>
    <hr style="color: #c1c8c5" />
    <table id="Add_Table">
      <tr>
        <td style="width: 20%;"><span style="color: red; margin-left: 1em;">*</span>日程名称:</td>
        <td><asp:TextBox runat="server" type="text" style="width: 75%;" ID="Name_T" class="form-controll required" ></asp:TextBox></td>
      </tr>
      <tr>
        <td><span style="color: red; margin-left: 1em; text-decoration: none;">*</span>起止日期</td>
        <td><asp:TextBox class="form-controll required date " ID="txtBeginTime" runat="server" onclick="WdatePicker();" Width="30%"></asp:TextBox>
          -
          <asp:TextBox class="form-controll required date" ID="txtEndTime" runat="server" onclick="WdatePicker();" Width="30%"></asp:TextBox>
          <asp:RequiredFieldValidator ID="Req1" ValidationGroup="Add" runat="server" ErrorMessage="开始或结束时间不能为空！" ControlToValidate="txtEndTime"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="checkbox" runat="server" id="allDay" />
          全天事件
          <input type="checkbox" runat="server" id="repeat"/>
          重复</td>
      </tr>
      <tr>
        <td style="padding-left: 1em">日程地址:</td>
        <td><input type="text" class="form-controll" name="place" style="width: 75%" placeholder="点击此处添加日程地址" /></td>
      </tr>
      <tr>
        <td style="padding-left: 1em">负责人:</td>
        <td><input type="text" id="LeaderIDS_T" class="form-control"/>
          <input type="button" value="选择" onclick="selRuser();" class="btn btn-primary" style="margin-left:5px;" />
          <asp:HiddenField runat="server" ID="LeaderIDS_Hid" /></td>
      </tr>
      <tr>
        <td style="padding-left: 1em">参与人:</td>
        <td><input type="text" id="PartTakeIDS_T" class="form-control"  placeholder="选择用户名或姓名"/>
          <input type="button" value="选择" onclick="selCuser();" class="btn btn-primary" style="margin-left:5px;"/>
          <asp:HiddenField runat="server" ID="PartTakeIDS_Hid" /></td>
      </tr>
      <tr>
        <td style="padding-left: 1em"> 日程描述:</td>
        <td><textarea class="form-controll" style="width: 75%; height: 8em;" name="describe" placeholder="点击此处添加日程描述"></textarea></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="checkbox" runat="server"  id="priva"/>
          私密日程</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><asp:Button ID="Add_Btn" runat="server" Text="提交" CssClass="btn btn-primary" OnClientClick="return VoteCheck();" OnClick="BtnAdd_Click"  ValidationGroup="Add" />
          <input type="button" class="btn btn-default" onclick="ViewTaskDetail()"  data-dismiss="modal"value="取消" /></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
      </tr>
    </table>
    <div style="display: none;" class="hidden_div"> <a href="javascript:;" data-toggle="modal" data-target="#myModal" id="Model_Btn"></a> <a href="javascript:;" data-toggle="modal" data-target="#fileup_div" id="FileUP_Btn"></a> </div>
  </div>
</div>
</div>
<!--用户选取-->
<div id="select" style="position: absolute; display: none; width: 800px; background: #FFF; border: 1px solid #ddd; top: 20%; left: 20%; z-index: 99999;">
<div id="Free_Div" runat="server" class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title" style="text-align: center; width: 600px; float: left;">请选择用户</h3>
    <span style="float: right; cursor: pointer;" class="glyphicon glyphicon-remove" title="关闭" onclick="$('#select').hide();"></span>
    <div class="clearfix"></div>
  </div>
  <div class="panel-body">
    <iframe runat="server" id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 430px;" name="main_right" src="/Plat/Common/SelUser.aspx?Type=AllInfo" frameborder="0"></iframe>
  </div>
</div>
</div>
<script type="text/javascript">
function selRuser() {
    $("#select").css("margin-top", $(document).scrollTop());
    $("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#ReferUser");
    $("#User_IFrame")[0].contentWindow.ClearChk();
    $("#select").show();
}
function selCuser() {
    $("#select").css("margin-top", $(document).scrollTop());
    $("#User_IFrame").attr("src", "/Plat/Common/SelUser.aspx?Type=AllInfo#CCUser");
    $("#User_IFrame")[0].contentWindow.ClearChk();
    $("#select").show();
}
function UserFunc(json, select) {
    var uname = "";
    var uid = "";
    for (var i = 0; i < json.length; i++) {
        uname += json[i].UserName + ",";
        uid += json[i].UserID + ",";
    }
    if (uid) uid = uid.substring(0, uid.length - 1);
    if (select == "ReferUser") {
        $("#LeaderIDS_T").val(uname);//主负责人
        $("#LeaderIDS_Hid").val(uid);
    }
    if (select == "CCUser") {
        $("#PartTakeIDS_T").val(uname);//参与人员
        $("#PartTakeIDS_Hid").val(uid);
    }
    $("#select").hide();
}
function VoteCheck() {
    var validator = $("#form1").validate({ meta: "validate" });
    return validator.form();
}
</script> 
<!--模态框--> 
<a href="javascript:;" data-toggle="modal" data-target="#Add_Content" id="Add_Content_Btn"></a>
<div id="taskDetail_Div" style="height: 100%; width: 610px; position: fixed; bottom: 0px; right: 0px; border-left: 1px solid #ddd; background-color: white; display: none; z-index: 1031;" onfocus="console.log('11');" onblur="console.log('22');">
<iframe id="taskDetail_if" style=" border: none; height: 100%; width: 100%; overflow:hidden;"></iframe>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link type="text/css" href="/App_Themes/ICMS/Sass.css" rel="stylesheet" />
<style type="text/css">
.form-controll {height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.4285;color: #555;border: 1px solid #CCC;border-radius: 4px;}
#Add_Content {border: none;font-family: 微软雅黑;width:600px;height:650px;margin:auto;overflow:hidden;}
#DateTable{margin-top:10px;}
#DateTable thead{text-align:center;}
#DateBody tr td{width:13%;height:11em;font-size: 0.7em;}
#DateBody tr td:hover{background-color:#bce8f1;}
.tdTitle{text-align:right;font-size:15px;}
.td_content_div{padding:2px;padding-left:5px;border-radius:10px;background-color:#1796BF;margin-top:3px;margin-bottom:3px;height:25px;line-height:25px;color:white;text-align:center;}
.td_content_div a{color:white;}
#Add_Table td{padding:5px;}
</style>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
<script type="text/javascript">
$().ready(function () {
$("#DateBody td").dblclick(function () {
	var v = $(this).attr("data-date");
	console.log(v);
	$("#txtBeginTime").val(v);
	$("#txtEndTime1").val(v);
	$("#Add_Content_Btn").click();
});
});
function ViewDetail(id) {
$("#taskDetail_if").attr("src", "DailyDetail.aspx?ID="+id);
$("#taskDetail_Div").show();
}
function HideMe() {
$("#taskDetail_Div").fadeOut("fast");
}
</script> 
</asp:Content>