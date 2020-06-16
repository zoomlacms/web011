<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_AddClassRoom, App_Web_uep30c12" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
 <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
<title>添加班级</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" class="text-center">
                <strong><asp:Label ID="Label1" runat="server" Text="添加学校班级"></asp:Label></strong>
            </td>
        </tr>
        <tr>
            <td><strong>班级名称</strong></td>
            <td>
                <asp:TextBox ID="txtRoomName" class="form-control" runat="server" Width="304px"></asp:TextBox>
                <span style="color: Red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoomName" ErrorMessage="班级名称不能为空!"></asp:RequiredFieldValidator></span>
            </td>
        </tr>
        <tr>
            <td><strong>所属学校</strong></td>
            <td>
                <asp:TextBox ID="txtSchoolName" class="form-control" runat="server" Width="304px" onclick="SelectRule();" ReadOnly="true"></asp:TextBox>
                <span style="color: Red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSchoolName" ErrorMessage="所属学校不能为空!" Display="Dynamic"></asp:RequiredFieldValidator>点击输入框进行选择学校</span>
            </td>
        </tr>
        <tr>
            <td><strong>班主任</strong></td>
            <td>
                <asp:TextBox ID="txtTeacher" class="form-control" runat="server" Width="104px"></asp:TextBox>
                <span style="color: Red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTeacher" ErrorMessage="请输入班主任名字"></asp:RequiredFieldValidator></span>
            </td>
        </tr>
        <tr>
            <td><strong>副管理员</strong></td>
            <td>
                <asp:TextBox ID="txtAdviser" class="form-control" runat="server" Width="304px"></asp:TextBox>多个请用逗号 , 隔开</td>
        </tr>
        <tr>
            <td><strong>创建人(管理员)</strong></td>
            <td>
                <asp:TextBox ID="txtCreateUser" class="form-control" runat="server" Width="104px"></asp:TextBox>
                创建人ID 
                <span style="color: Red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCreateUser" ErrorMessage="请输入创建人用户ID"></asp:RequiredFieldValidator></span>
            </td>
        </tr>
        <tr>
            <td><strong>班长</strong></td>
            <td>
                <asp:TextBox ID="txtMonitor" class="form-control" runat="server" Width="104px"></asp:TextBox>
                <span style="color: Red">*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMonitor" ErrorMessage="请输入班长名字"></asp:RequiredFieldValidator></span>
            </td>
        </tr>
        <tr>
            <td><strong>入学时间</strong></td>
            <td>
                <asp:TextBox ID="txtGrade" class="form-control" runat="server" Width="200" MaxLength="4"></asp:TextBox>
                年份 <span style="color: Red">*
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtGrade" Display="Dynamic" ErrorMessage="请输入入学年份"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtGrade"  Display="Dynamic" ErrorMessage="格式不正确" ValidationExpression="(D-)?\d{4}"></asp:RegularExpressionValidator>
                   </span>
            </td>
        </tr>
        <tr>
            <td><strong>是否审核</strong></td>
            <td>
                <input type="checkbox" runat="server" id="txtIsTrue" class="switchChk" checked="checked"/>
            </td>
        </tr>
        <tr>
            <td><strong>班级介绍</strong></td>
            <td>
                <asp:TextBox ID="txtClassinfo" TextMode="MultiLine" class="form-control" runat="server" Height="168px" Width="443px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HiddenField ID="txtSchoolID" runat="server" />
                <asp:HiddenField ID="txtRoomID" runat="server" />
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="确认添加" OnClick="Button1_Click" />
                <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="取消返回" OnClientClick="location.href='SnsSchool.aspx';return false;" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<script>
	function SelectRule() {
		window.open('SchoolList.aspx', '', 'width=600,height=450,resizable=0,scrollbars=yes');
	}
</script>
</asp:Content>
