<%@ page language="C#" autoeventwireup="true" inherits="MIS_Plan, App_Web_rf4ejtbp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title> 计划</title>
<link href="../../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js"></script> 
<script>
    function loadPage(id, url) { 
    $("#" + id).addClass("loader");
    $("#" + id).append("Loading......");
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        error: function () { alert('加载页面' + url + '时出错！'); },
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
            this.Container = $$(container);//容器(table结构)
            this.Days = [];//日期对象列表

            this.SetOptions(options);

            this.Year = this.options.Year;
            this.Month = this.options.Month;

            this.SelectDay = this.options.SelectDay ? new Date(this.options.SelectDay) : null;
            this.onSelectDay = this.options.onSelectDay;
            this.onToday = this.options.onToday;
            this.onFinish = this.options.onFinish;

            this.Draw();
        },
        //设置默认属性
        SetOptions: function (options) {
            this.options = {//默认值
                Year: new Date().getFullYear(),//显示年
                Month: new Date().getMonth() + 1,//显示月

                SelectDay: null,//选择日期
                onSelectDay: function () { },//在选择日期触发
                onToday: function () { },//在当天日期触发
                onFinish: function () { }//日历画完后触发


            };
            Object.extend(this.options, options || {});
        },
        //上一个月
        PreMonth: function () {
            //先取得上一个月的日期对象
            var d = new Date(this.Year, this.Month - 2, 1);
            //再设置属性
            this.Year = d.getFullYear();
            this.Month = d.getMonth() + 1;
            //重新画日历
            this.Draw();
        },
        //下一个月
        NextMonth: function () {
            var d = new Date(this.Year, this.Month, 1);
            this.Year = d.getFullYear();
            this.Month = d.getMonth() + 1;
            this.Draw();
        },
        //画日历
        Draw: function () {
            //用来保存日期列表
            var arr = [];
            var arrc = [];
            var week01 = "";
            var week02 = "";
            var week03 = "";
            //用当月第一天在一周中的日期值作为当月离第一天的天数
            for (var i = 1, firstDay = new Date(this.Year, this.Month - 1, 1).getDay() ; i <= firstDay; i++) {
                arr.push("&nbsp;");
            }
            //用当月最后一天在一个月中的日期值作为当月的天数
            for (var i = 1, monthDay = new Date(this.Year, this.Month, 0).getDate() ; i <= monthDay; i++) {
                arr.push(i);
                // monthDay
            }
            for (var i = 1, monthDay = new Date(this.Year, this.Month, 0).getDate() ; i <= Math.ceil((monthDay + new Date(this.Year, this.Month - 1, 1).getDay()) / 7) ; i++) {

                week02 = week02 + "<li>第" + i + "周<div id='wk02View" + i + "' class='wkview'></div></li>";//<a href='AddPlan.aspx?Year=" + this.Year + "&Month=" + this.Month + "&week=" + i + "'></a>
                document.getElementById("week02").innerHTML = week02;
                
            }
            for (var i = 1, monthDay = new Date(this.Year, this.Month - 1, 0).getDate() ; i <= Math.ceil((monthDay + new Date(this.Year, this.Month - 1, 1).getDay()) / 7) ; i++) {

                week01 = week01 + "<li>第" + i + "周<div id='wk01View" + i + "' class='wkview'></div></li>";//<a href='AddPlan.aspx?Year=" + new Date(this.Year, this.Month - 2, 1).getFullYear() + "&Month=" + (new Date(this.Year, this.Month - 2, 1).getMonth() + 1) + "&week=" + i + "'></a>
                document.getElementById("week01").innerHTML = week01;
            }
          
            for (var i = 1, monthDay = new Date(this.Year, this.Month + 1, 0).getDate() ; i <= Math.ceil((monthDay + new Date(this.Year, this.Month - 1, 1).getDay()) / 7) ; i++) {

                week03 = week03 + "<li>第" + i + "周<div id='wk03View" + i + "' class='wkview'></div></li>";//<a href='AddPlan.aspx?Year=" + new Date(this.Year, this.Month, 1).getFullYear() + "&Month=" + (new Date(this.Year, this.Month, 1).getMonth() + 1) + "&week=" + i + "'></a>
                document.getElementById("week03").innerHTML = week03;
               // loadPage("'wk03View" + i + "'", "/Mis/Plan/SelPlan.aspx?type=1&year=" + this.Year + "&month=" + this.Month + "&week=" + i);
            }
            var url = "";

            for (var i = 1, monthDay = new Date(this.Year, this.Month, 0).getDate() ; i <= Math.ceil((monthDay + new Date(this.Year, this.Month - 1, 1).getDay()) / 7) ; i++) {
                 url = "/Mis/Plan/SelPlan.aspx?type=1&year=" + this.Year + "&month=" + this.Month + "&week=" + i;
                loadPage("wk02View" + i, url);
            }

            for (var i = 1, monthDay = new Date(this.Year, this.Month - 1, 0).getDate() ; i <= Math.ceil((monthDay + new Date(this.Year, this.Month - 1, 1).getDay()) / 7) ; i++) {

                url = "/Mis/Plan/SelPlan.aspx?type=1&year=" + this.Year + "&month=" + (this.Month - 1) + "&week=" + i
               loadPage("wk01View" + i , url);
            }

            for (var i = 1, monthDay = new Date(this.Year, this.Month + 1, 0).getDate() ; i <= Math.ceil((monthDay + new Date(this.Year, this.Month - 1, 1).getDay()) / 7) ; i++) {
                 url="/Mis/Plan/SelPlan.aspx?type=1&year=" + this.Year + "&month=" + (this.Month+1) + "&week=" + i;
                loadPage("wk03View" + i , url);
            }

            var frag = document.createDocumentFragment();

            this.Days = [];

            while (arr.length > 0) {
                //每个星期插入一个tr
                var row = document.createElement("tr");
                //每个星期有7天
                for (var i = 1; i <= 7; i++) {
                    var cell = document.createElement("td");
                    cell.innerHTML = "&nbsp;";

                    if (arr.length > 0) {
                        var d = arr.shift();
                        cell.innerHTML = d + "<br/>";
                        if (d > 0) {
                            this.Days[d] = cell;
                            //判断是否今日
                            if (this.IsSame(new Date(this.Year, this.Month - 1, d), new Date())) { this.onToday(cell); }
                            //判断是否选择日期
                        }
                    }
                    row.appendChild(cell);
                }
                frag.appendChild(row);
            }

            //先清空内容再插入(ie的table不能用innerHTML)
            while (this.Container.hasChildNodes()) { this.Container.removeChild(this.Container.firstChild); }
            this.Container.appendChild(frag);

            this.onFinish(); 
          
        },
        //判断是否同一日
        IsSame: function (d1, d2) {
            return (d1.getFullYear() == d2.getFullYear() && d1.getMonth() == d2.getMonth() && d1.getDate() == d2.getDate());
        }
    };




