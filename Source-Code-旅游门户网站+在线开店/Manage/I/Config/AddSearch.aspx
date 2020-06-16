<%@ page language="C#" autoeventwireup="true" inherits="manage_Search_AddSearch, App_Web_bnkjraqn" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>新增导航</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField ID="hideid" runat="server" />
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered table-hover">
        <tr>
            <td class="spacingtitle" colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="添加搜索信息"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td valign="top" style="margin-top: 0px; margin-left: 0px;">
                <table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover" style="margin: 0;">
                    <tbody id="Tabs0">
                        <tr>
                            <td style="width: 100px;">
                                <strong>功能名称：</strong>
                            </td>
                            <td style="height: 26px;">
                                <asp:TextBox ID="txtName" Width="300" runat="server" class="form-control"></asp:TextBox>*方便记忆的名称
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="名称不能为空！" Display="Dynamic" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                <br />
                                <span runat="server" id="Span1"></span>
                            </td>
                        </tr>
                    </tbody>
                    <tbody id="Tabs1">
                        <tr>
                            <td>
                                <strong>文件路径：</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFileUrl" Width="300" runat="server" class="form-control"></asp:TextBox>
                                *您可以直接填入系统内文件名,以便后台访问,如[/manage/Config/SiteInfo.aspx]为系统配置,或输入外部网址提交</td>
                        </tr>
                        <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this,className='tdbg'">
                            <td>
                                <strong>图标地址：</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" Width="300" runat="server" style="display:inline;" CssClass="form-control"></asp:TextBox>
                                <span id="imgIcon"></span>
                                <input type="button" class="btn btn-primary" onclick="ShowIcon()" value="选择图标" />
                                
                                <!-- /.modal -->
                                <!-- /.modal -->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>打开方式：</strong>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdoOpenType" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
                                    <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>支持移动：</strong>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SupportMobile" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="1">支持</asp:ListItem>
                                    <asp:ListItem Value="0">不支持</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>块大小：</strong>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="MotroSize" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="3">大</asp:ListItem>
                                    <asp:ListItem Value="2">中</asp:ListItem>
                                    <asp:ListItem Value="1">小</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td class="text-center" colspan="2">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="添加导航" runat="server" OnClick="EBtnSubmit_Click" />
                <input type="button" class="btn btn-primary" name="Button2" value="返回列表" onclick="location.href = 'SearchFunc.aspx'" id="Button2" />
            </td>
        </tr>
    </table>
    <div id="icons" style="display:none"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script src="/JS/Controls/ZL_Dialog.js" type="text/javascript"></script>
    <script>
        function sureglyphicon()
        {
            var ico = $("input[type=radio][name=glyphicon]:checked");
            $("#TextBox1").val(ico.val());
        }
        var diag = new ZL_Dialog();
        function ShowIcon() {  
            diag.title = "选择图标";
            diag.ajaxurl = "/Common/icon.html";
            diag.ShowModal();
        }
        
        function LoadIcon() {
            $("[name=glyphicon]").click(function () {
                $("#TextBox1").val($(this).prev().text());
                $("#imgIcon").attr("class", $(this).prev().text());
                diag.CloseModal();
            });
        }
        var diag = new ZL_Dialog();
        $().ready(function () {
            $("#imgIcon").attr("class", $("#TextBox1").val());
            //$("input[type=radio][name=glyphicon]").each(function () {
            //    $(this).attr("data-dismiss", "modal");
            //})
            //$("input[type=radio][name=glyphicon]").change(function () {
            //    $("#TextBox1").val($(this).val());
            //})
        })
    </script>
    <style>
        .glyphicon-text{font-size:12px;}
        .glyphicon-class .glyphicon{ font-size:24px;}
        #myModal .table td{ vertical-align:top;}
    </style>
</asp:Content>
