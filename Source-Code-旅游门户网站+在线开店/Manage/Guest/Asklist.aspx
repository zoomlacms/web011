<%@ page language="C#" autoeventwireup="true" inherits="manage_Guest_Asklist, App_Web_jwvfgwdw" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>信息管理</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <link href="../../Plugins/JqueryUI/EasyDialog/easydialog.css" type="text/css"  rel="stylesheet" />
    <style type="">
        .rap {
            word-wrap: break-word;
            word-break: break-all;
        }

        .user_t {
            border: 1px solid #9bbde6;
            border-top: none;
        }

        .borders {
            border-bottom: 1px solid #40a2fd;
        }
    </style>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>   
    <script type="text/javascript" src="../../JS/jquery.js"></script>
    <script type="text/javascript" src="../../Plugins/JqueryUI/EasyDialog/easydialog.min.js"></script>
    <script type="text/javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3");
        window.onload = function () {
            pload();
        }
        function ShowTabss(ID) {
            location.href = 'Asklist.aspx?id=<%=Request.QueryString["id"]%>&type=<%=Request.QueryString["type"]%>';
        }
        function pload() {
            var ID = '<%=Request.QueryString["type"]%>';
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                tID = ID;
            }
        }

        function dialog() {
            UE.getEditor("txtContent").setContent("");
            o = document.getElementById("replyDiv");
            o.style.display = "block";
        }
    </script>

     
