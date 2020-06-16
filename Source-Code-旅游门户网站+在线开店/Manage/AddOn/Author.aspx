﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_Author, App_Web_0sth0hzm" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>添加作者</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <style>
        body {
            font-size: 12px;
            font-family: Verdana,Arial,"宋体";
        }

        a:link {
            color: #464646;
            text-decoration: none;
        }

        a:visited {
            color: #464646;
            text-decoration: none;
        }

        a:hover {
            color: #ed145b;
            text-decoration: underline;
        }

        a:active {
            color: #ed145b;
            text-decoration: underline;
        }

        td {
            font-size: 12px;
        }
        /*想要改输入日历控件的样子就改下面的CSS样式就可以了*/
        /*Date*/
        .header {
            font: 12px Arial, Tahoma !important;
            font-weight: bold !important;
            font: 11px Arial, Tahoma;
            font-weight: bold;
            color: #154BA0;
            background: #C2DEED;
            height: 25px;
            padding-left: 10px;
        }

            .header td {
                padding-left: 10px;
            }

            .header a {
                color: #154BA0;
            }

            .header input {
                background: none;
                vertical-align: middle;
                height: 16px;
            }

        .category {
            font: 12px Arial, Tahoma !important;
            font: 11px Arial, Tahoma;
            color: #92A05A;
            height: 20px;
            background-color: #FFFFD9;
        }

            .category td {
                border-bottom: 1px solid #DEDEB8;
            }

        .expire, .expire a:link, .expire a:visited {
            color: #999999;
        }

        .default, .default a:link, .default a:visited {
            color: #000000;
        }

        .checked, .checked a:link, .checked a:visited {
            color: #FF0000;
        }

        .today, .today a:link, .today a:visited {
            color: #00BB00;
        }

        #calendar_year {
            display: none;
            line-height: 130%;
            background: #FFFFFF;
            position: absolute;
            z-index: 10;
        }

            #calendar_year .col {
                float: left;
                background: #FFFFFF;
                margin-left: 1px;
                border: 1px solid #86B9D6;
                padding: 4px;
            }

        #calendar_month {
            display: none;
            background: #FFFFFF;
            line-height: 130%;
            border: 1px solid #86B9D6;
            padding: 4px;
            position: absolute;
            z-index: 11;
        }

        .tableborder {
            background: white;
            border: 1px solid #86B9D6;
        }

        #year, #month {
            padding-right: 10px;
            background: url(attachments/month_0701/8200714125245.gif) no-repeat center right;
        }
        /*图片路径可以改成自己的*/
        /*Date*/
    </style>
    <script src="../../JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        //var isSubmit = false;
        //function getSubmit() {
        //    if (!isSubmit) {
        //        alert("您是否还有哪项填的不符合规范");
        //        return isSubmit;
        //    }
        //    return isSubmit;
        //}
        window.onload = function () {
            //var txtTel = document.getElementById("TxtTel");
            //txtTel.onblur = function () {
            //    if (!isMobilePhone(txtTel.value)) {
            //        isSubmit = false;
            //        document.getElementById("warnTxtTel").style.display = "";
            //    }
            //    else {
            //        isSubmit = true;
            //        document.getElementById("warnTxtTel").style.display = "none";
            //    }
            //}//end txtTel.onblur
            //var txtFax = document.getElementById("TxtFax");
            //txtFax.onblur = function () {
            //    if (!isFax_number(txtFax.value)) {
            //        isSubmit = false;
            //        document.getElementById("warnTxtFax").style.display = "";
            //    }
            //    else {
            //        isSubmit = true;
            //        document.getElementById("warnTxtFax").style.display = "none";
            //    }
            //}//end txtFax.obblur
            //var txtZipCode = document.getElementById("TxtZipCode");
            //txtZipCode.onblur = function () {
            //    if (!isZipCode(txtZipCode.value)) {
            //        isSubmit = false;
            //        document.getElementById("warnTxtZipCode").style.display = "";
            //    }
            //    else {
            //        isSubmit = true;
            //        document.getElementById("warnTxtZipCode").style.display = "none";
            //    }
            //}//end txtZipCode.onblur
            //var txtEmail = document.getElementById("TxtEmail");
            //txtEmail.onblur = function () {
            //    if (!isEmail(txtEmail.value)) {
            //        isSubmit = false;
            //        document.getElementById("warnTxtEmail").style.display = "";
            //    }
            //    else {
            //        isSubmit = true;
            //        document.getElementById("warnTxtEmail").style.display = "none";
            //    }
            //}//end 
            //document.getElementById("TxtName").onblur = checkName;
        }//end window.onload
        function checkName()
        {
            var v = document.getElementById("TxtName").value;
            SyncpostToCS(v);
        }
        function SyncpostToCS(v) {
            $.ajax({
                type: "Post",
                url: "Author.aspx",
                //dataType: "json",
                data: { value: v },
                //async: true,
                success: function (data) {
                    //result = data;
                    if (data == "1") {
                        $("#TxtNameRemind").html("存在名字相同，建议您使用:" + v + "1").css('color', 'red');
                        isSubmit = false;
                    }
                    else if (data == "0") {
                        $("#TxtNameRemind").html("");
                        isSubmit = true;
                    }
                },
                error: function (data) { alert("失败"); }
            });
        }
    </script>
