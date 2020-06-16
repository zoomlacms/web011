<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_AddClass, App_Web_fk1hbgsf" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
        <title>添加组别</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField runat="server" ID="classid_Hid" />
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text="添加组别"></asp:Label></td>
        </tr>
        <tbody id="Tabs0">
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="ssjd_txt" runat="server" Text="班级名称："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txt_Regulationame" runat="server" class="form-control" ></asp:TextBox>
                    &nbsp;<font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label2" runat="server" Text="班级课程："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtCourse" runat="server" class="form-control"  Enabled="false"></asp:TextBox>
                    <asp:HiddenField ID="hfid" runat="server" />
                    <input id="Button1" type="button" value="选择课程" data-toggle="modal" data-target="#class_div" onclick="Openwin(); void (0)" class="btn btn-primary" />
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label7" runat="server" Text="班级类别："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:DropDownList ID="classtype" runat="server" CssClass="form-control"></asp:DropDownList>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label9" runat="server" Text="负责人："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txt_Regulation" runat="server" class="form-control" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label3" runat="server" Text="售价："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtShiPrice" runat="server" class="form-control"  ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13"
                        runat="server" ControlToValidate="txtShiPrice" ErrorMessage="售价格式不对!" ValidationExpression="\d+[.]?\d*"
                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label4" runat="server" Text="优惠价："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtLinkPrice" runat="server" class="form-control" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        runat="server" ControlToValidate="txtLinkPrice" ErrorMessage="优惠价格式不对!" ValidationExpression="\d+[.]?\d*"
                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label5" runat="server" Text="课时："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txtCoureTime" runat="server" class="form-control"  ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label6" runat="server" Text="订购此班级是否赠送此课程："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <input type="checkbox" runat="server" id="rbl" class="switchChk"/>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Ratednumber_name" runat="server" Text="额定人数："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txt_Ratednumber" runat="server" class="form-control"  ></asp:TextBox>
                    人
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label14" runat="server" Text="建立时间："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txt_Setuptime" runat="server" class="form-control"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label15" runat="server" Text="结束时间："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:TextBox ID="txt_Endtime" runat="server" class="form-control"   onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="tdbgleft" style="width: 20%" align="right">
                    <asp:Label ID="Label8" runat="server" Text="开班天数："></asp:Label>
                    &nbsp;
                </td>
                <td class="bqright">
                    <asp:Label ID="lbDay" ForeColor="Red" runat="server" CssClass="form-control" Text ="结束时间-建立时间=开班天数"></asp:Label>
                </td>
            </tr>
        </tbody>
        <tr class="tdbgbottom">
            <td colspan="2">

                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="添加学习组" runat="server" OnClick="EBtnSubmit_Click" />
                &nbsp;
                <asp:Button ID="BtnBack" class="btn btn-primary" runat="server" Text="返回列表" UseSubmitBehavior="False"
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    <div class="modal" id="class_div">
        <div class="modal-dialog" style="width: 1024px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong>选择分类</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="class_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/Plugins/kindeditor/kindeditor.js" charset="utf-8"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript">
        function Openwin() {
            $("#class_ifr").attr("src", "SelectCourse.aspx");
        }
    </script>
</asp:Content>