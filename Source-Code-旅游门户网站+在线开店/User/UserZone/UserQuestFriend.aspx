<%@ page language="C#" autoeventwireup="true" inherits="User_Guild_UserQuestFriend, App_Web_yvo3vzv5" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>找朋友</title>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/ICMS/User_V3.css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
<form id="form1" runat="server" >    
<div>     
   <table class="table table-hover padding0">
   <tr><td>
    <a href="/User/UserFriend/Default.aspx">我的好友</a>
   </td>
   <td>
   <a href="UserQuestFriend.aspx">查找好友</a>
   </td>
   </tr>
   </table>
    </div>
    <div>
        <table class="table table-hover padding0">
            <tr>
                <td>
                    <%-- <img src="../images/ico_hy.gif" width="28" height="24" align="absmiddle" />--%>
                    查找朋友
                </td>
                <td align="right">
                    <a href="javascript:window.history.back();">&lt;&lt;返回上一页</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="content">
        <br />
       
        <table style="width:569px;height:175px;" class="table table-hover table-bordered padding0">
            <tr>
                <td colspan="2">
                    <%--<img src="#" width="24" height="23" align="absmiddle" />--%>
                    <font color="#336699"><strong class="f14">模糊查找</strong></font>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    性别：
                </td>
                <td>
                  <select name="sex" id="sex" runat="server">
                        <option value="3">所有</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    年龄范围：
                </td>
                <td>
                    <select class="form-control" name="age" id="age" runat="server">
                        <option value="0">全部</option>
                        <option value="1">18以下</option>
                        <option value="2">18-25</option>
                        <option value="3">25-33</option>
                        <option value="4">33-45</option>
                        <option value="5">45以上</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    地区：
                </td>
                <td>
                    <asp:DropDownList ID="province" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="province_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:DropDownList ID="city" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="text-right">&nbsp;
                </td>
                <td>
                    <span class="btmbian">
                    <asp:Button ID="btnSecher" runat="server" CssClass="btn btn-primary" Text="查找" onclick="btnSecher_Click" />
				</span>
                </td>
            </tr>
        </table>

        <br /><br />
        <table style="width:569px;height:165px;" class="table table-bordered table-hover padding0">
            <tr>
                <td colspan="2">
                    <%--<img src="../images/ico_search1.gif" width="24" height="23" align="absmiddle" />--%>
                    <font color="#336699"><strong>精确查找</strong></font>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    对方昵称：
                </td>
                <td>
                    <input name="username" type="text"  id="username" size="40" maxlength="20" class="form-control" runat="server"/>
                    <span class="btmbian">
                    <asp:Button ID="btnFirendUserName" runat="server" Text="查找" CssClass="btn btn-primary"  onclick="btnFirendUserName_Click"></asp:Button>
                    </span>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    对方会员ID号：
                </td>
                <td>
                    <input name="userid" type="text" class="form-control" id="userid"  maxlength="10" runat="server"/>
        <asp:RangeValidator ID="RangeValidator1" runat="server" MaximumValue="99999"  MinimumValue="1" Type="Integer" ErrorMessage="请输入数字" ControlToValidate="userid">
                    </asp:RangeValidator>
                    <span class="btmbian">&nbsp;<asp:Button ID="Button1" runat="server" Text="查找" CssClass="btn btn-primary" onclick="Button1_Click"></asp:Button>
                </td>
            </tr>
            <tr>
                <td class="text-right">&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
        </table>
    
</div>
<div class="clearfix"></div>
</form>
</body>
</html>