</head>
<body>
    <!--以上是选会员 -->
    <form id="form1" runat="server">
        <asp:HiddenField runat="server" ID="dataField" />
        <div id="nav_box">
            <div class="r_navigation">
                <span>内容管理</span>&gt;&gt;<span><a href="SourceManage.aspx">内容参数</a></span>&gt;&gt;<span><a href="AuthorManage.aspx">作者管理</a></span> &gt;&gt;<span>添加作者</span>
            </div>
        </div>
        <div style="height: 24px;"></div>
        <div class="clearbox"></div>
        <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
            <tr align="center">
                <td colspan="4" class="spacingtitle">添加作者信息          
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>姓名：</strong></td>
                <td>
                    <asp:TextBox ID="TxtName" onblur="checkName()" runat="server" class="l_input"></asp:TextBox><span id="TxtNameRemind"></span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="用户名不能为空" ControlToValidate="TxtName" Enabled="true">*</asp:RequiredFieldValidator>
                </td>
                <td rowspan="8" colspan="2">
                    <table width="100%" border="0" cellpadding="2" cellspacing="1">
                        <tr>
                            <td style="width: 100%;" align="left">
                                <img id="showphoto" runat="server" src="/App_Themes/AdminDefaultTheme/Images/default.gif" width="150" height="172" alt="作者图片" />
                            </td>
                        </tr>
                        <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <td align="left">
                                <asp:TextBox ID="txtpic" runat="server"></asp:TextBox><asp:Label ID="LabPicPath" runat="server" Text="请选择上传路径！" Visible="False"></asp:Label><br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>会员名：</strong></td>
                <td>
                    <asp:TextBox ID="TxtUserName" runat="server" class="l_input" /><span id="TxtUserNameRemind"></span>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>性别：</strong></td>
                <td>
                    <asp:RadioButtonList ID="RadlSex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                        <asp:ListItem Value="0">女</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>生日：</strong></td>
                <td>
                    <input name="member.birth" class="l_input" id="tbUBday" runat="server" type="text" value="1982-1-1" size="14" readonly="readonly" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" />(单击文本框,选择年月)  
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>地址：</strong></td>
                <td>
                    <asp:TextBox ID="TxtAddress" runat="server" MaxLength="20" class="l_input"></asp:TextBox></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>手机：</strong></td>
                <td>
                    <asp:TextBox ID="TxtTel" runat="server" MaxLength="20" class="l_input"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REV1" Display="Dynamic" ControlToValidate="TxtTel" ValidationExpression="^(13|15|18)[0-9]{9}" runat="server" ErrorMessage="手机号码格式不正确"></asp:RegularExpressionValidator>
                    <span id="warnTxtTel" style="color: red; display: none;"></span>
                </td>
                
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>传真：</strong></td>
                <td>
                    <asp:TextBox ID="TxtFax" runat="server" MaxLength="20" class="l_input"></asp:TextBox>
                    <span id="warnTxtFax" style="color: red; display: none;">传真格式不正确</span>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>单位：</strong></td>
                <td>
                    <asp:TextBox ID="TxtCompany" runat="server" MaxLength="20" class="l_input" />
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>部门：</strong>
                </td>
                <td>
                    <asp:TextBox ID="TxtDepartment" runat="server" MaxLength="20" class="l_input" />
                </td>
                <td class="tdbgleft">
                    <strong>主页：</strong>
                </td>
                <td>
                    <asp:TextBox ID="TxtHomePage" runat="server" class="l_input" />
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>邮编：</strong></td>
                <td>
                    <asp:TextBox ID="TxtZipCode" runat="server" MaxLength="20" class="l_input" />
                    <asp:RegularExpressionValidator ID="REV3" runat="server" ControlToValidate="TxtZipCode" Display="Dynamic" ErrorMessage="邮编格式不正确" ValidationExpression="^[1-9]\d{5}(?!\d)$" Visible="true"></asp:RegularExpressionValidator>
                </td>
                <td class="tdbgleft">
                    <strong>邮件：</strong>
                </td>
                <td>
                    <asp:TextBox ID="TxtEmail" runat="server" MaxLength="20" class="l_input" />
                    <asp:RegularExpressionValidator ID="REV2" runat="server" ControlToValidate="TxtEmail" Display="Dynamic" ErrorMessage="电子邮箱格式不正确" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Visible="true"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>通讯：</strong>
                </td>
                <td>
                    <asp:TextBox ID="TxtMail" runat="server" MaxLength="20" class="l_input" />
                </td>
                <td class="tdbgleft">
                    <strong>IM：</strong>
                </td>
                <td>
                    <asp:TextBox ID="TxtIm" runat="server" MaxLength="20" class="l_input" />
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>分类：</strong>
                </td>
                <td colspan="3">
                    <asp:RadioButtonList ID="RadlAuthorType" RepeatLayout="Flow" RepeatColumns="6" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem Selected="True" Value="0">大陆作者</asp:ListItem>
                        <asp:ListItem Value="1">港台作者</asp:ListItem>
                        <asp:ListItem Value="2">海外作者</asp:ListItem>
                        <asp:ListItem Value="3">本站特约</asp:ListItem>
                        <asp:ListItem Value="4">其他作者</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>属性：</strong>
                </td>
                <td colspan="3">
                    <asp:CheckBox ID="ChkElite" runat="server" Checked="true" />推荐
                <asp:CheckBox ID="ChkOnTop" runat="server" />置顶
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>作者简介：</strong>
                </td>
                <td colspan="3">
                    <asp:TextBox ID="TxtIntro" TextMode="MultiLine" runat="server" Height="300px" Width="583px" class="l_input" />
                </td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>是否启用：</strong>
                </td>
                <td colspan="3">
                    <asp:CheckBox ID="ChkPass" runat="server" Checked="true" />
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center" class="tdbg">
                    <asp:Button ID="EBtnModify" Text="修改" OnClick="EBtnModify_Click" runat="server" class="C_input" Visible="false" />
                    <asp:Button ID="EBtnSubmit" class="C_input" Text="保存" OnClick="EBtnSubmit_Click" runat="server" />&nbsp;&nbsp;
                <input name="Cancel" type="button" class="C_input" id="Cancel" value="取消" onclick="javascript: window.location.href = 'AuthorManage.aspx'" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
