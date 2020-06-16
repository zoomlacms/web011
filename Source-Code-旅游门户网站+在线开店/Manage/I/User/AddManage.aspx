<%@ page language="C#" autoeventwireup="true" inherits="ZoomLaManage.WebSite.Manage.User.AddManage, App_Web_2wb0azx5" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑管理员</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#home" role="tab" data-toggle="tab">基本信息</a></li>
        <li><a href="#profile" role="tab" data-toggle="tab">角色设置</a></li>
        <li><a href="#messages" role="tab" data-toggle="tab">审核权限</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content" >
        <div class="tab-pane active" id="home">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td align="center" colspan="2" dir="ltr" valign="middle">
                        <asp:Label ID="lbTitle" runat="server" Text="添加管理员"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width:20%" class="text-right"><strong>管理员名：</strong></td>
                    <td>
                        <asp:TextBox ID="tbdName" Style="width: auto" CssClass="form-control" onkeydown="return GetEnterCode('focus','txtAdminTrueName');" runat="server"></asp:TextBox>
                        <span style="padding: 5px;">管理员名必须大于等于2个字符并且不能超过20个字符</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="管理员名不能为空" ControlToValidate="tbdName" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbdName" ErrorMessage="不能包含特殊字符，如@，#，$，%，^，&，*，(，)，'，?，{，}，[，]，;，:等" ValidationExpression="^[^@#$%^&*()'?{}\[\];:]*$" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbdName" ErrorMessage="管理员名必须大于等于2个字符并且不能超过20个字符!" ValidationExpression="\S{2,20}$" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>真实姓名：</strong></td>
                    <td>
                        <asp:TextBox ID="txtAdminTrueName" onkeydown="return GetEnterCode('focus','tbPwd');" runat="server" class="form-control pull-left" Style="width: auto"></asp:TextBox>
                        <span class="pull-left" style="padding: 5px;">真实姓名必须大于等于2个字符并且不能超过20个字符</span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="真实姓名不能为空" ControlToValidate="txtAdminTrueName" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtAdminTrueName" ErrorMessage="不能包含特殊字符，如@，#，$，%，^，&，*，(，)，'，?，{，}，[，]，;，:等" ValidationExpression="^[^@#$%^&*()'?{}\[\];:]*$" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtAdminTrueName" ErrorMessage="真实姓名必须大于等于2个字符并且不能超过20个字符！" ValidationExpression="\S{2,20}$" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>新密码：</strong></td>
                    <td>
                        <asp:TextBox ID="tbPwd" onkeydown="return GetEnterCode('focus','tbPwd1');" class="form-control pull-left" runat="server" TextMode="Password" Style="width: auto"></asp:TextBox>
                          <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="tbPwd1" ControlToValidate="tbPwd" ErrorMessage="密码与初始密码不一致"></asp:CompareValidator>
                        <span class="pull-left" style="padding: 5px;">管理员密码字符数要在6-18之间</span>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbPwd" ErrorMessage="管理员密码字符数要在6-18之间！" ValidationExpression="\S{6,18}" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                      
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>确认密码：</strong></td>
                    <td>
                        <asp:TextBox ID="tbPwd1" runat="server" onkeydown="return GetEnterCode('focus','cb1');" TextMode="Password" class="form-control pull-left" Style="width: auto"></asp:TextBox>
                           <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbPwd" ControlToValidate="tbPwd1" ErrorMessage="密码与初始密码不一致"></asp:CompareValidator>
                        <span class="pull-left" style="padding: 5px;">确认密码必须与密码保持一致</span>
                        <asp:HiddenField ID="HdnPwd" runat="server" />
                     </td>
                </tr>
                 <tr>
                    <td class="text-right"><strong>二级密码：</strong></td>
                    <td>
                        <input runat="server" type="text" id="Spwd_T" class="form-control pull-left" style="width:auto;" />
						<span class="pull-left" style="padding: 5px;">开发中心等增进功能需要验证此密码，初始为123456</span>
                     </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>所属组织：</strong></td>
                    <td class="bqright" onmouseover="this.className='tdbgmouseover'">
                        <asp:TextBox ID="txtNode" CssClass="form-control"  runat="server" Enabled="false" Text="组织结构"></asp:TextBox>
                        <input id="Button3" type="button"  value="更改组织" onclick="AddNode('link')" class="btn btn-primary" style="width: auto" />
                        <table cellpadding="0" cellspacing="0" id="NondeTable" border="0"></table>
                        <asp:HiddenField ID="hfNode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="text-right"><strong>选项设置：</strong></td>
                    <td>
                        <asp:CheckBox ID="cb1" Checked="true"  onkeydown="return GetEnterCode('focus','cb2');" runat="server" />
                        允许多人同时使用此帐号登陆<br />
                        <asp:CheckBox ID="cb2" Checked="true"  onkeydown="return GetEnterCode('focus','cb3');" runat="server" />
                        允许管理员修改密码<br />
                        <asp:CheckBox ID="cb3"  onkeydown="return GetEnterCode('focus','cb4');" runat="server" />
                        是否锁定<br />
                        <asp:CheckBox ID="cb4"  onkeydown="return GetEnterCode('focus','adduser');" runat="server" />
                        是否启用个性桌面</td>
                </tr>
                <tr id="showmenu" runat="server">
                    <td class="title" colspan="2">
                        <input id="adduser" runat="server" type="checkbox" onclick="hideAdmin()" onkeydown="return GetEnterCode('focus','tbQuestion');" checked="checked" /><label for="adduser">添加同名用户</label>
                    </td>
                </tr>
                <tbody runat="server" id="SameNameDiv">
                    <tr id="Tr1">
                        <td align="right">提示问题： </td>
                        <td>
                            <asp:TextBox ID="tbQuestion" onkeydown="return GetEnterCode('focus','tbAnswer');" runat="server" Style="max-width: 220px" class="form-control pull-left"></asp:TextBox>
                            <span style="color: red; float: left; padding-top: 8px;">*</span>
                        
                        </td>
                    </tr>
                    <tr id="Tr2">
                        <td align="right">提示问题答案： </td>
                        <td>
                            <asp:TextBox ID="tbAnswer" onkeydown="return GetEnterCode('focus','tbEmail');"  runat="server" Style="max-width: 220px" class="form-control pull-left"></asp:TextBox>
                            <span style="color: red; float: left; padding-top: 8px;">*</span>
                        
                    </tr>
                    <tr id="viewmail">
                        <td align="right">Email： </td>
                        <td>
                            <asp:TextBox ID="tbEmail" runat="server" onkeydown="return GetEnterCode('focus','btnSubmit');" Style="max-width: 220px" class="form-control pull-left"></asp:TextBox>
                            <span style="color: red; float: left; padding-top: 8px;">*</span>
                        
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="profile">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td style="width: 200px;"><strong>管理员角色设置：</strong></td>
                    <td valign="top">
                        <asp:CheckBoxList ID="cblRoleList"  runat="server" DataTextField="RoleName" DataValueField="RoleID" /></td>
                </tr>
            </table>
        </div>
        <div class="tab-pane" id="messages">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td style="width: 200px;"><strong>是否前台审核互动：</strong></td>
                    <td valign="top">
                        <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                </tr>
                <tr>
                    <td><strong>发布内容默认状态：</strong></td>
                    <td valign="top">
                        <asp:DropDownList ID="DefaultStart"  class="form-control" Style="width: auto" runat="server">
                            <asp:ListItem Value="-99">请选择状态</asp:ListItem>
                            <asp:ListItem Value="99" Selected="True">已审</asp:ListItem>
                            <asp:ListItem Value="0">待审</asp:ListItem>
                            <asp:ListItem Value="-1">退稿</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="保存" />
            <asp:Button ID="btnCancel" class="btn btn-primary" runat="server" Text="取消" OnClientClick="location.href='AdminManage.aspx';return false;" />
        </div>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Drag.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script>
        function hideAdmin() {
            if(event.srcElement.checked)
            {
                $("#SameNameDiv").show();
            }
            else $("#SameNameDiv").hide();
        }
        window.onload = function () {
            if (document.getElementById('<%=txtNode.ClientID%>') != null) {
                $('#tbdName').focus();

                var str = window.document.getElementById('<%=hfNode.ClientID%>').value;
                var strarr = str.split(",");
                var s = ""; //alert(str);
                if (strarr.length > 0) {
                    if (strarr[0].indexOf('|') > -1) {
                        var sa = strarr[0].split("|");
                        if (sa.length > 2) {
                            s += sa[0] + ",";
                            var xx = sa[1];
                            if (xx != "") {
                                window.document.getElementById('<%=txtNode.ClientID%>').value = sa[1].replace("&gt;&gt;", ">>");
                            }
                            for (var ii = 0; ii < strarr.length; ii++) {
                                if (ii > 0) {
                                    if (strarr[ii] != "") {
                                        var sarr = strarr[ii].split("|");
                                        AddNodeRow(sarr[1], sarr[0]);
                                        s += sarr[0] + ",";
                                    }
                                }
                            }
                        }
                    }
                }
                window.document.getElementById('<%=hfNode.ClientID%>').value = s;
            }
        }
        //主节点
        function ShowNode(nodename, checks, nodeid) {
            var Nodeval = document.getElementById("<%=txtNode.ClientID%>").value;

            if (checks == true) {
                if (Nodeval == '组织结构') {
                    document.getElementById("<%=txtNode.ClientID%>").value = nodename;
                    document.getElementById("<%=hfNode.ClientID%>").value = nodeid;

                }
                else {
                    document.getElementById("<%=txtNode.ClientID%>").value = document.getElementById("<%=txtNode.ClientID%>").value + " " + nodename;
                    document.getElementById("<%=hfNode.ClientID%>").value = document.getElementById("<%=hfNode.ClientID%>").value + "," + nodeid;

                }

            }
            else {
                document.getElementById("<%=txtNode.ClientID%>").value = document.getElementById("<%=txtNode.ClientID%>").value.replace(" " + nodename, "");
                document.getElementById("<%=hfNode.ClientID%>").value = document.getElementById("<%=hfNode.ClientID%>").value.replace("," + nodeid, "");
            }

        }
        //添加节点
        function AddNode(type) {
            var nid = document.getElementById("<%=hfNode.ClientID%>").value;
            window.open('../../Common/StructTree.aspx?nid=' + nid + '&type=' + type + '', 'newWin', 'modal=yes,width=400,height=300,resizable=yes,scrollbars=yes');
        }
    </script>
</asp:Content>
