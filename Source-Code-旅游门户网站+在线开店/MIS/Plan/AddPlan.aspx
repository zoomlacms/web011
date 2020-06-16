<%@ page language="C#" autoeventwireup="true" inherits="MIS_Plan_New, App_Web_rf4ejtbp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>��Ӽƻ�</title>
<link href="/App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery.js" ></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script> 
<script>
function loadPage(id, url) {
    $("#" + id).addClass("loader");
    $("#" + id).append("Loading......");
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        error: function () { alert('����ҳ��' + url + 'ʱ����'); },
        success: function (msg) {
            $("#" + id).empty().append(msg);
            $("#" + id).removeClass("loader");
        }
    });
}
</script>
<script type="text/javascript">
var $$ = function (id) {
return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
create: function () {
    return function () {
        this.initialize.apply(this, arguments);
    }
}
}

Object.extend = function (destination, source) {
for (var property in source) {
    destination[property] = source[property];
}
return destination;
} 
var Calendar = Class.create();
Calendar.prototype = {
initialize: function (container, options) {
    this.Container = $$(container);//����(table�ṹ)
    this.Days = [];//���ڶ����б�

    this.SetOptions(options);

    this.Year = this.options.Year;
    this.Month = this.options.Month;
    this.SelectDay = this.options.SelectDay ? new Date(this.options.SelectDay) : null;
    this.onSelectDay = this.options.onSelectDay;
    this.onToday = this.options.onToday;
    this.onFinish = this.options.onFinish;

    this.Draw();
},
//����Ĭ������
SetOptions: function (options) {
    this.options = {//Ĭ��ֵ
        Year: new Date().getFullYear(),//��ʾ��
        Month: new Date().getMonth() + 1,//��ʾ��

        SelectDay: null,//ѡ������
        onSelectDay: function () { },//��ѡ�����ڴ���
        onToday: function () { },//�ڵ������ڴ���
        onFinish: function () { }//��������󴥷�


    };
    Object.extend(this.options, options || {});
},
//��һ����
PreMonth: function () {
    //��ȡ����һ���µ����ڶ���
    var d = new Date(this.Year, this.Month - 2, 1);
    //����������
    this.Year = d.getFullYear();
    this.Month = d.getMonth() + 1;
    //���»�����
    this.Draw();
},
//��һ����
NextMonth: function () {
    var d = new Date(this.Year, this.Month, 1);
    this.Year = d.getFullYear();
    this.Month = d.getMonth() + 1;
    this.Draw();
},
//������
Draw: function () {
    //�������������б�
    var arr = [];
    var arrc = [];
    var week01 = "";
    var week02 = "";
    var week03 = "";
    //�õ��µ�һ����һ���е�����ֵ��Ϊ�������һ�������
    for (var i = 1, firstDay = new Date(this.Year, this.Month - 1, 1).getDay() ; i <= firstDay; i++) {
        var t= LastDay = new Date(new Date(this.Year, this.Month - 2, 1).getFullYear(), new Date(this.Year, this.Month - 2, 1).getMonth(), 0).getDate() ; 
        arr.push(t - i);
        arrc.push(t - i);
    }
    //for (var i = 1, LastDay = new Date(new Date(this.Year, this.Month - 2, 1).getFullYear(), new Date(this.Year, this.Month - 2, 1).getMonth(), 0).getDate() ; i <= LastDay; i++) {
                          
    //    arr.push("&nbsp;");
    //}
    //�õ������һ����һ�����е�����ֵ��Ϊ���µ�����
    for (var i = 1, monthDay = new Date(this.Year, this.Month, 0).getDate() ; i <= monthDay; i++) {
        arr.push("<a href='AddPlan.aspx?Year=" + this.Year + "&Month=" + this.Month + "'>" + i + "</a>");
        arrc.push(i);
            // monthDay
    }   

    var frag = document.createDocumentFragment();

    this.Days = [];
    j = 0;
    while (arr.length > 0) {
        //ÿ�����ڲ���һ��tr
        var row = document.createElement("tr");
        j++;
        //ÿ��������7��
        for (var i = 1; i < 9; i++) {

            var cell = document.createElement("td");
            if (i == 1) { 
                var dd1 = arrc[(j-1) * 7];
                var dd = arrc[j * 7] - 1 
                if (dd > 0) { }
                else { dd = arrc[(arrc.length-1)]; }
                cell.innerHTML = "&nbsp; <a href='javascript:ChangWeeks(" + j + "," + dd1 + ","+dd+")'>��" + j + "�� </a> ";
            }
            else {
                if (arr.length > 0) {
                    var d = arr.shift();
                    cell.innerHTML = d + "<br/>";
                    if (d > 0) {
                        this.Days[d] = cell;
                        //�ж��Ƿ����
                        if (this.IsSame(new Date(this.Year, this.Month - 1, d), new Date())) { this.onToday(cell); }
                        //�ж��Ƿ�ѡ������
                    }
                }
            }
            row.appendChild(cell);
        }
        frag.appendChild(row);
    }

    //����������ٲ���(ie��table������innerHTML)
    while (this.Container.hasChildNodes()) { this.Container.removeChild(this.Container.firstChild); }
    this.Container.appendChild(frag);

    this.onFinish();
},
//�ж��Ƿ�ͬһ��
IsSame: function (d1, d2) {
    return (d1.getFullYear() == d2.getFullYear() && d1.getMonth() == d2.getMonth() && d1.getDate() == d2.getDate());
} 
};

