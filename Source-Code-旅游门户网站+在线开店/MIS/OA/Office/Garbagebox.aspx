<%@ page language="C#" autoeventwireup="true" inherits="MIS_OA_Office_Garbagebox, App_Web_l1ttvgdr" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>回收站</title>
<link href="../CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<script src="/JS/jquery-1.9.1.min.js"></script>
<script>
function delCon() {
    return confirm('确定要彻底删除该公文!!!');
}
function GetTo(url)
{
    location.href = url;
}
</script>
</head>
<body>
<form id="form1" runat="server">
<div class="draftnav"><a href="/MIS/OA/Main.aspx">行政公文</a>/<a href="Default.aspx">公文管理</a></div>
    <div id="site_main" style="margin:10px;">
        <div style="margin-bottom:10px;">
            <ul class="draft_ul">
                <li><a href="Default.aspx">公文</a></li>
                <li><a href="DocManage.aspx">文档</a></li>
                <li><a href="DraftBox.aspx">草稿箱</a></li>
                <li  class="current"><a href="Garbagebox.aspx">回收站</a></li>
            </ul>
        </div>
        <div class="input-group" style=" width:600px;float:left;margin-bottom:10px;margin-left:30px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control"/>
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" />
            </span>
             <span style="color:red;"><input type="radio" id="r1" name="recycleRadio" checked="checked" /><label for="r1">公文</label>
                   <input type="radio" id="r2" name="recycleRadio" onchange="GetTo('DocRecycle.aspx');"/><label for="r2">文档</label></span>
        </div>
        <div class="tab3">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%" CssClass="table_li table-border" EmptyDataText="回收站无文件!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" >
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
  <%--                  <asp:TemplateField HeaderText="发文类型">
                        <ItemTemplate>
                            <%#GetType(Eval("Type", "{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
                    <asp:BoundField HeaderText="标题" DataField="Title" />
                    <asp:TemplateField HeaderText="密级">
                        <ItemTemplate>
                            <%#GetSecret( Eval("Secret","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="紧急程度">
                        <ItemTemplate>
                            <%# GetUrgency(Eval("Urgency","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="重要程度">
                        <ItemTemplate>
                            <%# GetImport(Eval("Importance","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%# GetStatus(Eval("Status","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="restore" runat="server" ToolTip="还原" CommandArgument='<%#Eval("ID") %>' CommandName="restore">还原</asp:LinkButton>
                            <asp:LinkButton ID="del" CommandArgument='<%#Eval("ID") %>' CommandName="del2" runat="server" ToolTip="删除" OnClientClick="return delCon();">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center"/>
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div></form>
</body>
</html>
