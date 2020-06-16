<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyResult, App_Web_tlu33zqh" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>问卷投票结果</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>

    <script src="Js/highcharts.js" type="text/javascript"></script>
    <script src="Js/exporting.js" type="text/javascript" charset="gb2312"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">后台管理&gt;&gt;<a href="SurveyManage.aspx">问卷投票管理</a>&gt;&gt;问卷投票结果</div>
        <table class="border" width="100%" cellpadding="2" cellspacing="1">
            <tr>
                <td class="spacingtitle" style="line-height: 26px; text-align: center; background-color: #8dc2ee; font-size: 16px; font-weight: bolder;">
                    <asp:Label ID="lblSurveyName" runat="server" Style="letter-spacing: normal"></asp:Label></td>
            </tr>
            <tr>
                <td class="tdbg" style="line-height: 25px; text-align: left;">
                    <asp:Label ID="lblDesp" runat="server" Style="word-wrap: break-word; word-break: break-all; padding-left: 30px;"> 没有添加问卷描述。。。。</asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr align="center">
                            <td id="TabTitle0" name="TabTitle0" class="titlemouseover" onclick="ShowTabs('Tabs0','TabTitle0')">结果统计</td>
                            <td id="TabTitle1" name="TabTitle1" class="tabtitle" onclick="ShowTabs('Tabs1','TabTitle1')">结果统计</td>
                            <td id="TabTitle2" name="TabTitle2" class="tabtitle" onclick="ShowTabs('Tabs2','TabTitle2')">详细信息</td>
                            <td>&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tabs0">
                <td>
                    <table style="width: 100%; height: 20px; color: black; background-color: white;" cellpadding="2" cellspacing="1" class="border">
                        <tr class="tdbg">
                            <th>问题选项</th>
                            <th>问题分数</th>
                            <th>选择人数</th>
                        </tr>
                        <%= GetAll() %>
                        <tr class="tdbg">
                            <td colspan="4">
                                <h4>公式：(A*N+B*N+C*N+D*N)/总问卷数/9*100<br />
                                    注：N=单项投票总数
                                </h4>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tabs1" style="display:none;">
                <td class="tdbg">
                    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField HeaderText="问卷提交用户ID" DataField="Userid" />
                            <asp:BoundField HeaderText="用户得分" DataField="AnswerScore" />
                        </Columns>
                        <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                        <RowStyle Height="24px" HorizontalAlign="Center" />
                    </ZL:ExGridView>
                </td>
            </tr>
            <tr id="Tabs2" style="display:none;">
                <td class="tdbg">
                    <asp:Repeater ID="rptReuslt" runat="server" OnItemDataBound="rptReuslt_ItemDataBound">
                        <ItemTemplate>
                            <table style="width: 100%;">
                                <tr class="title">
                                    <td colspan="3" style="line-height: 25px;">第 <%#Container.ItemIndex +1 %>  题 : <%# Eval("QuestionTitle") %> [<%# GetQuesType(Eval("TypeID")) %>] </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTip" Visible="true" runat="server" Text="文本内容不可查看。。。"></asp:Label>
                                    </td>
                                </tr>
                                <asp:Repeater ID="rptOption" runat="server">
                                    <ItemTemplate>
                                        <tr class="options">
                                            <td style="width: 40%;">( <%# Convert.ToChar(Container.ItemIndex + 65) %> ) 、 <%# Container.DataItem %></td>
                                            <td style="width: 50%;">
                                                <asp:Image ID="imgBar" runat="server" ImageUrl="~/images/redline.jpg" Height="20px" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPercent" runat="server" Style="padding-left: 15px; color: red; font-size: 12px;"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr>
                                    <%# GetScore(Eval("QuestionID","{0}"),Eval("TypeID","{0}")) %>
                                </tr>
                            </table>

                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td class="tdbg" style="text-align: right; padding-right: 50px;">统计总分：<span style="color: #f00"><%=GetCountScore() %></span></td>
            </tr>
            <tr class="tdbgbottom">
                <td>
                    <input name="print" type="button" id="Button1" class="C_input" value="打印" onclick="window.print();" />&nbsp;&nbsp;
        <input name="Cancel" type="button" id="Cancel" class="C_input" value="返回" onclick="window.location.href = 'SurveyManage.aspx';" /></td>
            </tr>
        </table>
        <div id="container" style="width: 200px; height: 300px; margin: 0; float: left"></div>
        <style>
            #Tabs0 table td{ text-align:center;}
        </style>
        <script type="text/javascript">
            //保留小数点后一位
            function Decimal(x) {
                var f_x = parseFloat(x);
                if (isNaN(f_x)) {
                    alert('参数为非数字，无法转换！');
                    return false;
                }
                var f_x = Math.round(x * 10) / 10;

                return f_x;
            }
            var chart;
            $(document).ready(function () {
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'container',
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '<%=BiaoS.Title %>'
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.point.name + '</b>: ' + Decimal(this.percentage) + ' %';
                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                formatter: function () {
                                    return '<b>' + this.point.name + '</b>: ' + Decimal(this.percentage) + ' %';
                                }
                            }
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: 'Browser share',
                        data: [<%=BiaoS.X  %>//这里决定显示的值
                        ]
                    }]
                });
            });
            function ShowTabs(id, tdid)
            {
                if (id == "Tabs2") {
                    $("#TabTitle0").removeClass("titlemouseover").addClass("tabtitle");
                    $("#TabTitle1").removeClass("titlemouseover").addClass("tabtitle");
                    $("#TabTitle2").removeClass("tabtitle").addClass("titlemouseover");
                    $("#Tabs0").hide();
                    $("#Tabs1").hide();
                    $("#Tabs2").show();
                }
                else if (id == "Tabs1")
                {
                    $("#TabTitle0").removeClass("titlemouseover").addClass("tabtitle");
                    $("#TabTitle1").removeClass("tabtitle").addClass("titlemouseover");
                    $("#TabTitle2").removeClass("titlemouseover").addClass("tabtitle");
                    $("#Tabs0").hide();
                    $("#Tabs1").show();
                    $("#Tabs2").hide();
                }
                else
                {
                    $("#TabTitle0").removeClass("tabtitle").addClass("titlemouseover");
                    $("#TabTitle1").removeClass("titlemouseover").addClass("tabtitle");
                    $("#TabTitle2").removeClass("titlemouseover").addClass("tabtitle");
                    $("#Tabs0").show();
                    $("#Tabs1").hide();
                    $("#Tabs2").hide();
                }
            }
        </script>
    </form>
</body>
</html>
