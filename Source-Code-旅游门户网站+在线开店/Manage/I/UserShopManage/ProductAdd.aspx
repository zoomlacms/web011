<%@ page language="C#" autoeventwireup="true" inherits="Manage_Shop_UserShopManage_ProductAdd, App_Web_2pfg00wt" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品列表</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<%--    <div id="flotop" style="display: none;">
        <div id="msgDiv">
            <div id="msgShut">关闭</div>
            <div id="msgDetail"></div>
        </div>
        <div id="bgDiv"></div>
    </div>--%>
    <div style="width: 100%">
        <asp:Panel ID="Panel1" runat="server" Width="98%" class="us_topinfo" Style="margin-top: 10px;">
            <table class="table table-bordered">
                <tr>
                    <td height="24" align="center" style="width: 33%">
                        <asp:ListBox ID="class0" CssClass="form-control" runat="server" Height="280px" Width="180px" AutoPostBack="True"></asp:ListBox>
                    </td>
                    <td height="24" align="center" style="width: 33%">
                        <asp:ListBox ID="class1" CssClass="form-control" runat="server" Height="280px" Width="180px" AutoPostBack="True"></asp:ListBox>
                    </td>
                    <td height="24" align="center" width="33%">
                        <asp:ListBox ID="class2" CssClass="form-control" runat="server" Height="280px" Width="180px" AutoPostBack="True"></asp:ListBox>
                    </td>
                    <td height="24" align="center" width="33%">
                        <asp:ListBox ID="class3" CssClass="form-control" runat="server" Height="280px" Width="180px" AutoPostBack="True"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="false">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#Tabs0" onclick="ShowTabss(0)" data-toggle="tab">基本信息</a></li>
                <li><a href="#Tabs1" onclick="ShowTabss(1)" data-toggle="tab">介绍及图片</a></li>
                <li><a href="#Tabs2" onclick="ShowTabss(2)" data-toggle="tab">其他信息</a></li>
                <li><a href="#Tabs3" onclick="ShowTabss(3)" data-toggle="tab">价格设置</a></li>
                <li><a href="#Tabs4" onclick="ShowTabss(4)" data-toggle="tab">促销设置</a></li>
                <li><a href="#Tabs5" onclick="ShowTabss(5)" data-toggle="tab">商品属性</a></li>
            </ul>
            <table class="table table-striped table-bordered table-hover">
                <tbody id="Tabs0">
                    <asp:Label ID="nodename" runat="server"></asp:Label>
                    <asp:HiddenField ID="HdnNode" runat="server" />
                    <asp:HiddenField ID="HdnModel" runat="server" />
                    <asp:HiddenField ID="ClickType" runat="server" />
                    <asp:HiddenField ID="ID" runat="server" Value="0" />
                    <asp:HiddenField ID="Item" runat="server" />
                    <asp:HiddenField ID="ComModelID" runat="server" />
                    <asp:HiddenField ID="Categoryid" runat="server" />
                    <asp:HiddenField ID="HdnSpec" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:HiddenField ID="hidNum" runat="server" />
                    <div id="lblSpec" runat="server"></div>
                    <tr>
                        <td style="width: 150px;">
                            <strong>所属分类：</strong>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品编号：</strong>
                        </td>
                        <td style="width: 592px; height: 26px;">
                            <asp:TextBox ID="ProCode" CssClass="form-control" runat="server" disabled="disabled" />
                            <asp:CheckBox ID="CheckBox1" Text="自动编号" onclick="SetDisabled(this.checked)" runat="server" Checked="True" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>条形码：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="BarCode" CssClass="form-control" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品名称：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Proname" CssClass="form-control" runat="server" Width="442px" />
                            <span class="STYLE1">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="Proname" Display="Dynamic" ErrorMessage="商品名称不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>自定义分类：</strong>
                        </td>
                        <td>
                            <asp:DropDownList ID="UserClass" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>关键字：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Kayword" CssClass="form-control" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品单位：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="ProUnit" CssClass="form-control" runat="server" />
                            <span class="STYLE1"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="Proname" Display="Dynamic" ErrorMessage="商品单位不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span>
                            <div class="btn btn-group">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品重量：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Weight" CssClass="form-control" runat="server" Width="80px" />
                            千克（Kg）<asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                ControlToValidate="Weight" ErrorMessage="商品重量必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$"
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>售后服务：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="ServerPeriod" CssClass="form-control" runat="server" Width="80" />
                            <asp:DropDownList ID="ServerType" CssClass="form-control" Width="80" runat="server">
                                <asp:ListItem Selected="True" Value="3">年</asp:ListItem>
                                <asp:ListItem Value="2">月</asp:ListItem>
                                <asp:ListItem Value="1">日</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                ControlToValidate="ServerPeriod" ErrorMessage="服务期限必须是数字!" ValidationExpression="^\d+$"
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品类型：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="ProClass" runat="server" RepeatDirection="Horizontal" Width="179px">
                                <asp:ListItem Selected="True" Value="1">正常销售</asp:ListItem>
                                <asp:ListItem Value="2">特价处理</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>属性设置：</strong>
                        </td>
                        <td>
                            <asp:CheckBox ID="isnew" runat="server" Text="新品" />
                            <asp:CheckBox ID="ishot" runat="server" Text="热销" />
                            <asp:CheckBox ID="isbest" runat="server" Text="精品" />
                            <asp:CheckBox ID="isreach" runat="server" Text="二手闲置" />
                            <asp:CheckBox ID="ismarked" runat="server" Text="一口价" />
                            <asp:CheckBox ID="isprefer" runat="server" Text="优惠" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>交易状态：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Value="0" Selected="True">销售</asp:ListItem>
                                <asp:ListItem Value="1">团购</asp:ListItem>
                                <asp:ListItem Value="2">竞拍</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:MultiView ID="MultiView1" runat="server">
                                <asp:View ID="View1" runat="server">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <td>团购数量：</td>
                                            <td>
                                                <asp:TextBox ID="ColonelNumtxt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>团购价格：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ColonelMoneytxt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>团购保证金：</td>
                                            <td>
                                                <asp:TextBox ID="CautionMoneytxt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>开始时间：</td>
                                            <td>
                                                <asp:TextBox ID="ColonelStartTimetxt" CssClass="form-control" runat="server" OnFocus="setday(this)"></asp:TextBox>
                                            </td>
                                            <td>结束时间：</td>
                                            <td>
                                                <asp:TextBox ID="ColonelendTimetxt" CssClass="form-control" runat="server" OnFocus="setday(this)"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:RadioButtonList ID="OnCalonelUsertxt" runat="server">
                                        <asp:ListItem Value="1" Selected="True" Text="达到团购数量，在指定的日期内订单自动转为可结算状态"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="未达到团购数量，在指定的日期内订单自动转为可结算状态"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </asp:View>
                                <asp:View ID="View2" runat="server">
                                    <table class="table table-striped table-bordered table-hover">
                                        <tr>
                                            <td>竞拍起始价格：</td>
                                            <td>
                                                <asp:TextBox ID="txtColonelMoneys" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>竞拍保证金：</td>
                                            <td>
                                                <asp:TextBox ID="txtCautionMoney" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>开始时间：</td>
                                            <td>
                                                <asp:TextBox ID="txtColonelStartTime" CssClass="form-control" runat="server" Text="" OnFocus="setday(this)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>结束时间：</td>
                                            <td>
                                                <asp:TextBox ID="txtColonelendTime" CssClass="form-control" runat="server" OnFocus="setday(this)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="txtOnCalonelMoney" runat="server" Selected="True" Text="达到指定价格，在指定的日期内订单自动转为可结算状态" /><br />
                                                <asp:CheckBox ID="txtOnCalonelTime" runat="server" Selected="True" Text="达到指定日期，在指定的日期内订单自动转为可结算状态" /><br />
                                                <strong>注意：本商品的销售价格为竞拍的最低承受价格</strong>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtColonelMoneys"
                                        ErrorMessage="请输入正确的价格" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                </asp:View>
                            </asp:MultiView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>交易操作：</strong>
                        </td>
                        <td>
                            <asp:CheckBox ID="Sales" Text="打勾表示允许交易，否则不允许交易" runat="server" />
                        </td>
                    </tr>
                </tbody>
                <tbody id="Tabs1" style="display: none">
                    <tr>
                        <td width="20%">
                            <strong>商品简介：</strong>
                        </td>
                        <td>用于首页及栏目页显示，不要超过255个字符<br />
                            <asp:TextBox ID="Proinfo" CssClass="form-control" Style="max-width: 500px;" runat="server" Height="100" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" style="height: 24px">
                            <strong>详细介绍：</strong>
                        </td>
                        <td style="height: 24px; width: 80%;">
                            <textarea cols="80" id="Procontent" style="width: 680px; height: 300px;" name="Procontent"
                                rows="10" runat="server"></textarea>
                            <script id="headscript" type="text/javascript">
                                UE.getEditor('Procontent');
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <strong>商品清晰图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Clearimg" CssClass="form-control" runat="server" Style="max-width: 300px;" />
                            <iframe id="bigimgs" style="top: 2px" src="../../UserShopManage/fileupload.aspx?menu=Clearimg" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                    <tr id="addsmallimg">
                        <td width="20%">
                            <strong>商品缩略图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Thumbnails" runat="server" CssClass="form-control" Style="max-width: 300px;" />
                            <iframe id="smallimgs" style="top: 2px" src="../../UserShopManage/fileupload.aspx?menu=Thumbnails" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                </tbody>
                <tbody id="Tabs2" style="display: none">
                    <tr>
                        <td width="20%">
                            <strong>生 产 商：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Producer" CssClass="form-control" runat="server"></asp:TextBox>
                            [<a href="###" onclick="SelectProducer();">请选择</a>]
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>品牌/商标：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Brand" runat="server" CssClass="form-control"></asp:TextBox>
                            [<a href="###" onclick="SelectBrand();">请选择</a>]
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>缺货时允许购买：</strong>
                        </td>
                        <td>
                            <asp:CheckBox ID="Allowed" runat="server" Text="打勾表示缺货时允许购买， 否则缺货时不允许购买" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>限购数量：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Quota" runat="server" CssClass="form-control" Width="50">10</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Quota"
                                ErrorMessage="限购数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>最低购买数量：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="DownQuota" runat="server" CssClass="form-control" Width="50">1</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="DownQuota"
                                ErrorMessage="最低购买数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px">
                            <strong>库存数量：</strong>
                        </td>
                        <td style="height: 24px">
                            <asp:HiddenField ID="hfstock" runat="server" />
                            <asp:TextBox ID="Stock" runat="server" CssClass="form-control" Width="50">0</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="Stock"
                                ErrorMessage="库存数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 24px">
                            <strong>库存报警下限：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="StockDown" runat="server" CssClass="form-control" Width="50">-1</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="StockDown"
                                ErrorMessage="库存报警下限必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td>
                            <strong>前台库存计算方式：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 32%">
                                        <asp:RadioButtonList ID="JisuanFs" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="0">实际库存</asp:ListItem>
                                            <asp:ListItem Value="1">虚拟库存</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td width="89%">（实际库存－已订购数）
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>税率设置：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="Rateset" runat="server">
                                <asp:ListItem Selected="True" Value="1">含税，不开发票时有税率优惠 </asp:ListItem>
                                <asp:ListItem Value="2">含税，不开发票时没有税率优惠</asp:ListItem>
                                <asp:ListItem Value="3">不含税，开发票时需要加收税费</asp:ListItem>
                                <asp:ListItem Value="4">不含税，开发票时不需要加收税费</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品税率：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Rate" CssClass="form-control" Width="80" runat="server" />
                            %
										<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                            ControlToValidate="Rate" ErrorMessage="商品税率必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$"
                                            SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>商品推荐等级：</strong>
                        </td>
                        <td>
                            <asp:DropDownList ID="Dengji" CssClass="form-control" Width="150" runat="server">
                                <asp:ListItem Value="5">★★★★★</asp:ListItem>
                                <asp:ListItem Value="4">★★★★</asp:ListItem>
                                <asp:ListItem Selected="True" Value="3">★★★</asp:ListItem>
                                <asp:ListItem Value="2">★★</asp:ListItem>
                                <asp:ListItem Value="1">★</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </tbody>
                <tbody id="Tabs3" style="display: none">
                    <tr>
                        <td width="20%">
                            <strong>市场参考价：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 23%; height: 21px;">
                                        <asp:TextBox ID="ShiPrice" CssClass="form-control" runat="server" Width="80px" />
                                        <asp:HiddenField ID="hfprice" runat="server" />
                                        <asp:HiddenField ID="hfFesPrice" runat="server" />
                                        <asp:HiddenField ID="hfBookprice" runat="server" />
                                        元 <font color="red">*</font>
                                    </td>
                                    <td width="76%" style="height: 21px">购买时参考的市场零售价，可以比当前零售价高。<asp:RegularExpressionValidator ID="RegularExpressionValidator13"
                                        runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价格格式不对!" ValidationExpression="\d+[.]?\d*"
                                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价不能为空!"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>当前零售价：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 23%; height: 20px;">
                                        <asp:TextBox ID="LinPrice" runat="server" CssClass="form-control" Width="80" />
                                        元 <font color="red">*</font>
                                    </td>
                                    <td width="78%" style="height: 20px">商店销售此商品时的价格。<asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                                        ControlToValidate="LinPrice" ErrorMessage="零售价格式不对!" ValidationExpression="\d+[.]?\d*"
                                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator4" runat="server" ControlToValidate="LinPrice" ErrorMessage="零售价不能为空!"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>运费设置:</strong>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="rdoFarePrice" runat="server" RepeatDirection="Horizontal"
                                        AutoPostBack="True" OnSelectedIndexChanged="rdoFarePrice_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Selected="True">免运费</asp:ListItem>
                                        <asp:ListItem Value="1">运费</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox ID="farePrice" CssClass="form-control" runat='server' Width="80px" Visible="false"></asp:TextBox>
                                    <div id="farediv" runat="server" visible="false">
                                        <asp:HiddenField ID="FareID1" runat="server" Value='0' />
                                        快递：<asp:TextBox ID="FarePrice1" runat='server' CssClass="form-control" Width="80px"></asp:TextBox>元 
                                                     
                                                    <asp:HiddenField ID="FareID2" runat="server" Value='1' />
                                        平邮：<asp:TextBox ID="FarePrice2" runat='server' CssClass="form-control" Width="80px"></asp:TextBox>元 
                                                     
                                                    <asp:HiddenField ID="FareID3" runat="server" Value='2' />
                                        EMS：<asp:TextBox ID="FarePrice3" runat='server' CssClass="form-control" Width="80px"></asp:TextBox>元 
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr width="100%">
                        <td><strong>会员价:</strong></td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="rdoUserPrice" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                        OnSelectedIndexChanged="rdoUserPrice_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Selected="True">会员价</asp:ListItem>
                                        <asp:ListItem Value="1">会员组</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="userP" runat="server">会员价：<asp:TextBox ID="userPrice" runat='server' class=" form-control" Width="50px"></asp:TextBox>元</div>
                                    <div id="divGroup" runat="server" visible="false">
                                        <asp:Repeater ID="repGroup" runat="server">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="groupID" runat="server" Value='<%#Eval("GroupID") %>' />
                                                <%#Eval("GroupName")%>：<asp:TextBox ID="GroupPrice" runat='server' class="form-control" Width="50px"></asp:TextBox>元
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr width="100%">
                        <td><strong>节日价格:</strong></td>
                        <td>
                            <asp:TextBox ID="txtDayPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDayPrice" ErrorMessage="节日价格格式不正确!" ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr width="100%">
                        <td><strong>节日时间:</strong></td>
                        <td>
                            <div id='hotelDiv'>
                                <asp:TextBox ID='CheckInDate' runat="server" Text="" CssClass="form-control" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>至 
									<asp:TextBox ID='CheckOutDate' runat="server" Text="" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" CssClass="form-control"></asp:TextBox>
                            </div>
                            <input id='IntervallCheckInAndChekOut' value='1' type='hidden' />
                            <input id='CheckOut' type='hidden' runat="server" />
                            <asp:HiddenField ID="serverdate" runat="server" Value='2010-8-31' />
                            <div id='m_contentend'></div>
                        </td>
                    </tr>
                    <tr width="100%">
                        <td><strong>预订价格:</strong></td>
                        <td>
                            <asp:TextBox ID="txtBookPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtBookPrice" ErrorMessage="预订价格格式不正确!"
                                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr width="100%">
                        <td><strong>预订时间:</strong></td>
                        <td>
                            <asp:TextBox ID="txtBookDay" runat="server" CssClass="form-control"></asp:TextBox>
                            <font color="red">节日时间提前N天为预订价</font>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtBookDay" ErrorMessage="预订时间格式不正确!"
                                ValidationExpression="\d+" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>允许批发：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="Wholesales" runat="server" RepeatDirection="Horizontal"
                                            Width="106px">
                                            <asp:ListItem Value="1" onclick="show(this);">是</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="0" onclick="show(this);">否</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr id="pifaji" style="display: none">
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="height: 24px">① 一次性购买此商品数量满
																<asp:TextBox ID="s1" runat="server" Text='10' CssClass="form-control" Width="50px" />
                                                    时，批发价为
																<asp:TextBox ID="j1" runat="server" CssClass="form-control" Width="80px">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="24">② 一次性购买此商品数量满
																<asp:TextBox ID="s2" runat="server" Text='50' CssClass="form-control" Width="50px" />
                                                    时，批发价为
																<asp:TextBox ID="j2" runat="server" CssClass="form-control" Width="80px">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="24">③ 一次性购买此商品数量满
																<asp:TextBox ID="s3" runat="server" Text='100' CssClass="form-control" Width="50px" />
                                                    时，批发价为
																<asp:TextBox ID="j3" runat="server" CssClass="form-control" Width="80px">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>允许单独交易：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="Wholesaleone" runat="server" RepeatDirection="Horizontal"
                                Width="106px">
                                <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <strong>购买积分：</strong>
                        </td>
                        <td>购买赠送<asp:TextBox ID="Integral" runat="server" CssClass="form-control" />
                            积分
										<asp:RegularExpressionValidator CssClass="l_input" ID="RegularExpressionValidator16" runat="server"
                                            ControlToValidate="Integral" ErrorMessage="积分必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <strong>市场参考价：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 23%; height: 21px;">
                                        <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server" Width="80px" />
                                        <asp:HiddenField ID="HiddenField2" runat="server" />
                                        <asp:HiddenField ID="HiddenField3" runat="server" />
                                        <asp:HiddenField ID="HiddenField4" runat="server" />
                                        元 <font color="red">*</font>
                                    </td>
                                    <td width="76%" style="height: 21px">购买时参考的市场零售价，可以比当前零售价高。<asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                        runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价格格式不对!" ValidationExpression="\d+[.]?\d*"
                                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator5" runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价不能为空!"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>当前零售价：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 23%; height: 20px;">
                                        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Width="80" />
                                        元 <font color="red">*</font>
                                    </td>
                                    <td width="78%" style="height: 20px">商店销售此商品时的价格。<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                        ControlToValidate="LinPrice" ErrorMessage="零售价格式不对!" ValidationExpression="\d+[.]?\d*"
                                        Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator6" runat="server" ControlToValidate="LinPrice" ErrorMessage="零售价不能为空!"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>运费设置:</strong>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                                        AutoPostBack="True" OnSelectedIndexChanged="rdoFarePrice_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Selected="True">免运费</asp:ListItem>
                                        <asp:ListItem Value="1">运费</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox ID="TextBox9" CssClass="form-control" runat='server' Width="80px" Visible="false"></asp:TextBox>
                                    <div id="Div1" runat="server" visible="false">
                                        <asp:HiddenField ID="HiddenField5" runat="server" Value='0' />
                                        快递：<asp:TextBox ID="TextBox10" runat='server' CssClass="form-control" Width="80px"></asp:TextBox>元 
                                                     
                                                    <asp:HiddenField ID="HiddenField6" runat="server" Value='1' />
                                        平邮：<asp:TextBox ID="TextBox11" runat='server' CssClass="form-control" Width="80px"></asp:TextBox>元 
                                                     
                                                    <asp:HiddenField ID="HiddenField7" runat="server" Value='2' />
                                        EMS：<asp:TextBox ID="TextBox12" runat='server' CssClass="form-control" Width="80px"></asp:TextBox>元 
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>会员价:</strong></td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                        OnSelectedIndexChanged="rdoUserPrice_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Selected="True">会员价</asp:ListItem>
                                        <asp:ListItem Value="1">会员组</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="Div2" runat="server">会员价：<asp:TextBox ID="TextBox13" runat='server' class=" form-control" Width="50px"></asp:TextBox>元</div>
                                    <div id="div3" runat="server" visible="false">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="groupID" runat="server" Value='<%#Eval("GroupID") %>' />
                                                <%#Eval("GroupName")%>：<asp:TextBox ID="GroupPrice" runat='server' class="form-control" Width="50px"></asp:TextBox>元
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>节日价格:</strong></td>
                        <td>
                            <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtDayPrice" ErrorMessage="节日价格格式不正确!" ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td><strong>节日时间:</strong></td>
                        <td>
                            <div id='hotelDiv'>
                                <asp:TextBox ID='TextBox15' runat="server" Text="" CssClass="form-control" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>至 
									<asp:TextBox ID='TextBox16' runat="server" Text="" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" CssClass="form-control"></asp:TextBox>
                            </div>
                            <input id='IntervallCheckInAndChekOut' value='1' type='hidden' />
                            <input id='Hidden1' type='hidden' runat="server" />
                            <asp:HiddenField ID="HiddenField8" runat="server" Value='2010-8-31' />
                            <div id='m_contentend'></div>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>预订价格:</strong></td>
                        <td>
                            <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtBookPrice" ErrorMessage="预订价格格式不正确!"
                                ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td><strong>预订时间:</strong></td>
                        <td>
                            <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control"></asp:TextBox>
                            <font color="red">节日时间提前N天为预订价</font>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtBookDay" ErrorMessage="预订时间格式不正确!"
                                ValidationExpression="\d+" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <strong>允许批发：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal"
                                            Width="106px">
                                            <asp:ListItem Value="1" onclick="show(this);">是</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="0" onclick="show(this);">否</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr id="pifaji" style="display: none">
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="height: 24px">① 一次性购买此商品数量满
																<asp:TextBox ID="TextBox19" runat="server" Text='10' CssClass="form-control" Width="50px" />
                                                    时，批发价为
																<asp:TextBox ID="TextBox20" runat="server" CssClass="form-control" Width="80px">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="24">② 一次性购买此商品数量满
																<asp:TextBox ID="TextBox21" runat="server" Text='50' CssClass="form-control" Width="50px" />
                                                    时，批发价为
																<asp:TextBox ID="TextBox22" runat="server" CssClass="form-control" Width="80px">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="24">③ 一次性购买此商品数量满
																<asp:TextBox ID="TextBox23" runat="server" Text='100' CssClass="form-control" Width="50px" />
                                                    时，批发价为
																<asp:TextBox ID="TextBox24" runat="server" CssClass="form-control" Width="80px">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>允许单独交易：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal"
                                Width="106px">
                                <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <strong>购买积分：</strong>
                        </td>
                        <td>购买赠送<asp:TextBox ID="TextBox25" runat="server" CssClass="form-control" />
                            积分
										<asp:RegularExpressionValidator CssClass="l_input" ID="RegularExpressionValidator9" runat="server"
                                            ControlToValidate="Integral" ErrorMessage="积分必须是数字!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </tbody>
                <tbody id="Tabs4" style="display: none">
                    <tr>
                        <td width="20%">
                            <strong>促销方案：</strong>
                        </td>
                        <td valign="top">
                            <table style="width: 100%;">
                                <tr>
                                    <td rowspan="5" valign="top">
                                        <asp:RadioButtonList ID="Preset" runat="server" CssClass="table table-bordered">
                                            <asp:ListItem Value="1"></asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                            <asp:ListItem Value="3"></asp:ListItem>
                                            <asp:ListItem Value="4"></asp:ListItem>
                                            <asp:ListItem Value="5"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="table table-bordered ftable">
                                            <tr>
                                                <td style="line-height: 33px;">不促销
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="line-height: 33px;">&nbsp;买&nbsp;<asp:TextBox ID="TextBox1" Text="1" runat="server" CssClass="form-control" Width="40px"></asp:TextBox>
                                                    送&nbsp;<asp:TextBox ID="TextBox2" runat="server" Text="1" CssClass="form-control" Width="40px"></asp:TextBox>同样商品
                                                <div class="clearfix"></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="line-height: 33px;" style="line-height: 33px;">&nbsp;买&nbsp;<asp:TextBox Text="1" ID="TextBox3" runat="server" CssClass="form-control" Width="40px"></asp:TextBox>
                                                    送其他商品 赠品名称：<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <asp:Button ID="Button6" CssClass="btn btn-primary" runat="server" Text="浏览..." />
                                                    <asp:HiddenField ID="regproid" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="line-height: 33px;">&nbsp;送&nbsp;<asp:TextBox ID="TextBox5" runat="server" Text="1" CssClass="form-control" Width="40"></asp:TextBox>
                                                    同样商品
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="line-height: 33px;">&nbsp;送其他商品 赠品名称：<asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <asp:Button ID="Button7" CssClass="btn btn-primary" runat="server" Text="浏览..." />
                                                    <asp:HiddenField ID="regproidother" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </tbody>
                <tbody id="Tabs5" style="display: none">
                    <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                </tbody>
                <tbody id="Tabs7" style="display: none">
                    <tr>
                        <td id="tdDeliverMoney" colspan="2" runat="server"></td>
                    </tr>
                </tbody>
                <tbody style="display: none">
                    <tr>
                        <td width="20%" style="height: 24px">
                            <strong>更新时间：</strong>
                        </td>
                        <td style="height: 24px; width: 592px;">
                            <asp:TextBox ID="UpdateTime" runat="server" />
                            <span class="STYLE1">*<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                ControlToValidate="UpdateTime" Display="Dynamic" ErrorMessage="更新时间不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <strong>内容页模板：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="ModeTemplate" runat="server" />
                            <input type="button" value="选择模板" onclick="WinOpenDialog(<%=CustomerPageAction.customPath2+"Template/TemplateList.aspx?OpenerText="%>    +escape('ModeTemplate')+'&FilesDir=',650,480)" class="btn" />
                        </td>

                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="EBtnSubmit" Text="保存商品信息" runat="server" CssClass="btn btn-primary" OnClientClick="numChange('0');" OnClick="EBtnSubmit_Click1" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" />
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript" src="/Common/Common.js"></script>
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script>
        var aid = 0;
        var showID = 0;
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6", "TabTitle7");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3", "Tabs4", "Tabs5", "Tabs6", "Tabs7");
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
                aid = SID;
            }
        }

        function ShowTable() {
            if (aid < 7) {
                aid = aid + 1;
            }
            if (aid < 7) {
                ShowTabss(aid);
            }
        }

        function showup() {
            if (aid > 0) {
                aid = aid - 1;
            }
            if (aid >= 0 && aid < 8) {
                ShowTabss(aid);
            }
        }

        function deleteRow(tableID, rowIndex, rowsid) {
            var ccd = confirm('你确定将此绑定的商品删除吗？');
            if (ccd) {
                var table = document.all[tableID]
                var bindstr = "," + document.getElementById("Hiddenbind").value + ",";
                rowsid = "," + rowsid + ",";
                var reg = new RegExp(rowsid, "g")
                bindstr = bindstr.replace(reg, ",");
                reg = new RegExp(",,", "g")
                bindstr = bindstr.replace(reg, ",");
                document.getElementById("Hiddenbind").value = bindstr;
                table.deleteRow(rowIndex);
                document.getElementById("Hiddenbind").value = document.getElementById("Hiddenbind").value.replace(reg, ",");
                if (document.getElementById("Hiddenbind").value == "" || document.getElementById("Hiddenbind").value == ",") {
                    document.getElementById("Span1").innerHTML = "";
                    document.getElementById("Hiddenbind").value = "";
                }
            }
        }

        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id && elm[i].id.indexOf("Item", false) > -1) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }

        function SelectProducer() {
            window.open('Producerlist.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }
        //团购信息
        function OpenSelect2() {

            window.open('TGALL.aspx?shopid=<%=Request.QueryString["ID"] %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
            return false;
        }

        function OpenSelect() {

            window.open('AddbindPro.aspx?id=<%=Request.QueryString["ID"] %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
            return false;
        }

        function ProductsSelect(act) {
            window.open('ProductsSelect.aspx?act=' + act, '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }

        function OpenprojectSelect() {

            window.open('projectSelect.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
            return false;
        }

        function ClearSelect() {
            document.getElementById("Span1").innerHTML = "";
            document.getElementById("Hiddenbind").value = "";
        }

        function SelectBrand() {
            window.open('Brandlist.aspx?producer=' + document.getElementById('Producer').value + '', '', 'width=600,height=450,resizable=0,scrollbars=yes');

        }

        function SetDisabled(checked) {
            document.getElementById('ProCode').disabled = checked;
        }

        function show(checked) {
            if (checked.value == 1) {
                document.getElementById("pifaji").style.display = "";
            }
            else {
                document.getElementById("pifaji").style.display = "none";
            }
        }

        function showpf() {
            if (document.getElementById("Wholesales_0").checked == true) {
                document.getElementById("pifaji").style.display = "";
            } else {
                document.getElementById("pifaji").style.display = "none";
            }
        }

        function Clearoption() {
            var hiddenidvalue = document.getElementById("OtherProject"); //获取已经存在的ID值

            for (var i = hiddenidvalue.options.length - 1; i >= 0; i--) {
                if (hiddenidvalue[i].selected == true) {
                    hiddenidvalue[i] = null;
                }
            }

        }

        function ShowGuess(obj) {
            switch (obj) {
                case 1:
                    document.getElementById("Guess1").style.display = "none";
                    document.getElementById("Guess2").style.display = "none";
                    break;
                case 2:
                    document.getElementById("Guess1").style.display = "";
                    document.getElementById("Guess2").style.display = "none";
                    break;
                case 3:
                    document.getElementById("Guess1").style.display = "none";
                    document.getElementById("Guess2").style.display = "";
                    break;
            }

             
        }

        function ShowInterference(i) {
            switch (i) {
                case 1:
                    document.getElementById("tableInterference").style.display = "none";
                    break;
                case 2:
                    document.getElementById("tableInterference").style.display = "";
                    document.getElementById("Panel1").style.display = "";
                    document.getElementById("Panel2").style.display = "none";
                    document.getElementById("Panel3").style.display = "none";
                    break;
                case 3:
                    document.getElementById("tableInterference").style.display = "";
                    document.getElementById("Panel1").style.display = "none";
                    document.getElementById("Panel2").style.display = "";
                    document.getElementById("Panel3").style.display = "none";
                    break;
                case 4:
                    document.getElementById("tableInterference").style.display = "";
                    document.getElementById("Panel1").style.display = "none";
                    document.getElementById("Panel2").style.display = "none";
                    document.getElementById("Panel3").style.display = "";
                    break;
            }
        }

        function buttonclick(username, userid) {
            var objlist = document.getElementById("ListBox1");
            node = document.createElement("<option   value='" + userid + "'>");
            text = document.createTextNode(username);
            node.appendChild(text);
            objlist.appendChild(node);

            for (var i = 0; i < objlist.length; i++) {
                objlist.options[i].selected = true;
            }
        }
        function deldata(userid) {
            var objlist = document.getElementById("ListBox1");
            for (i = objlist.length - 1; i >= 0; i--) {
                if (objlist.options[i].value == userid) {
                    objlist.remove(i);
                }
            }
        }

        function change(obj) {
            if (obj == "3") {
                document.getElementById("tpoint").style.display = "";
            } else {
                document.getElementById("tpoint").style.display = "none";
            }
        }
    </script>
    <script>
        function SelectFlower() 
        {
            //背景
            var bgObj = document.getElementById("bgDiv");
            bgObj.style.width = (document.body.offsetWidth) + "px";
            bgObj.style.height = screen.height + "px";
            //定义窗口
            var msgObj = document.getElementById("msgDiv");
            msgObj.style.marginTop = -75 + document.documentElement.scrollTop + "px";
            //关闭
            document.getElementById("msgShut").onclick = function () 
            {
                bgObj.style.display = msgObj.style.display = "none";
            }
            msgObj.style.display = bgObj.style.display = "block";
            msgDetail.innerHTML = "<p align=center><iframe src='SelectFlower.aspx' width='500' height='750' scrolling='no' frameborder='0'></iframe></p>"
        }
    </script>
    <script type="text/JavaScript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6", "TabTitle7");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2", "Tabs3", "Tabs4", "Tabs5", "Tabs6", "Tabs7");
        function ShowTabs(ID) {
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                document.getElementById(arrTabs[tID].toString()).style.display = "none";
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                tID = ID;
            }
        }
        function SelectProducer() {
            window.open('Producerlist.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }

        function SelectBrand() {
            window.open('Brandlist.aspx?producer=' + document.getElementById('Producer').value + '', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }
    </script>
    <script type="text/javascript">
        function GetPicurl(imgurl) {

        }

        function SetDisabled(checked) {
            document.getElementById('ProCode').disabled = checked;
        }

        function Setsmallimgs(checked) {
        }
        function show(checked) {

            if (checked.value == 1) {
                document.getElementById("pifaji").style.display = "";
            } else {
                document.getElementById("pifaji").style.display = "none";
            }
        }

        function showpf() {
            if (document.getElementById("Wholesales_0").checked == true) {
                document.getElementById("pifaji").style.display = "";
            } else {
                document.getElementById("pifaji").style.display = "none";
            }
        }

        function deleteRow(tableID, rowIndex, rowsid) {
            var ccd = confirm('确定删除此花材吗？');
            if (ccd) {
                var table = document.all[tableID]
                var bindstr = "," + document.getElementById("HiddenField1").value + ",";
                rowsid = "," + rowsid + ",";
                var reg = new RegExp(rowsid, "g");
                bindstr = bindstr.replace(reg, ",");
                reg = new RegExp(",,", "g")
                bindstr = bindstr.replace(reg, ",");
                document.getElementById("HiddenField1").value = bindstr;
                table.deleteRow(rowIndex);
                document.getElementById("HiddenField1").value = document.getElementById("HiddenField1").value.replace(reg, ",");
                if (document.getElementById("HiddenField1").value == "" || document.getElementById("HiddenField1").value == ",") {
                    document.getElementById("ShiPrice").disabled = "";
                    document.getElementById("LinPrice").disabled = "";
                    document.getElementById("txtDayPrice").disabled = "";
                    document.getElementById("txtBookPrice").disabled = "";
                    document.getElementById("Span2").innerHTML = "";
                    document.getElementById("HiddenField1").value = "";
                } else {
                    numChange('0');
                }
            }
        }

        function ClearSelect() {
            document.getElementById("Span2").innerHTML = "";
            document.getElementById("HiddenField1").value = "";
            document.getElementById("ShiPrice").value = "";
            document.getElementById("LinPrice").value = "";
            document.getElementById("hfprice").value = "";
            document.getElementById("LinPrice").disabled = "";
            document.getElementById("ShiPrice").disabled = "";
            document.getElementById("txtDayPrice").value = "";
            document.getElementById("txtBookPrice").value = "";
            document.getElementById("hfBookprice").value = "";
            document.getElementById("hfFesPrice").value = "";
            document.getElementById("txtBookPrice").disabled = "";
            document.getElementById("txtDayPrice").disabled = "";
        }

        //花材数量改变
        function numChange(obj) {
            if (document.getElementById("HiddenField1").value != "") {
                if (obj != '0' && isNaN(document.getElementById("pronums" + obj).value)) {
                    document.getElementById("ShiPrice").value = "";
                    document.getElementById("LinPrice").value = "";
                    document.getElementById("hfBookprice").value = "";
                    document.getElementById("hfFesPrice").value = "";
                    document.getElementById("txtDayPrice").value = "";
                    document.getElementById("txtBookPrice").value = "";
                    document.getElementById("hfprice").value = "";
                    alert("请输入数字");
                } else {
                    var hidPrice = 0;   //花材总价格
                    var bookprices = 0;   //花材预订价
                    var festprices = 0;   //花材节日价
                    var hid = document.getElementById("HiddenField1").value;
                    var hidNum = "";
                    var hids = hid.split(',');
                    for (i = 0; i < hids.length; i++) {
                        if (hids[i] != "") {
                            var num = 0;
                            var price = 0;
                            var bookprice = 0;  //预订价
                            var festprice = 0;   //节日价
                            if (document.getElementById("pronums" + hids[i]).value != "")
                                num = parseInt(document.getElementById("pronums" + hids[i]).value);
                            price = parseFloat(document.getElementById("prices" + hids[i]).innerText.substring(1));
                            bookprice = parseFloat(document.getElementById("bookprice" + hids[i]).innerText.substring(1));
                            festprice = parseFloat(document.getElementById("festprice" + hids[i]).innerText.substring(1));
                            hidNum = hidNum + "," + num;
                            hidPrice = hidPrice + (num * price);
                            bookprices = bookprices + (num * bookprice);
                            festprices = festprices + (num * festprice);
                        } else {
                            hidNum = hidNum + ",0";
                        }
                    }
                    document.getElementById("ShiPrice").value = hidPrice;
                    document.getElementById("LinPrice").value = hidPrice;
                    document.getElementById("hfBookprice").value = bookprices;
                    document.getElementById("hfFesPrice").value = festprices;
                    document.getElementById("txtDayPrice").value = bookprices;
                    document.getElementById("txtBookPrice").value = festprices;
                    document.getElementById("hfprice").value = hidPrice;
                    document.getElementById("LinPrice").disabled = "disabled";
                    document.getElementById("ShiPrice").disabled = "disabled";
                    document.getElementById("txtDayPrice").disabled = "disabled";
                    document.getElementById("txtBookPrice").disabled = "disabled";
                    if (hidNum.substring(0, 1) == ",") {
                        hidNum = hidNum.substring(1);
                    }
                    if (hidNum.substring(hidNum.length - 1) == ",") {
                        hidNum = hidNum.substring(0, hidNum.length - 1);
                    }
                    document.getElementById("hidNum").value = hidNum;
                }
            }
        }

        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }

        $().ready(function(){
            show(document.getElementById("Wholesales"));
            SelUnit();
        });
        function SelUnit(){
            var units= "件,个,只,组,套,把,双,台,年,月,日,季";
            var array=units.split(",");
            for (var i = 0; i < array.length; i++) {
                var str="<button type='button' class='btn btn-default'>"+array[i]+"</button>"
                $("#Unitd").append(str);
            }
            $("#Unitd").find("button").click(function(){
                $("#ProUnit").val($(this).text());
            });
            
        }
    </script>
</asp:Content>
