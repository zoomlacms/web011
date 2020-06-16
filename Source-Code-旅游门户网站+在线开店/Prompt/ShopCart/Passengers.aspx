<%@ page language="C#" autoeventwireup="true" inherits="Prompt_ShopCart_Passengers, App_Web_a3w1qawe" masterpagefile="~/User/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/ZL_Regex.js"></script>
    <title>信息补充</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%:Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">填写信息</li>
    </ol>
     <div><h4>旅游信息</h4></div>
    <table class="table table-bordered">
        <tr><td>旅游线路</td><td>出发时间</td><td>单价</td><td>人数</td><td>合计</td></tr>
        <asp:Repeater runat="server" ID="ProList_RPT">
            <ItemTemplate>
                <tr><td><%#Eval("ProName") %></td>
                <td><%#Eval("GoDate","{0:yyyy年MM月dd日 HH:mm}") %></td>
                <td><%#Eval("Price","{0:f2}") %></td>
                <td><%#Eval("ProNum") %></td>
                <td><%#Eval("AllMoney","{0:f2}") %></td></tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan="5">总计:<span runat="server" id="AllMoney_sp" class="r_red_mid"></span></td></tr>
    </table>
  <%--  <div><strong>保险数量:</strong><asp:TextBox runat="server" ID="Safenum_T" CssClass="form-control" /></div>--%>
    <div><h4>旅客信息</h4></div>
    <ul id="user_ul">
        <li><table class='table table-bordered'>
                <tr><td rowspan='2' class='r_green_mid min'>旅客<span class='num'>1</span></td><td><input type='text' class='form-control' name='name_t' placeholder='姓名' />
                    <input type='button' value='添加' class='btn btn-default' onclick="AddGuest();" /></td></tr>
                <tr><td><select name='certtype_sel' class='form-control min'>
                    <option value='1' selected='selected'>身份证</option>
                    <option value='2'>护照</option>
                    <option value='3'>学生证</option></select><input type='text' class='form-control margin_l5' name='certcode_t' placeholder='证件号' /></td></tr>
            </table></li>
    </ul>
    <div><h4>联系人信息</h4></div>
    <table class="table table-bordered">
         <tr><td class="tdleft">姓名:</td><td><input type="text" class="form-control" name="c_name_t" /></td></tr>
         <tr><td>手机:</td><td><input type="text" class="form-control" name="c_mobile_t" /></td></tr>
         <tr><td>地址:</td><td><input type="text" class="form-control" name="c_address_t" /></td></tr>
         <tr><td></td><td><asp:Button runat="server" ID="Save_Btn" OnClick="Save_Btn_Click" Text="预订" CssClass="btn btn-primary" OnClientClick="return CheckSubmit();" /></td></tr>
    </table>
    <input type="hidden" id="Pros_Hid" name="Pros_Hid" />
    <input type="hidden" id="Guest_Hid" name="Guest_Hid"/>
    <input type="hidden" id="Contract_Hid" name="Contract_Hid"/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
       .tdleft{width:120px;}
       .margin_l5{margin-left:5px;}
    </style>
    <script>
        $(function () {
            $("#Pros_Hid").val('<%=Pros%>');
        })
        var addTlp = "<li><table class='table table-bordered'>"
        + "<tr><td rowspan='2' class='r_green_mid min'>旅客<span class='num'>@num</span></td><td><input type='text' class='form-control' name='name_t' placeholder='姓名' /><input type='button' value='移除' class='btn btn-default margin_l5' onclick='RemoveGuest(this);' /></td></tr>"
        + "<tr><td><select name='certtype_sel' class='form-control min'>"
        + "<option value='1' selected='selected'>身份证</option><option value='2'>护照</option><option value='3'>学生证</option></select>"
        + "<input type='text' class='form-control margin_l5' name='certcode_t' placeholder='证件号' /></td></tr></table></li>";
        //添加一个新旅客
        function AddGuest() {
            var num = parseInt($("#user_ul li:last .num").text()) + 1;
            $("#user_ul").append(addTlp.replace("@num", num));
        }
        function RemoveUser(obj) {
            if (confirm("确定要移除吗")) {
                $(obj).closest("li").remove();
            }
        }
        function CheckSubmit() {
            var guestArr = [];//旅客
            var contractArr = [];//联系人
            $liarr = $("#user_ul li");
            for (var i = 0; i < $liarr.length; i++) {
                $li = $($liarr[0]);
                var model = { Name: $li.find("input[name=name_t]").val(), CertType: $li.find("input[name=certtype_sel]").val(), CertCode: $li.find("input[name=certcode_t]").val() };
                guestArr.push(model);
            }
            var model = { Name: $("input[name=c_name_t]").val(), Mobile: $("input[name=c_mobile_t]").val(), Address: $("input[name=c_address_t]").val() };
            contractArr.push(model);
            $("#Guest_Hid").val(JSON.stringify(guestArr));
            $("#Contract_Hid").val(JSON.stringify(contractArr));
            return true;
        }
    </script>
</asp:Content>