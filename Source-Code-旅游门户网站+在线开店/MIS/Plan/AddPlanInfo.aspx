<%@ page language="C#" autoeventwireup="true" inherits="MIS_Plan_AddPlanInfo, App_Web_rf4ejtbp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>计划内容</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="/js/ajaxrequest.js"></script>
<script src="/JS/MisView.js"></script> 
<script> 
    function loadPage(id, url) {
        $("#" + id).addClass("loader");
        $("#" + id).append("Loading......");
        $.ajax({
            type: "get",
            url: url,
            cache: false,
            error: function () { alert('加载页面' + url + '时出错！'); },
            success: function (msg) {
                $("#" + id).empty().append(msg);
                $("#" + id).removeClass("loader");
            }
        });
    }
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="Meno">
 <span class="fr"> - 未完成 - 已完成 - 已取消</span>[ <asp:Label ID="lblPre" runat="server"></asp:Label> | <asp:Label ID="lblNext" runat="server"></asp:Label> | <a href="javascript:void" onclick="javascript:history.go(-1)">返回</a> ]  
<div class="popup_headti">       <asp:Label ID="lblTitle" runat="server"></asp:Label>  </div>
    <div id="editTit" runat="server"><asp:TextBox ID="txtTile" runat="server"></asp:TextBox> <asp:Button ID="lbtEdit" CssClass="i_bottom" runat="server" Text="确定"  OnClick="lbtEdit_Click" />&nbsp;<asp:Button CssClass="i_bottom" ID="Lbtn2" runat="server" Text="取消" OnClick="lbtEditV_Click" />   </div>
<div class="myoper"> <asp:LinkButton ID="lbtEditV" runat="server" Text="[编辑计划标题]" OnClick="lbtEditV_Click"></asp:LinkButton> 
    <asp:LinkButton ID="LinkButton1" runat="server" Text="[立即发布当前计划]" OnClick="lbtSubmit_Click"  OnClientClick="return confirm('确定发布？')" ></asp:LinkButton> </div>
<table width="100%" class="tsktab " border="1" style="border-collapse:collapse; border-color:#EEE;">
<tr><th width="10%" align="right">计划类型</th><td><asp:Label ID="lblType" runat="server"></asp:Label></td>
    <th width="10%" align="right">计划时间</th><td><asp:Label ID="lblStartTime" runat="server"></asp:Label>-<asp:Label ID="lblEndTime" runat="server"></asp:Label></td>
    <th width="10%" align="right">当前版本</th><td><asp:Label ID="lblVersion" runat="server"></asp:Label></td>
</tr>
    <tr><th align="right">计划部门</th><td><asp:Label ID="lblDepart" runat="server"></asp:Label></td>
    <th align="right">计划人</th><td><asp:Label ID="lblInputer" runat="server"></asp:Label></td>
    <th align="right">最后编辑时间</th><td><asp:Label ID="lblEditTime" runat="server"></asp:Label></td>
</tr>
</table>
<table class="border staff_frm" width="100%" >
<tr height="25" class="title" style="background-image: none; background-attachment: scroll; background-repeat: repeat; background-position-x: 0%; background-position-y: 0%; background-color: rgb(231, 243, 255);">
<th width="100"></th> <th width="60%">详细内容</th> <th width="180">编辑时间</th> </tr>
   
<tr><td width="100" align="right" valign="top">内容 </td><td id="log_box" colspan="2"> 
<div id="mylog_title_div" ><a href="javascript:void(0);"  onclick="ShowHidDiv('mylog_title_div','edit_middel_div')"> >>添加计划内容</a></div>
<div id="edit_middel_div" runat="server" style="display:none;" class="bgyellow">
<asp:TextBox ID="txtTitle" Text="分类标签" class="M_input" runat="server" /><br />
<textarea id="log_1" name="log_1" cols="60" rows="6" runat="server">计划细则</textarea><br /> 
<asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="确定" />
<input id="btn1Cln" type="button" onclick="ShowHidDiv('mylog_title_div', 'edit_middel_div')" value="取消" />
</div>
<div id="dayList">
<ul>
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
<ItemTemplate> 
<li><div class="greybg"><strong> <%#Eval("Title") %> </strong></div><span><%#Eval("CreateTime","{0:MM-dd hh:mm}") %>  </span> <%#Eval("Content") %>  <div>
    <asp:LinkButton ID="lbtSet" CommandArgument='<%#Eval("ID") %>' CommandName="SetSta" Text="设置完成" runat="server" ></asp:LinkButton>  | <a href="javascript:void(0)" onclick="ShowDiv('Dayshow_<%#Eval("ID") %>')" >编辑</a> | <asp:LinkButton ID="lbtDel" CommandArgument='<%#Eval("ID") %>' CommandName="SetDel" Text="删除" runat="server" ></asp:LinkButton> | 
<a href="javascript:void(0)" onclick="ShowDiv('DayChang_<%#Eval("ID") %>')" >延期到</a>
<%--<asp:LinkButton ID="lbtDate" CommandArgument='<%#Eval("ID") %>' CommandName="SetDate" Text="延期到" runat="server" ></asp:LinkButton>--%>
</div></li>
<li id='Dayshow_<%#Eval("ID") %>' style="display:none;"  class="bgyellow">
<textarea id='logEdit_<%#Eval("ID") %>' name='logEdit_<%#Eval("ID") %>' cols="60" rows="6" ><%#Eval("Content") %></textarea>
<asp:Button ID="btnEdDay" CommandArgument='<%#Eval("ID") %>' CommandName="Edit"   runat="server" Text="确定" />
<input id="Button5" type="button" onclick="ShowDiv('Dayshow_<%#Eval("ID") %>')"  value="取消" />
</li>
<li id='DayChang_<%#Eval("ID") %>' style="display:none;"  class="bgyellow">
<input id='edtDate_<%#Eval("ID") %>'  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input"  />
<asp:Button ID="Button4" CommandArgument='<%#Eval("ID") %>' CommandName="EditDate"   runat="server" Text="确定" />
<input id="Button6" type="button" onclick="ShowDiv('DayChang_<%#Eval("ID") %>')" value="取消" />
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
</td></tr>
<tr><td align="center" valign="top">总结 </td>
    <td id="end_box"  colspan="2">
    <div id="jtit"></div><a href="javascript:void(0);"  onclick="ShowHidDiv('jtit','Div1')">  >>计划总结  </a>
