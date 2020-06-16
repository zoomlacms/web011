<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_StructTree, App_Web_hjb2stj5" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>组织结构左侧栏</title>
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
    function SetNodeSelect(conid, nodeid, nodename) {
        var theBox = document.getElementById(conid);
        xState = theBox.checked;
        var v = opener.document.getElementById("hfNode").value;
        if (xState) {
            var hfnode = opener.document.getElementById("hfNode");
            hfnode.value = nodeid;//+="," +
            //opener.document.write("dddd");
            opener.AddRowNode(nodename, nodeid, opener.document.all.NondeTable, "此组织", 1);
        }
        else {
            var arr = v.split(",");
            for (var i = 0; i < arr.length; i++) {
                if (arr[i] == nodeid)
                    opener.DelCurrentRow(nodeid, 1);
            }
        }
    }
    function SetNode(conid, nodeid, nodename) {

       // var v = opener.document.getElementById("hfNode").value;
      //  var arr = v.split(",");
       //v = nodeid + ",";
      //  for (var i = 1; i < arr.length; i++) {
       //     if (arr[i] != nodeid && arr[i] != "") {
       //         v =arr[i] + ",";
              
        //    }
      //  }
      //  var t = opener.document.getElementById("hfNode").value = v;
      //  alert(v)
        var checks = document.getElementById(conid).checked;
        opener.ShowNode(nodename, checks, nodeid);
       
       // window.close();
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="border">
        <tr class="tdbgleft" id="tr2" runat="server">
            <td colspan="2">
                <asp:TreeView ID="tvNav" runat="server" ExpandDepth="1" ShowLines="True" EnableViewState="False">
                </asp:TreeView>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">

        var a = opener.document.form1.hfNode.value;
        var arr = new Array();
        arr = a.split(","); //字符分割
        var elm = document.form1.elements;
        if ('<%=Request.QueryString["type"]%>' == "check") {
            for (var j = 0; j < arr.length; j++) {
                for (var i = 0; i < elm.length; i++) {
                    if (elm[i].type == "checkbox") {
                        if (arr[j] == elm[i].value) {
                            elm[i].checked = true;
                            if (j == 0) {
                                elm[i].disabled = true;
                            }
                        }
                    }
                }
            }
        }
        else {
            for (var i = 0; i < elm.length; i++) {
                if (elm[i].type == "checkbox") {
                    if (arr[0] == elm[i].value)
                        elm[i].checked = true;
                }
            }
        }

    </script>

    </form>
</body>
</html>