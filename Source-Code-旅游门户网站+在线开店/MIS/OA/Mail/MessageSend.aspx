<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageSend, App_Web_mb5viozi" validaterequest="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>发送短消息</title>
    <link type="text/css" href="../CSS/ZLOA.css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/JS/MisView.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="mainDiv">
            <ul class="Messge_nav" style="display:none;">
                <li class="active"><a href="MessageSend.aspx">写邮件</a></li>
                <li><a href="Message.aspx">收件箱</a></li>
                <li><a href="MessageOutbox.aspx">发件箱</a></li>
                <li><a href="MessageDraftbox.aspx">草稿箱</a></li>
                <li><a href="MessageGarbagebox.aspx">垃圾箱</a></li>
                <li><a href="Mobile.aspx">手机短信</a></li>
            </ul>
            <div class="clearfix"></div>
            <div style="margin-top: 10px;">
                <div class="us_seta" style="margin-top: 5px;">
                    <table class="table_li table-border" style="width: 100%;">
                        <tr>
                            <td class="text-right">收件人：</td>
                            <td class="tdRight">
                                <asp:TextBox CssClass="form-control" ID="TxtInceptUser" runat="server" style="margin-right:10px;" />
                                <asp:HiddenField ID="HiddenUser" runat="server" />
                                <button type="button" onclick="showdiv('div_share','1')" class="btn-primary">选择</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">抄送人：</td>
                            <td class="tdRight">
                                <asp:TextBox CssClass="form-control" ID="ccUserT" runat="server" style="margin-right:10px;"/>
                                <asp:HiddenField ID="HiddenCCUser" runat="server" />
                                <button type="button" onclick="showdiv('div_share','2')" class="btn-primary">选择</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">邮件标题：</td>
                            <td class="tdRight">
                                <asp:TextBox ID="TxtTitle" CssClass="form-control" runat="server" />
                               <%-- <asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="邮件标题不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="EditorContent" runat="server" TextMode="MultiLine" Width="98%" Height="300px" ClientIDMode="Static">
                                </asp:TextBox>
                              <%--  <asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr id="hasFileTR" runat="server" visible="true">
                            <td class="text-right">已上传文件：<asp:HiddenField runat="server" ID="hasFileData" ClientIDMode="Static" />
                            </td>
                            <td id="hasFileTD" runat="server"></td>
                        </tr>
                        <tr>
                            <td style="text-align: center;width:10%;" >
                                <input type="button" class="btn btn-primary" value="再加个附件" onclick="addAttach();" />
                            </td>
                            <td colspan="7">
                                <table id="attachTB">
                                    <tr>
                                        <td>
                                            <input type="file" name="fileUPs" class="fileUP" /><input type="button" value="删除" onclick="delAttach(this);" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:HiddenField ID="HdnMessageID" runat="server" />&nbsp;
                        <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" OnClientClick="return SendConfirm();" class="btn btn-primary"/>&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="存草稿" OnClick="Button1_Click" class="btn btn-primary" />&nbsp; 
                        <asp:Button ID="BtnReset" runat="server" Text="清除" OnClick="BtnReset_Click" class="btn btn-primary" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                               <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" />--%>
                            </td>
                        </tr>
                    </table>
                    <div align="center"></div>
                </div>
                <div id="div_share" class="panel panel-primary" style="display: none; width: 800px; height: 600px; position: absolute; z-index: 1000;">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-remove pull-right" style="margin-top: 10px; cursor: pointer;" onclick="hidediv()" title="关闭"></span>
                        <h3 class="panel-title">选择用户</h3>
                    </div>
                    <div class="panel-body">
                        <iframe id="main_right" style="z-index: 1000; visibility: inherit; overflow: auto; overflow-x: hidden; width: 800px; height: 450px;" name="main_right" src="SelGroup.aspx?Type=AllInfo" frameborder="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <%=Call.GetUEditor("EditorContent",2)%>
        <script type="text/javascript">
            var uptr = '<tr><td><input type="file" name="fileUP" class="fileUP" /><input type="button" value="删除" onclick="delAttach(this);" /></td></tr>';
            function addAttach() {
                $("#attachTB").append(uptr);
            }
            function delAttach(obj) {
                $(obj).parent().remove();
            }
            function delHasFile(v, obj) {
                rv = $("#hasFileData").val().replace(v + ",", "");
                $("#hasFileData").val(rv)
                $(obj).parent().remove();
            }
            function showdiv(div_id, n) {
                if (n == "1")
                    $("#main_right").attr("src", "SelGroup.aspx?Type=AllInfo#ReferUser");
                else
                    $("#main_right").attr("src", "SelGroup.aspx?Type=AllInfo#CCUser");
                var div_obj = $("#" + div_id);
                var h = (document.documentElement.offsetHeight - 800) / 2;
                var w = (document.documentElement.offsetWidth - 600) / 2;
                div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
                div_obj.focus();
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
                    $("#TxtInceptUser").val(uname);
                    $("#HiddenUser").val(uid);
                }
                if (select == "CCUser") {
                    $("#ccUserT").val(uname);
                    $("#HiddenCCUser").val(uid);
                }
                $("#div_share").hide("fast");
            }
            function hidediv() {
                $("#div_share").hide("fast");
            }
            function SendConfirm()
            {
                rece = $("#TxtInceptUser").val();
                if (rece == "") { alert('未选定收件人!'); return false;}
                title = $("#TxtTitle").val();
                if (title == "") { alert('邮件标题不能为空!'); return false; }
               
                if (confirm('确定要发送该邮件吗'))
                {
                    disBtn(this, 3000); return true;
                } else {
                    return false;
                }
            }
        </script>
        <style>
            .form-control {padding:5px; float:left; width:300px; height:22px; line-height:22px; border:1px solid #ccc; }
        </style>
    </form>
</body>
</html>
