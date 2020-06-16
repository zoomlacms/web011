<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_QuestionManage, App_Web_fk1hbgsf" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>系统试题管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="divbox" id="nocontent" runat="server" style="display: none"> 暂无试题信息</div>
    <div>
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"   EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"  OnPageIndexChanging="EGV_PageIndexChanging"
            OnRowDataBound="gvCard_RowDataBound" OnRowCommand="gvCard_RowCommand" >
            <RowStyle CssClass="tdbg" Height="26px"></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("p_id") %>' />
                        <asp:CheckBox ID="chkSel" runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="试题标题">
                    <ItemTemplate>
                        <img src="/App_Themes/AdminDefaultTheme/images/diagram1.png" border="0" width="15" alt="已共享" />
                       <asp:HyperLink ID="lbTitle" runat="server"><%# Eval("p_title")%></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Inputer" HeaderText="作者" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="难度" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Label ID="lblDiff" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类别" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetClass(Eval("p_Class","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_Views" HeaderText="使用次数" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle" />
                <asp:TemplateField HeaderText="题型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetType(Eval("p_Type", "{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="考点" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#GetTestPoint(Eval("p_Knowledge", "{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="p_CreateTime" HeaderText="创建时间" ItemStyle-VerticalAlign="Middle"
                    ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="相关操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("p_id") %>'>修改</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("p_id") %>'
                            OnClientClick="return confirm('你确定将该数据删除吗？');">删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    <div>
        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="导出数据" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" class="btn btn-primary" data-toggle="modal" data-target="#Excel_div" Text="导入数据" OnClientClick="inputQMinfo();return false;" />
        <asp:Button ID="BtnDelete" runat="server" class="btn btn-primary" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}"
            Text="批量删除选定内容" Width="134px" OnClick="BtnDelete_Click" />
    </div>
    <div class="modal" id="Excel_div">
        <div class="modal-dialog" style="width: 600px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <span class="modal-title"><strong>导入试题</strong></span>
                </div>
                <div class="modal-body">
                      <iframe id="Excel_ifr" style="width:100%;height:100px;border:none;" src=""></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/Drag.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function inputQMinfo() {
            $("#Excel_ifr").attr("src", "ExportExcel.aspx");
        }
    </script>
</asp:Content>