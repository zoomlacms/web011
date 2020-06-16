<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="Manage_I_Content_TemplateEdit, App_Web_5nkxzgmd" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
    <link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
    <script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
    <script src="/Plugins/CodeMirror/mode/xml.js"></script>
    <script src="/Plugins/CodeMirror/mode/javascript/javascript.js"></script>
    <script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
    <script src="/Plugins/CodeMirror/addon/edit/matchbrackets.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <%--<script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>--%>
    <title>编辑模板</title>
    <style type="text/css">
        .spanfixdivchechk>a{float:left;}
        .spanfixdivchechk>span{float:left;width:90%;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table width="100%" cellpadding="2" border="0" cellspacing="1" class="table table-striped table-bordered" align="center">
        <tr class="title" style="font-weight: normal;">
            <td align="left" colspan="2">
                <div id="add_div" visible="false" runat="server">
                    <span style="float:left; margin-left:10px; margin-right:10px; font-weight:bold; margin-top:0.3em;">请输入模板名称:</span>
               <div class="input-group" style="width: 300px; float:left">
                   <input runat="server" id="TxtFilename" style="text-align: right" class="form-control" />
                   <asp:Label runat="server" ID="name_L" class="input-group-addon">
                       .html
                   </asp:Label>
               </div>
                </div>
                <div id="edit_div" visible="false" runat="server">
                    <asp:Label ID="TempUrl_L" runat="server"></asp:Label>
                </div>
                
                          <asp:HiddenField ID="HdnShowPath" runat="server" />
                <asp:HiddenField ID="Hdnmethod" runat="server" />
                <asp:HiddenField ID="HdnFilePath" runat="server" />
        </tr>
        <tr>
            <td align="left" style="height: 410px; min-width:377px; width: 377px; vertical-align: top;">
                <div id="Tab1_header">
                    <ul class="nav nav-tabs">
                        <li id="TabTitle0" class="active"><a href="#Tabs0" data-toggle="tab" onclick="ShowTabs(0)">自定标签</a></li>
                        <li id="TabTitle1"><a href="#Tabs1" data-toggle="tab" onclick="ShowTabs(1);">字段标签</a></li>
                        <li id="TabTitle2"><a href="#Tabs2" data-toggle="tab" onclick="ShowTabs(2);">系统标签</a></li>
                        <li id="TabTitle3"><a href="#Tabs3" data-toggle="tab" onclick="ShowTabs(3);">扩展函数</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="Tabs0" runat="server">
                            <table border="0"  class="table table-striped table-bordered">
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
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                          <table class="table table-striped table-bordered">
                                <tbody id="Tabs4" runat="server"></tbody>
                                <tbody id="Tabs1" runat="server" style="display: none">
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
                                <tbody id="Tabs2" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="lblSys" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="Tabs3" style="display: none">
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
                    <asp:TextBox TextMode="MultiLine" runat="server"  ID="textContent" style="width:300px;height:300px;"/>
                </div>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <div style="float: left; padding-left: 250px">
                    <asp:Button ID="btnSave" runat="server" Text="保存模板" Class="btn btn-primary" OnClick="btnSave_Click"  UseSubmitBehavior="false"/>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnReset" Class="btn btn-primary" runat="server" Text="取消操作" OnClick="btnReset_Click" UseSubmitBehavior="false"/>&nbsp;&nbsp;&nbsp;
                </div>
                <div id="Div1" style="float: left">
                    <%--<input type="button" id="buttons" name="buttons" value="可视化预览" class="btn btn-primary" onclick="opentitle('Default.aspx','可视化窗口')" />--%>
                </div>
            </td>
        </tr>
    </table>
    <div class="modal" id="userinfo_div">
        <div class="modal-dialog" style="width: 800px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong id="title">用户信息</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="user_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
  <script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script src="/Plugins/CodeMirror/LabelCall.js"></script>
    <script type="text/javascript">
        var diag = new ZL_Dialog();
        function opentitle(url, title)
        {
            diag.title = "修改标签";
            diag.url = url;
            diag.ShowModal();
            return false;
        }
        function closeCuModal() {
            diagLabel.CloseModal();
        }
    </script>
</asp:Content>