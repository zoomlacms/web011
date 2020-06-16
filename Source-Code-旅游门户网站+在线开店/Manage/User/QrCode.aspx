<%@ page language="C#" autoeventwireup="true" inherits="manage_QrCode, App_Web_aunhunhk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>二维码</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<script language="javascript" type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>

<script>
    window.onload = function () {
        //页面状态保持
        if (document.getElementById("contain").value == "2") {
            ShowCreate('crt2', 'TabTitle2');
        }
    }

    //滑动门
    var tID = 0;
    var arrTabTitle = new Array("TabTitle1", "TabTitle2");
    function pload() {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            if (document.getElementById(arrTabTitle[ID].toString()) != null) {
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            }
            if (document.getElementById(arrTabTitle[tID].toString()) != null) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            }
        }
        else {
            if (document.getElementById("TabTitle") != null) {
                document.getElementById("TabTitle").style.display = "";
                document.getElementById("TabTitle").className = "titlemouseover";
            }
            tID = ID;
        }
    }

    function ShowCreate(result, id) {
        document.getElementById("contain").value = id.substr(8, 1);
        HideCreate();
        document.getElementById(result).style.display = "";

        for (var i = 0; i < arrTabTitle.length; i++) {
            if (arrTabTitle[i] == id) {
                document.getElementById(arrTabTitle[i]).style.display = "";
                document.getElementById(arrTabTitle[i]).className = "titlemouseover";
            } else {
                document.getElementById(arrTabTitle[i]).className = "tabtitle";
            }
        }
    }

    function HideCreate() {
        for (i = 1; i < 3; i++) {
            document.getElementById("crt" + i).style.display = "none";
        }
    }
</script>
</head>
<body>
<form id="form1" runat="server">
<asp:HiddenField ID="contain" runat="server"/><%--页面保持--%>
<div class="r_navigation">后台管理 &gt;&gt; 扩展功能 &gt;&gt; <a href="ADZoneManage.aspx">生成二维码</a></div>  
<div id="Main">
    <div id="HeadNav">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr align="center">
            <td id="TabTitle1" name="TabTitle1" class="titlemouseover" onclick="ShowCreate('crt1','TabTitle1')">
                文本二维码
            </td>
            <td id="TabTitle2" name="TabTitle2" class="tabtitle" onclick="ShowCreate('crt2','TabTitle2')">
                名片信息
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <table class="border" width="100%" margin:auto;>
        <tr class="title">
            <td>生成二维码</td>
        </tr>
    </table>
    </div>
    <div class="CreateCk">
        解码格式:
        <asp:DropDownList id="Encoding" CssClass="dropd1" runat="server" Height="20px" Width="93px">
            <asp:ListItem>包含文字数字</asp:ListItem>
            <asp:ListItem>数字</asp:ListItem>
            <asp:ListItem Selected="True">文字</asp:ListItem>
        </asp:DropDownList>
        纠错等级:<asp:DropDownList id="Level" CssClass="dropd1" runat="server" Height="20px" Width="50px">
            <asp:ListItem Selected="True">L</asp:ListItem>
            <asp:ListItem>M</asp:ListItem>
            <asp:ListItem>Q</asp:ListItem>
            <asp:ListItem>H</asp:ListItem>
        </asp:DropDownList>
        版本:<asp:DropDownList id="Version" CssClass="dropd1" runat="server" Height="20px" Width="50px">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem Selected="True">5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
        大小:<asp:TextBox CssClass="x_input" ID="TxtSize" Text="4"  runat="server" Width="50px"></asp:TextBox>
    </div>
    <div id="crt1">
        <asp:TextBox ID="TxtContent" class="x_input" runat="server" Height="50px" TextMode="MultiLine" Width="435px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="BtnCreate" CssClass="C_input" Text="创建" runat="server" OnClick="BtnCreate_Click" />
        &nbsp;
        <asp:Button ID="BtnSave" Text="保存" CssClass="C_input" runat="server" OnClick="BtnSave_Click" />
<%--    &nbsp;
        <asp:FileUpload ID="FileOpen" runat="server" Width="70px" />
        &nbsp;
        <asp:Button ID="BtnOpen" Text="上传" OnClick="BtnOpen_Click" runat="server" />
        &nbsp;
        <asp:Button ID="BtnDecode" Text="解码" runat="server" OnClick="BtnDecode_Click" />--%>
    </div>
    <div id="crt2" style="display:none;">
        <table>
            <tr>
                <td>姓名:</td>
                <td><input  class="x_input" runat="server" id="FN"></td>
                <td>手机:</td>
                <td><input class="x_input" runat="server" id="TEL"></td>
                <td>邮箱:</td>
                <td><input class="x_input" runat="server" id="EMAIL">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确的邮箱格式" ControlToValidate="EMAIL" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>MSN:</td>
                <td><input class="x_input" id="MSN" runat="server" style="width: 100px"></td>
                <td>QQ:</td>
                <td><input class="x_input" id="QQ" runat="server" style="width: 100px"></td>
                <td>个人主页:</td>
                <td><input class="x_input" id="URL" runat="server"></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="BtnCreates" OnClick="BtnCreates_Click" CssClass="C_input" Text="创建" runat="server"/>
        &nbsp;
        <asp:Button ID="BtnSaves" Text="保存" CssClass="C_input" OnClick="Button1_Click" runat="server"/>
    </div>
    <div id="ShowImgs" runat="server" visible="false">
        <asp:Image ID="ImgCode" runat="server"/>
    </div>
    </div>
</form>
</body>
</html>
