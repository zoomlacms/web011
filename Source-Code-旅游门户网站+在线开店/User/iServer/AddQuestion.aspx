<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="user_iServer_AddQuestion, App_Web_3febypik" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>�ύ����</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>�����ڵ�λ�ã�<a title="��վ��ҳ" href="/"><%= Call.SiteName%></a></li>
        <li><a title="��Ա����" href="/User/Default.aspx">��Ա����</a></li>
        <li><a href="FiServer.aspx">���ʱش�</a></li>
        <li class="active">�ύ����</li>
    </ol>
    <asp:HiddenField ID="OrderID" runat="server" />
    <table class="table table-bordered">
        <tr style="height: 25px; background-color: #fff;" valign="bottom">
            <td class="title" align="center">�ύ����
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
                                                    <td style="width: 100px">���ȼ�<span style="color: red">*</span>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="true">
                                                            <asp:ListItem Value="��">��</asp:ListItem>
                                                            <asp:ListItem Selected="True" Value="��">��</asp:ListItem>
                                                            <asp:ListItem Value="��">��</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>�������<span style="color: red">*</span></td>
                                                    <td>
                                                        <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" AutoPostBack="true">   
                                                            <asp:ListItem Selected="True" Value="��ѯ">��ѯ</asp:ListItem>
                                                            <asp:ListItem Value="Ͷ��">Ͷ��</asp:ListItem>
                                                            <asp:ListItem Value="����">����</asp:ListItem>
                                                            <asp:ListItem Value="Ҫ��">Ҫ��</asp:ListItem>
                                                            <asp:ListItem Value="����ʹ��">����ʹ��</asp:ListItem>
                                                            <asp:ListItem Value="bug����">bug����</asp:ListItem>
                                                            <asp:ListItem Value="����">����</asp:ListItem>
                                                            <asp:ListItem Value="����">����</asp:ListItem>
                                                            <asp:ListItem Value="����">����</asp:ListItem>
                                                            <asp:ListItem Value="����">����</asp:ListItem>
                                                            <asp:ListItem Value="�ʾ�">�ʾ�</asp:ListItem>
                                                            <asp:ListItem Value="DNS">DNS</asp:ListItem>
                                                            <asp:ListItem Value="MSSQL">MSSQL</asp:ListItem>
                                                            <asp:ListItem Value="MySQL">MySQL</asp:ListItem>
                                                            <asp:ListItem Value="IDC">IDC</asp:ListItem>
                                                            <asp:ListItem Value="��վ�ƹ�">��վ�ƹ�</asp:ListItem>
                                                            <asp:ListItem Value="��վ����">��վ����</asp:ListItem>
                                                            <asp:ListItem Value="����">����</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px">�������<span style="color: red">*</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" onblur="isNulltitle();"></asp:TextBox>
                                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>��������<span style="color: red">*</span>
                                                    </td>
                                                    <td id="iframeHtml">
                                                        <textarea runat="server" id="textarea1"  name="content" rows="4" style="width:100%; height: 300px;"
                                                            cols="40" onblur="isNullstr();"></textarea>
                                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" CssClass="ckeditor" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>����
                                                    </td>
                                                    <td>ֻ���ϴ�<span id="filetype" runat="server"></span> ���͵ĸ���,��������С�� 500KB
                                                    <br />
                                                        ����1:
                                                    <asp:FileUpload ID="FileUpload1" runat="server" onkeydown="event.returnValue=false;"
                                                        onpaste="return false" /><br />
                                                        ����2:
                                                    <asp:FileUpload ID="FileUpload2" runat="server" onkeydown="event.returnValue=false;"
                                                        onpaste="return false" /><br />
                                                        ����3:
                                                    <asp:FileUpload ID="FileUpload3" runat="server" onkeydown="event.returnValue=false;"
                                                        onpaste="return false" /><br />
                                                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <asp:Button ID="LinkButton1" runat="server" CssClass="btn btn-primary" OnClick="LinkButton1_Click"
                                                            Text="�ύ" />
                                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="ȡ��" OnClick="Button1_Click" CausesValidation="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div style="padding: 10px;">
                                                            ��ʾ��������ʹ��AddQuestion.aspx?title=222&con=content�ķ�������GET���ݡ�
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
                lbltitle.innerHTML = "�������������!!!";
                return;
            }
            else
                lbltitle.innerHTML = "";
        }

        function isNullstr() {
            var lblstr = document.getElementById("Label2");
            var str = document.getElementById("textarea1").value;
            if (str == "")
                lblstr.innerHTML = "��������������!!!"
            else
                lblstr.innerHTML = "";
        }
    </script>
</asp:Content>