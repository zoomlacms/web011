<%@ page language="C#" autoeventwireup="true" inherits="manage_Content_showContent2, App_Web_zxhe1krl" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>预览内容</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/thickbox.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/UserThem/edit.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript" src="../../JS/thickbox-compressed.js"></script>
    <script type="text/javascript" src="../../JS/DocManage.js"></script>
    <style type="text/css">
        .pics {
            position: relative;
            left: 200px;
            top: -10px;
            display: block;
            height: 18px;
            background: #e8f5ff;
            width: 200px;
            text-align: left;
        }

        .r_navigations {
            border-style: none;
            margin-bottom: 0px;
            line-height: 24px;
            text-align: left;
            clear: both;
            color: #000;
        }

            .r_navigations a, #r_navigation:link {
                text-decoration: none;
                color: #000;
            }

                .r_navigations a:hover {
                    color: #c00;
                    text-decoration: underline;
                }

        .auto-style1 {
            border-left: 1px solid #e8f5ff;
            border-right: 1px solid #e8f5ff;
            border-top: 1px solid #e8f5ff;
            background: #CBE6FC;
            width: 130px;
            font-weight: bold;
            text-align: center;
            line-height: 20px;
            font-size: 12px;
            height: 22px;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: 0px;
        }

        .auto-style2 {
            line-height: 20px;
            border-bottom: 1px solid #fff;
            height: 22px;
        }

        .Photo-style {
            width: 200px;
            height: 120px;
            margin-top: 6px;
            border: #b6ff00 1px solid;
        }
    </style>
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/JavaScript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2");
        function ShowTabs(ID) {
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                document.getElementById(arrTabs[tID].toString()).style.display = "none";
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                tID = ID;
            }
        }
        function showCustom(value) {
            var index = parseInt(value);

            for (i = 2; i <= 20; i++) {
                if (i <= index)
                    document.getElementById("Custom" + i).style.display = "";
                else
                    document.getElementById("Custom" + i).style.display = "none";
            }
        }

        function selectnum() {

        }

        var stID = 0;
        var sarrTabTitle = new Array("sTabTitle0", "sTabTitle1", "sTabTitle2");
        function sShowTabs(ID) {
            if (ID != stID) {
                if (sarrTabTitle[stID] != null) {
                    document.getElementById(sarrTabTitle[stID].toString()).className = "tabtitle";
                }
                if (sarrTabTitle[ID] != null) {
                    document.getElementById(sarrTabTitle[ID].toString()).className = "titlemouseover";
                }
                stID = ID;
            }
        }
        function sshowCustom(value) {
            var index = parseInt(value);

            for (i = 2; i <= 20; i++) {
                if (i <= index)
                    document.getElementById("sCustom" + i).style.display = "";
                else
                    document.getElementById("sCustom" + i).style.display = "none";
            }
        }

        var diag = new Dialog(); 
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function open_title(ModelID, NodeID) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = "添加内容<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
            diag.URL = "AddContent.aspx?ModelID=" + ModelID + "&NodeID=" + NodeID;
            diag.show();
        }

        function opentitle(url, title) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        }

        function closdlg() {
            Dialog.close();
        }
    </script>
    <script language="javascript">

        function svcode(obj) {
            var winname = window.open('', '_blank', 'height=1,width=1,top=200,left=300');
            winname.document.open('text/html', 'replace');
            winname.document.writeln(obj);
            winname.document.execCommand('saveas', '', 'code.txt');
            winname.close();
        }
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
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation">
            <span>后台管理</span> &gt;&gt;&nbsp;<span><a href="ContentManage.aspx">内容管理</a></span>&nbsp;&gt;&gt;
            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HdnModelID" runat="server" />
        </div>
        <div class="clearbox">
        </div>
        <table border="0" cellpadding="0" cellspacing="0" id="top">
            <tr align="center">
                <td id="TabTitle0" class="titlemouseover" onclick="ShowTabs(0)">基本信息
                </td>
                <td id="TabTitle1" class="tabtitle" onclick="ShowTabs(1)">信息属性
                </td>
            </tr>
        </table>
        <div id="backDoc" style="display:none;"><a href="javascript:">返回</a></div>
        <table style="height: 500px; width: 30%; float: left;" border="0" cellpadding="5" cellspacing="1" class="border" id="left">
            <tr class="tdbg">
                <td valign="top" style="margin-top: 0px; margin-left: 0px;">
                    <table width="100%" cellpadding="2" cellspacing="1">
                        <%-- 基本信息--%>
                        <tbody id="Tabs0">
                            <tr class="tdbg">
                                <td class="tdlefttxt" style="width: 130px;">所属节点</td>

                                <td class="bqright">
                                    <asp:TextBox ID="txtNode" CssClass="l_input" runat="server" Width="250px" Enabled="false" Text="" />
                                    <asp:HiddenField ID="hfNode" runat="server" Value="" />
                                </td>
                            </tr>

                            <tr class="tdbg">
                                <td class="tdlefttxt">ID</td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="GeneralID" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr class="tdbg">
                                <td class="tdlefttxt">标题</td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="txtTitle" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <asp:Literal ID="ModelHtml" runat="server" Visible="false"></asp:Literal>
                            <tr class="tdbg">
                                <td colspan="2">
                                    <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" CellPadding="4"
                                        GridLines="None" Font-Size="12px" Style="margin-bottom: 0px; margin-top: 0px;"
                                        CssClass="r_navigations" CellSpacing="1">
                                        <Fields>
                                        </Fields>
                                        <FooterStyle Font-Bold="True" BackColor="#FFF" />
                                        <CommandRowStyle Font-Bold="True" CssClass="r_navigations tdlefttxt" />
                                        <RowStyle />
                                        <FieldHeaderStyle Font-Bold="True" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <HeaderStyle Font-Bold="True" />
                                        <EditRowStyle />
                                        <AlternatingRowStyle />
                                    </asp:DetailsView>
                                </td>
                            </tr>
                        </tbody>
                        <%--信息属性--%>
                        <tbody id="Tabs1" style="display: none">
                            <tr class="tdbg">
                                <td class="tdlefttxt">录入者</td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr class="tdbg">
                                <td class="tdlefttxt">录入时间</td>
                                <td class="tdrighttxt">
                                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </tbody>

                    </table>
                    <br />
                    <center>
				<asp:Button ID="EditDoc" CssClass="C_input" runat="server" Text="" OnClick="EditDoc_Click" />
                <asp:Button ID="SaveDoc" CssClass="C_input" runat="server" Text="" OnClick="SaveDoc_Click" Visible="false"/>
                <asp:Button ID="ReBuildDoc" CssClass="C_input" runat="server" Text="生成文档" OnClientClick="return generate2('docTitle','docParamValue');" OnClick="ReBuildDoc_Click" />
				<asp:Button ID="DeleDoc" CssClass="C_input" runat="server" Text="" OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"
					OnClick="delete_Click" />
                <asp:Button ID="BakList" CssClass="C_input" runat="server" Text="返回文档列表" OnClick="BakList_Click"/>
			</center>
                </td>
            </tr>
        </table>

        <div class="editdocLi" style="height: 500px; width: 68%; float: right; margin-right: 15px;" id="right">
         <div id="tempListDiv">
                <ul>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                      <li>
                          <%# System.IO.File.Exists(Server.MapPath(m_ConfigUploadDir+docTitle.Value+"/"+Eval("DocName"))) ?"<span>" + "<a href='javascript:openDoc(\"" +txtTitle.Text+ "/" + Eval("DocName") + "\")' title='单击打开" + Eval("DocName") + "'>" + Eval("DocName") + "</a></span> ":"<a href='javascript:singleDocGen(\"docTitle\",\"docParamValue\",\""+ Eval("DocName")+"\");' style='background:url(/App_Themes/AdminDefaultTheme/images/System3Grey.png) no-repeat top center;' title=未生成,点击生成>" + Eval("DocName") + "</a>" %>
                      </li>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
            </div>
        </div>
        <div class="clearbox"></div>
        <iframe id="wordManage" style="width: 1px; height: 1px;" src="/edit/edit.aspx"></iframe>
        <script type="text/javascript">
            //打开Word文档
            function openDoc(title) {
                document.getElementById("wordManage").style.width = "100%";
                document.getElementById("wordManage").style.height = "750px";
                document.getElementById("top").style.display = "none";
                document.getElementById("left").style.display = "none";
                document.getElementById("right").style.display = "none";
                wordManage.window.openWord3(title);
            }
            function closeDoc() {
                document.getElementById("wordManage").style.width = "1px";
                document.getElementById("wordManage").style.height = "1px";
                document.getElementById("top").style.display = "";
                document.getElementById("left").style.display = "";
                document.getElementById("right").style.display = "";
            }
        </script>
        <asp:HiddenField ID="HiddenType" runat="server" />
        <asp:HiddenField ID="HiddenModeid" runat="server" />
        <asp:HiddenField ID="HiddenGID" runat="server" />
        <asp:HiddenField ID="HdnNode" runat="server" />
        <asp:HiddenField ID="docParamValue" runat="server"  Value=""/>
        <asp:HiddenField ID="docTitle" runat="server"  Value=""/>
    </form>
    <script>
    </script>
</body>
</html>