<div id="Div1"  style="display:none;">
<textarea  id="jie_1" name="jie_1"  cols="60" rows="6"></textarea><br />
<asp:Button ID="Button2" OnClick="Button2_Click" CssClass="i_bottom" runat="server" Text="确定" />
    <input id="Button5" type="button" class="i_bottom" onclick="ShowHidDiv('jtit', 'Div1')" value="取消" />
</div>
<div id="DaiJie">
<ul>
<asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater1_ItemCommand">
<ItemTemplate> 
    <li><span><%#Eval("CreateTime","{0:MM-dd hh:mm}") %>  </span> <%#Eval("Title") %><%#Eval("Content") %>  <div><asp:LinkButton ID="lbtSet" CommandArgument='<%#Eval("ID") %>' CommandName="SetSta" Text="设置完成" runat="server" ></asp:LinkButton>  | <a href="javascript:void(0)" onclick="ShowDiv('Dayshow_<%#Eval("ID") %>')" >编辑</a> | <asp:LinkButton ID="lbtDel" CommandArgument='<%#Eval("ID") %>' CommandName="SetDel" Text="删除" runat="server" ></asp:LinkButton> |<a href="javascript:void(0)" onclick="ShowDiv('DayChang_<%#Eval("ID") %>')" >延期到</a>
<%--<asp:LinkButton ID="lbtDate" CommandArgument='<%#Eval("ID") %>' CommandName="SetDate" Text="延期到" runat="server" ></asp:LinkButton> --%>
</div>    </li>
<li id='Dayshow_<%#Eval("ID") %>' style="display:none;">
    <textarea id='logEdit_<%#Eval("ID") %>' name='logEdit_<%#Eval("ID") %>' cols="60" rows="6" ><%#Eval("Content") %></textarea><br />
        <asp:Button ID="btnEdDay" CommandArgument='<%#Eval("ID") %>' CommandName="Edit"   runat="server" Text="确定" />
<input id="Button5" type="button" onclick="ShowDiv('Dayshow_<%#Eval("ID") %>')"  value="取消" />
</li>
    <li id='DayChang_<%#Eval("ID") %>' style="display:none;">
    <input id='edtDate_<%#Eval("ID") %>'  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="M_input"  />
        <asp:Button ID="Button4" CommandArgument='<%#Eval("ID") %>' CommandName="EditDate"   runat="server" Text="确定" />
        <input id="Button6" type="button" onclick="ShowDiv('DayChang_<%#Eval("ID") %>" value="取消" />
</li>
</ItemTemplate>
</asp:Repeater>
</ul></div></td></tr>
<tr><td align="center" valign="top"> 附件 </td><td  colspan="2"><table><tr><td><a href="javascript:void(0)" onclick="additem('filesDiv')">  >>添加附件  </a>
<textarea id="Textfile" cols="100" rows="6" style="display:none;"></textarea></td></tr></table>
<table><tr><td>
<asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater1_ItemCommand">
<ItemTemplate> 
<li><span><%#Eval("CreateTime","{0:MM-dd hh:mm}") %>  </span><a href="/UploadFiles/<%#Eval("Content") %>"><%#Eval("Title") %> </a> <div>   <asp:LinkButton ID="lbtDel" CommandArgument='<%#Eval("ID") %>' CommandName="SetDel" Text="删除" runat="server" ></asp:LinkButton>  
<%--<asp:LinkButton ID="lbtDate" CommandArgument='<%#Eval("ID") %>' CommandName="SetDate" Text="延期到" runat="server" ></asp:LinkButton> --%>
</div>    </li>  
</ItemTemplate></asp:Repeater>
</td></tr>
</table>
<table id="filesDiv"></table>
<asp:Button ID="Button3" OnClick="Button3_Click" CssClass="i_bottom" runat="server" Text="确定" />
</td></tr>
</table>  </div>
</form>
    <script>
        var ajax = new AJAXRequest();
        var count = 0, number = 0;
        var save = "";

        function deleteItem(obj, string) {
            //alert("a");
            if (number >= 1) {
                number = number - 1;
                var curRow = obj.parentNode.parentNode;
                var tb3 = document.getElementById("filesDiv");
                var i;
                string = string + ",";
                i = save.indexOf(string);
                saveh1 = save.substr(0, i);
                saveh2 = save.substr(i + 2, save.length - i - 2);
                save = saveh1 + saveh2;
                tb3.deleteRow(curRow.rowIndex);
                document.getElementById("hfNumber").value = save;
            }
        }
        var str = ""; 
        function additem(id) {
            str =  '<input type="file" name="File" style="width: 300px" runat="server"/>';
            var row, cell, str;
            var tab1 = document.getElementById(id); 
            row = tab1.insertRow(number);
            if (row != null) {
                row.insertCell(0).innerHTML = "<td>"+str+" <a href=\"javascript:void(0)\" class=\"button\"  onclick=\'deleteItem(this," + count + ");\'>删除</a></td>";
                save = save + count + ",";
                count++;
                number++;
            }
            document.getElementById("hfNumber").value = save; 
        } 
</script>
</body>
</html>