</script>
 
</head>
<body>
<form id="form1" runat="server">
<div class="Mis_Plan Mis_pad" id="Meno">
<div class="Mis_Title"><strong><a href="AddPlan.aspx">新建计划</a></strong></div>
<table width="100%" class="border plan">
<tr class="Mis_tits"><td width="33%" id="dates">本月(13年2月)</td>
<td width="33%" ><a  href="javascript:void(0)" id="idCalendarPre"> 上一月</a> <b id="tb_date">2013年1月－3月 </b><a href="javascript:void(0)" id="idCalendarNext">下一月</a>
    </td>
<td width="33%" ><%--<a href="#">导出</a> | <a href="#">切换到列表视图</a>--%>
</td>
</tr>
<tr><td valign="top">
<ul>
<li><strong id="Month01">一月 </strong></li>
<li id="M01"> 月计划 </li> 
     
<li><em>周计划</em></li>
</ul>
<div>
<ul  id="week01"></ul></div>
<div>自定义计划</div>
<div id="zview1" class="mview">
 
</div>
</td>

<td valign="top">
<ul>
<li><strong  id="Month02">二月 </strong></li>
<li id="M02"><a href="#">月计划</a></li>

<li><em>周计划</em></li>
</ul> 
<div>
<ul  id="week02"></ul>
</div>
<div>自定义计划</div>
<div id="zview2" class="mview">
  
</div>
</td>

<td  valign="top">
<ul> <li><strong  id="Month03">三月 </strong></li>
<li id="M03"><a href="#">月计划 </a></li>
 
<li><em>周计划</em></li>
        </ul> 
<div><ul id="week03"></ul></div>
                    
<div>自定义计划</div>
<div id="zview3" class="mview">
 
</div>
</td> 
</tr></table>
</div>
<div>
<div class="Calendar" style="display:none">
<span id="idCalendarYear" >
</span>年 <span id="idCalendarMonth"> </span>月
<table cellspacing="0">
<thead>
    <tr>
    <td>日</td>
    <td>一</td>
    <td>二</td>
    <td>三</td>
    <td>四</td>
    <td>五</td>
    <td>六</td>
    </tr>
</thead>
<tbody id="idCalendar">
</tbody>
</table>
    </div>
