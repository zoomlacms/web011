<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_AddSpecCate, App_Web_pyrhy5wd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加专题类别</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
        <li><a href="#Tabs1" data-toggle="tab">专题选项</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="Tabs0">
            <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>专题类别名：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpecCateName" class="form-control pull-left" Style="max-width: 200px;" runat="server" AutoPostBack="True" OnTextChanged="TxtSpecCateName_TextChanged" />
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="专题类别不能为空!" ControlToValidate="TxtSpecCateName" Display="Dynamic" SetFocusOnError="True" />
                            <asp:HiddenField ID="HdnSpecCateID" Value="0" runat="server" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题类别目录：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpecCateDir" class="form-control pull-left" Style="max-width: 200px;" runat="server" /><asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="ValrCateDir" runat="server" ErrorMessage="专题类别目录不能为空!" ControlToValidate="TxtSpecCateDir" Display="Dynamic" SetFocusOnError="True" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题图片地址：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSpecCatePic" class="form-control" Style="max-width: 300px;" runat="server" MaxLength="255" Columns="50" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题提示：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpecCateTips" class="form-control" Style="max-width: 300px;" runat="server" Columns="60" Height="65px" Width="500px" Rows="2" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题类别说明：</strong>
                        </td>
                        <td class="tdbg">
                            <asp:TextBox ID="TxtSpecCateDesc" class="form-control" Style="max-width: 300px;" runat="server" Columns="50" Height="65px" Width="500px" Rows="5" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题META关键词:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpecCateKeyword" class="form-control" Style="max-width: 300px;" runat="server" Height="65" Width="500" Columns="60" Rows="4" TextMode="MultiLine" />

                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题META网页描述：
			
                            </strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpecCateDescriptive" class="form-control" Style="max-width: 300px;" runat="server" Height="65" Width="500" Columns="60"
                                Rows="4" TextMode="MultiLine" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs1">
            <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr class="tdbg">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>打开方式：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLOpenType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
                                <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>专题类别列表页扩展名：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLFileExt" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">.html</asp:ListItem>
                                <asp:ListItem Value="1">.htm</asp:ListItem>
                                <asp:ListItem Value="2">.shtml</asp:ListItem>
                                <asp:ListItem Selected="True" Value="3">.aspx</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>专题类别列表页模板：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtListTemplate" class="form-control pull-left" Style="max-width: 300px;" runat="server" Columns="50"></asp:TextBox>
                            <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtListTemplate') + '&FilesDir=', 650, 480)" class="btn btn-primary" style="margin-left: 5px;" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" style="height: 38px">&nbsp; &nbsp;
			<asp:Button ID="EBtnSubmit" Text="保存" class="btn btn-primary" OnClick="EBtnSubmit_Click" runat="server" />
                <input name="Cancel" type="button" class="btn btn-primary" id="BtnCancel" value="取消" onclick="window.location.href = 'SpecialManage.aspx'" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>