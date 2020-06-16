<%@ page language="C#" autoeventwireup="true" inherits="manage_APP_AddAPP, App_Web_m5epptqi" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>添加应用模版</title>
<link type="text/css"  href="../App_Themes/AdminDefaultTheme/Default.css" rel="stylesheet" />
<link href="../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="../JS/CheckContent.js"></script>
      <script language="JavaScript" type="text/javascript">
          function SelectColor(t, clientId) {
              var url = "../Common/SelectColor.aspx?d=f&t=6";
              var old_color = (document.getElementById(clientId).value.indexOf('#') == 0) ? '&' + document.getElementById(clientId).value.substr(1) : '&' + document.getElementById(clientId).value;
              var color = "";
              if (document.all) {
                  color = showModalDialog(url + old_color, "", "dialogWidth:18.5em; dialogHeight:16.0em; status:0");
                  if (color != null) {
                      document.getElementById(clientId).value = color;
                  } else {
                      document.getElementById(clientId).focus();
                  }
              } else {
                  color = window.open(url + '&' + clientId, "hbcmsPop", "top=200,left=200,scrollbars=yes,dialog=yes,modal=no,width=300,height=260,resizable=yes");
              }
          }

          function Check() {
              var hid = document.getElementById("HidCheck").value;
              if (hid != "") {
                  document.getElementById("Hids").value = document.getElementById("HidCheck").value;
                  if (hid == 0) {
                      document.getElementById("TypeTit").innerText = "栏目ID：";
                      document.getElementById("RadNode").checked = true;
                      document.getElementById("RadCom").checked = false;
                      document.getElementById("LisBox").style.display = "block";
                      document.getElementById("ComBox").style.display = "none";
                  }
                  else if (hid == 1) {
                      document.getElementById("TypeTit").innerText = "内容ID：";
                      document.getElementById("RadNode").checked = false;
                      document.getElementById("RadCom").checked = true;
                      document.getElementById("ComBox").style.display = "block";
                      document.getElementById("LisBox").style.display = "none";
                  }
              }
              else {
                  document.getElementById("HidCheck").value = 0;
              }
          }

          function CheckNode() {
              document.getElementById("TypeTit").innerText = "栏目ID：";
              document.getElementById("RadNode").checked = true;
              document.getElementById("RadCom").checked = false;
              document.getElementById("HidCheck").value = "0";
              document.getElementById("Hids").value = document.getElementById("HidCheck").value;
              document.getElementById("LisBox").style.display = "block";
              document.getElementById("ComBox").style.display = "none";
              document.getElementById("LblNewMessage").innerText = "";
          }
          function CheckCom() {
              document.getElementById("TypeTit").innerText = "内容ID：";
              document.getElementById("RadNode").checked = false;
              document.getElementById("RadCom").checked = true;
              document.getElementById("HidCheck").value = "1";
              document.getElementById("Hids").value = document.getElementById("HidCheck").value;
              document.getElementById("ComBox").style.display = "block";
              document.getElementById("LisBox").style.display = "none";
          }

          function CheckNameExit() {
              var AppName = document.getElementById("TextAppName").value;
              if (AppName == null || AppName == "") {
                  document.getElementById("LblMessage").innerText = "请输入应用名称";
              }
              else {
                  document.getElementById("LblMessage").innerText = "";
              }
          }
          window.onload = Check;
        </script>
</head>
<body>   
<form id="form1" runat="server">
<div class="r_navigation">
<%if(GetOpenHelp.IsopenHelp()=="1")
{%>
<div id="help"><a onclick="help_show('24')" title="帮助"></a></div>
<%}%> 后台管理&gt;&gt;系统设置&gt;&gt;<a href="<%=CustomerPageAction.customPath2 %>Template/TemplateSet.aspx">方案设置</a>&gt;&gt;<a href="<%=CustomerPageAction.customPath2 %>Template/CloudLead.aspx">从云端免费获取全站方案</a>&gt;&gt;<a href="TemplateSetOfficial.aspx">应用推送</a>&gt;&gt;添加应用模版 </div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
    <tbody id="Tabs0">
      <tr class="spacingtitle" style="height:30px;">
        <td align="center" colspan="3" ><asp:Label ID="lblText" runat="server">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>应用模版</asp:Label></td>
      </tr>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td rowspan="7" style="width:305px;">
        <div id="phone">
         <div id="phnifm"><iframe id="Viewhtml" width="272" style="overflow-y:hidden;" height="405" frameborder="0" scrolling="no" src="Default.aspx?NodeID=<%=Request["NodeID"]%>&ID=<%=Request["ID"]%>"></iframe></div> 
        </div>
        </td>
        <td style="width: 150px" class="tdbgleft"><strong>应用名称：</strong></td>
        <td><asp:TextBox ID="TextAppName" onblur="CheckNameExit()" class="l_input" runat="server" />
          <asp:Label ID="LblMessage" runat="server" ForeColor="#FF3300"></asp:Label>  
        </td>
      </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft"><strong><asp:Label ID="TypeTit" runat="server" Text="栏目ID"></asp:Label></strong></td>
        <td>
            <input id="RadNode" runat="server" onclick="CheckNode()" type="radio" checked="true"/>栏目
            <input id="RadCom" runat="server" onclick="CheckCom()" type="radio"/>内容
