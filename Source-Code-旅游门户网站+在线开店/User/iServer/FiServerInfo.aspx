<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="manage_iServer_FiServerInfo, App_Web_3febypik" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>问题详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">有问必答</a></li>
        <li class="active">问题详情</li>
    </ol>
    <div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
        <table class="table table-bordered">
            <tr>
                <td colspan="2" class="text-center">问题详情</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblQuestionId" runat="server" Text="" Visible="false"></asp:Label>
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td width="100">标题</td>
                            <td>
                                <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="100">状态</td>
                            <td>
                                <asp:Label ID="lblState" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>优先级</td>
                            <td>
                                <asp:Label ID="lblPriority" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>提交来源</td>
                            <td>
                                <asp:Label ID="lblRoot" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td>问题类别</td>
                            <td>
                                <asp:Label ID="lblType" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td>提交时间</td>
                            <td>
                                <asp:Label ID="lblSubTime" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td>已读次数</td>
                            <td>
                                <asp:Label ID="lblReadCount" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td>解决时间</td>
                            <td>
                                <asp:Label ID="lblSolveTime" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td class="text-center">对话详情</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSubTime_R" runat="server" Text=""></asp:Label>
                                来自:<asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>标题:<asp:Label ID="lblTitle_R" runat="server" Text=""></asp:Label></b> [<a href="#reply">回复</a>][<a href="#top">返回页首</a>]
                            </td>
                        </tr>
                        <tr>
                            <td style="border: #CCC 1px solid;">
                                <asp:Label ID="lblConent" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><span id="spDiv" runat="server"></span>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:Repeater ID="resultsRepeater" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-striped table-hover">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="回复记录" ID="rep"></asp:Label>
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSubTime_R" runat="server" Text='<%# Eval("ReplyTime")%>'></asp:Label>
                                    来自:<asp:Label ID="lblName" runat="server" Text='<%# GetUserName(Eval("UserId","{0}"))%>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>[<a href="#reply">回复</a>] [<a href="#top">返回页首</a>]</td>
                            </tr>
                            <tr>
                                <td style="border: #CCC 1px solid;">
                                    <asp:Label ID="lblConent" runat="server" Text='<%# Eval("Content")%>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><%#GetFile(Eval("path","{0}")) %>  </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div id="replyDiv" runat="server">
                        <table class="table table-bordered table-striped table-hover">
                            <tr>
                                <td colspan="2" class="text-center">回复对话</td>
                            </tr>
                            <tr>
                                <td width="120">标题</td>
                                <td>
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Text="" Width="387px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>内容<font color="red">*</font></td>
                                <td>
                                    <textarea runat="server" id="textarea1" style="width:700px;min-height:500px;" name="content" rows="4" cols="40"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>附件
                                </td>
                                <td>只能上传<span id="spfiletype" runat="server"></span>类型的附件,单个附件小于3M<br />
                                    附件1:
                                <asp:FileUpload ID="FileUpload1" runat="server" onkeydown="event.returnValue=false;"
                                    onpaste="return false" /><br />
                                    附件2:
                                <asp:FileUpload ID="FileUpload2" runat="server" onkeydown="event.returnValue=false;"
                                    onpaste="return false" /><br />
                                    附件3:
                                <asp:FileUpload ID="FileUpload3" runat="server" onkeydown="event.returnValue=false;"
                                    onpaste="return false" /><br />
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="Button1" class="i_bottom" runat="server" Text="提交" OnClick="Button1_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/js/zh-CN/attachment.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">
        <%= Call.GetEditor("textarea1")%>
        function fn_CheckSupportTicket(theForm) {
            if (!fn_CheckRequired(theForm.content, "回复内容"))
                return false;
            return true;
        }
    </script>
</asp:Content>