</div> 
</form> 
<script language="JavaScript">
   
    var cale = new Calendar("idCalendar", {
        SelectDay: new Date().setDate(10),
        // onSelectDay: function(o){ o.className = "onSelect"; },
        onToday: function (o) { o.className = "onToday"; },
        onFinish: function () {
       
            $$("idCalendarYear").innerHTML = this.Year;
            $$("idCalendarMonth").innerHTML = this.Month;
            var flag = [10, 15, 20];
            //alert("日期是:" + this.Year + "/" + this.Month + "/" + flag[i] + "wewee") 


            document.getElementById("dates").innerHTML = "本月(" + new Date().getFullYear() + "年" + (new Date().getMonth() + 1) + "月)";
            document.getElementById("tb_date").innerHTML = new Date(this.Year, this.Month - 2, 1).getFullYear() + "年" + (new Date(this.Year, this.Month - 2, 1).getMonth() + 1) + "月－" + new Date(this.Year, this.Month, 1).getFullYear() + "年" + (new Date(this.Year, this.Month, 1).getMonth() + 1) + "月 ";
            document.getElementById("Month02").innerHTML = "<a href='AddPlan.aspx?Month=" + this.Month + "&Year=" + this.Year + "'>" + this.Month + "月</a>";
            document.getElementById("Month01").innerHTML = "<a href='AddPlan.aspx?Month=" + (new Date(this.Year, this.Month - 2, 1).getMonth() + 1) + "&Year=" + new Date(this.Year, this.Month - 2, 1).getFullYear() + "'>" + (new Date(this.Year, this.Month - 2, 1).getMonth() + 1) + "月</a>";
            document.getElementById("Month03").innerHTML = "<a href='AddPlan.aspx?Month=" + (new Date(this.Year, this.Month, 1).getMonth() + 1) + "&Year=" + new Date(this.Year, this.Month, 1).getFullYear() + "'>" + (new Date(this.Year, this.Month, 1).getMonth() + 1) + "月</a>";
          
            document.getElementById("M02").innerHTML = "<a href='AddPlan.aspx?Month=" + this.Month + "&Year=" + this.Year + "'>月计划</a><div id='mview2' class='mview'></div>";
            document.getElementById("M01").innerHTML = "<a href='AddPlan.aspx?Month=" + (new Date(this.Year, this.Month - 2, 1).getMonth() + 1) + "&Year=" + new Date(this.Year, this.Month - 2, 1).getFullYear() + "'>月计划</a><div id='mview'  class='mview'></div>";
            document.getElementById("M03").innerHTML = "<a href='AddPlan.aspx?Month=" + (new Date(this.Year, this.Month, 1).getMonth() + 1) + "&Year=" + new Date(this.Year, this.Month, 1).getFullYear() + "'>月计划</a><div id='mview3' class='mview'></div>" ;
            
            loadPage("mview2", "/Mis/Plan/SelPlan.aspx?type=2&year=" + this.Year + "&month=" + this.Month);

            loadPage("mview", "/Mis/Plan/SelPlan.aspx?type=2&month=" + (new Date(this.Year, this.Month - 2, 1).getMonth() + 1) + "&year=" + new Date(this.Year, this.Month - 2, 1).getFullYear());
            loadPage("mview3", "/Mis/Plan/SelPlan.aspx?type=2&year=" + new Date(this.Year, this.Month, 1).getFullYear() + "&month=" + (new Date(this.Year, this.Month, 1).getMonth() + 1));

            loadPage("zview2", "/Mis/Plan/SelPlan.aspx?type=3&year=" + this.Year + "&month=" + this.Month);
            loadPage("zview1", "/Mis/Plan/SelPlan.aspx?type=3&month=" + (new Date(this.Year, this.Month - 2, 1).getMonth() + 1) + "&year=" + new Date(this.Year, this.Month - 2, 1).getFullYear()) ;
            loadPage("zview3", "/Mis/Plan/SelPlan.aspx?type=3&year=" + new Date(this.Year, this.Month, 1).getFullYear() + "&month=" + (new Date(this.Year, this.Month, 1).getMonth() + 1) );
            
        }

        //        for(var i = 0, len = flag.length; i < len; i++){
        //            this.Days[flag[i]].innerHTML = "<a href='javascript:void(0);' onclick=\"alert('日期是:"+this.Year+"/"+this.Month+"/"+flag[i]+"');return false;\">" + flag[i] + "</a>"; 

        //        }
 
});

$$("idCalendarPre").onclick = function () { cale.PreMonth(); }
$$("idCalendarNext").onclick = function () { cale.NextMonth(); } 
 </script>
 

</body>
</html>
