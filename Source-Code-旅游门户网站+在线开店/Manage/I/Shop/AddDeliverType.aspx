<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_AddDeliverType, App_Web_2afsdgkd" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加送货方式</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr>
                <td colspan="2" align="center" class="title">添加送货方式</td>
            </tr>
            <tr>
                <td width="24%"><strong>送货方式名称</strong></td>
                <td width="76%">
                    <asp:TextBox ID="deliname" CssClass="form-control" runat="server" Width="300px" />
                    <asp:HiddenField ID="uptype" runat="server" />
                    <asp:HiddenField ID="ID_H" runat="server" />
                </td>
            </tr>
            <tr>
                <td><strong>送货方式简介</strong></td>
                <td>
                    <asp:TextBox ID="deliinfo" CssClass="form-control" runat="server" Height="177px" TextMode="MultiLine" Width="428px" /></td>
            </tr>
            <tr runat="server" id="aas">
                <td><strong>运费</strong></td>
                <td>
                    <asp:TextBox ID="delitype" CssClass="form-control" runat="server" Width="82px"></asp:TextBox>元</td>
            </tr>

            <tr>
                <td><strong>费用</strong></td>
                <td>
                    <asp:RadioButtonList ID="IsOpen" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="IsOpen_SelectedIndexChanged">
                        <asp:ListItem Value="1">免费</asp:ListItem>
                        <asp:ListItem Value="2">按重量计算运费</asp:ListItem>
                        <asp:ListItem Value="3">固定值</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td><strong>税率</strong></td>
                <td>
                    <asp:TextBox ID="shuilv" CssClass="form-control" runat="server" Text='0' Width="50px" />%</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <label for="ctl00_CphContent_ChkIsDefault">
                        <asp:CheckBox ID="selectto" Text="设为默认送货方式" runat="server" />
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" class="btn btn-primary" Style="width: 110px;" Text="保存送货方式" runat="server" OnClick="Button1_Click" />
                </td>
            </tr>
        </tbody>
    </table>
    <div runat="server" id="aa2">
        <table class="table table-striped table-bordered table-hover">
            <tbody id="Tbody4">
                <tr>
                    <td colspan="2" align="center" class="style2"><span class="spacingtitle">同一城市间运费标准</span></td>
                </tr>
                <tr>
                    <td width="24%"><strong>货运商所属省份：</strong></td>
                    <td width="76%">
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="table table-striped table-bordered table-hover">
            <tbody id="Tbody2">
                <tr>
                    <td colspan="2" align="center" class="style2"><span class="spacingtitle">同一城市间运费标准</span></td>
                </tr>
                <tr>
                    <td width="24%"><strong>基本运费：</strong></td>
                    <td width="76%">
                        <asp:TextBox ID="tx_citymoney" CssClass="form-control" runat="server" />元
                    </td>
                </tr>
                <tr>
                    <td><strong>基本运费的起算<b>重量：</b></strong></td>
                    <td>
                        <asp:TextBox ID="tx_citykg" CssClass="form-control" runat="server" />千克（Kg）当商品重量不超过上述指定起算重量时，实际运费按基本运费计算</td>
                </tr>
                <tr>
                    <td><strong>浮动运费：</strong></td>
                    <td>当商品总重量超过基本运费的起算重量后，除了收取基本运费外，每<asp:TextBox ID="tx_bigcitykg" runat="server" Width="82px"></asp:TextBox>
                        千克的商品增加运费<asp:TextBox ID="tx_bigcitymoney" runat="server" Width="82px"></asp:TextBox>元</td>
                </tr>
                <tr>
                    <td><strong>最高运费：</strong></td>
                    <td>
                        <asp:TextBox ID="tx_maxcity" CssClass="form-control" runat="server" Width="82px"></asp:TextBox>
                        元（当基本运费＋浮动运费超过最高运费时，实际运费按最高运费计算）</td>
                </tr>

            </tbody>
        </table>
        <table class="table table-striped table-bordered table-hover">
            <tbody id="Tbody3">
                <tr>
                    <td colspan="2" align="center" class="style2"><span class="spacingtitle">省外之间运费标准</span></td>
                </tr>
                <tr>
                    <td width="24%"><strong>基本运费：</strong></td>
                    <td width="76%">
                        <asp:TextBox ID="tx_outmoney" CssClass="form-control" runat="server" />
                        元</td>
                </tr>
                <tr>
                    <td><strong>基本运费的起算<b>重量：</b></strong></td>
                    <td>
                        <asp:TextBox ID="tx_outkg" CssClass="form-control" runat="server" />千克（Kg）当商品重量不超过上述指定起算重量时，实际运费按基本运费计算</td>
                </tr>
                <tr>
                    <td><strong>浮动运费：</strong></td>
                    <td>当商品总重量超过基本运费的起算重量后，除了收取基本运费外，每<asp:TextBox ID="tx_bigoutkg" runat="server" Width="82px"></asp:TextBox>
                        千克的商品增加运费<asp:TextBox ID="tx_bigoutmoney" runat="server" Width="82px"></asp:TextBox>元</td>
                </tr>
                <tr>
                    <td><strong>最高运费：</strong></td>
                    <td>
                        <asp:TextBox ID="tx_maxout" CssClass="form-control" runat="server" Width="82px"></asp:TextBox>
                        元（当基本运费＋浮动运费超过最高运费时，实际运费按最高运费计算）</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
