<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.MyContentpage, App_Web_lvsrob24" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>投稿管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<script type="text/javascript">
	if('<%Call.Label("{ZL.Label id=\"抽取登录会员的用户组ID\" /}"); %>'==11){
	 
		$("#nodeNav").css("display",'inline');	
	}
</script>
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">投稿管理</li>
</ol>
<style>
.left_ul ul{padding:0;}
tvNavDiv{float:left;background-color:#f3f3f3;height:100%;width:100%;margin-top:1px;}
.tvNav_ul li{padding-left:10px;}
.left_ul{ background:#f3f3f3;border:1px solid #ddd;}
.left_ul ul li {border-bottom:1px solid #ddd;}
.left_ul ul li a{color:#1963aa;font-size:0.9em;display:block;text-decoration:none;height:35px;line-height:35px;padding-left:10px;}
.left_ul ul li a:hover{ background:#6BBEF6; color:#fff;}
.activeLi{ background:#6BBEF6; color:#fff;border-bottom:1px solid #ddd;}
.list_span {margin-right:10px;}
#Egv tr th {text-align: center;}
#addall0{ display:none;} 
</style>
<div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0;">
    <div>
        <div class="tvNavDiv">
            <div class="left_ul">
                <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
            </div>
        </div>
        <span style="color:green;" runat="server" id="remind" visible="false" />
    </div>
</div>
<div class="">
<div>
    <asp:Label ID="lblAddContent" runat="server" Text=""></asp:Label>
    <a href="/User/Content/MyContent.aspx?NodeID=<%=Request["NodeID"]%>&status=-2" class="btn btn-primary"> 回收站</a>
</div>
<div class="us_pynews" style="margin-top:10px;">
    <div class="us_seta">
        <asp:GridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover"
            DataKeyNames="GeneralID" OnPageIndexChanging="Egv_PageIndexChanging"
            OnRowCommand="Lnk_Click" Width="100%" CellPadding="4" ForeColor="#333333"
            GridLines="None" EnableModelValidation="True" EmptyDataText="无相关信息！">
            <Columns>
                <asp:TemplateField HeaderStyle-Height="25px" HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSel" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle Height="25px"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="GeneralID" HeaderText="ID">
                    <HeaderStyle Width="6%" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="标题">
                    <HeaderStyle Width="50%" />
                    <ItemTemplate>
                        <a href='ShowPubList.aspx?ID=<%# Eval("GeneralID") %>'>
                            <%# ZoomLa.Common.BaseClass.Htmlcode(Eval("Title","{0}"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status", "{0}")) %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="已生成">
                    <ItemTemplate>
                        <%# GetCteate(Eval("IsCreate", "{0}"))%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href='ShowPublist.aspx?ID=<%# Eval("GeneralID") %>'>预览</a>&nbsp;&nbsp;<a href="<%# GetUrl(Eval("Status", "{0}"))%>" target="_blank">访问</a>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("GeneralID") %>' Visible='<%#GetIsNRe(Eval("Status", "{0}")) %>'>修改</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server" Visible='<%#GetIsDe(Eval("Status", "{0}")) %>' CommandName="Del" CommandArgument='<%# Eval("GeneralID") %>'
                            OnClientClick="return confirm('你确定将该数据删除到回收站吗？')">删除</asp:LinkButton>
                        <asp:LinkButton ID="ResetBtn" runat="server" Visible='<%#GetIsRe(Eval("Status", "{0}")) %>' CommandName="Reset" CommandArgument='<%# Eval("GeneralID") %>'
                            OnClientClick="return confirm('你确定将该数据还原吗？')">还原</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
            <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
        </asp:GridView>
        <div style="width:100%; float: left; line-height: 30px; margin-top: 5px;">
            <asp:CheckBox ID="CheckBox2" CssClass="pull-left" style="line-height:32px;" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged"
                Text="选中本页显示的所有项目" /><div class="clearfix"></div>
            <asp:Button ID="Button2" runat="server" Text="批量删除" OnClick="btnDeleteAll_Click" class="btn btn-primary pull-left"
                OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" UseSubmitBehavior="true" />
            <asp:DropDownList ID="DropDownList1" CssClass="form-control pull-left" Width="120" style="margin-left:10px;" runat="server">
                <asp:ListItem Value="0">按标题查找</asp:ListItem>
                <asp:ListItem Value="1">按ID查找</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="TxtSearchTitle" CssClass="form-control pull-left" runat="server"></asp:TextBox>
            <asp:Button ID="Btn_Search" runat="server" class="btn btn-primary" Text="搜索" OnClick="Btn_Search_Click" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" />
        </div>
    </div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
$().ready(function () {
$(".tvNav a.list1").click(function () { showlist(this); });
if (window.localStorage.Content_tvNav) {
    expand($("#" + window.localStorage.Content_tvNav));
}
})
function showlist(obj) {
$(obj).parent().parent().find("a").removeClass("activeLi");//a-->li-->ul
$(obj).parent().children("a").addClass("activeLi");//li
$(obj).parent().siblings("li").find("ul").slideUp();
$(obj).parent().children("ul").slideToggle();
window.localStorage.Content_tvNav = obj.id;
}
function expand(obj)//超链接,不以动画效果显示
{
$a = $(obj).parent().parent(".tvNav ul").parent("li").find("a:first");
if ($a.length > 0) expand($a);
$(obj).addClass("activeLi");
$(obj).parent("li").children("ul").show();
}
</script>
</asp:Content>