function getmenu(){ } 
function changetime(obj){
if (obj.value == 1) {
    document.getElementById("idCalendarw").style.display = "block";
    document.getElementById("idCalendarz").style.display = "none";
    document.getElementById("idCalendarM").style.display = "none";
}
else if (obj.value ==2) {
    document.getElementById("idCalendarw").style.display = "none";
    document.getElementById("idCalendarz").style.display = "block";
    document.getElementById("idCalendarM").style.display = "none";
}
else {
    document.getElementById("idCalendarw").style.display = "none";
    document.getElementById("idCalendarz").style.display = "none";
    document.getElementById("idCalendarM").style.display = "block";
}
}
function ChangMonth(id) {
var year = document.getElementById("ThisYear").value;
document.getElementById("TextTitle").value = year + "��" + id + "�¼ƻ�";
var date = new Date(year, id, 0).getDate();
if (id < 10) {
    document.getElementById("TextStartDate").value = year + "/0" + id + "/01";
    document.getElementById("TextEndDate").value = year + "/0" + id + "/" + date;
}
else {
    document.getElementById("TextStartDate").value = year + "/" + id + "/01";
    document.getElementById("TextEndDate").value = year + "/" + id + "/" + date;
}
}

function ChangWeeks(id,d1,d2) {
var year = document.getElementById("idCalendarYear").innerHTML;
var moth = document.getElementById("idCalendarMonth").innerHTML; 
if (d1 > d2)
    d1 = 1;
document.getElementById("TextStartDate").value = year + "/" + moth + "/" + d1;
document.getElementById("TextEndDate").value = year + "/" + moth + "/" + d2;
document.getElementById("TextTitle").value = year + "��" + moth + "�µ�" + id + "�ܼƻ�";

}
</script> 
</head>
<body>
<form runat="server">
<div id="Meno">
<div class="plan">
<h1>�½��ƻ�</h1>
<div id="type_tit">
ѡ��ƻ�����:
<input type="radio" name="types"  value="1" onclick="changetime(this)" checked /> �ܼƻ� <input type="radio" name="types"  value="2"  onclick="changetime(this)"  /> �¼ƻ�<input type="radio" name="types" value="3"  onclick="changetime(this)"  /> �Զ���ƻ� 
</div>
<div class="change_time">
<div class="Calendar" id="idCalendarw" >
ѡ��ƻ�ʱ��: <span id="idCalendarYear" >
</span>�� <span id="idCalendarMonth"> </span>��
<table cellspacing="0" width="200">
<thead>
<tr>
<td></td>
<td>�� </td>
<td>һ</td>
<td>��</td>
<td>��</td>
<td>��</td>
<td>��</td>
<td>��</td>
</tr>
</thead>
<tbody id="idCalendar">
</tbody>
</table>
</div> 
<div id="idCalendarz" style="display:none">
ѡ��ƻ�ʱ��:
<select id="ThisYear"  > 
    <option value="2012">2012��</option>
    <option value="2013">2013��</option>
    <option value="2014">2014��</option>
    <option value="2015">2015��</option>
    <option value="2016">2016��</option>
    <option value="20172">2017��</option>
    <option value="2018">2018��</option>
    <option value="2019">2019��</option>
    <option value="2020">2020��</option>
