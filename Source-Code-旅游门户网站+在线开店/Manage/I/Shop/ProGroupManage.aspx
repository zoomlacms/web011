<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_ProGroupManage, App_Web_enu4lwhk" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>团购管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="divline" style="padding-left: 10px">
    </div>
    <div class="clearbox">
    </div>

    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                <span>
                    <b>请选择排列顺序：</b>
                    <asp:DropDownList ID="txtbyfilde" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
                    <asp:DropDownList ID="txtbyOrder" CssClass="form-control" Width="150" runat="server"></asp:DropDownList>
                </span>
                <span><b>可添加商品：</b><asp:Label ID="lblAddContent" runat="server" Text=""></asp:Label></span>

            </td>
        </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tabss">
            <tr class="title">
                <td width="3%" height="28" align="center">
                    <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
                </td>
                <td width="3%" align="center">
                    <span>ID</span>
                </td>
                <td width="12%" align="center">
                    <span>商品图片</span>
                </td>
                <td width="17%" align="center">
                    <span>商品名称</span>
                </td>
                <td width="5%" align="center">
                    <span>单位</span>
                </td>
                <td width="5%" align="center">
                    <span>库存</span>
                </td>
                <td width="6%" align="center">
                    <span>当前价格</span>
                </td>
                <td width="6%" align="center">
                    <span>团定人数</span>
                </td>
                <td width="5%" align="center">
                    <span>推荐</span>
                </td>
                <td width="6%" align="center">
                    <span>商品属性</span>
                </td>
                <td width="6%" align="center">
                    <span>销售中</span>
                </td>
                <td width="7%" align="center">
                    <span>排序</span>
                </td>
                <td width="12%" align="center">
                    <span>操作</span>
                </td>
            </tr>
            <asp:Repeater ID="Productlist" runat="server">
                <ItemTemplate>
                    <tr class="tdbg" id="<%#Eval("id")%>" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" ondblclick="getinfo(this.id,<%#Eval("Nodeid") %>,<%#Eval("ModelID") %>)">
                        <td height="24" align="center">
                            <input name="Item" type="checkbox" value='<%# Eval("id")%>' />
                        </td>
                        <td height="24" align="center">
                            <%# Eval("id")%>
                        </td>
                        <td height="24" align="center" title="单击查看详情">
                            <a href="ShowProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">
                                <%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></a>
                        </td>
                        <td height="17" align="left" title="单击查看详情" style="cursor: pointer">
                            <a href="ShowProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>"
                                ondblclick="javascript:localhost.href('ShowProduct.aspx?menu=edit&ModelID={0}&NodeID={1}&id={2}'),<%#Eval("ModelID") %>,<%#Eval("Nodeid") %>,<%#Eval("id")%>">
                                <%#(Eval("Priority", "{0}") == "1") && (Convert.ToInt32(Eval("Propeid","{0}")) > 0) ? "<font color=maroon>[绑]</font>  " : ""%><%#Eval("proname")%></a>
                        </td>
                        <td height="24" align="center">
                            <%#Eval("ProUnit")%>
                        </td>
                        <td height="24" align="center">
                            <%#Stockshow(DataBinder.Eval(Container,"DataItem.id","{0}"))%>
                        </td>
                        <td height="24" align="center">
                            <%#Eval("NowPirce", "{0}")%>
                        </td>
                        <td height="24" align="center">
                            <%#Eval("GroupCount", "{0}")%>
                        </td>
                        <td height="24" align="center">
                            <%#Eval("Dengji")%>
                        </td>
                        <td height="24" align="center">
                            <%#forisbest(DataBinder.Eval(Container,"DataItem.isbest","{0}"))%>
                            <%#forishot(DataBinder.Eval(Container,"DataItem.ishot","{0}"))%>
                            <%#forisnew(DataBinder.Eval(Container,"DataItem.isnew","{0}"))%>
                        </td>
                        <td height="24" align="center">
                            <%#formattype(DataBinder.Eval(Container,"DataItem.Sales","{0}"))%>
                        </td>
                        <td align="center">
                            <a href="ProductManage.aspx?menu=DownMove&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">上移</a>
                            <a href="ProductManage.aspx?menu=UpMove&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">下移</a>
                        </td>
                        <td height="24" align="center">
                            <a onclick="open_title('ShowGroupUser.aspx?proid=<%#Eval("id")%>','团定列表')" href="###">团定列表</a>
                            <a href="AddProduct.aspx?menu=edit&ModelID=<%#Eval("ModelID") %>&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>">修改</a> <a href="ProductManage.aspx?menu=delete&NodeID=<%#Eval("Nodeid") %>&id=<%#Eval("id")%>"
                                onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="24" colspan="13" align="center" class="tdbgleft">
                    <div style="text-align: center" class="tdbg">
                        <span style="text-align: center">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
                            <asp:Label ID="Nextpage" runat="server" Text="" />
                            <asp:Label ID="Downpage" runat="server" Text="" />
                            <asp:Label ID="Endpage" runat="server" Text="" />
                            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                                Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                            条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            </asp:DropDownList>
                            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                                ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                        </span>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <table style="width: 100%;">
        <tr>
            <td style="height: 21px">&nbsp;<asp:Button ID="Button1" runat="server" Text="开始销售" OnClick="Button1_Click" class="btn btn-primary" />
                <asp:Button ID="Button2" runat="server" Text="设为热卖" OnClick="Button2_Click" class="btn btn-primary" />
                <asp:Button ID="Button6" runat="server" Text="设为精品" OnClick="Button6_Click" class="btn btn-primary" />
                <asp:Button ID="Button5" runat="server" Text="设为新品" OnClick="Button5_Click" class="btn btn-primary" />
                <asp:Button ID="Button3" runat="server" Text="批量删除" class="btn btn-primary" OnClick="Button3_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？'); " />
                <asp:Button ID="Button4" runat="server" Text="停止销售" OnClick="Button4_Click" class="btn btn-primary" />
                <br />
                &nbsp;<asp:Button ID="Button7" runat="server" Text="取消热卖" OnClick="Button7_Click" class="btn btn-primary" />
                <asp:Button ID="Button8" runat="server" Text="取消精品" OnClick="Button8_Click" class="btn btn-primary" />
                <asp:Button ID="Button9" runat="server" Text="取消新品" OnClick="Button9_Click" class="btn btn-primary" />
                <asp:Button ID="Button10" runat="server" Text="批量移动" OnClick="btnMove_Click"
                    UseSubmitBehavior="true" class="btn btn-primary" />
                <asp:Button ID="Button11" runat="server" Text="批量审核" UseSubmitBehavior="true"
                    OnClick="Button11_Click" class="btn btn-primary" />
                <asp:Button ID="Button12" runat="server" Text="取消审核" UseSubmitBehavior="true"
                    OnClick="Button12_Click" class="btn btn-primary" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>商品属性中的各项含义：</strong><br />
                <font color="blue">精</font>----推荐精品，<font color="red">热</font>----热门商品，<font color="green">新</font>----推荐新品，<font
                    color="blue">图</font>----有商品缩略图，<font color="maroon">绑</font>----捆绑商品销售
                <br />
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="Label1_Hid" />
    <div class="modal" id="userinfo_div">
        <div class="modal-dialog" style="width: 800px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong id="title">用户信息</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="user_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
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
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function open_title(url, title) {
            $("#title").text(title);
            $("#user_ifr").attr("src", url);
            $("#userinfo_div").modal({});
        }
        function closdlg() {
            Dialog.close();
        }
        function getinfo(id, NodeID, ModelID) {
            location.href = "AddProduct.aspx?menu=edit&ModelID=" + ModelID + "&NodeID=" + NodeID + "&id=" + id + "";
        }
    </script>
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
</asp:Content>
