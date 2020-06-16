<%@ page language="C#" autoeventwireup="true" inherits="IPManage, App_Web_waw0ye5y" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<html>
<head id="Head1" runat="server">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>IP分类</title>

    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="myform" runat="server">
        <div class="r_navigation">

            <span>后台管理 </span>&gt;&gt;<span> 扩展功能</span> &gt;&gt;<span> 其他功能</span> &gt;&gt; 
        <span>IP分类</span>
            <a href="InputClass.aspx"><font color="red">[添加分类]</font></a>
        </div>
        <div class="clearbox">
        </div>
        <div>

            <div>
            </div>

            <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
                <thead class="spacingtitle">
                    <tr style="height: 30px">
                        <td colspan="4" align="center">IP分类管理
                        </td>
                    </tr>
                </thead>
                <tbody class="tdbg">
                    <tr style="height: 26px" class="tdbgleft">
                        <td align="center" style="width: 10%">ID</td>
                        <td align="center" style="width: 25%">所属分�?/td>
                        <td align="center" style="width: 30%">分类名称</td>
                        <td align="center" style="width: 35%">操作</td>
                    </tr>
                    <%=table() %>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
