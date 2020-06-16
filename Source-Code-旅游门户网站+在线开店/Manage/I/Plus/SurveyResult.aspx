<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyResult, App_Web_0t1uxiqn" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问卷投票结果</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover" width="100%" cellpadding="2" cellspacing="1">
        <tr>
            <td style="text-align: center; font-size: 16px; font-weight: bolder;">
                <asp:Label ID="lblSurveyName" runat="server" Style="letter-spacing: normal"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <asp:Label ID="lblDesp" runat="server" Style="word-wrap: break-word; word-break: break-all; padding-left: 30px;"> 没有添加问卷描述。。。。</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#Tabs0" data-toggle="tab">总分评测</a></li>
                    <li><a href="#Tabs1" data-toggle="tab">用户清单</a></li>
                    <li><a href="#Tabs2" data-toggle="tab">详细信息</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="Tabs0">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>问题选项</th>
                                <th>问题分数</th>
                                <th>选择人数</th>
                            </tr>
                            <%= GetAll() %>
                            <tr>
                                <td colspan="4">
                                    <h4>
                                        公式：(A*N+B*N+C*N+D*N)/总问卷数/9*100<br />
                                        注：N=单项投票总数
                                    </h4>
                                    
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="tab-pane" id="Tabs1">
                        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" Width="100%" Height="20px" AllowPaging="True" AllowSorting="True" CellPadding="2" CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" RowStyle-CssClass="tdbg" GridLines="None" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField HeaderText="问卷提交用户ID" DataField="Userid" />
                                <asp:BoundField HeaderText="用户得分" DataField="AnswerScore" />
                            </Columns>
                            <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                            <RowStyle Height="24px" HorizontalAlign="Center" />
                        </ZL:ExGridView>
                    </div>
                    <div class="tab-pane" id="Tabs2">
                        <asp:Repeater ID="rptReuslt" runat="server" OnItemDataBound="rptReuslt_ItemDataBound">
                            <ItemTemplate>
                                <table class="table table-striped table-bordered table-hover">
                                    <tr>
                                        <td colspan="3" style="">第 <%#Container.ItemIndex +1 %>  题 : <%# Eval("QuestionTitle") %> [<%# GetQuesType(Eval("TypeID")) %>] </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTip" Visible="true" runat="server" Text="文本内容不可查看。。。"></asp:Label>
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="rptOption" runat="server">
                                        <ItemTemplate>
                                            <tr>
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
                        </asp:Repeater>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; padding-right: 50px;">统计总分：<span style="color: #f00"><%=GetCountScore() %></span></td>
        </tr>
        <tr>
            <td class="text-center">
                <input name="print" type="button" id="Button1" class="btn btn-primary" value="打印" onclick="window.print();" />
                <input name="Cancel" type="button" id="Cancel" class="btn btn-primary" value="返回" onclick="window.location.href = 'SurveyManage.aspx';" />
            </td>
        </tr>
    </table>
    <div id="container" style="width: 200px; height: 300px; margin: 0; float: left"></div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>
        #Tabs0 table td{ text-align:center;}
    </style>
    <script src="Js/highcharts.js" type="text/javascript"></script>
    <script src="Js/exporting.js" type="text/javascript" charset="gb2312"></script>
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
    </script>
</asp:Content>
