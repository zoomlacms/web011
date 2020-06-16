<%@ page language="C#" autoeventwireup="true" inherits="Manage_Content_CreateHtmlByNode, App_Web_gqexlk3x" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>按节点发布</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div id="foo" style="position:fixed;top:50%;left:30%;display:block;"></div>
    <table class="table table-striped table-bordered table-hover">
        <tr class="gridtitle" align="center" style="height: 25px;">
            <td width="3%" class="title">
                <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />
            </td>
            <td style="width:3%;text-align:center;">
                <strong>ID</strong>
            </td>
            <td style="width:40%;">
                <strong>节点名称</strong>
            </td>
            <td  style="width:12%;height:20px;">
                <strong>节点类型</strong>
            </td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr onclick="getNodeList(this,'nodeList','<%#Eval("NodeID")%>');" class="tdbg list<%# Eval("ParentID") %>" id='list<%#Eval("NodeID")%>' name="list<%#Getprname(Eval("NodeID"))%>" align="center" onmouseover="this.className='tdbgmouseover list<%# Eval("ParentID") %>'" onmouseout="this.className='tdbg list<%# Eval("ParentID") %>'" <%# ShoworHidden(Eval("NodeID")) %> ondblclick='showlist(<%#Eval("NodeID") %>);'>
                    <td style=" height:22px;text-align:center;">
                        <input name="Item" type="checkbox" value='<%# Eval("NodeID")%>' />
                    </td>
                    <td >
                        <strong><%# Eval("NodeID") %></strong>
                    </td>
                    <td style="text-align:left;">
                        <%# GetIcon(DataBinder.Eval(Container, "DataItem.NodeName", "{0}"), DataBinder.Eval(Container, "DataItem.NodeID", "{0}"), DataBinder.Eval(Container, "DataItem.Depth", "{0}"), DataBinder.Eval(Container, "DataItem.NodeType", "{0}"))%>
                    </td>
                    <td>
                        <strong><%# GetNodeType(DataBinder.Eval(Container, "DataItem.NodeType", "{0}"))%></strong>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <div class="clearbox"></div>
    <asp:Button ID="Button1" runat="server" Text="发布栏目" CssClass="btn btn-primary" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="发布内容" CssClass="btn btn-primary" OnClick="Button2_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="./JS/SelectCheckBox.js"></script>   
<script type="text/javascript" src="./js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
<script type="text/javascript" src="/Plugins/JqueryUI/spin/spin.js"></script>
<script type="text/javascript">
    var Num = 0;
    var nn = 0;
    function help_show(helpid) {
        Num++;
        var newDiv = document.createElement('div');
        var str = "<div id='help_content'></div><div id='help_hide'><a onclick='help_hide(Num)' style='width:20px;color:#666' title='关闭'></a></div> ";
        newDiv.innerHTML = str;
        newDiv.setAttribute("Id", "help_div" + Num);
        nn = Num - 1
        jQuery("#help").append(newDiv);
        if ($("#help_div" + nn))
        { $("#help_div" + nn).remove(); }
        jQuery("#help_content").load("/manage/help/" + helpid + ".html", function () { jQuery("#help").show(); });
    }
    function help_hide(Num) {
        jQuery("#help_div" + Num).remove();
    }

    function CheckAll(spanChk) {
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;
        for (i = 0; i < elm.length; i++) if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
            if (elm[i].checked != xState)
                elm[i].click();
        }
    }

    function showlist(sid) {
        var i = 0;
        var j = 0;
        var state = $("#list" + sid).attr("state");
        if (sid == "0") {
            for (i = 3; i <= $("tr").length; i++) {
                if (state == "1") {
                    $("tr:nth-child(" + i + ")").css("display", "none");
                    $("tr:nth-child(" + i + ")").attr("state", "1");
                }
                else {
                    $(".list" + sid).css("display", "");
                    $("tr:nth-child(" + i + ")").attr("state", "0");
                }
            }
        }
        else {
            for (i = 1; i <= $("tr").length; i++) {
                if ($("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name") && $("tr:nth-child(" + i + ")").attr("id") == ("list" + sid)) {
                    j++;
                    continue;
                }
                if (j == 1 && $("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name")) {
                    j++;
                    break;
                }
                switch (j) {
                    case 1:
                        if (state == "1") {
                            $("tr:nth-child(" + i + ")").css("display", "none");
                            $("tr:nth-child(" + i + ")").attr("state", "1");
                        }
                        else {
                            $(".list" + sid).css("display", "");
                            $("tr:nth-child(" + i + ")").attr("state", "0");
                        }
                        break;
                }
            }
        }
        if (state == "1") {
            $("#list" + sid).attr("state", "0");
        } else {
            $("#list" + sid).attr("state", "1");
        }
    }
    //-------------------
    var opts = {
        lines: 8, // The number of lines to draw
        length: 6, // The length of each line
        width: 2, // The line thickness
        radius: 5, // The radius of the inner circle
        color: '#000', // #rbg or #rrggbb
        speed: 1, // Rounds per second
        trail: 100, // Afterglow percentage
        shadow: true // Whether to render a shadow
    };
    var trCode = "<tr onclick=\"getNodeList(this,'nodeList','{nid}');\" class=\"tdbg list{pid}\" id=\"list{nid}\" name=\"list{pid}\" align=\"center\" onmouseover=\"this.className='tdbgmouseover list{pid}'\" onmouseout=\"this.className='tdbg list{pid}'\"  state=\"1\" ondblclick=\"showlist({nid})\" >"
                + "<td style=\" height:22px;text-align:center;\">"
                    + "<input name=\"Item\" type=\"checkbox\" value=\"{nid}\"></td>"
                + "<td><strong>{nid}</strong></td>"
                + "<td style=\"text-align:left;\">"
                   + "{icon}"
               + "</td><td><strong>{type2}</strong></td>"
                    + "</tr>";

    function getNodeList(obj, a, nodeID) {
        var target = document.getElementById('foo');
        var spinner = new Spinner(opts).spin(target);
        $.ajax({
            type: "Post",
            url: "NodeManage.aspx",
            data: { want: a, nid: nodeID },
            dataType: "json",//json
            success: function (data) {
                spinner.stop();
                if (!data) return;
                for (var i = 0; i < data.length; i++) {
                    newTr = trCode.replace("{NodeName}", data[i].NodeName);
                    newTr = newTr.replace(/{icon}/, data[i].icon);
                    newTr = newTr.replace(/{nid}/g, data[i].NodeID);
                    newTr = newTr.replace(/{pid}/g, data[i].ParentID);
                    //newTr = newTr.replace(/{showhidden}/g, data[i].showhidden)
                    newTr = newTr.replace(/{type2}/g, data[i].type2);
                    $(obj).after(newTr);
                }
            },
            error: function (data) {
                spinner.stop();
                alert("自定错误" + data);
            }
        });
        obj.onclick = "";
    }
</script>
</asp:Content>