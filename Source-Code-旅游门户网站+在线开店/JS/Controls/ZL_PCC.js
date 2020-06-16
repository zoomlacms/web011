/*
*Author:Coffee
*功能:省市县三级联动
*尚缺:text:text功能
*/
function ZL_PCC(pid, cityid, countyid) {
    this.$province = $("#" + pid);
    this.$city = $("#" + cityid);
    this.$county = $("#" + countyid);
}
ZL_PCC.prototype = {
    ProvinceInit: function (pid) {
        var ref = this;
        for (var i = 0; i < AreaMod.length; i++) {
            ref.$province.append("<option value='" + AreaMod[i].ID + "'>" + AreaMod[i].Name + "</option>");
        }
        var v = pid ? pid : AreaMod[0].ID;
        ref.$province.val(v);
        ref.CityInit();
        ref.$province.change(function () { ref.CityInit(); });
    },
    CityInit: function (cid) {
        var ref = this;
        ref.$city.html("");
        var arr = AreaMod.GetByID(ref.$province.val()).CityList;
        for (var i = 0; i < arr.length; i++) {
            ref.$city.append("<option value='" + arr[i].ID + "'>" + arr[i].Name + "</option>");
        }
        var v = cid ? cid : arr[0].ID;
        ref.$city.val(v);
        ref.CountyInit();
        ref.$city.change(function () { ref.CountyInit(); });
    },
    CountyInit: function (cid) {
        var ref = this;
        ref.$county.html("");
        var arr = AreaMod.GetByID(ref.$province.val()).CityList.GetByID(ref.$city.val()).CountyList;
        for (var i = 0; i < arr.length; i++) {
            ref.$county.append("<option value='" + arr[i].ID + "'>" + arr[i].Name + "</option>");
        }
        var v = cid ? cid : arr[0].ID;
        ref.$county.val(v);
    }
}
Array.prototype.GetByID = function (v) {
    for (var i = 0; i < this.length; i++) {
        if (this[i].ID == v) return this[i];
    }
    return null;
}