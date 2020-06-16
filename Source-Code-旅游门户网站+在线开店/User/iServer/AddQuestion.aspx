<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="user_iServer_AddQuestion, App_Web_3febypik" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>提交问题</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="FiServer.aspx">有问必答</a></li>
        <li class="active">提交问题</li>
    </ol>
    <asp:HiddenField ID="OrderID" runat="server" />
    <table class="table table-bordered">
        <tr style="height: 25px; background-color: #fff;" valign="bottom">
            <td class="title" align="center">提交问题
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" style="width: 100%">
                <div id="viewPanel">
                    <table style="width:100%;">
                        <tr>
                            <td style="width:100%;">
                                <table style="width:100%;">
                                    <tr>
                                        <td colspan="2">
                                            <input type="hidden" name="module" value="mysupport_supportticketadd" />
                                            <input type="hidden" name="dosupportticketadd" value="" />
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <td style="width: 100px">优先级<span style="color: red">*</span>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="true">
                                                            <asp:ListItem Value="低">低</asp:ListItem>
                                                            <asp:ListItem Selected="True" Value="中">中</asp:ListItem>
                                                            <asp:ListItem Value="高">高</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>问题类别<span style="color: red">*</span></td>
                                                    <td>
                                                        <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" AutoPostBack="true">   
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
                                                    <td style="width: 100px">问题标题<span style="color: red">*</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" onblur="isNulltitle();"></asp:TextBox>
                                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>问题内容<span style="color: red">*</span>
                                                    </td>
                                                    <td id="iframeHtml">
                                                        <textarea runat="server" id="textarea1"  name="content" rows="4" style="width:100%; height: 300px;"
                                                            cols="40" onblur="isNullstr();"></textarea>
                                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" CssClass="ckeditor" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>附件
                                                    </td>
                                                    <td>只能上传<span id="filetype" runat="server"></span> 类型的附件,单个附件小于 500KB
                                                    <br />
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
                                                    <td colspan="2" align="center">
                                                        <asp:Button ID="LinkButton1" runat="server" CssClass="btn btn-primary" OnClick="LinkButton1_Click"
                                                            Text="提交" />
                                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="取消" OnClick="Button1_Click" CausesValidation="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div style="padding: 10px;">
                                                            提示：您可以使用AddQuestion.aspx?title=222&con=content的方法进行GET传递。
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        <%= Call.GetEditor("textarea1","'fullscreen', 'source', '|', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch','autotypeset','blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|', 'rowspacingtop', 'rowspacingbottom', 'lineheight', '|','customstyle', 'paragraph', 'fontfamily', 'fontsize', '|', 'directionalityltr', 'directionalityrtl', 'indent', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|', 'link', 'unlink', 'anchor', '|', 'template', 'horizontal', 'date', 'time', '|', 'spechars', 'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', '|', 'print', 'preview', 'searchreplace', '|', 'help'")%>
    </script>
    <script type="text/javascript">
        function isNulltitle() {
            var lbltitle = document.getElementById("Label1");
            var title = document.getElementById("TextBox1").value;
            if (title == "") {
                lbltitle.innerHTML = "请输入问题标题!!!";
                return;
            }
            else
                lbltitle.innerHTML = "";
        }

        function isNullstr() {
            var lblstr = document.getElementById("Label2");
            var str = document.getElementById("textarea1").value;
            if (str == "")
                lblstr.innerHTML = "请输入问题内容!!!"
            else
                lblstr.innerHTML = "";
        }
    </script>
</asp:Content>