<%@ page language="C#" autoeventwireup="true" validaterequest="false" enableeventvalidation="false" inherits="Zoomla.Website.manage.Shop.AddProduct, App_Web_5arvbvnz" enableviewstatemac="false" masterpagefile="~/Manage/Site/OptionMaster.master" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<meta charset="utf-8" />
<title>编辑商品</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/ICMS/V3.css" rel="stylesheet" />
<script src="/JS/Common.js" type="text/javascript"></script> 
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
<link rel='stylesheet' type='text/css' href='/App_Themes/AdminDefaultTheme/doutime.css' />
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet" />
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
<style type="text/css">
#flotop	{width: 100%;}
#flotop{height: 30px;background: url(../images/top_bg.gif) repeat-x;z-index: 99;}
/*顶部高为30px导航样式**/
#msgDiv, #mgDiv{z-index: 10001;width: 500px;height: 750px;background: white;border: #CCC 1px solid;position: absolute;left: 50%;top: 20%;font-size: 12px;margin-left: -225px;display: none;}
#bDiv{display: none;position: absolute;top: 0px;left: 0px;right: 0px;background-color: #777;filter: progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75)opacity: 0.6;}
/*弹出层*/
#msgShut, #mgShut{width: 30px;height: 20px;cursor: pointer;line-height: 20px;text-align: center;float: right;color: #F00;font-weight: bold;}
#site_main #tab3 td{line-height:40px;height:40px;}
</style>
<script type="text/JavaScript">
    var aid = 0;
    var showID = 0;
    var tID = 0;

    function deleteRow(tableID, rowIndex, rowsid) {
        var ccd = confirm('你确定将此绑定的商品删除吗？');
        if (ccd) {
            var table = document.all[tableID]
            var bindstr = "," + document.getElementById("Hiddenbind").value + ",";
            rowsid = "," + rowsid + ",";
            var reg = new RegExp(rowsid, "g")
            bindstr = bindstr.replace(reg, ",");
            reg = new RegExp(",,", "g")
            bindstr = bindstr.replace(reg, ",");
            document.getElementById("Hiddenbind").value = bindstr;
            table.deleteRow(rowIndex);
            document.getElementById("Hiddenbind").value = document.getElementById("Hiddenbind").value.replace(reg, ",");
            if (document.getElementById("Hiddenbind").value == "" || document.getElementById("Hiddenbind").value == ",") {
                document.getElementById("Span1").innerHTML = "";
                document.getElementById("Hiddenbind").value = "";
            }
        }
    }

    function CheckAll(spanChk)//CheckBox全选
    {
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;
        for (i = 0; i < elm.length; i++)
            if (elm[i].type == "checkbox" && elm[i].id != theBox.id && elm[i].id.indexOf("Item", false) > -1) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
    }

    function SelectProducer() {
        window.open('Producerlist.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
    }
    //团购信息
    function OpenSelect2() {

        window.open('TGALL.aspx?shopid=<%=Request.QueryString["ID"] %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        return false;
    }

    function OpenSelect() {

        window.open('AddbindPro.aspx?id=<%=Request.QueryString["ID"] %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        return false;
    }

    function ProductsSelect(act) {
        window.open('ProductsSelect.aspx?act=' + act, '', 'width=600,height=450,resizable=0,scrollbars=yes');
    }

    function OpenprojectSelect() {

        window.open('projectSelect.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        return false;
    }

    function ClearSelect() {
        document.getElementById("Span1").innerHTML = "";
        document.getElementById("Hiddenbind").value = "";
    }

    function SelectBrand() {
        window.open('Brandlist.aspx?producer=' + document.getElementById('Producer').value + '', '', 'width=600,height=450,resizable=0,scrollbars=yes');

    }

    function SetDisabled(checked) {
        document.getElementById('ProCode').disabled = checked;
    }

    function show(checked) {
        if (checked.value == 1) {
            document.getElementById("pifaji").style.display = "";
        }
        else {
            document.getElementById("pifaji").style.display = "none";
        }
    }

    function showpf() {
        if (document.getElementById("Wholesales_0").checked == true) {
            document.getElementById("pifaji").style.display = "";
        } else {
            document.getElementById("pifaji").style.display = "none";
        }
    }

    function Clearoption() {
        var hiddenidvalue = document.getElementById("OtherProject"); //获取已经存在的ID值

        for (var i = hiddenidvalue.options.length - 1; i >= 0; i--) {
            if (hiddenidvalue[i].selected == true) {
                hiddenidvalue[i] = null;
            }
        }

    }

    function ShowGuess(obj) {
        switch (obj) {
            case 1:
                document.getElementById("Guess1").style.display = "none";
                document.getElementById("Guess2").style.display = "none";
                break;
            case 2:
                document.getElementById("Guess1").style.display = "";
                document.getElementById("Guess2").style.display = "none";
                break;
            case 3:
                document.getElementById("Guess1").style.display = "none";
                document.getElementById("Guess2").style.display = "";
                break;
        }

             
    }

    function ShowInterference(i) {
        switch (i) {
            case 1:
                document.getElementById("tableInterference").style.display = "none";
                break;
            case 2:
                document.getElementById("tableInterference").style.display = "";
                document.getElementById("Panel1").style.display = "";
                document.getElementById("Panel2").style.display = "none";
                document.getElementById("Panel3").style.display = "none";
                break;
            case 3:
                document.getElementById("tableInterference").style.display = "";
                document.getElementById("Panel1").style.display = "none";
                document.getElementById("Panel2").style.display = "";
                document.getElementById("Panel3").style.display = "none";
                break;
            case 4:
                document.getElementById("tableInterference").style.display = "";
                document.getElementById("Panel1").style.display = "none";
                document.getElementById("Panel2").style.display = "none";
                document.getElementById("Panel3").style.display = "";
                break;
        }
    }

    function buttonclick(username, userid) {
        var objlist = document.getElementById("ListBox1");
        node = document.createElement("<option   value='" + userid + "'>");
        text = document.createTextNode(username);
        node.appendChild(text);
        objlist.appendChild(node);

        for (var i = 0; i < objlist.length; i++) {
            objlist.options[i].selected = true;
        }
    }
    function deldata(userid) {
        var objlist = document.getElementById("ListBox1");
        for (i = objlist.length - 1; i >= 0; i--) {
            if (objlist.options[i].value == userid) {
                objlist.remove(i);
            }
        }
    }

    function change(obj) {
        if (obj == "3") {
            document.getElementById("tpoint").style.display = "";
        } else {
            document.getElementById("tpoint").style.display = "none";
        }
    }
    $().ready(function () {
        $("td").removeClass("tdbgleft");
    });
</script> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <div id="m_site"><p style="float:left;"> 站群中心 >> 服务管理 >> <asp:Label ID="Label1" runat="server" /></p></div>
    <asp:HiddenField ID="HiddenUser" runat="server" />
<div id="site_main" style="margin-top:2px;">
        <div id="tab3">
<ul class="nav nav-tabs">
    <li class="active"><a href="#tab1" data-toggle="tab">基本信息</a></li>
    <li><a href="#tab2" data-toggle="tab">主机服务</a></li>
    <li><a href="#Div1" data-toggle="tab">其他信息</a></li>
    <li><a href="#tab4" data-toggle="tab">价格设置</a></li>
    <li><a href="#Div2" data-toggle="tab">促销设置</a></li>
    <li><a href="#Div3" data-toggle="tab">商品属性</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab1">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="site_border">
        <tbody id="Tabs0">
                    <tr>
                        <td width="20%">
                            <strong>所属节点：</strong>
                        </td>
                        <td>
                            <asp:Label ID="nodename" runat="server"></asp:Label>
                            <asp:HiddenField ID="HdnNode" runat="server" />
                            <asp:HiddenField ID="HdnModel" runat="server" />
                            <asp:HiddenField ID="ClickType" runat="server" />
                            <asp:HiddenField ID="ID" runat="server" Value="0" />
                            <asp:HiddenField ID="I_tem" runat="server" />
                            <asp:HiddenField ID="ComModelID" runat="server" />
                            <asp:HiddenField ID="Hiddenbind" runat="server" />
                            <asp:HiddenField ID="hidNum" runat="server" />
                        </td>
                    </tr>
                    <tr runat="server" visible="false">
                        <td>
                            <strong>所属专题：</strong>
                        </td>
                        <td>
                            <asp:HiddenField ID="HdnSpec" runat="server" />
                            <asp:Label ID="Categoryname" runat="server"></asp:Label>
                            <div id="lblSpec" runat="server">
                            </div>
                            <input type="button" id="Button1" value="添加到专题" onclick="AddToSpecial()"
                                style="width: 100px" />
                            <asp:HiddenField ID="Categoryid" runat="server" />
                            &nbsp;
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="height: 26px">
                            <strong>商品编号：</strong>
                        </td>
                        <td style="width: 592px; height: 26px;">
                            <asp:TextBox ID="ProCode" runat="server" disabled="disabled" Width="155px" class="l_input" />
                            <asp:CheckBox ID="CheckBox1" Text="自动编号" onclick="SetDisabled(this.checked)" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 26px">
                            <strong>捆绑销售：</strong>
                        </td>
                        <td style="height: 26px;">
                            <asp:Button ID="Button3" Style="width: 100px" runat="server" Text="添加捆绑商品" OnClientClick="OpenSelect();return false;" />
                            <asp:Button ID="Button4" Style="width: 100px" runat="server" Text="清空捆绑列表" OnClientClick="ClearSelect();return false;" /><br />
                            <span runat="server" id="Span1"></span>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>自选数量：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Propeid" runat="server" Text="0" Width="51px" class="l_input" />
                            <font color="red">(0为不允许自选购买;如果捆绑商品为空,则此数值为无效)</font>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>条形码：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="BarCode" runat="server" Width="155px" class="l_input" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>商品名称：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Proname" runat="server" Width="442px" class="l_input" />
                            <span class="STYLE1">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="Proname" Display="Dynamic" ErrorMessage="商品名称不能为空!" SetFocusOnError="True" ForeColor="Red"/></span>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>关键字：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Kayword" runat="server" Width="155px" class="l_input" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td><strong>商品单位：</strong></td>
                        <td>
                            <asp:TextBox ID="ProUnit" runat="server" Width="155px" class="l_input" Text="件" />
                            <span class="STYLE1">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ProUnit" Display="Dynamic" ErrorMessage="商品单位不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="display:none;">
                        <td><strong>商品重量：</strong></td>
                        <td>
                            <asp:TextBox ID="Weight" runat="server" Width="91px" class="l_input" />
                            千克（Kg）<asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                ControlToValidate="Weight" ErrorMessage="商品重量必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$"
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td><strong>商品类型：</strong></td>
                        <td>
                            <asp:RadioButtonList ID="ProClass" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="6">服务商品</asp:ListItem>
                            </asp:RadioButtonList>
                            <div id="TG">
                                <asp:MultiView ID="MultiView1" runat="server">
                                    <asp:View ID="View1" runat="server">
                                        <table>
                                            <tr>
                                                <td>团购订金：</td>
                                                <td><asp:TextBox ID="txtColoneDeposit" runat="server" class="l_input"></asp:TextBox>元
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6"
                                            runat="server" ControlToValidate="txtColoneDeposit" ErrorMessage="团购订金格式不对!" ValidationExpression="\d+[.]?\d*"
                                            Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
                                            </tr>
                                            <tr>
                                                <td>最低团购人数：</td>
                                                <td><asp:TextBox ID="NumberText" runat="server" class="l_input"></asp:TextBox>人&nbsp;</td>
                                                <td>团购价格:</td>
                                                <td><asp:TextBox ID="TGPrice" runat="server" class="l_input"></asp:TextBox>元</td>
                                            </tr>
                                            <tr><td>开始时间</td>
                                                <td><asp:TextBox ID="ColonelStartTimetxt" runat="server"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="l_input" /></td>
                                                <td>结束时间:</td><td>
                                                    <asp:TextBox ID="ColonelendTimetxt" runat="server"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="l_input"></asp:TextBox>
                                                    <asp:HiddenField ID="hfEndTime" runat="server" />
                                                    <asp:HiddenField ID="hfBeginTime" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                    <asp:Button ID="Button14" Style="width: 100px" runat="server" Text="添加"
                                                        CausesValidation="false" OnClick="Button14_Click" />
                                                    <asp:Button ID="Button15" Style="width: 100px" runat="server" Text="浏览价格"
                                                        CausesValidation="false" OnClientClick="OpenSelect2();return false;" />
                                                    <asp:Button ID="TGButtion" Style="width: 100px" runat="server" Text="取消"
                                                        CausesValidation="false" OnClick="TGButtion_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                            </div>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td><strong>销售状态：</strong> </td>
                        <td><asp:CheckBox ID="Sales" Text="打勾表示销售中，否则为停售状态" runat="server" /></td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td> <strong>属性设置：</strong></td>
                        <td>
                            <asp:CheckBox ID="istrue" runat="server" Text="审核通过" Checked="true"/>
                            <asp:CheckBox ID="isnew" runat="server" Text="新品" />
                            <asp:CheckBox ID="ishot" runat="server" Text="热销" />
                            <asp:CheckBox ID="isbest" runat="server" Text="精品" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%" style="height: 24px">
                            <strong>点击数：</strong>
                        </td>
                        <td style="height: 24px; width: 592px;">
                            <asp:TextBox ID="txtCountHits" runat="server" class="l_input" Text="Label" />
                            <span class="STYLE1">*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ControlToValidate="UpdateTime" Display="Dynamic" ErrorMessage="点击数不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%" style="height: 24px">
                            <strong>更新时间：</strong>
                        </td>
                        <td style="height: 24px; width: 592px;">
                            <asp:TextBox ID="UpdateTime" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" class="l_input" />
                            <span class="STYLE1">*<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                ControlToValidate="UpdateTime" Display="Dynamic" ErrorMessage="更新时间不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator></span>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%">
                            <strong>内容页模板：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="ModeTemplate" runat="server" class="l_input" />
                            <input type="button" style="width: 100px" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('ModeTemplate') + '&FilesDir=', 650, 480)" />
                        </td>
                    </tr>
                </tbody>
    </table>
</div>
<div class="tab-pane fade" id="tab2">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="site_border">
        <tbody id="Tabs1">
                   <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" style="height:19px;">
                        <td style="width:20%;"><strong>到期提醒：</strong></td>
                         <td>
                             <asp:DropDownList runat="server" ID="expRemindDP">
                                 <asp:ListItem Value="1">1天</asp:ListItem>
                                 <asp:ListItem Value="3">3天</asp:ListItem>
                                 <asp:ListItem Value="5">5天</asp:ListItem>
                                 <asp:ListItem Value="10">10天</asp:ListItem>
                                 <asp:ListItem Value="15">15天</asp:ListItem>
                                 <asp:ListItem Value="30">1月</asp:ListItem>
                             </asp:DropDownList>
                         </td></tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="height: 26px"><strong>服务期限：</strong></td>
                        <td style="height: 26px">
                            <asp:TextBox ID="ServerPeriod" runat="server" Width="53px" class="l_input" Text="1"/>
                            <asp:DropDownList ID="ServerType" runat="server">
                                <asp:ListItem Selected="True" Value="3">年</asp:ListItem>
                                <asp:ListItem Value="2">月</asp:ListItem>
                                <asp:ListItem Value="1">日</asp:ListItem>
                                <asp:ListItem Value="0">不限期</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="ServerPeriod" 
                                ErrorMessage="服务期限必须是数字!" ValidationExpression="^\d+$" SetFocusOnError="True" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%"><strong>商品简介：</strong></td>
                        <td>用于首页及栏目页显示，最多255个字符<br/>
                            <asp:TextBox ID="Proinfo" runat="server" Height="87px" TextMode="MultiLine" Width="500px" class="l_input" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%" style="height: 24px">
                            <strong>详细介绍：</strong>
                        </td>
                        <td style="height: 24px; width: 80%;">
                            <textarea cols="80" id="Procontent" style="width:715px; height:300px;"  name="Procontent"
                                rows="10" runat="server"></textarea>
                            <script id="headscript" type="text/javascript">
                                UE.getEditor('Procontent');
                                //<![CDATA[
                                //                                CKEDITOR.replace('Procontent',
                                //{ 
                                //enterMode: 2,
                                //width:'100%',
                                //shiftEnterMode: 2
                                ////toolbar: [['Source', '-', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
                                //});
                                //]]>
                            </script>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%">
                            <strong>商品清晰图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Clearimg" runat="server" Width="300px" class="l_input" /><iframe
                                id="bigimgs" style="top: 2px" src="../shop/fileupload.aspx?menu=Clearimg" width="100%"
                                height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                    <tr id="addsmallimg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%">
                            <strong>商品缩略图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Thumbnails" runat="server" Width="300px" class="l_input" /><iframe
                                id="smallimgs" style="top: 2px" src="../shop/fileupload.aspx?menu=Thumbnails" width="100%"
                                height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                </tbody>
    </table>
</div>
<div class="tab-pane fade" id="Div1">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="site_border">
        <tbody id="Tabs2">
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%">
                            <strong>生 产 商：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Producer" runat="server" Width="214px" class="l_input"></asp:TextBox>[<a
                                href="###" onclick="SelectProducer();">请选择</a>]
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>品牌/商标：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Brand" runat="server" Width="214px" class="l_input"></asp:TextBox>[<a
                                href="###" onclick="SelectBrand();">请选择</a>]
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>缺货时允许购买:</strong>
                        </td>
                        <td>
                            <asp:CheckBox ID="Allowed" runat="server" Text="打勾表示缺货时允许购买， 否则缺货时不允许购买" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>限购数量:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Quota" runat="server" Width="100px" class="l_input">-1</asp:TextBox>
                            -1为不限制数量 0为不允许购买
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Quota"
                                ErrorMessage="限购数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>最低购买数量:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="DownQuota" runat="server" Width="100px" class="l_input">-1</asp:TextBox>
                            -1为不限制数量 0为不允许购买
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="DownQuota"
                                ErrorMessage="最低购买数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>秒杀时间段:(限制购买时间)</strong>
                        </td>
                        <td>
                            从<asp:TextBox ID="TextBox13" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" runat="server" class="l_input"></asp:TextBox>
                            &nbsp;到
                            <asp:TextBox ID="TextBox14" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" runat="server" class="l_input"></asp:TextBox>
                            &nbsp;为止
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="height: 24px">
                            <strong>库存数量:</strong>
                        </td>
                        <td style="height: 24px">
                            <asp:TextBox ID="Stock" runat="server" Width="100px" class="l_input">10</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="Stock"
                                ErrorMessage="库存数量必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="height: 24px">
                            <strong>库存报警下限:</strong>
                        </td>
                        <td style="height: 24px; width: 592px;">
                            <asp:TextBox ID="StockDown" runat="server" Width="100px" class="l_input">1</asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="StockDown"
                                ErrorMessage="库存报警下限必须是数字!" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>前台库存计算方式:</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25%">
                                        <asp:RadioButtonList ID="JisuanFs" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="0">实际库存</asp:ListItem>
                                            <asp:ListItem Value="1">虚拟库存</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td width="89%">
                                        （实际库存－已订购数）
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>税率设置:</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="Rateset" runat="server">
                                <asp:ListItem Selected="True" Value="1">含税，不开发票时有税率优惠 </asp:ListItem>
                                <asp:ListItem Value="2">含税，不开发票时没有税率优惠</asp:ListItem>
                                <asp:ListItem Value="3">不含税，开发票时需要加收税费</asp:ListItem>
                                <asp:ListItem Value="4">不含税，开发票时不需要加收税费</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>商品税率:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Rate" runat="server" Text="0" class="l_input" />
                            %
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                ControlToValidate="Rate" ErrorMessage="商品税率必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$"
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>商品推荐等级:</strong>
                        </td>
                        <td>
                            <asp:DropDownList ID="Dengji" runat="server">
                                <asp:ListItem Value="5">★★★★★</asp:ListItem>
                                <asp:ListItem Value="4">★★★★</asp:ListItem>
                                <asp:ListItem Selected="True" Value="3">★★★</asp:ListItem>
                                <asp:ListItem Value="2">★★</asp:ListItem>
                                <asp:ListItem Value="1">★</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </tbody>
    </table>
</div>
<div class="tab-pane fade" id="tab4">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="site_border">
        <tbody id="Tabs3">
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%"><strong>市场参考价：</strong></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td style="width: 23%; height: 21px;">
                                        <asp:TextBox ID="ShiPrice" runat="server" Width="93px" class="l_input" />元 
                                        <font color="red">*</font>
                                    </td>
                                    <td width="76%" style="height: 21px">
                                        购买时参考的市场零售价，可以比当前零售价高。
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator13"  runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价格格式不对!" ValidationExpression="\d+[.]?\d*"  Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator  ID="RequiredFieldValidator3" runat="server" ControlToValidate="ShiPrice" ErrorMessage="市场价不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>当前零售价：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td style="width: 23%; height: 20px;">
                                        <asp:HiddenField ID="hfprice" runat="server" />
                                        <asp:HiddenField ID="hfFesPrice" runat="server" />
                                        <asp:HiddenField ID="hfBookprice" runat="server" />
                                        <asp:TextBox ID="LinPrice" runat="server" Width="93px" class="l_input" />
                                        元 <font color="red">*</font>
                                    </td>
                                    <td width="78%" style="height: 20px">
                                        商店销售此商品时的价格。<asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"  ControlToValidate="LinPrice" ErrorMessage="零售价格式不对!" ValidationExpression="\d+[.]?\d*" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator  ID="RequiredFieldValidator4" runat="server" ControlToValidate="LinPrice" ErrorMessage="零售价不能为空!" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" width="100%">
                        <td><strong>会员价:</strong></td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="rdoUserPrice" runat="server" RepeatDirection="Horizontal"
                                        AutoPostBack="True" OnSelectedIndexChanged="rdoUserPrice_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Selected="True">会员价</asp:ListItem>
                                        <asp:ListItem Value="1">会员组</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="userP" runat="server">
                                        会员价：<asp:TextBox ID="userPrice" runat='server' class="l_input" Width="35px"></asp:TextBox>元</div>
                                    <div id="divGroup" runat="server" visible="false">
                                        <asp:Repeater ID="repGroup" runat="server">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="groupID" runat="server" Value='<%#Eval("GroupID") %>' />
                                                <%#Eval("GroupName")%>：<asp:TextBox ID="GroupPrice" runat='server' class="l_input"
                                                    Width="30px"></asp:TextBox>元
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                        width="100%">
                        <td>
                        <strong>运费设置：</strong>
                        </td>
                        <td><asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="rdoFarePrice" runat="server" RepeatDirection="Horizontal"
                                        AutoPostBack="True" OnSelectedIndexChanged="rdoFarePrice_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Selected="True">免运费</asp:ListItem>
                                        <asp:ListItem Value="1">运费</asp:ListItem>  
                                    </asp:RadioButtonList>  
                                    <asp:TextBox id="farePrice" runat='server' Width="35px" Visible="false"></asp:TextBox>
                                        <div id="farediv" runat="server" visible="false"> 
                                                <asp:HiddenField ID="FareID1" runat="server" Value='0' />
                                                    快递：<asp:TextBox ID="FarePrice1" runat='server' class="l_input" Width="30px"></asp:TextBox>元 
                                                     
                                                <asp:HiddenField ID="FareID2" runat="server" Value='1' />
                                                    平邮：<asp:TextBox ID="FarePrice2" runat='server' class="l_input" Width="30px"></asp:TextBox>元 
                                                     
                                                <asp:HiddenField ID="FareID3" runat="server" Value='2' />
                                                    EMS：<asp:TextBox ID="FarePrice3" runat='server' class="l_input" Width="30px"></asp:TextBox>元 
                                    </div>

                                    </ContentTemplate>
                                    </asp:UpdatePanel>
                        </td>
                        </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                        width="100%">
                        <td>
                            <strong>节日价格:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDayPrice" runat="server" class="l_input" Height="19px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDayPrice"
                                ErrorMessage="节日价格格式不正确!" ValidationExpression="\d+[.]?\d*" Display="Dynamic"
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                        width="100%">
                        <td>
                            <strong>节日时间:</strong>
                        </td>
                        <td>
                            <div id='hotelDiv'>
                                <asp:TextBox ID='CheckInDate' runat="server" Text="" class="l_input" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>至
                                <asp:TextBox ID='CheckOutDate' runat="server" Text="" class="l_input" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox></div>
                            <input id='IntervallCheckInAndChekOut' value='1' type='hidden' />
                            <input id='CheckOut' type='hidden' runat="server" />
                            <asp:HiddenField ID="serverdate" runat="server" Value='2010-8-31' />
                            <div id='m_contentend'>
                            </div>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                        width="100%">
                        <td>
                            <strong>预订价格:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBookPrice" runat="server" class="l_input" Height="19px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBookPrice"
                                ErrorMessage="预订价格格式不正确!" ValidationExpression="\d+[.]?\d*" Display="Dynamic"
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                        width="100%">
                        <td>
                            <strong>预订时间:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBookDay" runat="server" class="l_input" Height="19px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
                            <font color="red">节日时间提前N天为预订价</font>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtBookDay"
                                ErrorMessage="预订时间格式不正确!" ValidationExpression="\d+" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>打折优惠率:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtRecommend" runat="server" Text="0" Width="93px" class="l_input" />
                            %
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRecommend"
                                ErrorMessage="优惠率必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>积分价格:</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPoint" runat="server" Text="0" Width="93px" class="l_input" Enabled="false" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtRecommend"
                                ErrorMessage="积分价格必须是数字!" ValidationExpression="^(-?\d+)(\.\d+)?$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>允许批发：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="Wholesales" runat="server" RepeatDirection="Horizontal"
                                            Width="106px">
                                            <asp:ListItem Value="1" onclick="show(this);">是</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="0" onclick="show(this);">否</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr id="pifaji" style="display: none" onmouseover="this.className='tdbgmouseover'"
                                    onmouseout="this.className='tdbg'">
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="height: 24px">
                                                    ① 一次性购买此商品数量满
                                                    <asp:TextBox ID="s1" runat="server" Text='10' Width="49px" class="l_input" />
                                                    时，批发价为
                                                    <asp:TextBox ID="j1" runat="server" Width="68px" class="l_input">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                            <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                                <td height="24">
                                                    ② 一次性购买此商品数量满
                                                    <asp:TextBox ID="s2" runat="server" Text='50' Width="49px" class="l_input" />
                                                    时，批发价为
                                                    <asp:TextBox ID="j2" runat="server" Width="68px" class="l_input">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="24">
                                                    ③ 一次性购买此商品数量满
                                                    <asp:TextBox ID="s3" runat="server" Text='100' Width="49px" class="l_input" />
                                                    时，批发价为
                                                    <asp:TextBox ID="j3" runat="server" Width="68px" class="l_input">0</asp:TextBox>
                                                    元
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>允许单独销售：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="Wholesaleone" runat="server" RepeatDirection="Horizontal"
                                Width="106px">
                                <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>设置为礼品：</strong>
                        </td>
                        <td>
                            <div style="float: left">
                                <asp:RadioButtonList ID="Largess" runat="server" RepeatDirection="Horizontal" Width="106px">
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div style="float: left; width: auto">
                                <font color="red">(自选数量大于0时设为礼品无效)</font></div>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td>
                            <strong>礼品价格：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Largesspirx" runat="server" Width="91px" class="l_input">0</asp:TextBox>
                            元 <font color="red">设置为礼品且允许单独销售时的价格</font>
                        </td>
                    </tr>
                </tbody>
    </table>
</div>
<div class="tab-pane fade" id="Div2">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="site_border">
        <tbody id="Tabs4">
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%">
                            <strong>促销方案：</strong>
                        </td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td rowspan="7" width="39px">
                                        <asp:RadioButtonList ID="ProjectType" runat="server" Width="39px" CellSpacing="0"
                                            CellPadding="0">
                                            <asp:ListItem Value="1" Selected="True" style="line-height: 26px"></asp:ListItem>
                                            <asp:ListItem Value="2" style="line-height: 25px"></asp:ListItem>
                                            <asp:ListItem Value="3" style="line-height: 25px"></asp:ListItem>
                                            <asp:ListItem Value="4" style="line-height: 26px"></asp:ListItem>
                                            <asp:ListItem Value="5" style="line-height: 26px"></asp:ListItem>
                                            <asp:ListItem Value="6" style="line-height: 26px">6</asp:ListItem>
                                            <asp:ListItem Value="7" style="line-height: 27px">7</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td width="96%" height="22">
                                        &nbsp;不促销
                                    </td>
                                </tr>
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td height="22">
                                        &nbsp;买&nbsp;<asp:TextBox class="l_input" ID="ProjectPronum2" Text="1" runat="server"
                                            Width="26px"></asp:TextBox>件此商品 可以送一件同样商品
                                    </td>
                                </tr>
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td style="height: 22px">
                                        &nbsp;买&nbsp;<asp:TextBox Text="1" ID="ProjectPronum3" class="l_input" runat="server"
                                            Width="26px"></asp:TextBox>件此商品 可以送一件其他商品 赠品名称：<asp:TextBox ID="Productsname3" class="l_input"
                                                runat="server" ReadOnly="true" onclick="ProductsSelect('Productsname1');"></asp:TextBox><asp:Button
                                                    ID="Button6" runat="server" Text="浏览..." OnClientClick="ProductsSelect('3');return false;" />
                                        <asp:HiddenField ID="HiddenField3" runat="server" />
                                    </td>
                                </tr>
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td height="22">
                                        &nbsp;送&nbsp;<asp:TextBox ID="ProjectPronum4" class="l_input" runat="server" Text="1"
                                            Width="26px"></asp:TextBox>件同样商品
                                    </td>
                                </tr>
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td style="height: 22px">
                                        &nbsp;送&nbsp;<asp:TextBox ID="ProjectPronum5" runat="server" class="l_input" Text="1"
                                            Width="26px"></asp:TextBox>件其他商品 送一件赠品名称：<asp:TextBox ID="Productsname5" class="l_input"
                                                runat="server" ReadOnly="true" onclick="ProductsSelect('Productsname2');"></asp:TextBox><asp:Button
                                                    ID="Button7" runat="server" Text="浏览..." OnClientClick="ProductsSelect('5');return false;" />
                                        <asp:HiddenField ID="HiddenField5" runat="server" />
                                    </td>
                                </tr>
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td height="22">
                                        &nbsp;加&nbsp;<asp:TextBox ID="ProjectMoney6" class="l_input" runat="server" Text="1"
                                            Width="26px"></asp:TextBox>元钱送商品 送一件赠品名称：<asp:TextBox ID="Productsname6" runat="server"
                                                class="l_input" ReadOnly="true" onclick="ProductsSelect('Productsname3');"></asp:TextBox><asp:Button
                                                    ID="Button8" runat="server" Text="浏览..." OnClientClick="ProductsSelect('6');return false;" />
                                        <asp:HiddenField ID="HiddenField6" runat="server" />
                                    </td>
                                </tr>
                                <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td height="22">
                                        &nbsp;满&nbsp;<asp:TextBox ID="ProjectMoney7" runat="server" Text="1" Width="26px"
                                            class="l_input"></asp:TextBox>元钱送商品 送一件赠品名称：<asp:TextBox ID="Productsname7" class="l_input"
                                                runat="server" ReadOnly="true" onclick="ProductsSelect('Productsname4');"></asp:TextBox><asp:Button
                                                    ID="Button5" runat="server" Text="浏览..." OnClientClick="ProductsSelect('7');return false;" />
                                        <asp:HiddenField ID="HiddenField7" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%" style="height: 19px">
                            <strong>其他促销方案：</strong>
                        </td>
                        <td style="height: 19px">
                            <asp:Button ID="Button9" runat="server" Text="绑定其他促销方案" Width="261px"
                                OnClientClick="OpenprojectSelect();return false;" /><br />
                            <asp:ListBox ID="OtherProject" runat="server" Height="127px" Width="261px" SelectionMode="Multiple">
                            </asp:ListBox>
                            <br />
                            <asp:Button ID="Button10" runat="server" Text="删除选中方案" Width="260px"
                                OnClientClick="Clearoption();return false;" />
                            <br />
                            <font color="red"><b>选中状态</b></font><font color="green">的方案将被更新</font> 支持<b>Ctrl</b>或<b>Shift</b>键多选
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td width="20%">
                            <strong>购物积分：</strong>
                        </td>
                        <td>
                            购买&nbsp;<asp:TextBox ID="IntegralNum" runat="server" Text="1" Width="26px" class="l_input"></asp:TextBox>&nbsp;件此商品可以得到
                            <asp:TextBox ID="Integral" runat="server" Width="53px" class="l_input" MaxLength="3" />
                            积分
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server"
                                ControlToValidate="Integral" ErrorMessage="积分只能是数字或小数！" ValidationExpression="^\d+\.?\d+$|^\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </tbody>
    </table>
</div>
<div class="tab-pane fade" id="Div3">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="site_border">
        <tbody id="Tabs5">
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        </tbody>
    </table>
</div>
</div>
</div>
<div id="tap_3">
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
<table border="0" cellpadding="0" cellspacing="0" width="100%" id="TABLE1">
    <tr>
        <td align="left" style="height: 59px">
            &nbsp; &nbsp;
            <asp:Button ID="EBtnSubmit" Text="保存商品信息" runat="server"  OnClick="EBtnSubmit_Click1" />
            <asp:Button ID="btnAdd" Text="添加为新商品" runat="server" OnClick="btnAdd_Click" /> 
            <input type="button" value="返回列表" onclick="location='ProductManage.aspx'" />
        </td>
    </tr>
</table>
<script type="text/javascript">
    $().ready(function () {
        $(":button").addClass("site_button");
        $(":submit").addClass("site_button");
    });
    function GetPicurl(imgurl) {
        //var optlen = document.getElementById("selectpic").options.length;
        var optlen = 1;
        var isin = 0;
        //alert(imgurl)
        for (var i = 0; i < optlen; i++) {
            //var doctxt = document.getElementById("selectpic").options.item(i);doctxt.value.toLowerCase() == imgurl.toLowerCase() || 
            var doctxt = imgurl;
            if (imgurl.toLowerCase().indexOf("http://") > -1) {
                isin = 1;
            }
        }

        if (isin == 0) {
            var option = document.createElement("option");
            option.text = imgurl;
            option.value = imgurl;
            //document.getElementById("selectpic").add(option);
        }
    }
</script>
</div>
</div>
<script src="../../dist/js/bootstrap.min.js" type="text/javascript"></script>
</asp:Content>