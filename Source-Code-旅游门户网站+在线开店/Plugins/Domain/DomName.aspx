<%@ page language="C#" autoeventwireup="true" inherits="Manage_Site_DomName, App_Web_cpqz3j25" masterpagefile="~/Manage/Site/SiteMaster2.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
.redStar {color: #ff0000;padding: 0 0 0 3px;}
#site_nav .site10 a {background: url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}
.border_line{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_bg.jpg) repeat-x; height:43px;}
.nochoose, .choose{	width: 100px;height: 22px;padding-bottom: 1px;padding-left: 1px;padding-right: 1px;padding-top: 1px;font-weight: normal;cursor: pointer;/*line-height: 120%;*/ font-size:14px;}
.nochoose { color: #ffffff;}
.choose{ background:#03a1f0;color: #ffffff; font-weight:bold;}
</style>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/css.css" type="text/css" />
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="site.js"></script>
<script type="text/javascript" src="/JS/jquery.js"></script>
<style type="text/css">
/*上右下左*/
#leftDiv {font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;width:15%;float:left;border:1px solid #ddd;margin-top:5px;}
#leftDiv span:hover{text-decoration:underline;}
#leftDiv a:active{text-decoration:none;}
.topOption {background-color:#08C;color:#FFF;height:30px;width:100%;font-size:14px;cursor:pointer;border:solid;border-width:1px;border-color:grey;border-style:none none solid none;}
.topWord {display:block;height:30px;line-height:30px;padding-left:8px;}
.oneOption { background-color:#DFDFDF;color:#7E7E7E;height:30px;width:100%;font-size:14px;cursor:pointer;border:solid;border-width:1px;border-color:grey; border-style:none none solid none;}
.oneWord {display:block;height:30px;line-height:30px;padding-left:24px;}
.twoOption {height:30px;width:100%;font-size:14px;cursor:pointer;border:solid;border-width:1px;border-color:grey; border:none ; }
.twoWord {color:#039DC2;display:block;height:30px;line-height:30px;padding-left:40px; }
.optionChoose {background:#F2FBFD;}
#rightDiv { float:right; margin-top:5px; width:84%;}
</style>
<script type="text/javascript">
    $().ready(function () {
        $("div[class='twoOption']").mousemove(function () { $(this).addClass("optionChoose"); }).mouseout(function () { $(this).removeClass("optionChoose"); });
    });
        function frameInit(obj,name) {
            obj.height = window.frames[name].document.body.scrollHeight * 0.95
        }
        function openFrame(url) {
            ShowTabs
            $("#tab1Frame").attr("src", url);

        }
    </script>
<title>用户中心--域名注册</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div id="m_site"><p style="float:left;"> 站群中心 >> 域名管理</p></div>
<div id="site_main">
    <div id="leftDiv">
        <div class="topOption"><span class="topWord">域名管理</span></div>
        <div class="oneOption"><span class="oneWord">域名管理</span></div>
        <div class="twoOption"><a href="javascript:;" id="tabBtn1" onclick="openFrame('/Site/Domain.aspx?remote=true')"><span class="twoWord">域名注册</span></a></div>
        <div class="twoOption"><a href="javascript:;" id="tabBtn3" onclick="ShowTabs(this,'tab3')"><span class="twoWord">域名管理</span></a></div>
        <div class="twoOption"><a href="/Site/Default.aspx" target="_blank"><span class="twoWord">智能建站</span></a></div>
        <div class="twoOption"><a href="javascript:;" id="tabBtn8" onclick="ShowTabs(this,'tab1');openFrame('MySiteManage.aspx')"><span class="twoWord">站点管理</span></a></div>
      <%--  <div class="twoOption"><a href="javascript:;" id="tabBtn2" onclick="ShowTabs(this,'tab2')"><span class="twoWord">注册模板</span></a></div>--%>
        <div class="twoOption"><a href="javascript:;" id="tabBtn4" onclick="ShowTabs(this,'tab1');openFrame('ViewUserLog.aspx');"><span class="twoWord">操作日志</span></a></div>
        <div class="twoOption"><a href="javascript:;" id="tabBtn6" onclick="ShowTabs(this,'tab1');openFrame('ViewProduct.aspx');"><span class="twoWord">购买服务</span></a></div>
        <div class="twoOption"><a href="javascript:;" id="tabBtn7" onclick="ShowTabs(this,'tab1');openFrame('ViewHave.aspx')"><span class="twoWord">查看已购买服务</span></a></div>
        <div class="twoOption"><a href="javascript:;" id="tabBtn5" onclick="ShowTabs(this,'tab5')"><span class="twoWord">充值</span></a></div>
    </div>
    <div id="rightDiv">
    <div id="tab1">
        <iframe id="tab1Frame" src="/Site/Domain.aspx?remote=true" style="width:98%;height:700px;" frameborder=0 scrolling=yes></iframe>
    </div>
    <div id="tab3" style="display:none;">
            域名搜索：<asp:TextBox runat="server" CssClass="site_input" ID="keyWord"  /><asp:Button runat="server" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" CssClass="site_button"/>
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" RowStyle-CssClass="tdbg"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand"
             CellPadding="2" CellSpacing="1" Width="100%" OnRowCancelingEdit="EGV_RowCancelingEdit" PageSize="10"
            GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！"  AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
                <Columns>
                   <%-- <asp:BoundField HeaderText="ID" DataField="ID" />--%>
                     <asp:BoundField HeaderText="序号" DataField="ID" ReadOnly="true" />
                  <%--   <asp:BoundField HeaderText="站点ID" DataField="SiteID" ReadOnly="true" />--%>
                       <asp:TemplateField HeaderText="域名">
                        <ItemTemplate>
                            <a href="<%# "http://"+Eval("DomName") %>"  target="_blank" title="打开站点"><%#Eval("DomName") %></a>
                        </ItemTemplate>
                           <EditItemTemplate>
                               <asp:Label runat="server" ID="lDomain" Text='<%#Eval("DomName").ToString().ToLower().Replace("www.","") %>'></asp:Label>
                           </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="所属用户" DataField="UserName"/>
<%--                     <asp:TemplateField HeaderText="站点名">
                        <ItemTemplate>
                            <a href="SiteDetail.aspx?SiteName=<%#Server.UrlEncode(Eval("SiteName") as string) %>" target="_blank" title="站点详情"><%#Eval("SiteName") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="到期日">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy年M月d日}") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="证书">
                        <ItemTemplate>
                        <a href="ViewCert.aspx?id=<%#Eval("ID") %>" target="_viewCert">查看证书</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="续费多久" Visible="false">
                        <ItemTemplate>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <select name="periodDP">
                                <option value="1">1年</option>
                                <option value="2">2年</option>
                                <option value="3">3年</option>
                                <option value="4">4年</option>
                                <option value="5">5年</option>
                            </select>
                        </EditItemTemplate>
                    </asp:TemplateField>
                   <%--  <asp:BoundField HeaderText="到期日期" DataField="EndDate" />--%>
                     <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Container.DisplayIndex %>' CommandName="Edit2">续费</asp:LinkButton>
                        </ItemTemplate>
                         <EditItemTemplate>
                             <asp:LinkButton runat="server" CommandArgument='<%#Container.DisplayIndex %>' CommandName="Renewals" OnClientClick="return confirm('你确定要续费该域名吗');">确定</asp:LinkButton>
                             <asp:LinkButton runat="server" CommandArgument='<%#Container.DisplayIndex %>' CommandName="Cancel">取消</asp:LinkButton>
                         </EditItemTemplate>
                     </asp:TemplateField>
                </Columns>
        </ZL:ExGridView> 
        </div>
    <table id="templateTable" style="margin:auto;display:none;" >
        <tr><td>模板名：</td><td><span class="redStar">*&nbsp;</span><input type="text" id="tempName" name="tempName"  class="site_input" size="30" />
            <asp:DropDownList runat="server" ID="tempListDP" AutoPostBack="true" OnSelectedIndexChanged="tempListDP_SelectedIndexChanged"></asp:DropDownList> </td>
        </tr>
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
                 <asp:DropDownList runat="server" ID="prvinceDP" ClientIDMode="Static" class="dpclass"></asp:DropDownList><br />
                 <span class="redStar">*</span>
                 <input type="text" id="cityText" name="cityText" class="site_input"/>
            </td>
        </tr>
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
     <%--   <tr>
            <td>传真：</td>
            <td><span class="redStar">*</span>
            <input id="ufaxa" type="text" class="site_input" size="6" name="ufaxa"  style="width:60px;"/>--
            <input id="ufaxn" type="text" class="site_input" size="12" name="ufaxn" style="width:114px;"  />
            </td>
        </tr>--%>
        <tr>
            <td>操作：</td>
            <td>
                <asp:Button runat="server" ID="addTempBtn" Text="添加模板" Style="cursor: pointer; margin-left:12px;" CssClass="site_button"  OnClick="addTempBtn_Click"
                    OnClientClick="return checkValue();"/>
            </td>
        </tr>
          <tr><td colspan="2"></td></tr>
    </table>
    <div id="tab5" style="display:none;">
        充值金额:<asp:TextBox runat="server" ID="chargeText" CssClass="site_input"/>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="chargeText" Display="Dynamic" ForeColor="Red" ErrorMessage="不能为空!" ValidationGroup="chargeG"/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="chargeText"  Display="Dynamic" ForeColor="Red" ErrorMessage="必须为整数" 
                ValidationExpression="^\d+(\d+)?$" ValidationGroup="chargeG"/>
           <asp:Button runat="server" ID="beginCharge" Text="充值" OnClick="beginCharge_Click" CssClass="site_button" ValidationGroup="chargeG"/>
    </div>
    </div>
    
<br />
<asp:HiddenField runat="server" ID="dataField" />
</div>
<script type="text/javascript">
    function ShowTabs(obj, id) {//Div切换
        $("#" + id).show().siblings().hide();
        $("#<%=dataField.ClientID%>").val(obj.id);
    }
    $().ready(function () {
        p= getParam("Page");
        if (p)
        {
            $("#tabBtn" + p).trigger("click");
        }
        id = $("#<%=dataField.ClientID%>").val();
        if (id != "") {
            $("#" + id).trigger("click");
        }
    });
    function setDefaultCheck(v) {
        a = v.split(',');
        for (var i = 0; i < a.length; i++) {
            $("input:[value='" + a[i] + "']").attr("checked", "checked");
        }
    }
</script>
</asp:Content>