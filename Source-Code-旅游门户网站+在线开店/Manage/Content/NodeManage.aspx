<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.NodeManage, App_Web_i3fxcuwj" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%--<%@ OutputCache Duration="1200" VaryByParam="none"%>--%>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>节点管理</title>
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
<link type="text/css" href="../../App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/calendar.js"></script>
<script type="text/javascript" src="../../JS/SelectCheckBox.js"></script>   
<script type="text/javascript" src="../../JS/Popmenu.js"></script>
<script type="text/javascript" src="../../js/Drag.js"></script>
<script type="text/javascript" src="../../js/Dialog.js"></script>
<script type="text/javascript" src="../../Plugins/JqueryUI/spin/spin.js"></script>
<script type="text/javascript" src="../../JS/jquery.js"></script>
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
    //为了Json序列化，如此处理
    var data = ["EditNode.aspx?NodeID=", "SetNodeOrder.aspx?ParentID=", "SetNodeOrder.aspx?ParentID=", 'EditSinglePage.aspx?NodeID=',"EditOutLink.aspx?NodeID="];
    function isInt(e) { var t = /^\d+(\d+)?$/gi; return t.exec(e) ? !0 : !1 }
    function open_page(NodeID, strURL) {
        var diag = new Dialog();
        diag.Width = 800;
        diag.Height = 600;
        diag.Title = "添加节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        if(isInt(strURL))
        {
            strURL = data[strURL];
        }
        diag.URL = strURL + NodeID;
        diag.show();
    }
    function editnode(NodeID) {
        var answer = confirm("该栏目未绑定模板，是否立即绑定");
        if (answer == false) {
            return false;
        }
        else {
            open_page(NodeID, "EditNode.aspx?NodeID=");
        }
    }
    function emptynode() {
        var answer = confirm("此操作将删除现有站点数据，确认？");
        if (answer == false) {
            return false;
        }
        else {
            //$("#EmptyNode").click();
            //alert('d');
            window.location.href = "NodeManage.aspx?action=del";
        }
    }
    function delConfirm()
    {
        return confirm("你确定要删除该节点吗？");
    }
</script>
</head>
<body>
<form id="form1" runat="server">
    <div id="nav_box">
<div class="r_navigation">
<%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('15')" title="帮助"></a></div>
  <%} %> 后台管理&gt;&gt;系统设置 &gt;&gt;<a href="NodeManage.aspx">节点管理</a>
  <%--<a href="../Config/EmptyData.aspx" style=" color:Red">[初始化全站数据]</a>--%>
  <span id="dropdown" class="dropd1">
  <a href="../Config/EmptyData.aspx" style=" color:green" onmouseover="showmenu(event,'<div class=menuitems><a href=\'NodeManage.aspx?action=showall\'>展开所有节点</a></div><div class=menuitems><a href=\'NodeManage.aspx\' >收缩所有节点</a></div><div class=menuitems><a href=\'javascript:void(0)\' onclick=\'emptynode()\'>删除所有节点</a></div><div class=menuitems><a href=\'../Config/EmptyData.aspx\' >初始化全站数据</a></div>')">操作</a>
  </span>
  </div>
 </div>
    <div style="height:27px;"></div>

<script type="text/javascript">
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
				+"<td style=\" height:22px;text-align:center;\">"
					+"<input name=\"Item\" type=\"checkbox\" value=\"{nid}\"></td>"
				+"<td><strong>{nid}</strong></td>"
                +"<td style=\"text-align:left;\">"
                   + "{icon}"
               +"</td><td><strong>{type2}</strong></td>"
					+"<td>{oper}"
				+"</td></tr>";

        function getNodeList(obj,a,nodeID)
        {
            var target = document.getElementById('foo');
            var spinner = new Spinner(opts).spin(target);
            $.ajax({
                type: "Post",
                url: "NodeManage.aspx",
                data: { want: a, nid: nodeID },
                dataType:"json",//json
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
                        newTr = newTr.replace(/{oper}/, data[i].oper);
                        $(obj).after(newTr);
                    } 
                },
                error: function (data)
                {
                    spinner.stop();
                    alert("自定错误"+data);
                }
            });
            obj.onclick = "";
        }
    </script>
    <div id="foo" style="position:fixed;top:50%;left:30%;display:block;"></div>
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="border" align="center">
	<tr class="gridtitle" align="center" style="height: 25px;">
		<td width="3%" class="title"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
		<td style="width:3%;text-align:center;"><strong>ID</strong></td>
		<td style="width:40%;"><strong>节点名称</strong></td>
		<td  style="width:12%;height:20px;"><strong>节点类型</strong></td>
		<td style="width:45%"><strong>操作</strong></td>
	</tr>
	<asp:Repeater ID="Repeater1" runat="server">
		<ItemTemplate>
            	<tr onclick="getNodeList(this,'nodeList','<%#Eval("NodeID")%>');" class="tdbg list<%# Eval("ParentID") %>" id='list<%#Eval("NodeID")%>' name="list<%#Getprname(Eval("NodeID"))%>"
                align="center" onmouseover="this.className='tdbgmouseover list<%# Eval("ParentID") %>'" 
                onmouseout="this.className='tdbg list<%# Eval("ParentID") %>'" <%# ShoworHidden(Eval("NodeID")) %>>
				<td style=" height:22px;text-align:center;">
					<input name="Item" type="checkbox" value='<%# Eval("NodeID")%>' />
				</td>
				<td ><strong><%# Eval("NodeID") %></strong>      </td>
                <td style="text-align:left;">
                    <%# GetIcon(DataBinder.Eval(Container, "DataItem.NodeName", "{0}"), 
                    DataBinder.Eval(Container, "DataItem.NodeID", "{0}"), DataBinder.Eval(Container, "DataItem.Depth", "{0}"), 
                    DataBinder.Eval(Container, "DataItem.NodeType", "{0}"))%>
                </td>
				<td>
					<strong><%# GetNodeType(DataBinder.Eval(Container, "DataItem.NodeType", "{0}"))%></strong>
				</td>
				<td >
					<%# GetOper(DataBinder.Eval(Container, "DataItem.NodeID", "{0}"), DataBinder.Eval(Container, "DataItem.NodeType", "{0}"))%>
				</td>
			</tr>
        </ItemTemplate>
    </asp:Repeater>
    </table>
    <br />
    <asp:Button ID="Button3" class="C_input" runat="server" OnClientClick="return confirm('此操作将删除现有站点数据，确认？');" Text="批量删除" OnClick="Button3_Click" />
    </form>
</body>
</html>
