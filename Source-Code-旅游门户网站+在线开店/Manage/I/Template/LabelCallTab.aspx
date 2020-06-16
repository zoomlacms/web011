<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_LabelCallTab, App_Web_5nkxzgmd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
    <link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
    <script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
    <script src="/Plugins/CodeMirror/mode/xml.js"></script>
    <script src="/Plugins/CodeMirror/mode/javascript/javascript.js"></script>
    <script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
    <script src="/Plugins/CodeMirror/addon/edit/matchbrackets.js"></script>
    <script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>
    <title>标签助手</title>
    <style>
        .modal-sm{width:450px;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered" >
        <tr>
            <td align="left" style="height: 410px;min-width: 377px;width:377px;vertical-align:top;">
                <div id="Tab1_header">
                    <ul class="nav nav-tabs" id="myTab">
                        <li class="active" onclick="ShowTabs(this);" tab="Tabs0"><a href="javascript:;">自定标签</a></li>
                        <li onclick="ShowTabs(this);" tab="Tabs1" style="cursor:pointer;"><a href="javascript:;">字段标签</a></li>
                        <li onclick="ShowTabs(this);" tab="Tabs2" style="cursor:pointer;"><a href="javascript:;">系统标签</a></li>
                        <li onclick="ShowTabs(this);" tab="Tabs3" style="cursor:pointer;"><a href="javascript:;">扩展函数</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="Tabs0" runat="server">
                            <table class="table table-striped table-bordered">
                            <tbody>
                                    <tr align="center">
                                        <td style="vertical-align:top;">
                                            <asp:DropDownList ID="DDLCate" runat="server" OnSelectedIndexChanged="ChangeCate" AutoPostBack="true"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td style="vertical-align:top;">
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="LblLabel" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <table runat="server" visible="false" enableviewstate="false">
                        <tr align="center" style="vertical-align:top;">
                            <td id="TabTitle0" runat="server" class="titlemouseover" onclick="ShowTabs(0)">自定标签
                            </td>
                            <td id="TabTitle1" runat="server" class="tabtitle" onclick="ShowTabs(1)">数据字段
                            </td>
                            <td id="TabTitle2" class="tabtitle" onclick="ShowTabs(2)">系统标签
                            </td>
                            <td id="TabTitle3" class="tabtitle" onclick="ShowTabs(3)">扩展函数
                            </td>
                            <td>&nbsp;
                                
                            </td>
                        </tr>
                    </table>

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                          <table class="table table-striped table-bordered">
                                <tbody id="Tabs4" class="tab-pane" runat="server"></tbody>
                                <tbody id="Tabs1" class="tab-pane" runat="server" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <asp:DropDownList ID="DDLField" runat="server" OnSelectedIndexChanged="ChangeSourceField"
                                                AutoPostBack="true">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="LblSourceField" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="Tabs2" class="tab-pane" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="lblSys" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="Tabs3" class="tab-pane" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="lblFun" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
            <td>
                <iframe style="height: 30px; width: 530px; z-index: -1;" frameborder="0" name="I1" id="I1" scrolling="no" src="/manage/Template/label.htm"></iframe>
                <div id="Textarea">
                    <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control" ID="textContent" Style="max-width: 100%; height: 530px;" Width="100%" Height="435px"></asp:TextBox>
                </div>
            </td>
        </tr>
    </table>
     <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/Plugins/CodeMirror/LabelCall.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript">
        //--------------
        function ShowTabs(obj)
        {
            $(obj).siblings("li[tab]").each(function () { $(this).removeClass("active"); id = $(this).attr("tab"); $("#" + id).hide(); });
            var sid = $(obj).attr("tab");
            $(obj).addClass("active");
            $("#" + sid).show();
        }
        var diag = new ZL_Dialog();
        function opentitle(url, title) {
            diag.url = url;
            diag.title = title;
            diag.ShowModal();
        }
        function closeCuModal() {
            diagLabel.CloseModal();
        }
    </script>
</asp:Content>