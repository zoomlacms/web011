<%@ page language="C#" autoeventwireup="true" inherits="User_Questions_MyCoruse, App_Web_ftiv45vt" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Assembly="ZoomLa.Ajax" Namespace="ZoomLa.Framework.Noebe.Jsons.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>我的课程</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
  
<script type="text/javascript" src="../JS/ManageJS.js"></script>
<script>
    function onShow(obj) {
        if (document.getElementById("DetDiv" + obj).style.display == "") {
            document.getElementById("DetDiv" + obj).style.display = "none";
        } else {
            document.getElementById("DetDiv" + obj).style.display = "";
        }
    }
</script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li>考试管理</li>
        <li class="active">我的课程</li>
    </ol>
     <div class="us_seta" style="width: 99%;margin-top: 5px;">
    <h1 class="text-center"> 我的课程</h1>
  </div>
  <div class="us_topinfo" style="width: 99%;padding:0;">
       
  <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
   <div>
  <div class="table table-bordered table-hover" id="nocontent" runat="server" style="display: none"> 暂无课程信息</div> 
    <table width="100%;">
      <tr class="tdbgleft">
        <td style="width: 10%"> 选择 </td>
        <td> 课程名称 </td>
        <td> 剩余/总(单位：天) </td>
        <td> 总课时 </td>
        <td> 开放状态 </td>
        <td> 操作 </td>
      </tr>
      <asp:Repeater ID="rep" runat="server" OnItemDataBound="rep_ItemDataBound">
        <ItemTemplate>
          <tr>
            <td><asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("CourseID") %>' />
              <asp:CheckBox ID="chkSel" runat="server" /></td>
            <td><%#GetCourse(Eval("CourseID","{0}"))%></td>
            <td><%#GetClass(Eval("ClassID", "{0}"),Convert.ToInt32( Eval("ID").ToString()), "1")%></td>
            <td><%#GetClass(Eval("ClassID", "{0}"), Convert.ToInt32(Eval("ID").ToString()), "3")%></td>
            <td><%#GetState(Eval("ClassID", "{0}"))%></td>
            <td><%#getStartLesson(Convert.ToInt32(Eval("ID").ToString()), Convert.ToInt32(Eval("ID").ToString()))%></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="5" style="width: 100%"><div id="DetDiv<%#Eval("ID") %>" style="display: none;">
                <table class="table table-bordered table-hover">
                  <tr style="border: 1px solid #C6E3F7; background-color: #185D84; color: #FFF">
                    <td> 课件名称 </td>
                    <td> 开放时间 </td>
                    <td> 主讲人 </td>
                    <td> 设计者 </td>
                    <td> 操作 </td>
                  </tr>
                  <asp:Repeater ID="Detail" runat='server'>
                    <ItemTemplate>
                      <tr>
                        <td> 第<%#Eval("CoursNum")%>课 <%#Eval("Courseware")%></td>
                        <td><%#Eval("UpdateTime")%></td>
                        <td><%#Eval("Speaker")%></td>
                        <td><%#Eval("SJName")%> </td>
                        <td><asp:UpdatePanel ID="upStudy" runat="server">
                            <ContentTemplate>
                              <asp:LinkButton ID="lbStudy" runat="server" OnClick="lbStudy_Click" CommandName='<%#Eval("ID") %>' CommandArgument='<%#Eval("FileUrl") %>'>开始学习</asp:LinkButton>
                              <asp:HiddenField ID="hfStudyUrl" Value='<%#Eval("FileUrl") %>' runat="server" />
                            </ContentTemplate>
                          </asp:UpdatePanel></td>
                      </tr>
                    </ItemTemplate>
                  </asp:Repeater>
                </table>
               </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
    </table>
    <table class="table table-bordered table-hover">
      <tr>
        <td><div class="text-center"><span style="text-align: center;">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />
            /
            <asp:Label ID="PageSize" runat="server" Text="" />
            页
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条数据/页 </span> </div></td>
      </tr>
    </table>
    <asp:UpdatePanel ID="upSpare" runat="server"> </asp:UpdatePanel>
  </div>
  </div>
</asp:Content>
