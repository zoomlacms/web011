<%@ page language="C#" autoeventwireup="true" inherits="manage_WeiXin_UpdateCode, App_Web_ckavs3bx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>修改二维码</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" /> 
<script language="javascript" type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    //function Checks() {
        //var type = '<%=Request["Type"]%>';
    //    if (type != '') {
    //        if (type == '1') {
    //            document.getElementById("TabTitle1").style.display ="none";
    //            document.getElementById("TabTitle2").style.display = "";
    //            document.getElementById("crt1").style.display = "none";
    //            document.getElementById("crt2").style.display = "";
    //        } else {
    //            document.getElementById("TabTitle1").style.display = "";
    //            document.getElementById("TabTitle2").style.display = "none";
    //            document.getElementById("crt1").style.display = "";
    //            document.getElementById("crt2").style.display = "none";
    //        }
    //    }
    //}
    //window.onload = Checks();
</script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理 &gt;&gt; <a href="wxApi.aspx">微信管理</a> &gt;&gt; <a href="QrCode.aspx">生成二维码</a>  <a href="QrCodeManage.aspx" style="color:#ff0000;">[二维码管理]</a></div> 

<div id="HeadNav" runat="server">
<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
<tr align="center">
<td id="TabTitle1" runat="server" name="TabTitle1" class="titlemouseover">
文本二维码
</td>
<td id="TabTitle2" runat="server" name="TabTitle2" class="titlemouseover">
名片信息
</td>
            
<td></td>
</tr>
</table>
</div>

<table  width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
 <tr class="tdbg"><td  style="padding-top:10px;"> 
    <div class="CreateCk">
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
<%--        背景颜色:<asp:DropDownList id="BackColor" CssClass="dropd1" runat="server" Height="20px" Width="50px">
            <asp:ListItem Value="蓝色">蓝色</asp:ListItem>
            <asp:ListItem Value="黄色">黄色</asp:ListItem>
            <asp:ListItem Value="绿色">绿色</asp:ListItem>
            <asp:ListItem Value="灰色">灰色</asp:ListItem>
            <asp:ListItem Value="白色">白色</asp:ListItem>
            <asp:ListItem Value="红色">红色</asp:ListItem>
        </asp:DropDownList>
        边框颜色:<asp:DropDownList id="ForeColor" CssClass="dropd1" runat="server" Height="20px" Width="50px">
            <asp:ListItem Value="红色">红色</asp:ListItem>
            <asp:ListItem Value="黑色">黑色</asp:ListItem>
            <asp:ListItem Value="棕色">棕色</asp:ListItem>
            <asp:ListItem Value="绿色">绿色</asp:ListItem>
        </asp:DropDownList>--%>
    </div>
    <div id="crt1" runat="server">
        <asp:TextBox ID="TxtContent" class="x_input" runat="server" Height="50px" TextMode="MultiLine" Width="435px"></asp:TextBox>
        <br />
        <span style="color:#808000;">注：如需生成网址则须在开头加上http:// 如(http://www.baidu.com)</span>
        <br /> 
       <div id="img1div"></div>
         <asp:Button ID="BtnCreate" CssClass="C_input" Text="保存修改" runat="server" OnClick="BtnCreate_Click" /> 
         &nbsp;
        <asp:Button ID="BtnSave" Text="下载到本地" CssClass="C_input" runat="server" OnClick="BtnSave_Click" />
        &nbsp;
       <input id="Button2" type="button" value="获取调用代码" class="C_input"  onclick="copy()"/> 
         &nbsp;
        <input name="Cancel" type="button" class="C_input"  id="Button1" value="返回列表" onclick="javescript: history.go(-1)" />   
        
<%--    &nbsp;
        <asp:FileUpload ID="FileOpen" runat="server" Width="70px" />
        &nbsp;
        <asp:Button ID="BtnOpen" Text="上传" OnClick="BtnOpen_Click" runat="server" />
        &nbsp;
        <asp:Button ID="BtnDecode" Text="解码" runat="server" OnClick="BtnDecode_Click" />--%>
    </div>
    <div id="crt2" runat="server">
        <table>
            <tr>
                <td>姓名:</td>
                <td><input  class="x_input" runat="server" id="FN"></td>
                <td>个人主页:</td>
                <td><input class="x_input" id="URL" runat="server"></td>
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
                <td>手机:</td>
                <td>
                    <input class="x_input" runat="server" id="TEL">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="请输入正确的手机号码" ControlToValidate="TEL" ValidationExpression="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
          <div id="img2div"></div>
        <br />
        <asp:Button ID="BtnCreates" OnClick="BtnCreates_Click" CssClass="C_input" Text="保存修改" runat="server"/> 
         &nbsp;
        <asp:Button ID="BtnSaves" Text="下载到本地" CssClass="C_input" OnClick="BtnSave_Click" runat="server"/>
         &nbsp;
       <input id="Button3" type="button" value="获取调用代码" class="C_input"  onclick="copy()"/> 
        &nbsp;
         <input name="Cancel" type="button" class="C_input"  id="Cancel" value="返回列表" onclick="javescript: history.go(-1)" />   
    </div>
   <div id="ShowImgs" runat="server" visible="false" style="display:none;">
      
<table width="100%" border="0" cellpadding="2" cellspacing="1"  >
<tr class="tdbg">
<td align="left" style="height:30px; padding-left:60px; padding-bottom:20px; padding-top:10px;">
<asp:Image ID="ImgCode" runat="server"/><br />
</td>	</tr>
<tr class="tdbg">
<td align="left" ><asp:TextBox TextMode="MultiLine" ID="TxtZoneCode" runat="server" rows="2" cols="20"  class="x_input" style="Width:435px;Height:30px; padding:5px;"></asp:TextBox><br /></td>
</tr>  
<tr class="tdbg">
<td align="left" >   
     
</td>
</tr> 
<tr class="tdbg">
<td align="left" >
<span style="color:Grey">调用方法：点击按钮复制代码，粘贴到网页中的指定位置即可。</span></td>
</tr>
</table>

    </div>
 </td></tr>    
</table>
<script>
    if (document.getElementById("img1div"))
        document.getElementById("img1div").innerHTML = document.getElementById("ShowImgs").innerHTML;
    if (document.getElementById("img2div"))
        document.getElementById("img2div").innerHTML = document.getElementById("ShowImgs").innerHTML;
</script>
</form>
</body>
</html>