</select>
<table width="600" style="margin:auto" class="black">
                        
<tbody id="Month_c">
    <tr class="tr">
        <td> <a href="javascript:void(0)" onclick="ChangMonth('1')"><input type="radio" name="typest"  value="1"/>һ��</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('2')"><input type="radio" name="typest"  value="2" />����</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('3')"><input type="radio" name="typest"  value="3" />����</a></td>
    </tr> 
    <tr><td>δ�ƶ�</td><td></td><td></td></tr>
        <tr  class="tr"><td><a href="javascript:void(0)" onclick="ChangMonth('4')">
        <input type="radio" name="types"  value="4" />����</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('5')"><input type="radio" name="typest"  value="5"  />����</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('6')"><input type="radio" name="typest"  value="6"/>����</a></td>
    </tr> 
    <tr><td>δ�ƶ�</td><td></td><td></td></tr>
        <tr  class="tr"><td><a href="javascript:void(0)" onclick="ChangMonth('7')"><input type="radio" name="typest" value="7" />����</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('8')"><input type="radio" name="typest" value="8" />����</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('9')"><input type="radio" name="typest" value="9" />����</a></td>
    </tr> 
        <tr><td>δ�ƶ�</td><td></td><td></td></tr>
    <tr  class="tr"><td><a href="javascript:void(0)" onclick="ChangMonth('10')"><input type="radio" name="typest" value="10" />ʮ��</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('11')"><input type="radio" name="typest"  value="11"/>ʮһ��</a></td>
        <td><a href="javascript:void(0)" onclick="ChangMonth('12')"><input type="radio" name="typest" value="12" />ʮ����</a></td>
    </tr>
    <tr><td>δ�ƶ�</td><td></td><td></td></tr>
    </tbody>

</table>

</div>
<div id="idCalendarM"  style="display:none"> 
    ѡ��ƻ�ʱ��: �� 
<asp:TextBox ID="TextStartDate"  onclick="WdatePicker();" Text="" class="M_input" runat="server" />
��<asp:TextBox ID="TextEndDate" onclick="WdatePicker();"  Text="" class="M_input" runat="server" />
</div>
<div class="plan_title">�ƻ�����<b>*</b>��<asp:TextBox ID="TextTitle" runat="server" class="M_input"></asp:TextBox> 
</div>
<div class="bots"><asp:Button ID="Button1" Text="�ύ" class="i_bottom" runat="server" OnClick="Button1_Click" /> </div>
<script language="JavaScript">
var cale = new Calendar("idCalendar", {
    SelectDay: new Date().setDate(10),
    // onSelectDay: function(o){ o.className = "onSelect"; },
    onToday: function (o) { o.className = "onToday"; },
    onFinish: function () {
        $$("idCalendarYear").innerHTML = this.Year;
        $$("idCalendarMonth").innerHTML = this.Month;
        var flag = [10, 15, 20];
        document.getElementById("ThisYear").value = this.Year;  
    }
}); 
</script>   
</div>
</div>
</div>
</form>
</body>
</html>