<%--            <asp:RadioButtonList ID="RidType" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">栏目</asp:ListItem>
                <asp:ListItem>内容</asp:ListItem>
            </asp:RadioButtonList>--%>
            <br />
            <div id="LisBox" runat="server">
            <asp:ListBox ID="LstNodes" runat="server" DataTextField="NodeName" DataValueField="NodeId"  SelectionMode="Multiple" Height="100px" Width="200px"></asp:ListBox>
            </div>
            <br />
            <div id="ComBox" runat="server" style="display:none;">
            <asp:TextBox ID="TxtCom" onblur="callserver()" CssClass="l_input" runat="server"></asp:TextBox>
            </div>
            <asp:Label ID="LblNewMessage" runat="server" ForeColor="#FF3300"></asp:Label>
            <input type="hidden" id="HidCheck" value="<%=Request["Type"]%>"/>
            <asp:HiddenField ID="Hids" Value="0" runat="server" />
            <%--<asp:RequiredFieldValidator ID="ReqTxtUserName" runat="server" ControlToValidate="NodeID" Text="" SetFocusOnError="false"  ErrorMessage="栏目ID不能为空"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="ValgTextMaxLength" ControlToValidate="NodeID" ValidationExpression="^[0-9]*[1-9][0-9]*$" SetFocusOnError="false" ErrorMessage="请输入正确的栏目ID！" runat="server"></asp:RegularExpressionValidator> --%>
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td class="tdbgleft"><strong>作者：</strong></td>
    <td><asp:TextBox ID="Author" class="l_input" runat="server" /></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
    <td style="width: 150px" class="tdbgleft"><strong>应用简介：</strong></td>
    <td><asp:TextBox ID="Description" TextMode="MultiLine" class="l_input"  Height="87px" Width="300px" runat="server" />
    </td>
    </tr>
<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft">
            <strong>颜色：</strong>
        </td>
        <td>
            <asp:TextBox ID="ColorDefault" CssClass="l_input" runat="server" MaxLength="7" Columns="7" Style="font-size: 9pt; height: 15px;"></asp:TextBox>
            <img alt="" onclick="SelectColor(this,'ColorDefault');" src="/App_Themes/AdminDefaultTheme/Images/selectclolor.gif" style=" vertical-align:middle; border-width: 0px; cursor: pointer" />
        </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>应用前置图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Clearimg" runat="server" Width="300px" class="l_input" /> 
                            <iframe id="Iframe1" style="top: 2px" src="<%=CustomerPageAction.customPath2+"Shop/fileupload.aspx?menu=Clearimg" %>" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
                    <tr class="tdbg" id="addsmallimg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft"  >
                            <strong>应用缩略图：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="Thumbnails" runat="server" Width="300px" class="l_input" /><iframe  id="smallimgs" style="top: 2px" src="<%=CustomerPageAction.customPath2+"Shop/fileupload.aspx?menu=Thumbnails"%>" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                        </td>
                    </tr>
  </table>
  <div class="clearbox"></div>
  <div style="text-align:center;">
    <asp:Button ID="BtnCommit" runat="server" Text="提交"  class="C_input" OnClick="Button1_Click" />
    &nbsp;&nbsp; 
    <input type="button" value="返回" onclick="javascript: history.go(-1)" class="C_input" />
  </div><asp:HiddenField ID="Furl" runat="server" />
<input type="hidden" id="HidTypes" value='<%=Request["Type"]%>'/>
</form>
</body>
</html>