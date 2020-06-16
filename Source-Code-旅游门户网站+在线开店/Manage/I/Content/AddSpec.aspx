<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_AddSpec, App_Web_pyrhy5wd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>专题列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
        <li><a href="#Tabs1" data-toggle="tab">专题选项</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="Tabs0">
            <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover">
                <tbody>
                    <tr align="center">
                        <td class="spacingtitle" colspan="2">
                            <asp:Label ID="LblTitle" runat="server" Text="添加专题" />
                        </td>
                    </tr>
                    <tr class="tdbg">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>所属专题类别：</strong>
                        </td>
                        <td>
                            <asp:Label ID="lblCate" runat="server" Text="Label"></asp:Label>
                            <asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>专题名称：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpecName" runat="server" class="form-control pull-left" style="max-width:200px;" OnTextChanged="TxtSpecName_TextChanged" AutoPostBack="true" Columns="30" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="tips" runat="server" ErrorMessage="专题不能为空!" ControlToValidate="TxtSpecName" Display="Dynamic" SetFocusOnError="True" />
                            <asp:HiddenField ID="HdnSpecID" Value="0" runat="server" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题标识名：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpecDir" class="form-control pull-left" style="max-width:200px;" runat="server" Columns="20" />
                            <span class="tips" style="color: Blue">注意，目录名只能是字母、数字、下划线组成，首字符不能是数字</span>
                                <asp:RequiredFieldValidator ID="ValrCateDir" CssClass="tips" runat="server" ErrorMessage="专题标识名不能为空!" ControlToValidate="TxtSpecDir" Display="Dynamic" SetFocusOnError="True" />
                        </td>
                    </tr>

                    <tr class="tdbg">
                        <td class="tdbgleft" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <strong>专题图片地址：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSpeacPic" class="form-control" style="max-width:300px;" runat="server" MaxLength="255" Columns="50" />
                        </td>
                    </tr>

                    <tr class="tdbg">
                        <td class="tdbgleft" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <strong>专题提示：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpeacTips" class="form-control" style="max-width:300px;" runat="server" Columns="60" Height="65px" Width="500px" Rows="2" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>专题说明：</strong></td>
                        <td>
                            <asp:TextBox ID="TxtSpecDesc" class="form-control" style="max-width:300px;" runat="server" Columns="50" Height="65px" Width="500px" Rows="5" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr class="tdbg">
                        <td class="tdbgleft" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <strong>专题META关键词:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpeacKeyword" class="form-control" style="max-width:300px;" runat="server" Height="65" Width="500" Columns="60" Rows="4" TextMode="MultiLine" />

                        </td>
                    </tr>
                    <tr class="tdbg">
                        <td class="tdbgleft" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <strong>专题META网页描述：
                
                            </strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtSpeacDescriptive" class="form-control" style="max-width:300px;" runat="server" Height="65" Width="500" Columns="60" Rows="4" TextMode="MultiLine" />
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
                            <strong>专题列表页扩展名：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLFileExt" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">.html</asp:ListItem>
                                <asp:ListItem Value="1">.htm</asp:ListItem>
                                <asp:ListItem Value="2">.shtml</asp:ListItem>
                                <asp:ListItem Value="3">.aspx</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>专题列表页文件名规则：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLListFileRule" runat="server">
                                <asp:ListItem Selected="True" Value="1">专题类别目录/专题目录/List_专题ID_PageIndex</asp:ListItem>
                                <asp:ListItem Value="2">专题类别目录/List/List_专题ID_PageIndex</asp:ListItem>
                                <asp:ListItem Value="3">Special/List_专题ID_PageIndex</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>专题列表页模板：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtListTemplate" class="form-control pull-left" style="max-width:300px;" runat="server" Columns="50"></asp:TextBox>
                            <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtListTemplate') + '&FilesDir=', 650, 480)" class="btn btn-primary" style="margin-left:5px;" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top: 8px;">
        <tr>
            <td align="center">&nbsp; &nbsp;
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" OnClick="EBtnSubmit_Click" runat="server" />&nbsp; &nbsp;
                <input name="Cancel" type="button" class="btn btn-primary" id="BtnCancel" value="取消" onclick="window.location.href = 'SpecialManage.aspx'" />
            </td>
        </tr>
    </table>
</asp:Content>