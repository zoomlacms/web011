<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="manage_AddOn_ProjectAffairsCenter, App_Web_0sth0hzm" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>事务中心</title>
    <script type="text/javascript">
        function ShowCreate(result) {
            HideCreate();
            $("#" + result).show();
            //result.style.display = "";
        }

        function HideCreate() {
            for (i = 1; i < 5; i++) {
                eval("Tabs" + i).style.display = "none";
            }
        }
        function CheckAffair() {
            if (document.form1.TBTitle.value == "") {
                alert("请输入事务名称！");
                form1.TBTitle.focus();
                return false
            }
            if (document.form1.TbRemmber.value == "") {
                alert("请输入事务内容！");
                form1.TbRemmber.focus();
                return false
            }
        }
        //         function Refesh()
        //         {          
        //            window.location.reload();
        //          for(i=1;i<5;i++)
        //			{
        //				eval("crt"+i).style.display="none";	
        //			}
        //			crt2.style.display="";
        //ShowCreate(crt2);            
        // }	1
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">公共事务社区</a></li>
        <li><a href="#Tabs1" data-toggle="tab">我的备忘</a></li>
        <li><a href="#Tabs2" data-toggle="tab">即时会话聊天</a></li>
        <li><a href="#Tabs3" data-toggle="tab">项目文档管理</a></li>
    </ul>

    <div class="clearbox"></div>
    <div class="tab-content">
        <!--我的备忘-->
        <div class="tab-pane" id="Tabs1">
            <table class="table table-bordered table-hover">
                <tr class="title">
                    <td colspan="2" style="height: 23px">&nbsp我的备忘</td>
                </tr>
                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                    <td colspan="2" style="height: 350px">
                        <asp:TextBox ID="TBxRemmber" class="form-control-static" runat="server" Height="200px" Width="800" TextMode="MultiLine" Rows="20" Columns="80" AutoPostBack="true" OnTextChanged="AutoSave"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <!--项目文档管理-->
        <div class="tab-pane" id="Tabs3">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr style="height: 23px">
                        <td colspan="5" style="height: 23px">&nbsp;项目文档管理<span class="pull-right"><asp:Literal ID="LitParentDirLink" runat="server"></asp:Literal></span></td>
                    </tr>
                </thead>

                <tr>
                    <td>当前目录：<asp:Label ID="lblDir" runat="server" Text="/"></asp:Label>
                    </td>
                    <td></td>
                </tr>
                <tr class="title" style="height: 23px">

                    <td>
                        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="新建文档" OnClick="AddAffairs_Click" /></td>
                    <td>目录名称：</td>
                    <td>
                        <asp:TextBox ID="txtForderName" class="form-control" runat="server" Width="200"></asp:TextBox></td>
                    <td>
                        <asp:Button ID="btnCreateFolder" runat="server" class="btn btn-primary" Text="新建目录" OnClick="btnCreateFolder_Click" />
                        <asp:HiddenField ID="HdnPath" runat="server" />
                    </td>
                    <td></td>
                </tr>
                <tr class="title" style="height: 23px">


                    <td>名称</td>
                    <td>大小</td>
                    <td>类型</td>
                    <td>修改时间</td>
                    <td>操作</td>
                </tr>
                <asp:Repeater ID="repFile" runat="server" OnItemCommand="repFileReName_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <img alt="" src=' <%# System.Convert.ToInt32(Eval("type")) == 1 ? "/App_Themes/AdminDefaultTheme/Images/Node/closefolder.gif" :"/App_Themes/AdminDefaultTheme/Images/Node/singlepage.gif" %>' />
                                <a href="<%# System.Convert.ToInt32(Eval("type")) == 1 ?  "ProjectAffairsCenter.aspx?Dir=" + Server.UrlEncode(Request.QueryString["Dir"] +"/"+ Eval("Name").ToString()):"ProjectAffairsAdd.aspx?TxtPath="+ Server.UrlEncode(Request.QueryString["Dir"] +"/"+ Eval("Name").ToString()) %>">
                                    <%# Eval("Name") %></a>
                            </td>
                            <td><%# GetSize(Eval("size").ToString()) %></td>
                            <td>
                                <asp:HiddenField ID="HdnFileType" Value='<%#Eval("type") %>' runat="server" />
                                <%# System.Convert.ToInt32(Eval("type")) == 1 ? "文件夹" : Eval("content_type").ToString() + "文件" %></td>
                            <td><%#Eval("lastWriteTime")%></td>
                            <td>&nbsp;				
			<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>' OnClientClick="return confirm('你确认要删除该文件夹或文件吗？')"><%# Flag==true?"删除":""%></asp:LinkButton>
                                <asp:LinkButton ToolTip="提示：右键选[另存为]即可下载到本地" ID="downbtn" runat="server" CommandName="DownFile" CommandArgument='<%#Eval("Name").ToString() %>'>
                                    <%# System.Convert.ToInt32(Eval("type")) == 1?"":"下载" %>
                                </asp:LinkButton>
                                
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </table>
        </div>
        <!--公用记事本-->
        <div class="tab-pane" id="Tabs2">
            <table class="table table-bordered table-hover">
                <tr class="title">
                    <td colspan="2" style="height: 23px">&nbsp即时会话聊天:</td>
                </tr>

                <tr>
                    <td>内容显示：</td>
                    <td>
                        <asp:TextBox ID="TxB" runat="server" Width="50%" Height="120px" CssClass="form-control-static" TextMode="MultiLine"></asp:TextBox>
                        <div class="container">
                            <asp:Button ID="Button2" runat="server" Text="刷新" OnClick="EBtnRefesh_Click" class="btn btn-primary" />
                            <asp:Button ID="BtClean" class="btn btn-primary" runat="server" Text="清空" OnClientClick="javascript:return confirm('你确定要清空公共记事本内容吗!');" OnClick="EBtnClean_Click" />
                        </div>

                    </td>
                </tr>

                <tr class="tdbg">
                    <td>新内容：</td>
                    <td class="bqright" style="padding: 0px;">
                        <div>
                            <asp:TextBox ID="TBComment" class="form-control" runat="server"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnNote" runat="server" Text="发送" class="btn btn-primary" OnClick="btnNote_Click" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!--BBS池-->
        <div class="tab-pane active" id="Tabs0">
            <table class="table table-bordered table-hover">
                <tr class="title">
                    <td colspan="2" style="height: 23px">&nbsp;&nbsp;公共事务社区:</td>
                </tr>
                <tr class="title">
                    <td colspan="2" style="height: 23px">
                        <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="ID" ShowHeader="false" PageSize="5" OnPageIndexChanging="Egv_PageIndexChanging" Width="100%" OnRowCommand="GridView1_RowCommand" EmptyDataText="无相关讨论内容">
                            <Columns>
                                <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel" runat="server" Visible="false" />
                                    </ItemTemplate>
                                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MainTitleID" HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" Width="5%" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#DataBinder.Eval(Container.DataItem, "AuthorName").ToString()%> <%#DataBinder.Eval(Container.DataItem, "EditTime").ToString()%>
                                        <br />
                                        <a href='#' onclick="window.open('ProjectAffairsShow.aspx?PAid=<%# Eval("ID")%>','事务内容', 'width=450,height=560,resizable=1,scrollbars=auto')"><%#DataBinder.Eval(Container.DataItem, "Title").ToString()%> </a>
                                    </ItemTemplate>

                                    <ItemStyle CssClass="tdbg" HorizontalAlign="Left" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteAffairs" OnClientClick="return confirm('确实要删除吗？');"
                                            CommandArgument='<%# Eval("ID")%>'><%# Flag==true?"删除":"" %></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="ReplyAffairs"
                                            CommandArgument='<%# Eval("ID")%>'>回复</asp:LinkButton>

                                    </ItemTemplate>

                                    <ItemStyle CssClass="tdbg" HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
                            <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
                            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
                        </asp:GridView>
                        <div class="clearbox"></div>
                    </td>
                </tr>
                <tr>
                    <td>标题：</td>
                    <td>
                        <asp:TextBox ID="TBTitle" runat="server" class="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>评论内容：</td>
                    <td>
                        <div style="float: left;"></div>
                        <asp:TextBox ID="TbRemmber" runat="server"
                            TextMode="MultiLine" Rows="8" Columns="50" class="form-control" Height="101px"></asp:TextBox>

                        <div>
                            &nbsp;
                <asp:Button ID="BtnSubmit" runat="server" Text="发送" OnClientClick="return CheckAffair();" OnClick="EBtnSubmit_Click" class="btn btn-primary" />
                            <asp:Button ID="BtnSave" runat="server" Text="保存" OnClick="EBtnReply_Click" Visible="false" class="btn btn-primary" />
                            <asp:HiddenField ID="HfdMid" runat="server" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
