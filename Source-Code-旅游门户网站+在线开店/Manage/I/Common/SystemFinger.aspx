<%@ page language="C#" autoeventwireup="true" inherits="manage_Common_SystemFinger, App_Web_yz0xa5ln" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>系统指针</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover" id="systb">
        <tr>
            <td style="width: 200px"><strong>页面网址：</strong></td>
            <td>
                <asp:Label ID="lbServerName" name="lbServerName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器IP地址：</strong></td>
            <td>
                <asp:Label ID="lbIp" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>站点域名：</strong></td>
            <td>
                <asp:Label ID="lbDomain" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>请求端口：</strong></td>
            <td>
                <asp:Label ID="lbPort" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器IIS版本：</strong></td>
            <td>
                <asp:Label ID="lbIISVer" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>本文件所在文件夹：</strong></td>
            <td>
                <asp:Label ID="lbPhPath" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器操作系统：</strong></td>
            <td>
                <asp:Label ID="lbOperat" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>系统所在文件夹：</strong></td>
            <td>
                <asp:Label ID="lbSystemPath" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器脚本超时时间：</strong></td>
            <td>
                <asp:Label ID="lbTimeOut" name="lbTimeOut" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器的语言种类：</strong></td>
            <td>
                <asp:Label ID="lbLan" name="lbLan" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>.NET Framework 版本：</strong></td>
            <td>
                <asp:Label ID="lbAspnetVer" name="lbAspnetVer" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器当前时间：</strong></td>
            <td>
                <asp:Label ID="lbCurrentTime" name="lbCurrentTime" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器IE版本：</strong></td>
            <td>
                <asp:Label ID="lbIEVer" name="lbIEVer" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>本次开机以来系统连续运行的时间：</strong></td>
            <td>
                <asp:Label ID="lbServerLastStartToNow" name="lbServerLastStartToNow" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>服务器硬盘分区：</strong></td>
            <td>
                <asp:Label ID="lbLogicDriver" name="lbLogicDriver" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>CPU 总数：</strong></td>
            <td>
                <asp:Label ID="lbCpuNum" name="lbCpuNum" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>CPU 类型：</strong></td>
            <td>
                <asp:Label ID="lbCpuType" name="lbCpuType" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>虚拟内存：</strong></td>
            <td>
                <asp:Label ID="lbMemory" name="lbMemory" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>当前程序占用内存：</strong></td>
            <td>
                <asp:Label ID="lbMemoryPro" name="lbMemoryPro" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>Asp.net所占内存：</strong></td>
            <td>
                <asp:Label ID="lbMemoryNet" name="lbMemoryNet" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>Asp.net所占CPU：</strong></td>
            <td>
                <asp:Label ID="lbCpuNet" name="lbCpuNet" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>当前Session数量：</strong></td>
            <td>
                <asp:Label ID="lbSessionNum" name="lbSessionNum" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>当前Session的数量与ID：</strong></td>
            <td>
                <asp:Label ID="lbSession" name="lbSession" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 200px"><strong>当前系统用户名：</strong></td>
            <td>
                <asp:Label ID="lbUser" name="lbUser" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <input type="button" name="GetExc" value="保存信息为Excel" id="GetExc" class="btn btn-primary" onclick="GetExcel('systb');" />
    <input type="button" id="back" name="back" value="返回" class="btn btn-primary" onclick="javascript: history.back();" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function GetExcel(obj) {
            var gt;
            ($("#" + obj)).find("tr").each(function (i, item) {
                ($(item)).find("td").each(function (j, iten) {
                    gt += $.trim($(iten).text()) + "$t";
                });
                gt += "$n";
            });
            var timeout;
            setTimeout(function () { document.getElementById("GetExc").disabled = true; $("#GetExc").val("正在转换中"); }, 10);
            var time = 4000;
            timeout = setInterval(function () {

                time = time - 1000;
            }, 1000);
            setTimeout(function () {
                clearInterval(timeout);
                document.getElementById("GetExc").disabled = false;
                $("#GetExc").val("保存信息为Excel");
            }, time);
            window.location.href = "../Content/GetExcel.aspx?txt=" + $.trim(gt.replace("undefined", ""));
        }
</script>
</asp:Content>