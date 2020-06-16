<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_CommentManage, App_Web_gqexlk3x" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>评论管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)"><%:lang.LF("所有评论") %></a></li>
            <li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)"><%:lang.LF("已审核评论") %></a></li>
            <li><a href="#tab2" data-toggle="tab" onclick="ShowTabs(2)"><%:lang.LF("待审核评论") %></a></li>
        </ul>
        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="CommentID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" title="" value='<%#Eval("CommentID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CommentID" HeaderText="评论ID" />
                <asp:BoundField HeaderText="内容ID" DataField="GeneralID" />
                <asp:TemplateField HeaderText="所属内容标题">
			        <HeaderStyle Width="20%" />
			        <ItemTemplate> 
				        <a href="<%# GetUrl(Eval("GeneralID", "{0}"))%>" target="_blank">
					        <%# GetTitle(Eval("GeneralID", "{0}"))%></a>
			        </ItemTemplate>
		        </asp:TemplateField>
                <asp:TemplateField HeaderText="状态">
			        <ItemTemplate>
				        <%#getcommend(Eval("Audited"))%>
			        </ItemTemplate>
		        </asp:TemplateField>
                <asp:BoundField DataField="Contents" HeaderText="评论内容" />
                <asp:TemplateField HeaderText="发表日期">
			        <ItemTemplate>
				        <%# Eval("CommentTime", "{0:yyyy-MM-dd}")%>
			        </ItemTemplate>
			        <ItemStyle HorizontalAlign="Center" />
		        </asp:TemplateField>
		        <asp:TemplateField HeaderText="发表人">
			        <ItemTemplate>
                    <a href="../User/UserInfo.aspx?id=<%# Eval("UserID") %>">
				        <%# GetUserName(Eval("UserID", "{0}"))%>
			        </ItemTemplate>
		        </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandName="Del2" CommandArgument='<%# Eval("CommentID") %>' runat="server">删除</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" CommandName="Audit" CommandArgument='<%# Eval("CommentID") %>' runat="server">审核</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center"  />
		    <RowStyle HorizontalAlign="Center" />
        </ZL:ExGridView>
        <div class="text-center">
            <asp:Button ID="Button1" runat="server" Text="删除评论" OnClick="BtnSubmit1_Click" CssClass="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择操作项');return false;}" />
            <asp:Button ID="Button2"   runat="server" Text="审核通过" OnClick="BtnSubmit2_Click" OnClientClick="if(!IsSelectedId()){alert('请选择操作项');return false;}" CssClass="btn btn-primary" />
            <asp:Button ID="Button3"  runat="server" Text="取消审核" OnClick="BtnSubmit3_Click" OnClientClick="if(!IsSelectedId()){alert('请选择操作项');return false;}" CssClass="btn btn-primary" />
        </div>
    </div>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $().ready(function () {
            $("#Egv tr:last").children().first().attr("colspan", "8").before("<td><input type=checkbox id='chkAll'/></td>");
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "idchk");
            });
            if (getParam("type"))
            {
                $("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
            }
        })
        function ShowTabs(n)
        {
            location.href = 'CommentManage.aspx?type=' + n;
        }
        function IsSelectedId()
        {
            var checkArr = $("input[type=checkbox][name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
    

