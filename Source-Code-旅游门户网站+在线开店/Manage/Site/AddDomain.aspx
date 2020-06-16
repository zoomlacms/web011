<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_AddDomain, App_Web_0jhes4tp" masterpagefile="~/Manage/Site/OptionMaster.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<meta charset="utf-8" />
    <title>添加域名</title>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/jquery.js"></script>
<script type="text/javascript" src="/Plugins/Domain/Site.js"></script>
<style>
.tdbg{ background:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div id="m_site"><p style="float:left;"> 站群中心 >>域名管理 >>添加域名</p></div>
    <div id="site_main">
    <div id="tab3">
    <div id="sitetab1" runat="server">
        <div class="S_User">
            <span>选择会员：</span><br />
            <div class="S_Class">
                <span>查找：</span>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0" Selected="True">会员名</asp:ListItem>
                    <asp:ListItem Value="1">会员ID</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox1" CssClass="site_input" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="site_button" runat="server" Text="搜索" />
            </div>
        </div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" RowStyle-CssClass="tdbg"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" CellPadding="2" CellSpacing="1" Width="100%" PageSize="10" GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField HeaderText="会员ID" DataField="UserID" ReadOnly="true" />
                <asp:TemplateField HeaderText="会员名">
                    <ItemTemplate>
                        <%# Eval("UserName") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="会员类型">
                    <ItemTemplate>
                        <%# GetGroupName(Eval("GroupID","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RegTime" HeaderText="注册时间" SortExpression="RegTime" DataFormatString="{0:yyyy-MM-dd}">
                </asp:BoundField>
                <asp:BoundField DataField="Purse" HeaderText="资金余额" DataFormatString="{0:F2}">
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("UserID") %>' CommandName="Select">选择</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    </div>
    <div id="sitetab2" runat="server" visible="false">
    <div style="float:left;">
    <table style="border-color:none;" class="site_table">
    <tr><td>域名：</td><td><asp:TextBox runat="server" ID="domListT1" CssClass="site_input" AutoPostBack="true" OnTextChanged="domListT1_TextChanged" ValidationGroup="ae"/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="domListT1" ValidationGroup="ae" 
            SetFocusOnError="true" Display="Dynamic" ErrorMessage="域名不能为空" />
        <asp:Label runat="server" ID="remindL" ForeColor="Red"></asp:Label></td></tr>
    <tr><td>会员：</td><td><asp:TextBox runat="server" ID="domListT2" CssClass="site_input" Enabled="false" AutoPostBack="true" 
        OnTextChanged="domListT2_TextChanged" ValidationGroup="ae"/>
        <asp:Label ID="Label1" runat="server" ForeColor="Green" Text="注:输入用户名!!" />
        <asp:RequiredFieldValidator  runat="server" ControlToValidate="domListT2" ValidationGroup="ae" 
            SetFocusOnError="true" Display="Dynamic" ErrorMessage="用户名不能为空" /></td></tr>
    <tr><td>生效日期：</td>
        <td><asp:TextBox runat="server" ID="domListT3" onclick="WdatePicker();" CssClass="site_input"/></td></tr>
    <tr><td>选项：</td><td><asp:CheckBox runat="server" ID="domChk" Text="不调用域名注册接口,仅录入信息" Checked="true"/></td></tr>
    <tr><td>年限：</td>
        <td><asp:DropDownList runat="server" ID="yearDP">
                <asp:ListItem Value="1">1年</asp:ListItem>
                <asp:ListItem Value="2">2年</asp:ListItem>
                <asp:ListItem Value="3">3年</asp:ListItem>
                <asp:ListItem Value="4">4年</asp:ListItem>
                <asp:ListItem Value="5">5年</asp:ListItem>
                <asp:ListItem Value="6">6年</asp:ListItem>
                <asp:ListItem Value="7">7年</asp:ListItem>
                <asp:ListItem Value="8">8年</asp:ListItem>
                <asp:ListItem Value="9">9年</asp:ListItem>
                <asp:ListItem Value="10">10年</asp:ListItem>
            </asp:DropDownList></td></tr>
    <tr><td>模板：</td>
        <td><asp:DropDownList runat="server" ID="domListDP" OnSelectedIndexChanged="domListDP_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>注:请先输入用户名</td></tr>
    <tr><td>操作：</td><td>
        <asp:Button runat="server" ID="domListBtn" Text="添加" OnClick="domListBtn_Click" OnClientClick="return PostData();" CssClass="site_button" ValidationGroup="ae"/>
        <input type="button" id="returnBtn" value="返回" onclick="location = 'AddDomain.aspx';" class="site_button" /></td></tr>
    </table>
    </div>
    <div id="tab2">
    <table id="templateTable" style="margin:auto;">
        <tr style="display:none;">
            <td>模板名：</td><td><span class="redStar">*&nbsp;</span><input type="text" id="tempName" name="tempName"  class="site_input" size="30" /></td></tr>
        <tr>
            <td>单位名称（中文名）：</td>
            <td><span class="redStar">*&nbsp;</span><input id="uname1" type="text" class="site_input" size="30" name="uname1" /></td>
        </tr>
        <tr>
            <td>单位名称（英文名）：</td>
            <td><span class="redStar">*&nbsp;</span><input id="uname2" type="text" class="site_input" size="30" name="uname2"  /></td>
        </tr>
        <tr>
            <td></td>
            <td style="color: red;">联系人中文名中至少含有1个中文字符，英文名信息中名和姓必须以空格分开。</td>
        </tr>
        <tr>
            <td>联系人（中文名）：</td>
            <td><span class="redStar">*&nbsp;</span><input id="rname1" type="text" class="site_input" size="30" name="rname1" /></td>
        </tr>
        <tr>
            <td>联系人（英文名）：</td>
            <td><span class="redStar">*&nbsp;</span><input id="rname2" type="text" class="site_input" size="30" name="rname2" /></td>
        </tr>
        <%--<tr class="CNAddr">
            <td>URL指向:</td>
            <td>
                <span class="redStar">*</span>
                <input id="urlId" type="text" class="site_input" size="30" name="url" value="http://www." />
            </td>
        </tr>--%>
        <tr>
            <td>电子邮箱：</td>
            <td><span class="redStar">*&nbsp;</span><input id="aemail" type="text" class="site_input" size="30" name="aemail"  /></td>
        </tr>
        <tr>
            <td>所属区域：</td>
            <td><span class="redStar">*</span>
                 <asp:DropDownList ID="DropDownList1" runat="server" class="dpclass"><asp:ListItem Value="01">中国</asp:ListItem></asp:DropDownList><br />
                 <span class="redStar">*</span>
                <asp:DropDownList ID="prvinceDP" ClientIDMode="Static" class="dpclass" runat="server"></asp:DropDownList>
                <br /><span class="redStar">*</span>
                 <input type="text" id="cityText" name="cityText" class="site_input"/>
            </td>
        </tr>
        <tr><td>省份城市（英文）：</td><td><span class="redStar">*&nbsp;</span><input id="ucity2" name="ucity2" type="text" class="site_input" size="30"  /></td></tr>
        <tr>
            <td></td>
            <td style="color: red;">通迅地址（中文）信息中必须至少含有1个中文字符</td>
        </tr>
        <tr>
            <td>通迅地址（中文）：</td>
            <td><span class="redStar" style="position:relative;bottom:70px;">*</span>
                <textarea id="uaddr1" rows="4" cols="28" name="uaddr1" class="site_input" style="height:150px; margin-bottom:5px;" ></textarea>
            </td>
        </tr>
        <tr>
            <td>通迅地址（英文）：</td>
            <td><span class="redStar" style="position:relative;bottom:70px;">*</span>
                <textarea id="uaddr2" rows="4" cols="28" name="uaddr2" class="site_input" style="height:150px;" ></textarea>
            </td>
        </tr>
        <tr>
            <td>邮编：</td>
            <td><span class="redStar">*</span>
                <input id="uzip" type="text" name="uzip" class="site_input" size="30"  />
            </td>
        </tr>
        <tr>
            <td>手机：</td>
            <td><span class="redStar">*</span>
                <input id="uteln" type="text" class="site_input" name="uteln" />
            </td>
        </tr>
       <%-- <tr>
            <td>传真：</td>
            <td><span class="redStar">*</span>
            <input id="ufaxa" type="text" class="site_input" size="6" name="ufaxa"  style="width:60px;"/>--
            <input id="ufaxn" type="text" class="site_input" size="12" name="ufaxn" style="width:114px;"  />
            </td>
        </tr>
        <tr>
            <td>DNS服务器：</td>
            <td>
                <input type="radio" name="dnsOption" class="server_name" checked="checked" value="0" onclick="showDiv(0);"/>
                新网DNS解析服务器
                  <input type="radio" name="dnsOption" class="server_name" value="1" onclick="showDiv(1);"/>
                自定义DNS服务器
            </td>
        </tr>
        <tbody id="ddnsBody">
        <tr>
            <td>中文主域名服务器名称：</td>
            <td>
                <input type="text" id="dnsCodeId1" class="site_input server_name" size="30" value="dns-ch.xinnet.com" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>中文辅域名服务器名称：</td>
            <td>
                <input type="text" id="dnsCodeId2" name="subDnsCn" class="site_input server_name" size="30" value="dns-ch2.xinnet.com" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>英文主域名服务器名称：</td>
            <td>
                <input id="dnsCodeId3" type="text" name="mosDnsEn" class="site_input server_name" size="30" value="ns11.xincache.com" disabled="disabled" /></td>
        </tr>
        <tr>
            <td>英文辅域名服务器名称：</td>
            <td>
                <input id="dnsCodeId4" type="text" name="subDnsEn" class="site_input server_name" size="30" value="ns12.xincache.com" disabled="disabled" /></td>
        </tr>
        </tbody>
        <tbody id="cdnsBody" style="display:none;">
        <tr>
            <td>DNS主服务器：</td>
            <td>
                 <asp:TextBox runat="server" ID="dns1" MaxLength="30" CssClass="site_input" />
            </td>
        </tr>
        <tr>
            <td>DNS辅服务器：</td>
            <td>
             <asp:TextBox runat="server" ID="dns2" MaxLength="30" CssClass="site_input" />  
            </td>
        </tr>
        </tbody>--%>
      <%--  <tr>
            <td>操作：</td>
            <td>
                <asp:Button runat="server" ID="addTempBtn" Text="修改模版" Style="cursor: pointer; margin-left:12px;" CssClass="site_button"  OnClick="addTempBtn_Click" OnClientClick="return checkValue();"/>
            </td>
        </tr>--%>
          <tr><td colspan="2"></td></tr>
    </table>
    </div>
    </div>
    </div>
    <input type="hidden" id="dataValue" name="dataValue" />
    <script type="text/javascript">
        function PostData()
        {
            if (!checkValue()) return false;
            $("#dataValue").val(getInfo("templateTable"));
            return true;
        }
    </script>
</asp:Content>