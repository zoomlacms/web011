<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_ServerClusterConfig, App_Web_5arvbvnz" masterpagefile="~/Manage/Site/SiteMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link  type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="/dist/js/bootstrap.min.js" type="text/javascript"></script>
<title>集群配置</title>
<style>
input, button, select, textarea {line-height:10px;}
th{text-align:center;}
#m_site{ margin-top:15px;}
#site_nav ul, ol{margin-bottom:0px;}
</style>
<script type="text/javascript" >
    function HidDiv() {
        $("#fileup_div").hide();
    }
    function ShowDiv() {
        console.log("123123");
        $("#fileup_div").show();
    }
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >> 集群配置>>[<a id="add_s" href="javascript:;"  onclick="ShowDiv()" style="color:red;">添加服务器集群</a>]</p></div>
    <div id="site_main" style="margin-left:2%;">
    <div id="tab3">
    <div style="width:100%">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="True" RowStyle-CssClass="tdbg" 
            MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1" Width="100%" OnRowCommand="EGV_RowCommand" OnRowCancelingEdit="EGV_RowCancelingEdit"
            GridLines="None" EnableTheming="False" PageSize="5" EmptyDataText="没有任何数据！" OnPageIndexChanging="EGV_PageIndexChanging"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true"/>
                <asp:TemplateField HeaderText="网址">
                    <ItemTemplate>
                        <a href="<%#Eval("SiteUrl") %>" target="_blank" title=""><%#Eval("SiteUrl") %></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSiteUrl" Text='<%#Eval("SiteUrl") %>' style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="网站名称">
                    <ItemTemplate>
                        <%#Eval("SiteName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSiteName" Text='<%#Eval("SiteName") %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用户名">
                    <ItemTemplate>
                        <%#Eval("SiteUser") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSiteUser" Text='<%#Eval("SiteUser") %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="密码" Visible="false">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eSitePasswd" Text='<%#cr.Decrypt(Eval("SitePasswd")as string) %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                    <asp:TemplateField HeaderText="后台路径">
                    <ItemTemplate>
                        <%#Eval("CustomPath") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="eCustomPath" Text='<%#Eval("CustomPath") %>'  style="text-align:center;" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>'>修改</asp:LinkButton>
                       <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗');">删除</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                     <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("ID") %>'>更新</asp:LinkButton>
                     <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
    </div>
        <div class="modal" id="fileup_div" style="position: fixed; top: 15%;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" onclick="HidDiv()" class="close" id="btn" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <span class="modal-title" style="font-size: 20px; font-family:'Microsoft YaHei' " id="FileUP_Title">添加服务器集群</span>
                    </div>
                    <div class="modal-body" style="height: 300px;">
                        <div style="padding-bottom: 0px;">
                            <span style="color: red;">*</span><span>目标服务器上必须拥有一个部署好的站群，方可添加成功，构建起服务器集群。</span>
                        </div>
                        <table id="add_table" runat="server" class=" table" style="margin-top: 10px; display: block;">
                            <tr><td class="tdname">主控站点网址：</td>
                                <td>
                                    <asp:TextBox runat="server" ID="siteUrl" Stlye="float:left;" CssClass=" form-control" /><span style="float: left;">示例:http://www.baidu.com/ </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdname">主控站点管理员账号：</td>
                                <td>
                                    <asp:TextBox runat="server" ID="siteUser" CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdname">主控站点管理员密码：</td>
                                <td>
                                    <asp:TextBox runat="server" TextMode="Password" ID="sitePasswd" CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" ID="GetCustomPath" Text="获取目标服务器信息" OnClick="GetCustomPath_Click" CssClass="btn btn-primary" /></td>
                            </tr>
                        </table>
                        <table class="table" runat="server" id="table_ul" style="margin-top: 10px; display: none; height: 5%;">
                            <tr>
                                <td class="tdname">
                                    <span><span class="glyphicon glyphicon-ok" style="color: green; margin-right: 5px;"></span>获取成功! 站点名称：</span>
                                </td>
                                <td class="tdtext">
                                    <asp:TextBox runat="server" ID="siteName" CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdname">
                                    <span>后台路径：</span>
                                </td>
                                <td class="tdtext">
                                    <asp:TextBox runat="server" ID="NewcustomPath" CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button runat="server" ID="backBtn" CssClass="btn btn-primary" OnClick="backBtn_Click" Text="返回上一步" />
                                    <asp:Button runat="server" ID="addBtn" OnClick="addBtn_Click" Text="保存远程服务器集群" CssClass="btn btn-primary" /></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="HidDiv()" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
