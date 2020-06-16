<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_SpecBatchSet, App_Web_pyrhy5wd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>专题批量设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered">
        <tr align="center">
            <td colspan="2" class="spacingtitle">批量设置专题
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" style="width: 250px">
                <table>
                    <tr>
                        <td align="left">
                            <span style="color: Red">提示：</span>可以按住“Shift”<br />
                            或“Ctrl”键进行多个节点的选择
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:ListBox ID="LstSpec" runat="server" CssClass="form-control" DataTextField="SpecName" DataValueField="SpecID" SelectionMode="Multiple" Height="282px" Width="100%"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input id="BtnSelectAll" onclick="SelectAll()" type="button" class="btn btn-primary" value="选定所有专题" />
                            <input id="BtnCancelAll" onclick="UnSelectAll()" type="button" class="btn btn-primary" value="取消所有专题" />
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
                    <li><a href="#Tabs1" data-toggle="tab">专题选项</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="Tabs0">
                        <table width="100%" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered table-hover">
                            <tbody>
                                <tr>
                                    <td style="width: 30px; text-align: center" class="tdbgleft">
                                        <asp:CheckBox ID="ChkOpenType" runat="server" />
                                    </td>
                                    <td style="width: 200px; text-align: right" class="tdbgleft">
                                        <strong>打开方式：</strong>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RBLOpenType" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
                                            <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                    <div class="tab-pane" id="Tabs1">
                        <table width="100%" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered table-hover">
                            <tbody>
                                <tr class="tdbg">
                                    <td style="width: 30px; text-align: center" class="tdbgleft">
                                        <asp:CheckBox ID="ChkTemp" runat="server" />
                                    </td>
                                    <td style="width: 200px; text-align: right" class="tdbgleft">
                                        <strong>列表页模板：</strong>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TxtTemplate" class=" form-control pull-left" Style="max-width: 300px;" MaxLength="255" runat="server" Columns="50"></asp:TextBox>
                                        <input type="button" class="btn btn-primary" style="margin-left: 5px;" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtTemplate') + '&FilesDir=', 650, 480)" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <table width="100%" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered table-hover">
                    <tr class="tdbg">
                        <td colspan="3" class="tdbgleft">
                            <font color="blue">说明：</font>
                            <br />
                            1、若要批量修改某个属性的值，请先选中其左侧的复选框，然后再设定属性值。<br />
                            2、这里显示的属性值都是系统默认值，与所选节点的已有属性无关
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="center">
            <td colspan="2" class="tdbgleft">
                <asp:Button ID="EBtnBacthSet" class="btn btn-primary" Style="width: 110px;" Text="执行批处理" OnClick="EBtnBacthSet_Click" runat="server" />
                <asp:Button ID="BtnCancel" class="btn btn-primary" Style="width: 110px;" runat="server" Text="取消" OnClick="BtnCancel_Click" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        function SelectAll() {
            for (var i = 0; i < document.getElementById('<%=LstSpec.ClientID%>').length; i++) {
                document.getElementById('<%=LstSpec.ClientID%>').options[i].selected = true;
            }
        }
        function UnSelectAll() {
            for (var i = 0; i < document.getElementById('<%=LstSpec.ClientID%>').length; i++) {
                document.getElementById('<%=LstSpec.ClientID%>').options[i].selected = false;
            }
        }
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3");
        function ShowTabs(ID) {
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                document.getElementById(arrTabs[tID].toString()).style.display = "none";
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                tID = ID;
            }
        }
    </script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/Common.js"></script>
</asp:Content>