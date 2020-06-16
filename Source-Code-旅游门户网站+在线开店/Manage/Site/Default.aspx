<%@ page language="C#" autoeventwireup="true" inherits="IISMain, App_Web_asipkizh" masterpagefile="~/manage/Site/SiteMaster.master" title="站点列表" enableviewstate="True" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/jquery.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<title>站点列表</title>
    <style>
#site_nav .site01 a {background: url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}
.nochoose, .choose{	width: 78px;height: 22px;padding-bottom: 1px;padding-left: 1px;padding-right: 1px;padding-top: 1px;font-weight: normal;cursor: pointer;/*line-height: 120%;*/	}
.nochoose {background: url(../../App_Themes/AdminDefaultTheme/images/titlebg2.gif) left no-repeat;}
.choose{background: url(../../App_Themes/AdminDefaultTheme/images/titlebg1.gif) left no-repeat;color: #ffffff;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
    <div runat="server" id="serverDiv" style="position:absolute;margin-top:13px;"> 
        管理其它服务器：<asp:DropDownList runat="server" ID="serverList"   onchange="getToServer()"></asp:DropDownList>
    </div>
    <div id="localDiv">
        <div id="m_site"><p style="float:left;"> 站群中心 >> 站点列表</p>
        <span runat="server" id="titleSpan" style="color:green;margin-left:15px;">
            汇总信息：当前共有{0}个站点:{1}个运行中,{2}个已停止(其中有{3}个逐浪站点,{4}个运行中,{5}个已停止)
        </span><span>
            <asp:CheckBox runat="server" ID="noZoomla" Checked="true" Text="普通网站" AutoPostBack="true"/>
            <asp:CheckBox runat="server" ID="zoomlaSite" Checked="true" Text="逐浪网站" AutoPostBack="true"/>
            <asp:CheckBox runat="server" ID="started"  Checked="true" Text="运行中" AutoPostBack="true"/>
            <asp:CheckBox runat="server" ID="stopped"  Checked="true" Text="已停止" AutoPostBack="true"/>
            <asp:CheckBox runat="server" ID="expire"  Checked="false" Text="已到期(仅显示)" AutoPostBack="true"/>
            <script type="text/javascript">
                function testFunc2() {
                    $("#localDiv").hide();
                    $("#remoteDiv").show();
                }
                $().ready(function () {
                     obj = $("#<%=expire.ClientID%>");
                     //$("#serverDiv").css("top", $(obj).offset().top + $(obj).outerHeight + "px");
                    $("#<%=serverDiv.ClientID%>").css("left", $(obj).offset().left + 120);
                });
                function getToServer() {
                    value = $("#<%=serverList.ClientID%> option:selected").val();
                    if (value == 0) {
                        $("#localDiv").show();
                        $("#remoteDiv").hide();
                    } else if (value =='add')
                    {
                        location.href = "ServerClusterConfig.aspx";
                    }
                    else {
                        //var server = SyncpostToCS("serverInfo", value);
                        SyncpostToCS("serverInfo", value);
                    }
                    function SyncpostToCS(a, v) {
                       // var result;
                        $.ajax({
                            type: "Post",
                            url: "Default.aspx",
                            //dataType: "json",
                            data: { action: a, value: v },
                            async: true,
                            success: function (data)
                            {
                                //result = data;
                                $("#remoteFrame").attr("src", data);
                                $("#localDiv").hide();
                                $("#remoteDiv").show();
                            },
                            error: function (data) { alert("失败"); }
                        });
                       // return result;
                    }
                }
            </script>
            </span></div>
    <div id="site_main">
  <%--  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
<%--        <asp:UpdatePanel runat="server" ID="mainPanel"><ContentTemplate>--%>
            <table border="0" cellpadding="0" cellspacing="0" >
                <tr style="text-align: center;">
                    <td class="nochoose" onclick="ShowTabs(this,'<%=noZoomla.ClientID %>',true)">逐浪站点
                    </td>
                    <td id="td2" class="choose" onclick="ShowTabs(this,'<%=noZoomla.ClientID %>',false)">全部站点
                    </td>
                </tr>
            </table>
            <script type="text/javascript">
                function ShowTabs(obj, id,b) {//Div切换
                    $(obj).addClass("choose").siblings().removeClass("choose").addClass("nochoose");
                    $("#" + id).attr("checked", b);
                    $("#" + id).trigger("click");
                }
                $().ready(function (){
                    if ($("#<%=noZoomla.ClientID %>").attr("checked") == true)
                    {
                        $("#td2").addClass("choose").siblings().removeClass("choose").addClass("nochoose");
                    }
                });
            </script>
        <div id="tab3">
        <ZL:ExGridView ID="EGV" runat="server" DataSourceID="WSData" AllowPaging="True" RowStyle-CssClass="tdbg" AutoGenerateColumns="False" 
                    MouseOverCssClass="tdbgmouseover" CellPadding="2" CellSpacing="1"  Width="100%"  OnRowDataBound="EGV_RowDataBound"
                    GridLines="None" EnableTheming="False" EmptyDataText="没有任何数据！" OnRowCommand="EGV_RowCommand" AllowSorting="True" CheckBoxFieldHeaderWidth="3%" EnableModelValidation="True" IsHoldState="false" SerialText="">
         <Columns>
             <asp:TemplateField HeaderText="ID">
                 <ItemTemplate>
                     <input type="checkbox" name="chk" value="<%#Eval("SiteName") %>" style="margin-right:10px;" />
                     <%#Eval("SiteID") %>
                 </ItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="网站名称"  ItemStyle-CssClass="site_ico"  SortExpression="SiteState">
                 <ItemTemplate>
                   <a href="javascript:;" title="运行状态" style="position:relative; bottom:-2px; right:5px;">
                       <%#(Eval("SiteState") as string) == "Started" ? "<img src='../../App_Themes/AdminDefaultTheme/images/site/site_ico.gif' style='cursor:default;' />" 
                       : "<img src='../../App_Themes/AdminDefaultTheme/images/site/site_ico_stop.gif' style='cursor:default;'/>" %>                     
                   </a>
                   <a href="<%#GetFileUrl(Eval("SiteName")as string) %>" title="浏览文件" style="position:relative;bottom:-5px;">
                   <img src="../../App_Themes/AdminDefaultTheme/images/Folder/folderopen.gif" /> </a>
                   <a href="<%# GetSiteDetailUrl(Eval("SiteName")as string) %>" title="查看网站详情"><%# Eval("SiteName") %></a>
                     <a href="javascript:;" title="<%# "版本："+Eval("ZoomlaVersion") %>" style="position:relative; bottom:-2px; right:5px;margin-left:10px;">
                       <%#Eval("ZoomlaVersion").ToString().Length==0 ? "" 
                       : "<img src='../../favicon.ico' style='cursor:default;width:14px;height:14px;'/>" %>                 
                   </a>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="EditSiteName" runat="server" Text='<%#Eval("SiteName") %>' Width="90%" style="text-align:center;"/>
                 </EditItemTemplate>
            <ItemStyle CssClass="site_ico"></ItemStyle>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="状态" SortExpression="SiteState">
                 <ItemTemplate>
                     <%#(Eval("SiteState") as string) == "Started" ? "<span style='color:green;'>运行中</span>" : "<span style='color:red;'>已停止</span>" %>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="到期时间">
                <ItemTemplate>
                 <a href="<%#GetFranUrl(Eval("SiteName")as string) %>" title="点击进入管理">
                 <%#GetDate(DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy年M月d日}"))%>
                 </a>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="端口" SortExpression="SitePort">
                 <ItemTemplate>
                       <a href="Default.aspx?siteName=<%# Server.UrlEncode(Eval("SiteName")as string) %>" title="点击浏览绑定信息"><%#Eval("SitePort") %></a>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox runat="server" ID="EditPort" Text='<%#Eval("SitePort") %>' Width="30%" style="text-align:center;"/>
                 </EditItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="site_a">
                 <ItemTemplate>
                     <a href="javascript:;" title="浏览网站" onclick="testF(this,'getDomain', '<%#Eval("SiteName") %>','<%#Eval("SitePort") %>');">浏览 </a>
                     <asp:LinkButton  runat="server" CommandName="Edit2" CommandArgument='<%# Container.DisplayIndex %>' >修改 </asp:LinkButton>
                     <a href="javascript:if(confirm('你确定要删除吗!')){ postToCS('del','<%#Eval("SiteName") %>')}">删除 </a>
                     <a href="javascript:postToCS('stop','<%#Eval("SiteName") %>')">停止 </a>
                     <a href="javascript:postToCS('start','<%#Eval("SiteName") %>')">启动 </a>
                     <a href="javascript:postToCS('restart','<%#Eval("SiteName") %>')">重启</a>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:LinkButton ID="Save" runat="server" CommandName="Save" CommandArgument='<%# Container.DisplayIndex+":"+Eval("SiteID") %>'>更新</asp:LinkButton>
                     <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" CommandArgument='<%# Container.DisplayIndex %>'>取消</asp:LinkButton>
                 </EditItemTemplate>

<ItemStyle CssClass="site_a"></ItemStyle>
             </asp:TemplateField>       
         </Columns>
            <PagerStyle   HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView><br />
               <script type="text/javascript">
                   function testF(obj,a, name,b) {
                       postToCS2(a,name,b,obj);
                   }
                   function postToCS2(a, name,b,obj) {
                       $.ajax({
                           type: "Post",
                           url: "Default.aspx",
                           data: { action: a, siteName: name },
                           success: function (data)
                           {
                               var result="";
                               var arr = data.split(',');
                               if (data == "") {
                                   alert("尚未绑定域名");
                                   return false;
                                   //result += "<li class='tdbg'>尚未绑定域名</li>";
                               }
                               //else if (arr.length == 1) { window.open("http://" + arr[0]); return; }
                               for (i = 0; i < arr.length && data != "";i++)
                               {
                                   //  result+="<li class='tdbg'><a href='http://"+arr[i]+"'>"+arr[i]+"</a></li>";

                                   result=arr[i]
                               }
                              
                               window.open("http://" + result+":"+b, "_blank");
                              // $("#hrefBox").html(result);

                               easyDialog.open({
                                   container: 'hrefBox',
                                   follow: obj,
                                   followX: -60,
                                   followY: 15
                               });
                           },
                           error: function (data) { alert(data); }
                       });
                   }
                
        </script>
        <asp:ObjectDataSource runat="server" ID="WSData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetWSData" TypeName="GetDSData" >
            <SelectParameters>
                <asp:ControlParameter ControlID="noZoomla" Name="f1" PropertyName="Checked" Type="String" />
                <asp:ControlParameter ControlID="zoomlaSite" Name="f2" PropertyName="Checked" Type="String" />
                <asp:ControlParameter ControlID="started" Name="f3" PropertyName="Checked" Type="String" />
                <asp:ControlParameter ControlID="stopped" Name="f4" PropertyName="Checked" Type="String" />
                <asp:ControlParameter ControlID="expire" Name="f5" PropertyName="Checked" Type="String" />
            </SelectParameters>
            </asp:ObjectDataSource>
        <input type="button" id="btn1" value="创建新站点" class="site_button"/>
        <asp:Button runat="server" ID="batStart" Text="批量启动" class="site_button" OnClick="batStart_Click"/>
       <%-- <asp:Button runat="server" ID="batStop"  Text="批量停止" class="site_button" OnClick="batStop_Click"/>--%>
        <div style="display:none;">
        <input type="button" id="btn2" value="批量创建网站"/>
        <input type="button" id="btn3" value="批量删除"/>
        <input type="button" id="btn4" value="批量重启"/>
         </div>
            </div><!--tab3 end-->
    <%--   </ContentTemplate></asp:UpdatePanel>--%>
          <%--  <asp:ObjectDataSource  runat="server" ID="AppPoolData" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAppPool" TypeName="GetDSData" ></asp:ObjectDataSource>--%>
            </div>
    <script type="text/javascript">

            $(function () {
                $("#btn1,#rBtn1").click(function () {
                    url = "CreateSite.aspx";
                    if (getParam("remote") == "true")
                    {
                        url += "?remote=true"
                    }
                    location = url;
                });//btn1 end;

                $("#btn2,#rBtn2").click(function () {
                    $("#BCWSDiv").toggle();
                    $("#CSWSDiv").hide();
                });//btn2 end;
             
                $("#<%=EGV.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll' style='margin-right:10px;'/>ID");//EGV顶部
                $("#<%=EGV.ClientID%>  tr>th").css("height", "30px").css("line-height", "30px");
                //$("#EGV2 tr>th:eq(0)").html("<input type=checkbox id='chkAll2' style='float:left;'/>ID");
                //$("#EGV3 tr>th:eq(0)").html("<input type=checkbox id='chkAll3' style='float:left;'/>ID");
                //$("#EGV4 tr>th:eq(0)").html("<input type=checkbox id='chkAll4' style='float:left;'/>ID");

                $("#chkAll").click(function () {//EGV 全选
                    selectAll(this,"chk");
                });
                //$("#chkAll2").click(function () {//EGV2 全选
                //    selectAll(this, "chk2");
                //});
                //$("#chkAll3").click(function () {
                //    selectAll(this, "chk3");
                //});
                //$("#chkAll4").click(function () {
                //    selectAll(this, "chk4");
                //});
                
                //bindInfo("例:www.baidu.com", "BindDomain");
                //bindInfo('例:/test/test', 'VPath');
                //bindInfo('例:C:\\test\\', 'PPath')

                $("table tr").mousemove(function () { this.className = 'tdbgmouseover'; }).mouseout(function () { this.className = 'tdbg'; });
            });//ready End;

            function bindInfo(s, id)
            {
               $("#"+id).val(s).css('color', '#666')
                    .focus(function () { if (this.value == s) { this.value = ''; } })
                    .blur(function () { if (this.value == '') { this.value = s; this.style.color = '#666'; } });
            }
            function postToCS(a,name)
            {
                $.ajax({
                    type: "Post",
                    url:"Default.aspx",
                    data: { action: a, siteName: name },
                    success: function (data) { if (a != "del3") { location = location; } else { alert(data);}; },
                    error: function (data) { alert(data);}
                });
            }

            function selectAll(obj,name) {
                var allInput = document.getElementsByName(name);
                var loopTime = allInput.length;
                for (i = 0; i < loopTime; i++) {
                    if (allInput[i].type == "checkbox") {
                        allInput[i].checked = obj.checked;
                    }
                }
            }
            function openSite(domain,port)
            {
                if (domain == "") domain = "localhost";
                open("http://"+domain+":"+port);
            }
        </script>
    </div>
    <div id="remoteDiv" style="display:none;">
    <iframe id="remoteFrame" style="width:100%;height:960px;" />
    </div>
</asp:Content>