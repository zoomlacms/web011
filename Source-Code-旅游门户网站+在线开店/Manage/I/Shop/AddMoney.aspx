<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.AddMoney, App_Web_2afsdgkd" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>添加货币</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:HiddenField ID="hid" runat="server" />
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="text-center" colspan="2">
                添加货币
            </td>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">货币名称：
            </td>
            <td width="82%">
                <select name="unname" class="form-control" onchange="chgcur(options[this.selectedIndex].value)" id="moneydescp" runat="server">
                    <option value="0" selected>- 请选择 -</option>
                    <option value='CNY'>人民币</option>
                    <option value='USD'>美元</option>
                    <option value='EUR'>欧元</option>
                    <option value='GBP'>英镑</option>
                    <option value='CAD'>加拿大元</option>
                    <option value='AUD'>澳元</option>
                    <option value='RUB'>卢布</option>
                    <option value='HKD'>港币</option>
                    <option value='TWD'>新台币</option>
                    <option value='KRW'>韩元</option>
                    <option value='SGD'>新加坡元</option>
                    <option value='NZD'>新西兰元</option>
                    <option value='JPY'>日元</option>
                    <option value='MYR'>马元</option>
                    <option value='CHF'>瑞士法郎</option>
                    <option value='SEK'>瑞典克朗</option>
                    <option value='DKK'>丹麦克朗</option>
                    <option value='PLZ'>兹罗提</option>
                    <option value='NOK'>挪威克朗</option>
                    <option value='HUF'>福林</option>
                    <option value='CSK'>捷克克朗</option>
                </select>
            </td>
            <asp:TextBox ID="TextBox1" runat="server" class="form-control" Style="display: none"></asp:TextBox>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">货币代码：
            </td>
            <td width="82%">
                <asp:TextBox ID="moneycode" class="form-control" runat="server" onKeyUp="backText()"></asp:TextBox><span
                    id="cod" style="display: none; color: Red">货币代码不能修改！！</span>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">货币符号：
            </td>
            <td width="82%">
                <asp:TextBox ID="moneysign" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">
                
            </td>
            <td>
                <span class="p9gray">设置当前货币的显示符号，前台商品价格前会显示相应符号，比如人民币使用￥符号； </span>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">当前汇率：
            </td>
            <td width="82%">
                <asp:TextBox ID="moneyrate" class="form-control" runat="server" onKeyUp=" value=value.replace(/[^+|.|0-9]/g,'')"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">
                
            </td>
            <td>
                <span class="p9gray">设置当前货币和默认货币之间的汇率关系，比如默认货币为人民币，当前货币为美元。假设美元对人民币为1:8.28，则此处填写汇率为“0.1208”（1除以8.28约等于0.1208）；
                </span>
            </td>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">默认货币：
            </td>
            <td width="82%">
                <input type="checkbox" runat="server" id="moneyisflag" class="switchChk"  />
            </td>
        </tr>
        <tr>
            <td style="width: 200px; height: 23px;">
                
            </td>
            <td width="82%">
                <span>选择“是”则将当前货币设置为默认货币，前台价格显示、结算都以默认货币来进行； </span>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="Button1" class="btn btn-primary" Style="width: 110px;" runat="server" Text="保存设置" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script>
        function chgcur(cur) {
            if (document.getElementById("moneydescp").value == "0") {
                document.getElementById("moneycode").value = "";
            }
            else {
                document.getElementById("moneycode").value = document.getElementById("moneydescp").value;
                document.getElementById("TextBox1").value = document.getElementById("moneycode").value;
            }
        }

        function checkform() {
            if ((document.getElementById("moneydescp").value == "0") || (document.getElementById("moneyrate").value * 1 <= 0)) {
                if (document.getElementById("moneydescp").value == "0") {
                    alert("请选择货币名称！");

                    return false;
                }
                if (document.getElementById("moneyrate").value * 1 <= 0) {
                    alert("请输入当前汇率！");
                    document.getElementById("moneyrate").focus();
                    return false;
                }
            } else {
                return true;
            }
            //  form1.submit();
        }
        function backText() {
            document.getElementById("cod").style.display = "block";
            document.getElementById("moneycode").value = document.getElementById("TextBox1").value;
        }
    </script>
</asp:Content>
