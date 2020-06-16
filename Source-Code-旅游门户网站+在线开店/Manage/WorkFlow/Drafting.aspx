<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Drafting, App_Web_rqir0mdb" validaterequest="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公文起草</title>
    <link href="/MIS/OA/CSS/ZLOA.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/JS/OAKeyWord.js"></script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="draftnav">
            <a href="/MIS/OA/Main.aspx">行政公文</a>/<a href="Drafting.aspx">公文起草</a>
        </div>
        <div style="padding-left: 10px; padding-right: 10px; min-width: 960px;">
            <table class="table_li table-border" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="8" class="trhead">公文起草</td>
                </tr>
                <tr>
                    <td class="text-right" style="width: 140px;">密 级：</td>
                    <td>
                        <asp:DropDownList ID="Secret" runat="server"></asp:DropDownList>
                    </td>
                    <td class="text-right" style="width: 120px;">紧急程度：</td>
                    <td>
                        <asp:DropDownList ID="Urgency" runat="server"></asp:DropDownList>
                    </td>
                    <td class="text-right" style="width: 100px;">重要程度：</td>
                    <td>
                        <asp:DropDownList ID="Importance" runat="server"></asp:DropDownList>
                    </td>
                    <td class="text-right">表格模板：</td>
                    <td>
                        <asp:DropDownList ID="Type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Type_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">标 题：</td>
                    <td colspan="3">
                        <asp:TextBox ID="Title" runat="server" CssClass="form-control" /><span class="required">*</span>
                        <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="Title" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="标题不能为空!" />
                    </td>
                    <td class="text-right">流程：</td>
                    <td>
                        <asp:DropDownList runat="server" ID="proDP" AutoPostBack="true" OnSelectedIndexChanged="proDP_SelectedIndexChanged">
                        </asp:DropDownList><span class="required">*</span>
                    </td>
                    <td class="text-right">预览</td>
                    <td>
                        <button type="button" name="" id="" onclick="disWin()" class="btn-primary">流程预览</button>
                        <%--<input type="button" value="公文预览" class="btn-primary" onclick="preView();"/>--%>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">主题词：</td>
                    <td colspan="5">
                        <div id="OAkeyword"></div>
                        <div class="clearfix"></div>
                        <asp:TextBox ID="Keywords" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td class="text-right">起草日期：</td>
                    <td>
                        <asp:TextBox ID="CreateTime" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="text-right">起草人：</td>
                    <td colspan="3">
                        <asp:DropDownList runat="server" ID="userDP"></asp:DropDownList>
                    </td>
                    <td class="text-right">起草部门：</td>
                    <td colspan="3">
                        <asp:DropDownList runat="server" ID="groupDP" AutoPostBack="true" OnSelectedIndexChanged="groupDP_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <div style="width: 815px; margin: auto">
                            <asp:TextBox ID="Content" name="Content" TextMode="MultiLine" Width="100%" Height="370px" runat="server" ClientIDMode="Static"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr id="hasFileTR" runat="server" visible="true">
                    <td class="text-right">已上传文件：<asp:HiddenField runat="server" ID="hasFileData" ClientIDMode="Static" />
                    </td>
                    <td colspan="7" id="hasFileTD" runat="server"></td>
                </tr>
                <tr id="signTr" runat="server" style="display: none;">
                    <td class="text-right">签章：</td>
                    <td colspan="7">
                        <asp:RadioButtonList runat="server" ID="signRadio" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                        <span runat="server" id="signTrRemind" visible="false">你尚未配置个人签章</span>
                    </td>
                </tr>
                <tr runat="server" visible="false" id="upFileTR">
                    <td style="text-align: center;">
                        <input type="button" class="btn btn-primary" value="添加" onclick="addAttach();" />
                    </td>
                    <td colspan="7">
                        <table id="attachTB">
                            <tr>
                                <td>
                                    <input type="file" name="fileUP" class="fileUP" /><input type="button" value="删除" onclick="delAttach(this);" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="text-right">操作</td>
                    <td colspan="7">
                        <asp:Button runat="server" CssClass="btn-primary" ID="saveBtn" Text="发布" OnClick="saveBtn_Click" />
                        <asp:Button runat="server" CssClass="btn-primary" ID="AddNewBtn" Text="添加为新公文" OnClick="AddNewBtn_Click" Style="margin-left: 10px;" />
                        <asp:Button runat="server" CssClass="btn-primary" ID="DraftBtn" Text="草稿" OnClick="DraftBtn_Click" Style="margin-left: 10px;" />
                        <asp:Button runat="server" CssClass="btn-primary" ID="clearBtn" Text="重置" OnClick="clearBtn_Click" Style="margin-left: 10px;" />
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            var uptr = '<tr><td><input type="file" name="fileUP" class="fileUP" /><input type="button" value="删除" onclick="delAttach(this);" /></td></tr>';
            var id = '<%= Request.QueryString["appID"]%>';
            if (id != "") {
                var keys = "<%=key%>";
                if (keys != "") {
                    keys = keys.split(',');
                    for (var i = 0; i < keys.length; i++) {
                        $("#OAkeyword").append("<span name='tab' class='radius'>" + keys[i] + "<a class='deltab' onclick='closediv(this)'>×</a></span>")
                    }
                }
            }
            function addAttach()
            {
                $("#attachTB").append(uptr);
            }
            function delAttach(obj)
            {
                $(obj).parent().remove();
            }
            function delHasFile(v, obj) {
                rv = $("#hasFileData").val().replace(v, "");
                $("#hasFileData").val(rv)
                $(obj).parent().remove();
            }
            function preView() {
                var winname = window.open('', "_blank", '');
                winname.document.open('text/html', 'replace');
                winname.opener = null;
                winname.document.write($("#Content").val());
                winname.document.close();
            }
            var editor;
            setTimeout(function () { editor = UE.getEditor('Content'); }, 300);
            function disWin() {
                var iTop = (window.screen.availHeight - 30 - 550) / 2;
                var iLeft = (window.screen.availWidth - 10 - 960) / 2;
                var myWin = window.open('/Mis/OA/PreViewProg.aspx?proID=<%=proDP.SelectedValue%>', 'newwindow', 'height=550, width=960,top=' + iTop + ',left=' + iLeft + ',toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
            }
            $(function () {
                $("#OAkeyword").tabControl({ maxTabCount: 20, tabW: 80 });
                $("#saveBtn").click(function () {
                    var v = $("#OAkeyword").getTabVals();
                    $("#Keywords").val(v.join(","));
                });
                $("#AddNewBtn").click(function () {
                    var v = $("#OAkeyword").getTabVals();
                    $("#Keywords").val(v.join(","));
                });
                $("#DraftBtn").click(function () {
                    var v = $("#OAkeyword").getTabVals();
                    $("#Keywords").val(v.join(","));
                });
            });
            function closediv(obj) {
                if (confirm("确定删除该标签？")) {
                    $(obj).parent().remove();
                }
            }
        </script>
    </form>
</body>
</html>
