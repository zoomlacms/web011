<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.UserApi, App_Web_ub3q0ybo" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>Api接口配置</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab0" data-toggle="tab" onclick="showbody(1)">站群整合</a></li>
        <li><a href="#tab1" data-toggle="tab" onclick="showbody(2)">Discuz论坛</a></li>
        <li><a href="#tab2" data-toggle="tab" onclick="showbody(3)">DPO整合</a></li>
    </ul>

    <table class="table table-striped table-bordered table-hover">
        <tbody id="tb1">
            <tr>
                <td class="tdbgleft" style="width:120px;text-align:right;"><strong>作为子站：</strong></td>
                <td>
                    <input type="checkbox" runat="server" id="Remote_Chk" class="switchChk" />
                </td>
            </tr>
            <tr>
                <td class="tdbgleft" align="right"><strong>主站Url：</strong></td>
                <td>
                    <asp:TextBox runat="server" ID="Remote_Url" CssClass="form-control" Style="display: inline;" /><span>示例：http://www.zoomla.cn,非子站不需要填写</span></td>
            </tr>
            <tr>
                <td class="tdbgleft" align="right"><strong>Token：</strong></td>
                <td>
                    <asp:TextBox runat="server" ID="Token_T" CssClass="form-control" Style="display: inline;" /><span>提示：服务端与客户端都必须填写</span></td>
            </tr>
        </tbody>
        <tbody id="tb2" style="display:none;">
            <tr>
                <td align="center" colspan="2"><strong>Discuz论坛接口整合信息配置</strong></td>
            </tr>
            <tr>
                <td style="width:200px;text-align:right;"><strong>启用Discuz!NT论坛：</strong></td>
                <td>
                    <input type="checkbox" runat="server" id="RBLDZ" class="switchChk" />
                </td>
            </tr>
            <tr>
                <td align="right"><strong>启用Discuz!论坛：</strong></td>
                <td>
                    <input type="checkbox" runat="server" id="Discuz" class="switchChk" />
                </td>
            </tr>
        </tbody>
        <tbody id="tb3" style="display:none;">
            <tr>
                <td align="center" colspan="2"><strong>DPO(Dvbbs、PowerEasy、Oblog)接口整合信息配置</strong></td>
            </tr>
            <tr>
                <td style="width:120px;text-align:right;"><strong>是否启用接口：</strong></td>
                <td>
                    <input type="checkbox" runat="server" id="RBLEnable" class="switchChk" />
                </td>
            </tr>
            <tr>
                <td align="right"><strong>接口ID：</strong></td>
                <td>
                    <asp:Label ID="LblAppID" runat="server" Text="other"></asp:Label></td>
            </tr>
            <tr>
                <td class="tdbgleft" align="right"><strong>系统键值：</strong></td>
                <td>
                    <asp:TextBox ID="TxtSysKey" class="form-control" runat="server"></asp:TextBox>
                    <strong>&nbsp; </strong></td>
            </tr>
            <tr>
                <td class="tdbgleft" align="right"><strong>接口地址：</strong></td>
                <td>
                    <asp:TextBox ID="TxtUrls" class="form-control" runat="server"></asp:TextBox>
                    <strong>&nbsp;
        将接口地址用"|"隔开，地址必须以http://开头</strong></td>
            </tr>
        </tbody>
        <tr class="tdbg">
            <td class="tdbgleft" colspan="2" align="center">
                <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="保存" />
                &nbsp;
        <asp:Button ID="btnCancel" class="btn btn-primary" runat="server" Text="取 消" OnClick="btnCancel_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript">
        function showbody(num)
        {
            $("#tb" + num).show().siblings("tbody").hide();
        }
    </script>
</asp:Content>
