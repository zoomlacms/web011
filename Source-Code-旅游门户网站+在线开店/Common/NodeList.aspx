<%@ page language="C#" autoeventwireup="true" inherits="Common_NodeList, App_Web_gjj4kpp5" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>节点选取</title>
    <style type="text/css">
        *{font-family:'Microsoft YaHei';}
        #node_div ul li{list-style-type:none;}
    </style>
    <script type="text/javascript">
        function ShowChild() {
            $obj = $(event.srcElement);
            $obj.parent().parent().find("ul:eq(0)").toggle();
        }
        function ChkChild(obj) {
            $(obj).parent().find("input[name=nodeChk]").each(function () { this.checked = obj.checked; });
        }
        function GetResult() {
            var vs = "";
            $("#node_div input[name=nodeChk]:checked").each(function () { vs += $(this).val() + ","; });
            return vs;
        }
        function ReturnResult(r) {//支持window.open与frame引用
            if (opener) {
                opener.DealResult(r);
            }
            else {
                parent.DealResult(r);
            }
        }
        function checkAll() {
            $("[name=nodeChk]").each(function (i, j) {
                j.checked = $("#AllCheck")[0].checked;
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="node_div">
            <asp:Literal runat="server" ID="NodeHtml_Lit" EnableViewState="false"></asp:Literal>
        </div>
        <div><input type="button" id="sure_Btn" value="确定" class="form-control" onclick="ReturnResult(GetResult());" /></div>
        <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    </form>
</body>
</html>