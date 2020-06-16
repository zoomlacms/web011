<%@ page language="C#" autoeventwireup="true" inherits="Manage_User_CompetenceAdd, App_Web_pwpbtctt" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>权限设置</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center"><b>用户角色设置</b></td>
        </tr>
        <tr>
            <td class="text-right" style="width: 200px;"><strong>角色名：</strong></td>
            <td><asp:Label ID="RoleName" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right" style="height: 79px; width: 100px;"><strong>角色描述：</strong></td>
            <td><asp:Label ID="RoleInfo" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right" style="width: 100px;"><strong>OA权限设置：</strong></td>
            <td>
                <div class="checkdiv">
                    <input type="checkbox" onclick="checkall(this);" class="checkebox" name="OAMeetingManage" id="OAMeetingManage" value="OAMeetingManage" />会议权限
                    
                </div>
                <div class="checkdiv">
                    <input type="checkbox" class="checkebox" id="OATop" name="OATop" onclick="showtext(this)"  value="OATop" /> 置顶权限
                    <asp:TextBox ID="OATopNodeID_T" runat="server" style="display:none;"></asp:TextBox><span id="OATopSpan" style="display:none;">输入节点ID，格式为,1,2,</span>
                </div>
                <div class="checkdiv">
                    <input type="checkbox" class="checkebox" id="OADel" name="OADel" onclick="showtext(this)" value="OADel" /> 删除权限
                    <asp:TextBox ID="OADelNodeID_T" runat="server" style="display:none;"></asp:TextBox><span id="OADelSpan" style="display:none;">输入节点ID，格式为,1,2,</span>
                </div>
                <div class="checkdiv">
                    <input type="checkbox" class="checkebox" id="OAEdit" name="OAEdit" onclick="showtext(this)" value="OAEdit" /> 修改权限
                    <asp:TextBox ID="OAEditNodeID_T" runat="server" style="display:none;"></asp:TextBox><span id="OAEditSpan" style="display:none;">输入节点ID，格式为,1,2,</span>
                </div>
                <div class="checkdiv">
                    <input type="checkbox" class="checkebox" name="OATaskManage" id="OATaskManage" value="OATaskManage" />任务管理器
                </div>
                <div class="checkdiv">
                    <input type="checkbox" onclick="checkall(this);" class="checkebox" name="OAEmailManage" id="OAEmailManage" value="OAEmailManage" />邮件权限<br />
                    <input type="checkbox" class="checkebox" name="OAEmailManage" id="Checkbox9" value="OAEmailWrite" />写邮件权限
                    <input type="checkbox" class="checkebox" name="OAEmailManage" id="Checkbox1" value="OAEmailRead" />读邮件权限
                    <input type="checkbox" class="checkebox" name="OAEmailManage" id="Checkbox2" value="OAEmailContact " />邮件联系人权限
                </div>
                <div class="checkdiv">
                    <input type="checkbox" onclick="checkall(this);" class="checkebox" name="OADepartmentManage" id="OADepartmentManage" value="OADepartmentManage" />部门公告权限<br />
                    <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox3" value="OAPartyOffices" />党办公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox4" value="OAYardOffices" />院办公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox5" value="OADisciplineOffices" />纪检公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox6" value="OAPersonnelOffices" />人事公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox7" value="OAFinanceOffices" />财务公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox8" value="OAHospitalOffices" />医务公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox10" value="OANurseOffices" />护理公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox11" value="OAInfoOffices" />信息公告
                        <input type="checkbox" class="checkebox" name="OADepartmentManage" id="Checkbox12" value="OAScienceOffices" />科教公告
                </div>
                <div class="checkdiv">
                    <input type="checkbox" onclick="checkall(this);" class="checkebox" name="OADocumentManage" id="OADocumentManage" value="OADocumentManage" />行政公文权限<br />
                    <input type="checkbox" class="checkebox" name="OADocumentManage" id="Checkbox14" value="OADocumentWrite" />公文拟稿
                        <input type="checkbox" class="checkebox" name="OADocumentManage" id="Checkbox15" value="OADocumentInst" />公文批示
                        <input type="checkbox" class="checkebox" name="OADocumentManage" id="Checkbox16" value="OAPostingDocument" />发文管理
                        <input type="checkbox" class="checkebox" name="OADocumentManage" id="Checkbox17" value="OAReceiptDocument" />收文管理
                        <input type="checkbox" class="checkebox" name="OADocumentManage" id="Checkbox18" value="OADocumentCircu" />传阅管理
                </div>
                <div class="checkdiv">
                    <input type="checkbox" onclick="checkall(this);" class="checkebox" name="OAWorkManage" id="OAWorkManage" value="OAWorkManage" />行政办公权限<br />
                    <input type="checkbox" class="checkebox" name="OAWorkManage" id="Checkbox13" value="OAWorkManage" />事务起草
                        <input type="checkbox" class="checkebox" name="OAWorkManage" id="Checkbox19" value="OAWorkManage" />事务批示
                        <input type="checkbox" class="checkebox" name="OAWorkManage" id="Checkbox20" value="OAWorkManage" />资源预约
                        <input type="checkbox" class="checkebox" name="OAWorkManage" id="Checkbox21" value="OAWorkManage" />表单管理
                        <input type="checkbox" class="checkebox" name="OAWorkManage" id="Checkbox22" value="OAWorkManage" />日程安排
                </div>
                <div class="checkdiv">
                    <input type="checkbox" onclick="checkall(this);" class="checkebox" name="OANoticeManage" id="OANoticeManage" value="OANoticeManage" />最新通知权限<br />
                    <input type="checkbox" class="checkebox" name="OANoticeManage" id="Checkbox23" value="OANoticeReadManage" />阅读权限
                </div>
                <div class="checkdiv">
                    <input type="checkbox" onclick="checkall(this);" class="checkebox" name="OABBSManage" id="OABBSManage" value="OABBSManage" />论坛交流权限<br />
                    <input type="checkbox" class="checkebox" name="OABBSManage" id="Checkbox24" value="OABBSViewManage" />论坛查看
                </div>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: 100px;"><strong>权限设置：</strong></td>
            <td>
                <input type="checkbox" class="checkebox" name="ContentManage" id="ContentManage" value="ContentManage" />内容管理
                    <input type="checkbox" class="checkebox" name="ModelNodeManage" id="ModelNodeManage" value="ModelNodeManage" />模型节点管理
                    <input type="checkbox" class="checkebox" name="TemplateLabelManage" id="TemplateLabelManage" value="TemplateLabelManage" />模板标签管理
                    <input type="checkbox" class="checkebox" name="ShopManage" id="ShopManage" value="ShopManage" />商城管理
                    <input type="checkbox" class="checkebox" name="PageManage" id="PageManage" value="PageManage" />黄页管理
                    <input type="checkbox" class="checkebox" name="UserShopManage" id="UserShopManage" value="UserShopManage" />店铺管理
                    <input type="checkbox" class="checkebox" name="UserZoneManage" id="UserZoneManage" value="UserZoneManage" />空间管理
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="height: 40px">
                <input type="button" onclick="check()" name="btnSave" class="btn btn-primary" value="保存权限设置" />&nbsp; &nbsp;&nbsp;
                    <input type="button" onclick="javascript: window.location.href = 'PermissionInfo.aspx'" name="back" class="btn btn-primary" value="返回" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="../../JS/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script>
        $().ready(function () {
            var codes = '<%= GetCodes()%>';
            if (codes != "") {
                var codesArr = codes.split(',');
                for (var i = 0; i < codesArr.length; i++) {
                    var checkArr = $("input[type=checkbox][value=" + codesArr[i] + "]");
                    checkArr[0].checked = true;
                }
            }
            if ($("input[type=checkbox][id=OATop]")[0].checked==true)
            {
                $("#OATopNodeID_T").show();
                $("#OATopSpan").show();
            }
            if ($("input[type=checkbox][id=OADel]")[0].checked == true) {
                $("#OADelNodeID_T").show();
                $("#OADelSpan").show();
            }
            if ($("input[type=checkbox][id=OAEdit]")[0].checked == true) {
                $("#OAEditNodeID_T").show();
                $("#OAEditSpan").show();
            }
    })
    function check() {
        var checkArr = $("input[type=checkbox]");
        var checkValue = "";
        var nodeid = "";
        var id = getParam("ID");
        for (var i = 0; i < checkArr.length; i++) {
            if (checkArr[i].checked) {
                checkValue += checkArr[i].value + ",";
            }
        }
        nodeid = $("#OATopNodeID_T").val() + "|" + $("#OADelNodeID_T").val() + "|" + $("#OAEditNodeID_T").val();
        checkValue = checkValue.substring(0, checkValue.length - 1);
        postToCS(checkValue, id, nodeid);
    }
    function postToCS(a, b,c) {
        $.ajax({
            type: "Post",
            url: "CompetenceAdd.aspx",
            data: { Codes: a, ID: b, NodeID: c },
            success: function (data) { if (data == 1) { alert("修改成功"); window.location.href = "PermissionInfo.aspx"; } },
            error: function () { alert("修改失败"); }
        });
    }
    function getParam(paramName) {
        paramValue = "";
        isFound = false;
        if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
            arrSource = decodeURI(this.location.search).substring(1, this.location.search.length).split("&");
            i = 0;
            while (i < arrSource.length && !isFound) {
                if (arrSource[i].indexOf("=") > 0) {
                    if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) {
                        paramValue = arrSource[i].split("=")[1];
                        isFound = true;
                    }
                }
                i++;
            }
        }
        return paramValue;
    }
    function checkall(obj) {
        var name = $(obj).attr("name");
        chkArr = $(obj).parent().find(":checkbox[name=" + name + "]");
        for (var i = 0; i < chkArr.length; i++) {
            chkArr[i].checked = obj.checked;
        }
    }
    function showtext(obj) {
        var str = $(obj).attr("id");
        if (obj.checked) {
            $("#" + str + "NodeID_T").show();
            $("#" + str + "Span").show();
        }
        else {
            $("#" + str + "NodeID_T").hide();
            $("#" + str + "Span").hide();
        }
    }
</script>
</asp:Content>