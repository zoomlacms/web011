<%@ page language="C#" autoeventwireup="true" inherits="manage_Page_PageManage, App_Web_0fbyacen" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>黄页列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td style="line-height:38px;">
                <div>
                    <span class="pull-left">按申请人地区筛选：
                    <select runat="server" id="selprovince" class="form-control" style="width: 150px;" name="selprovince" onchange="javascript:area()"></select>
                        <asp:DropDownList ID="selcity" runat="server" CssClass="form-control" Width="150" AutoPostBack="true" OnSelectedIndexChanged="selcity_SelectedIndexChanged"></asp:DropDownList>
                    </span>
                </div>
                <div class="input-group nav_searchDiv">
                    <asp:TextBox runat="server" ID="keyword" class="form-control" placeholder="请输入需要搜索的内容" />
                    <span class="input-group-btn">
                        <asp:LinkButton runat="server" CssClass="btn btn-default" ID="Button1" OnClick="Button1_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </td>
        </tr>
    </table>
    <ul class="nav nav-tabs">
            <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)">全部</a></li>
            <li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)">已审核</a></li>
            <li><a href="#tab2" data-toggle="tab" onclick="ShowTabs(2)">待审核</a></li>
        </ul>
<table class="table table-striped table-bordered table-hover">
    <tbody id="Tbody1">
        <tr>
            <td align="center" class="title" style="width:5%">
                
            </td>
            <td align="center" class="title" style="width:5%"><span class="tdbgleft">ID</span></td>
            <td align="center" class="title" style="width:15%"><span class="tdbgleft">用户</span></td>
            <td align="center" class="title" style="width:18%"><span class="tdbgleft">黄页名称</span></td>
            <td align="center" class="title" style="width:20%"><span class="tdbgleft">子域名</span></td>
            <td align="center" class="title"><span class="tdbgleft">更新时间</span></td>
            <td align="center" class="title" style="width:25%"><span style="background-color: #e0f7e5; width: 30%">操作</span></td>
        </tr>
        <asp:Repeater ID="Pagetable" runat="server">
            <ItemTemplate>
                <tr class="tdbg" id="<%#Eval("ID") %>" ondblclick="getinfo(this.id)">  
                    <td style="height: 24px" align="center"><input name="Item" type="checkbox" value="<%#Eval("ID")%>" /></td>
                    <td style="height: 24px" align="center"><%#Eval("ID")%></td>
                    <td style="height: 24px" align="center"><a href="PageTemplate.aspx?id=<%#Eval("ID")%>"><%#Eval("UserName")%></a></td>
                    <td style="height: 24px" align="center"><%#Eval("CompanyName")%></td>
                    <td style="height: 24px" align="center"><a href="http://<%#Eval("Domain")%>.<%=ZoomLa.Components.SiteConfig.SiteOption.freedomain%>" target="_blank"><%#Eval("Domain")%>.<%=ZoomLa.Components.SiteConfig.SiteOption.freedomain%></a></td>
                    <td style="height: 24px" align="center"><%#Eval("UpdateTime")%></td>
                    <td style="height: 24px" align="center">
                        <a href="/Page/Default.aspx?pageid=<%#Eval("ID") %>">前台预览</a>
                        <%#GetRecommendation()%>
                        <%#GetStatus()%>
                        <%--<a href="PageModify.aspx?menu=edit&id=<%#Eval("ID") %>">配置信息</a>--%> <a href="AuditUser.aspx?menu=modify&id=<%#Eval("ID") %>">
                            修改</a> <a href="?menu=del&id=<%#Eval("ID") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');">删除</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
            <td style="text-align:center;"><input type="checkbox" id="Checkall" onclick="javascript: CheckAll(this);" runat="server" /></td>
            <td colspan="11" align="center" class="tdbgleft" style="height: 24px">共
                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>条信息
                <asp:LinkButton runat="server" ID="First" onclick="First_Click">首页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Prev" onclick="Prev_Click">上一页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Next" onclick="Next_Click">下一页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Last" onclick="Last_Click">尾页</asp:LinkButton>
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页
                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" OnTextChanged="txtPage_TextChanged" Text="10" />
                条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server"  AutoPostBack="True" onselectedindexchanged="DropDownListPage_SelectedIndexChanged"></asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
    </tbody>
</table>
<table class="table table-striped table-bordered table-hover">
    <tr>
        <td>          
            <asp:Button runat="server" CssClass="btn btn-primary" ID="Button3" Text="批量审核" OnClick="Button3_Click" />&nbsp;
            <asp:Button runat="server" CssClass="btn btn-primary" ID="Button2" Text="取消审核" OnClick="Button2_Click" />&nbsp;
            <asp:Button runat="server" CssClass="btn btn-primary" ID="Button4" Text="批量删除" OnClick="Button4_Click" />&nbsp;
            <asp:Button runat="server" CssClass="btn btn-primary" ID="Button5" Text="批量推荐" OnClick="Button5_Click" />&nbsp;
            <asp:Button runat="server" CssClass="btn btn-primary" ID="Button6" Text="取消推荐" OnClick="Button6_Click" />&nbsp;
            <asp:DropDownList runat="server" ID="style_DP" ></asp:DropDownList>
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ajaxrequest.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            if (getParam("type"))
            {
                $("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
            }
        })
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
        function getinfo(id) {
            location.href = '<%=Getcurrent()%>' + "/page/AuditUser.aspx?menu=modify&id=" + id;
        }
        function area() {
            $.ajax({
                type: "POST",
                url: "PageContent.aspx",
                data: "action=area&value=" + $("#selprovince option:selected").val(),
                success: function (msg) {
                    var s = new Array();
                    s = msg.split("|");
                    var str = "";
                    for (var i = 0; i < s.length; i++) {
                        if (s[i] != null && s[i] != "")
                            str += "<option>" + s[i] + "</option>"
                    }
                    $("#selcity").html(str);
                },
                Error: function (msg) {
                    alert("地址获取失败");
                }
            });
        }
    function ShowTabs(ID) {
        location.href = "PageManage.aspx?tid=" + ID + "&type=" + ID;
    }
    </script>
</asp:Content>