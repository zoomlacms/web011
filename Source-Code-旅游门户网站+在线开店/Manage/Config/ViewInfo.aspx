<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_ViewInfo, App_Web_dpasokpb" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>视图信息</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('71')" title="帮助"></a></div>
  <%} %>后台管理&gt;&gt;扩展功能&gt;&gt;开发中心&gt;&gt;<label id="lbBan" runat="server">视图信息</label></div>

        <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr class="tdbg"> 
                <td class="spacingtitle" colspan="2" align="center">
                <table  width="100%">
                    <tr>
                        <td  align="center"><label id="lbTag" runat="server">视图信息</label></td>
                        <td width="40"></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>视图名：</strong></td>
                <td>
                    ZL_V_<input type="text" id="txtVName" runat="server" disabled="disabled" />
                    <label id="lbCheck" runat="server" visible="false"></label>
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 120px">
                    <strong>连接条件(可为空)：</strong>
                    <p></p>
                </td>
                <td>
                    <textarea runat="server" id="taWhere" style="width: 800px;height:50px" disabled="disabled"></textarea>
                    <p>连接条件格式为： 表1.字段名=表2.字段名 and 表3.字段=表4.字段名，依次类推</p>
                </td>
            </tr>
            
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>SQL语句：</strong></td>
                <td>
                    <textarea runat="server" id="taSQL" readonly="readonly" style="width: 800px;height:100px"></textarea>
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>视图说明(选填)：</strong></td>
                <td>
                    功能：<input type="text" runat="server" id="explain" disabled="disabled" />二字查询关键字：<input type="text" runat="server" id="secshort" />三字查询关键字：<input type="text" runat="server" id="thrshort" />
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"></td>
                <td>


                    <input type="button" class="C_input" onclick="window.location.href('ViewList.aspx');" value="返回" />

            </tr>
        </table>

    </form>
</body>
</html>
