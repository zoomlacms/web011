﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Config_ThumbConfig, App_Web_gsi5yeuj" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>缩略图配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr >
      <td ><strong><%:lang.LF("上传图片默认宽度") %>：</strong></td>
      <td >
          <asp:TextBox ID="iwidth" runat="server" class="form-control pull-left" Width="200"></asp:TextBox>
          <span class="pull-left" style="line-height:32px; margin-left:5px;">像素&nbsp;&nbsp;设为0时，将以高度为准按比例缩小。 </span>
      </td>
    </tr>
    <tr >
      <td ><strong><%:lang.LF("上传图片默认高度") %>：</strong></td>
      <td >
          <asp:TextBox ID="iheight" runat="server" class="form-control pull-left" Width="200"></asp:TextBox>
          <span class="pull-left" style="line-height:32px; margin-left:5px;">像素&nbsp;&nbsp;设为0时，将以宽度为准按比例缩小。都为0时，则为原图大小。</span>
      </td>
    </tr>
    <tr >
      <td ><strong><%:lang.LF("是否开启水印") %>：</strong></td>
      <td >
            <input runat="server" type="checkbox" id="Isuse" class="switchChk" checked="checked" />
    </tr>
    <tr  style="display:none">
      <td ><strong><%:lang.LF("缩略图算法") %>：</strong></td>
      <td >
          <asp:RadioButtonList ID="RadioButtonList1" runat="server">
              <asp:ListItem Value="1" Selected="True">常规算法：宽度和高度都大于0时，直接缩小成指定大小，其中一个为0时，按比例缩小</asp:ListItem>
              <asp:ListItem Value="2">裁剪法：宽度和高度都大于0时，先按最佳比例缩小再裁剪成指定大小，其中一个为0时，按比例缩小。</asp:ListItem>
              <asp:ListItem Value="3">补充法：在指定大小的背景图上附加上按最佳比例缩小的图片。 </asp:ListItem>
          </asp:RadioButtonList>
      </td>
    </tr>
    <tr >
      <td ><strong><%:lang.LF("水印类型") %>：</strong></td>
      <td >
          <asp:RadioButtonList ID="waterType" runat="server" RepeatColumns="2" AutoPostBack="True" onselectedindexchanged="waterType_SelectedIndexChanged">
              <asp:ListItem Selected="True" Value="1">图片水印</asp:ListItem>
              <asp:ListItem Value="2">文字水印</asp:ListItem>
          </asp:RadioButtonList>
      </td>
    </tr>
    <div runat="server" id="tu">
      <tr >
        <td ><strong><%:lang.LF("水印图路径(不支持标签读取)") %>: </strong></td>
        <td ><asp:TextBox ID="iLogo" runat="server" Width="400" class="form-control pull-left" ></asp:TextBox></td>
      </tr>
      <tr >
        <td ><strong><%:lang.LF("水印图片透明度") %>：</strong></td>
        <td >
            <asp:TextBox ID="iAlp" runat="server" Width="50" CssClass="from-control pull-left"></asp:TextBox>
            <span class="pull-left" style="line-height:32px; margin-left:5px;">%，0为完全透明，100为完全不透明</span>
        </td>
      </tr>
    </div>
    <div id="zi" runat="server">
      <tr >
        <td ><strong><%:lang.LF("水印文字") %>：</strong><br />
          水印文字不宜超过15个字符,不支持HTML标记。</td>
        <td ><asp:TextBox ID="waterWord" runat="server" CssClass="form-control pull-left" Width="200"></asp:TextBox></td>
      </tr>
      <tr >
        <td ><strong><%:lang.LF("文字字体") %>：</strong><br /></td>
        <td style="height: 23px;">
            <asp:DropDownList ID="WordType" CssClass="form-control" Width="150" runat="server">
                <asp:ListItem>宋体</asp:ListItem>
                <asp:ListItem >楷体</asp:ListItem>
                <asp:ListItem >新宋体</asp:ListItem>
                <asp:ListItem>黑体</asp:ListItem>
                <asp:ListItem >隶书</asp:ListItem>
                <asp:ListItem>幼圆</asp:ListItem>
                <asp:ListItem >Andale Mono</asp:ListItem>
                <asp:ListItem >Arial</asp:ListItem>
                <asp:ListItem>Arial Black</asp:ListItem>
                <asp:ListItem >Book Antiqua</asp:ListItem>
                <asp:ListItem>Century Gothic</asp:ListItem>
                <asp:ListItem >Comic Sans MS</asp:ListItem>
                <asp:ListItem >Courier New</asp:ListItem>
                <asp:ListItem>Georgia</asp:ListItem>
                <asp:ListItem >Impact</asp:ListItem>
                <asp:ListItem>Tahoma</asp:ListItem>
                <asp:ListItem >Times New Roman</asp:ListItem>
                <asp:ListItem>Trebuchet MS</asp:ListItem>
                <asp:ListItem >Script MT Bold</asp:ListItem>
                <asp:ListItem>Stencil</asp:ListItem>
                <asp:ListItem >Verdana</asp:ListItem>
                <asp:ListItem >Lucida Console</asp:ListItem>
              </asp:DropDownList>
        </td>
      </tr>
      <tr >
        <td ><strong><%:lang.LF("字体样式") %>：</strong><br /></td>
        <td style=" height: 23px;">
            <asp:DropDownList ID="WordStyle" CssClass="form-control" Width="150" runat="server">
                <asp:ListItem Value="1">正常</asp:ListItem>
                <asp:ListItem Value="2">斜体</asp:ListItem>
                <asp:ListItem Value="3">加粗</asp:ListItem>
                <asp:ListItem Value="4">删除线</asp:ListItem>
                <asp:ListItem Value="5">下划线</asp:ListItem>
            </asp:DropDownList>
        </td>
      </tr>
      <tr >
        <td class="style3" ><strong><%:lang.LF("文字大小") %>：</strong><br /></td>
        <td >
            <asp:TextBox ID="WordSize" runat="server" CssClass="form-control pull-left" Width="200"></asp:TextBox>
            <span class="pull-left" style="line-height:32px; margin-left:5px;">请输入数字</span>
        </td>
      </tr>
      <tr >
        <td ><strong><%:lang.LF("文字颜色") %>：</strong><br /></td>
        <td style="height: 23px;">
            <script type="text/javascript">
                function SelectColor(t, clientId) {
                    var url = "../Common/SelectColor.aspx?d=f&t=6";
                    var old_color = (document.getElementById(clientId).value.indexOf('#') == 0) ? '&' + document.getElementById(clientId).value.substr(1) : '&' + document.getElementById(clientId).value;
                    if (document.all) {
                        var color = showModalDialog(url + old_color, '', "dialogWidth:18.5em; dialogHeight:16.0em; status:0");
                        if (color != null) {
                            document.getElementById(clientId).value = color;
                        } else {
                            document.getElementById(clientId).focus();
                        }
                    } else {
                        var color = window.open(url + '&' + clientId, "hbcmsPop", "top=200,left=200,scrollbars=yes,dialog=yes,modal=no,width=300,height=260,resizable=yes");
                    }
                }
            </script>
            <asp:TextBox ID="txt_dfg" CssClass="form-control pull-left" Width="200" name="txt_dfg" runat="server"></asp:TextBox>
            <img onclick="SelectColor(this,'txt_dfg');"src="/images/Rect.gif" align="absmiddle" style="border-width: 0px; cursor: pointer" />
        </td>
      </tr>
    </div>
    <tr >
      <td ><strong><%:lang.LF("坐标起点位置") %>：</strong></td>
      <td style=" height: 23px;">
          <asp:DropDownList ID="localP" runat="server" AutoPostBack="True" onselectedindexchanged="localP_SelectedIndexChanged"  class="form-control pull-left" Width="150">
              <asp:ListItem Value="1">左上</asp:ListItem>
              <asp:ListItem Value="2">左中</asp:ListItem>
              <asp:ListItem Value="3">左下</asp:ListItem><asp:ListItem Value="4">上中</asp:ListItem>
              <asp:ListItem Value="5">中</asp:ListItem>
              <asp:ListItem Value="6">下中</asp:ListItem>
              <asp:ListItem Value="7">右上</asp:ListItem>
              <asp:ListItem Value="8">右中</asp:ListItem>
              <asp:ListItem Value="9">右下</asp:ListItem>
              <asp:ListItem Value="10">自定义</asp:ListItem>
          </asp:DropDownList>
      </td>
    </tr>
    <tr  runat="server" id="oox" >
      <td ><strong><%:lang.LF("坐标位置") %>：坐标起点位置设置为手动设置时才有效。 </strong></td>
      <td style="height: 23px;"> X：
        <asp:TextBox ID="PX" runat="server" Width="50"></asp:TextBox>
        像素 填写的数据必须是数字！设为手动才可启用改参数<br />
        Y：
        <asp:TextBox ID="PY" runat="server" Width="50"></asp:TextBox>
        像素 填 </td>
    </tr>
  </table>
  <asp:Button ID="Button1" runat="server" Text="保存设置" OnClick="Button1_Click" class="btn btn-primary" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>