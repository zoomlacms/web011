<%@ page language="C#" autoeventwireup="true" inherits="manage_iServer_BiServerInfo, App_Web_2sdpagom" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问题详情</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation">后台管理&gt;&gt;<a href="BiServer.aspx">有问必答</a>&gt;&gt;<span>问题详情</div>
    <asp:Label ID="lblQuestionId" runat="server" Text="" Visible="false"></asp:Label>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>会员登录账号</td>
            <td>
                <span id="lblUserName" runat="server"></span>
                <asp:HiddenField ID="hfusername" runat="server" />
            </td>
        </tr>
        <tr>
            <td>状态<font color="red">*</font></td>
            <td>
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="False">
                    <asp:ListItem Value="未解决">未解决</asp:ListItem>
                    <asp:ListItem Value="处理中">处理中</asp:ListItem>
                    <asp:ListItem Value="已解决">已解决</asp:ListItem>
                    <asp:ListItem Value="已锁定">已锁定</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>优先级<font color="red">*</font></td>
            <td>
                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" AutoPostBack="False">
                    <asp:ListItem Value="低">低</asp:ListItem>
                    <asp:ListItem Value="中">中</asp:ListItem>
                    <asp:ListItem Value="高">高</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>提交来源<font color="red">*</font></td>
            <td>
                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" AutoPostBack="False">
                    <asp:ListItem Value="电话">电话</asp:ListItem>
                    <asp:ListItem Value="E-mai">E-mail</asp:ListItem>
                    <asp:ListItem Value="网页表单">网页表单</asp:ListItem>
                    <asp:ListItem Value="直接面谈">直接面谈</asp:ListItem>
                    <asp:ListItem Value="其它">其它</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>问题类别<font color="red">*</font></td>
            <td>
                <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server" AutoPostBack="false">                    
                    <asp:ListItem Selected="True" Value="咨询">咨询</asp:ListItem>
                    <asp:ListItem Value="投诉">投诉</asp:ListItem>
                    <asp:ListItem Value="建议">建议</asp:ListItem>
                    <asp:ListItem Value="要求">要求</asp:ListItem>
                    <asp:ListItem Value="界面使用">界面使用</asp:ListItem>
                    <asp:ListItem Value="bug报告">bug报告</asp:ListItem>
                    <asp:ListItem Value="订单">订单</asp:ListItem>
                    <asp:ListItem Value="财务">财务</asp:ListItem>
                    <asp:ListItem Value="域名">域名</asp:ListItem>
                    <asp:ListItem Value="主机">主机</asp:ListItem>
                    <asp:ListItem Value="邮局">邮局</asp:ListItem>
                    <asp:ListItem Value="DNS">DNS</asp:ListItem>
                    <asp:ListItem Value="MSSQL">MSSQL</asp:ListItem>
                    <asp:ListItem Value="MySQL">MySQL</asp:ListItem>
                    <asp:ListItem Value="IDC">IDC</asp:ListItem>
                    <asp:ListItem Value="网站推广">网站推广</asp:ListItem>
                    <asp:ListItem Value="网站制作">网站制作</asp:ListItem>
                    <asp:ListItem Value="其它">其它</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>提交时间</td>
            <td>
                <asp:Label ID="lblSubTime" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>已读次数</td>
            <td>
                <asp:Label ID="lblReadCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>解决时间</td>
            <td>
                <asp:Label ID="lblSolveTime" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>附注（内部使用）</td>
            <td>
                <textarea class="form-control" name="comments" c rows="4" cols="40"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="Button2" runat="server" Text="更新" CssClass="btn btn-primary" OnClick="Button2_Click" />
            </td>
        </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="title">最近的 5 条处理日志 </td>
        </tr>

        <tr>
            <td width="200px">
                <asp:Label ID="lblSubTime_V" runat="server" Text=""></asp:Label></td>
            <td>
                <asp:Label ID="lblUserName_V" runat="server" Text=""></asp:Label>提交了新问题</td>
        </tr>

    </table>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="title">对话详情</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSubTime_R" runat="server" Text=""></asp:Label>
                来自:<asp:Label ID="lblName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td><b>标题:<asp:Label ID="lblTitle_R" runat="server" Text=""></asp:Label></b> [<a href="#reply">回复</a>] [<a href="#top">返回页首</a>]</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblConent" runat="server" Text=""></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td><span id="spDIv" runat="server"></span>
                <br />
            </td>
        </tr>
    </table>
    <asp:Repeater ID="resultsRepeater" runat="server">
        <HeaderTemplate>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td class="title">回复记录</td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="tdbgmouseover">
                    <asp:Label ID="lblSubTime_R" runat="server" Text='<%# Eval("ReplyTime")%>'></asp:Label>
                    来自:<asp:Label ID="lblName" runat="server" Text='<%# GetUserName(Eval("UserId","{0}"))%>'></asp:Label></td>
            </tr>
            <tr>
                <td>[<a href="#reply">回复</a>] [<a href="#top">返回页首</a>]</td>
            </tr>
            <tr>
                <td style="border: #CCC 1px solid;">
                    <asp:Label ID="lblConent" runat="server" Text='<%# Eval("Content")%>'></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td><%#GetFile(Eval("path", "{0}"),Eval("questionId","{0}"))%></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center"><b>回复对话</b></td>
        </tr>
        <tr>
            <td style="min-width:150px;">标题</td>
            <td>
                <input type="text" name="title" runat="server" id="txtTitle" size="40" maxlength="100" class="form-control" value="" /></td>
        </tr>
        <tr>
            <td>内容<font color="red">*</font></td>
            <td>
                <textarea runat="server" id="textarea1" style="width: 700px; height: 300px;"  cols="20" rows="2"></textarea>
            </td>
        </tr>
        <tr>
            <td>附件</td>
            <td>只能上传<span id="sptype" runat="server"></span>类型的附件,单个附件小于 500KB
                <br />
                附件1:
                        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" onkeydown="event.returnValue=false;"
                            onpaste="return false" /><br />
                附件2:
                        <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" onkeydown="event.returnValue=false;"
                            onpaste="return false" /><br />
                附件3:
                        <asp:FileUpload ID="FileUpload3" runat="server" class="form-control" onkeydown="event.returnValue=false;"
                            onpaste="return false" /><br />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>E-mail回复</td>
            <td>
                <asp:CheckBox ID="IsEmail" Checked="true" runat="server" />
                <span id="IsEmailcont">是否发送邮件回复给：<input type="text" runat="server" id="UserEmail" class="form-control" name="reply_to" value="" /></span>
            </td>
        </tr>
    </table>
    <input type="hidden" name="greeting_name" value="" />
    <asp:Button ID="Button1" runat="server" Text="确认" CssClass="btn btn-primary" OnClick="Button1_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/zh-CN/attachment.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript">
        <%= Call.GetEditor("textarea1")%>
        function fn_CheckSupportTicket(theForm) {
            if (!fn_CheckRequired(theForm.content, "回复内容"))
                return false;
            return true;
        }
        function opentitle(url, title) {
            var diag = new Dialog();
            diag.Width = 600;
            diag.Height = 400;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        }


    </script>
</asp:Content>