</head>
<body>
    <form id="form1" runat="server">
        <div id="mainDiv" style="margin-left:5px;">
        <div class="r_navigation">
            <%if (GetOpenHelp.IsopenHelp() == "1")
              { %>
            <div id="help"><a onclick="help_show('97')" title="帮助"></a></div>
            <%} %>
            <%=lang.LF("后台管理")%> &gt;&gt;<a href="GuestCateMana.aspx">百科问答</a> &gt;&gt;<a href="WdCheck.aspx">问答管理</a>&gt;&gt;信息管理
        </div>
        <div class="clearbox">
        </div>
        <div class="border" style="margin-bottom:10px;">
            <div class="spacingtitle" style="margin-bottom: 0px;">问答内容</div>
            <div class="tdbg" >
                <div style="padding:10px; line-height:26px;">
                <asp:Label ID="askContent" runat="server" style="margin-left:5px;"/><br />
                <div id="contentFoot" class="tdbg" style="margin-top: 5px;margin-left:5px;">
                    <asp:Label ID="askName" runat="server" Text="提 问 人：" />
                    <asp:Label ID="askTime" runat="server" Text="提问时间：" Style="margin-left: 20px;" />
                </div>
                </div>
            </div>
        </div>
            
        <div class="borders">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr style="text-align: center;">
                    <td id="TabTitle0" class="titlemouseover" onclick="ShowTabss(0)"><a href="Asklist.aspx?type=0&ID=<%=Request["ID"]%>">所有回复</a> </td>
                    <td id="TabTitle1" class="tabtitle" onclick="ShowTabss(1)"><a href="Asklist.aspx?type=1&ID=<%=Request["ID"]%>">待审回复</a></td>
                    <td id="TabTitle2" class="tabtitle" onclick="ShowTabss(2)"><a href="Asklist.aspx?type=2&ID=<%=Request["ID"] %>">已审回复</a></td>
                </tr>
            </table>
        </div>
        <div class="clearbox"></div>
        <div class="user_t">
            <ZL:ExGridView ID="sgv1" runat="server" DataSourceID="askData" AllowPaging="True" AutoGenerateColumns="false" RowStyle-CssClass="tdbg"
                MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1" ForeColor="Black" CssClass="border" Width="100%"
                GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" SerialText="" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True"
                OnRowCommand="Lnk_Click">
                <Columns>
                    <asp:TemplateField HeaderText="选择|ID">
                        <ItemTemplate>
                            <div style="width: 100%; text-align: left;">
                                <input type="checkbox" name="chkSel" value="<%#Eval("ID") %>" />
                                <span style="margin-left: 30%;"><%#Eval("ID")%></span>
                            </div>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle CssClass="tdbg" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="问题类型" HeaderStyle-Width="12%">
                        <ItemTemplate>
                            <%#gettypes(Eval("QueId", "{0}"))%>
                        </ItemTemplate>
                        <HeaderStyle Width="12%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="参与人" HeaderStyle-Width="12%">
                        <ItemTemplate>
                            <%#Eval("UserName")%>
                        </ItemTemplate>
                        <HeaderStyle Width="12%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="互动时间" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <%#Eval("AddTime")%>
                        </ItemTemplate>
                        <HeaderStyle Width="10%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回复及追问内容" HeaderStyle-Width="8%">
                        <ItemTemplate>
                           <label id="<%#Eval("ID") %>"> <%#Eval("Content")%></label>
                        </ItemTemplate>
                        <HeaderStyle Width="18%"></HeaderStyle>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核状态">
                        <ItemTemplate>
                            <%#getcommend(Eval("audit"))%>
                        </ItemTemplate>
                        <ItemStyle CssClass="tdbg"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Audit"
                                CausesValidation="false">审核</asp:LinkButton>
                            |<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Edit2" CausesValidation="false" Visible="false">修改|</asp:LinkButton>
                            <a href="javascript:disUpdate(<%#Eval("ID") %>)">修改|</a>
                            <asp:LinkButton ID="LinkButton3" runat="server" OnClientClick="return confirm('确实要删除吗？');"
                                CommandArgument='<%#Eval("ID") %>' CommandName="Del" CausesValidation="false">删除</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="tdbg" HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
            <asp:ObjectDataSource ID="askData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAskListByID" TypeName="GuestAsk">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="ID" Type="String" />
                    <asp:QueryStringParameter Name="type" QueryStringField="type" Type="String" DefaultValue="0" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
        <input type="checkbox" id="allCheck" onclick="selectAll(this);" />
        <asp:Button ID="delBtn" runat="server" Text="删除" OnClick="DelBtn_Click" UseSubmitBehavior="False"
            OnClientClick="if(checkedNum()){if(!confirm('确定要批量删除吗？')){return false;}}else{return false;}" class="C_input" />
        <asp:Button ID="Button2" runat="server" Text="审核通过" OnClick="BtnSubmit2_Click" OnClientClick="return checkedNum();" UseSubmitBehavior="False" class="C_input" />
        <asp:Button ID="Button3" runat="server" Text="取消审核" OnClick="BtnSubmit3_Click" OnClientClick="return checkedNum();" UseSubmitBehavior="False" class="C_input" />
        <input type="button"  value="回复问题" class="C_input" onclick="dialog();" />
        <br />
        <div id="replyDiv" style="width: 500px; text-align: center; margin:auto; display: none; position:relative;">
            <div style=" position:absolute; top:-200px; left:-200px;">
            <div style="text-align: right;"><a title="关闭回复窗口" href="javascript:replyDiv.style.display='none';void(0);">
                <img src="../../Images/no.gif" /></a></div>
            <textarea id="txtContent" style="height: 300px; width: 500PX; margin-top: 10px;" runat="server"></textarea>
                <script type="text/javascript">
                    UE.getEditor('txtContent', {
                        toolbars: [['Source', 'Undo', 'Redo', 'Bold', 'Italic', 'NumberedList', 'BulletedList', 'Smiley', 'ShowBlocks',
                                     'Maximize', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'justifyleft',
                                     'justifycenter', 'justifyright', 'justifyjustify', 'snapscreen', '|', 'help']]
                    });
                </script>
            <input type="button" id="addBtn" value="管理员回复" onclick="if (addReply()) { disableBtn(this); }" class="C_input" />
            <input type="button" id="updateBtn" value="修改回复" onclick="updateReply()" class="C_input" style="display: none;" />
            <input type="button" value="返回提问列表" class="C_input" onclick="location = 'WdCheck.aspx'" style="margin-left: 5px;" />
        </div></div>
        <script type="text/javascript">

            function test() { alert(temp); }

            function disableBtn(o)
            {
                setTimeout(function () { o.disabled = true; }, 50)
            }

            function selectAll(o) {
                var allInput = document.getElementsByName("chkSel");
                var loopTime = allInput.length;
                for (i = 0; i < loopTime; i++) {
                    if (allInput[i].type == "checkbox") {
                        allInput[i].checked = o.checked;
                    }
                }
            }
            function checkedNum() {
                var allInput = document.getElementsByName("chkSel");
                var loopTime = allInput.length;
                for (i = 0; i < loopTime; i++) {
                    if (allInput[i].type == "checkbox" && allInput[i].checked == true) {
                        return true;
                    }
                }
                alert("没有选择框被选择!");
                return false;
            }
            //----------------Dialog and Ajax
            function createUE() {
                UE.getEditor('txtContent', {
                    toolbars: [['Source', 'Undo', 'Redo', 'Bold', 'Italic', 'NumberedList', 'BulletedList', 'Smiley', 'ShowBlocks',
                                 'Maximize', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'justifyleft',
                                 'justifycenter', 'justifyright', 'justifyjustify', 'snapscreen', '|', 'help']]
                });
            }
            //function dialog() {
            //    easyDialog.open({
            //        container: 'replyDiv',
            //        fixed: false,
            //        overlay: false
            //    });
            //    createUE();
            //}

            //添加回复
            function addReply() {
                $("#updateBtn").hide();
                $("#addBtn").show();
                var obj = UE.getEditor("txtContent");
                if (obj.getContent() == "") { return false; }
                var id =<%=Request["id"]%>
                $.post("Asklist.aspx", { content: obj.getContent(), id: id, action: "add" },
                    function (data) {
                        if (data == 1) { $("#replyDiv").hide(); location = location; alert("添加成功"); }
                        else { alert("添加失败"); }
                    }, "Json");
                return true;
            }
            var temp = 0;
            //显示修改
            function disUpdate(id)
            {
                $("#updateBtn").show();
                $("#addBtn").hide();
                dialog();
                UE.getEditor("txtContent").setContent($("#" + id).html());
                temp = id;
            }
            //修改更新
            function updateReply()
            {
                var obj = UE.getEditor("txtContent");
                if (obj.getContent() == "") { return false;}
                $.post("Asklist.aspx", { content: obj.getContent(), id: temp, action: "update" },
                    function (data) {
                        if (data == 1) { $("#replyDiv").hide(); location = location; alert("更新成功"); }
                        else { alert("更新失败"); }
                    }, "Json");
                return true;
            }
        </script>
        </div>
    </form>
</body>
</html>
