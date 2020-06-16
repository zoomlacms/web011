<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_Audit, App_Web_fk1hbgsf" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>审核管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <table class="table table-striped table-bordered table-hover" id="EGV">
            <tr align="center" class="title">
                <td width="2%">
                    
                </td>
                <td>申请ID</td>
                <td>升级客户</td>
                <td>申请人</td>
                <td>申请(课程)</td>
                <td>申请原因</td>
                <td>申请/开通(时间)</td>
                <td>付款状态<span style="color: #FFFFFF">(首付/续费)</span></td>
                <td>审核状态</td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <tr id="<%#Eval("CourseID") %>" ondblclick="ShowTabs(this.id)">
                        <td height="22" align="center">
                            <%#getIsChecked(Convert.ToInt32( Eval("ID").ToString()))%>
                        </td>
                        <td height="22" align="center">
                            <%#Eval("ID")%>
                        </td>
                        
                        <td height="22" align="center">
                            <asp:LinkButton ID="lbkehu" ForeColor="Blue" Font-Underline="false" CommandArgument='<%#Eval("UserID") %>'  OnClick="lbkehu_Click"   runat="server">升级为客户</asp:LinkButton>
                            
                            <asp:Label ID="lblkehu" ForeColor="#999999" Font-Underline="false" runat="server" Text="已升为客户"></asp:Label>
                        </td>
                        <td height="22" align="center">
                            <%#GetUserName(Eval("UserID", "{0}"))%>
                        </td>
                        <td height="22" align="center">
                            <%#GetName(Eval("CourseID", "{0}"))%>
                        </td>
                        <td height="22" align="center">
                            <%#Eval("Remark")%>
                        </td>
                        <td height="22" align="center">
                            <%#(Eval("AddTime"))%>
                        </td>
                        <td height="15" align="center">
                            <%#getPaymentStateById(Convert.ToInt32( Eval("Id").ToString())) %>
                        </td>
                        <td height="22" align="center">
                            <asp:LinkButton title='单击关闭' ID="lbAuniOK" OnClick="lbAuniOK_Click" CommandArgument='<%#Eval("ID")%>'
                                OnClientClick="return confirm('是否关闭此课程！')" ForeColor="Red" Font-Underline="false"
                                runat="server" Text='<%#GetAunit(Eval("Aunit", "{0}"))%>'></asp:LinkButton>
                            <asp:LinkButton title='单击开通' ID="lbAunitNO" OnClick="lbAunitNO_Click" CommandArgument='<%#Eval("ID")%>'
                                OnClientClick="return confirm('是否开通此课程！')" ForeColor="Blue" Font-Underline="false"
                                runat="server" Text='<%#GetAunit(Eval("Aunit", "{0}"))%>'></asp:LinkButton>
                            <asp:LinkButton ID="lbDelete" CommandArgument='<%#Eval("ID") %>' OnClick="lbDelete_Click"
                                OnClientClick="return confirm('确实要删除吗？');" runat="server">删除</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td style="text-align:center"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                <td height="22" colspan="10" align="center" class="tdbg">
                    共<asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条数据
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />页次：
                    <asp:Label ID="Nowpage" runat="server" Text="" />/
                    <asp:Label ID="PageSize" runat="server" Text="" />页
                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                        Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                    条数据/页 转到第
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                        ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                </td>
            </tr>
        </table>
    <div>
        <asp:Button ID="Button3" class="btn btn-primary" Style="width: 110px;" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"
            Text="批量删除" OnClick="Button3_Click" />
        <asp:Button ID="Button1" class="btn btn-primary" Style="width: 110px;" runat="server" Text="开通课程"
            OnClick="Button1_Click" />
        <asp:Button ID="Button2" Visible="false" class="btn btn-primary" Style="width: 110px;" runat="server"
            Text="撤消开通" OnClick="Button2_Click" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
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
        HideColumn("3,4,5,6");
    </script>
</asp:Content>