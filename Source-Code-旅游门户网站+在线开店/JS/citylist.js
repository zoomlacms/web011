// JavaScript Document


var province;
var city;

function provinceList() {
    this.length = 31;
    this[0] = new Option("北京", "01");
    this[1] = new Option("天津", "26");
    this[2] = new Option("上海", "24");
    this[3] = new Option("重庆", "31");
    this[4] = new Option("河北", "09");
    this[5] = new Option("山西", "22");
    this[6] = new Option("辽宁", "17");
    this[7] = new Option("吉林", "14");
    this[8] = new Option("黑龙江", "11");
    this[9] = new Option("江苏", "15");
    this[10] = new Option("浙江", "30");
    this[11] = new Option("安徽", "02");
    this[12] = new Option("福建", "03");
    this[13] = new Option("江西", "16");
    this[14] = new Option("山东", "21");
    this[15] = new Option("河南", "10");
    this[16] = new Option("湖北", "12");
    this[17] = new Option("湖南", "13");
    this[18] = new Option("广东", "05");
    this[19] = new Option("海南", "08");
    this[20] = new Option("四川", "25");
    this[21] = new Option("贵州", "07");
    this[22] = new Option("云南", "22");
    this[23] = new Option("陕西", "23");
    this[24] = new Option("甘肃", "04");
    this[25] = new Option("青海", "20");
    this[26] = new Option("西藏", "27");
    this[27] = new Option("广西", "06");
    this[28] = new Option("内蒙", "18");
    this[29] = new Option("宁夏", "19");
    this[30] = new Option("新疆", "28");
    
    return this;
}
function cityList() {
    this.length = 35;
    this[11] = new Array(17);
    this[11][0] = new Option("合肥市", "01");
    this[11][1] = new Option("淮北市", "08");
    this[11][2] = new Option("淮南市", "09");
    this[11][3] = new Option("黄山市", "10");
    this[11][4] = new Option("安庆市", "02");
    this[11][5] = new Option("蚌埠市", "03");
    this[11][6] = new Option("巢湖市", "04");
    this[11][7] = new Option("池州市", "05");
    this[11][8] = new Option("滁州市", "06");
    this[11][9] = new Option("六安市", "11");
    this[11][10] = new Option("马鞍山市", "12");
    this[11][11] = new Option("宣城市", "16");
    this[11][12] = new Option("宿州市", "13");
    this[11][13] = new Option("铜陵市", "14");
    this[11][14] = new Option("芜湖市", "15");
    this[11][15] = new Option("阜阳市", "07");
    this[11][16] = new Option("亳州市", "17");

    this[0] = new Array(1);
    this[0][0] = new Option("北京市", "01");
    
    this[3] = new Array(4);
    this[3][0] = new Option("重庆市", "01");
    
    this[12] = new Array(9);
    this[12][0] = new Option("福州市", "01");
    this[12][1] = new Option("龙岩市", "02");
    this[12][2] = new Option("南平市", "03");
    this[12][3] = new Option("宁德市", "04");
    this[12][4] = new Option("莆田市", "05");
    this[12][5] = new Option("泉州市", "06");
    this[12][6] = new Option("三明市", "07");
    this[12][7] = new Option("厦门市", "08");
    this[12][8] = new Option("漳州市", "09");
    
    this[24] = new Array(14);
    this[24][0] = new Option("兰州市", "01");
    this[24][1] = new Option("甘南藏族自治州", "04");
    this[24][2] = new Option("定西地区", "03");
    this[24][3] = new Option("白银市", "02");
    this[24][4] = new Option("嘉峪关市", "05");
    this[24][5] = new Option("金昌市", "06");
    this[24][6] = new Option("酒泉市", "07");
    this[24][7] = new Option("临夏回族自治州", "08");
    this[24][8] = new Option("陇南地区", "10");
    this[24][9] = new Option("平凉市", "11");
    this[24][10] = new Option("庆阳市", "12");
    this[24][11] = new Option("天水市", "13");
    this[24][12] = new Option("武威市", "14");
    this[24][13] = new Option("张掖市", "15");
    
    this[18] = new Array(21);
    this[18][0] = new Option("广州市", "05");
    this[18][1] = new Option("佛山市", "04");
    this[18][2] = new Option("惠州市", "07");
    this[18][3] = new Option("东莞市", "03");
    this[18][4] = new Option("江门市", "08");
    this[18][5] = new Option("揭阳市", "09");
    this[18][6] = new Option("潮州市", "02");
    this[18][7] = new Option("茂名市", "10");
    this[18][8] = new Option("梅州市", "11");
    this[18][9] = new Option("清远市", "12");
    this[18][10] = new Option("汕头市", "13");
    this[18][11] = new Option("汕尾市", "14");
    this[18][12] = new Option("深圳市", "01");
    this[18][13] = new Option("韶关市", "15");
    this[18][14] = new Option("阳江市", "16");
    this[18][15] = new Option("河源市", "06");
    this[18][16] = new Option("云浮市", "17");
    this[18][17] = new Option("中山市", "20");
    this[18][18] = new Option("珠海市", "21");
    this[18][19] = new Option("湛江市", "18");
    this[18][20] = new Option("肇庆市", "19");
    
    this[27] = new Array(14);
    this[27][0] = new Option("南宁市", "01");
    this[27][1] = new Option("防城港市", "05");
    this[27][2] = new Option("北海市", "03");
    this[27][3] = new Option("百色市", "02");
    this[27][4] = new Option("贺州市", "09");
    this[27][5] = new Option("桂林市", "06");
    this[27][6] = new Option("来宾市", "10");
    this[27][7] = new Option("柳州市", "11");
    this[27][8] = new Option("崇左市", "04");
    this[27][9] = new Option("钦州市", "12");
    this[27][10] = new Option("贵港市", "07");
    this[27][11] = new Option("梧州市", "13");
    this[27][12] = new Option("河池市", "08");
    this[27][13] = new Option("玉林市", "14");
    
    this[21] = new Array(9);
    this[21][0] = new Option("贵阳市", "01");
    this[21][1] = new Option("毕节地区", "03");
    this[21][2] = new Option("遵义市", "08");
    this[21][3] = new Option("安顺市", "02");
    this[21][4] = new Option("六盘水市", "04");
    this[21][5] = new Option("黔东南苗族侗族自治州", "05");
    this[21][6] = new Option("黔南布依族苗族自治州", "06");
    this[21][7] = new Option("黔西南布依族苗族自治", "07");
    this[21][8] = new Option("铜仁地区", "2108");
    
    this[19] = new Array(3);
    this[19][0] = new Option("海口市", "01");
    this[19][1] = new Option("三亚市", "13");
    this[19][2] = new Option("屯昌县", "14");
    this[19][3] = new Option("白沙黎族自治县", "02");
    this[19][4] = new Option("保亭黎族苗族自治县", "03");
    this[19][5] = new Option("昌江黎族自治县", "04");
    this[19][6] = new Option("澄迈县", "05");
    this[19][7] = new Option("定安县", "06");
    this[19][8] = new Option("东方", "07");
    this[19][9] = new Option("乐东黎族自治县", "08");
    this[19][10] = new Option("临高县", "09");
    this[19][11] = new Option("陵水黎族自治县", "10");
    this[19][12] = new Option("琼海", "11");
    this[19][13] = new Option("琼中黎族苗族自治县", "12");
    this[19][14] = new Option("万宁", "15");
    this[19][15] = new Option("文昌", "16");
    this[19][16] = new Option("五指山", "17");
    this[19][17] = new Option("儋州", "18");
    
    this[4] = new Array(11);
    this[4][0] = new Option("石家庄市", "01");
    this[4][1] = new Option("邯郸市", "05");
    this[4][2] = new Option("邢台市", "10");
    this[4][3] = new Option("保定市", "02");
    this[4][4] = new Option("张家口市", "11");
    this[4][5] = new Option("沧州市", "03");
    this[4][6] = new Option("承德市", "04");
    this[4][7] = new Option("廊坊市", "07");
    this[4][8] = new Option("秦皇岛市", "08");
    this[4][9] = new Option("唐山市", "09");
    this[4][10] = new Option("衡水市", "06");
    
    this[15] = new Array(18);
    this[15][0] = new Option("郑州市", "01");
    this[15][1] = new Option("开封市", "06");
    this[15][2] = new Option("驻马店市", "16");
    this[15][3] = new Option("安阳市", "02");
    this[15][4] = new Option("焦作市", "05");
    this[15][5] = new Option("洛阳市", "07");
    this[15][6] = new Option("濮阳市", "18");
    this[15][7] = new Option("漯河市", "17");
    this[15][8] = new Option("南阳市", "08");
    this[15][9] = new Option("平顶山市", "09");
    this[15][10] = new Option("新乡市", "12");
    this[15][11] = new Option("信阳市", "13");
    this[15][12] = new Option("许昌市", "14");
    this[15][13] = new Option("商丘市", "11");
    this[15][14] = new Option("三门峡市", "10");
    this[15][15] = new Option("鹤壁市", "03");
    this[15][16] = new Option("周口市", "15");
    this[15][17] = new Option("济源市", "04");

    this[8] = new Array(13);
    this[8][0] = new Option("哈尔滨市", "01");
    this[8][1] = new Option("大庆市", "02");
    this[8][2] = new Option("大兴安岭地区", "03");
    this[8][3] = new Option("鸡西市", "06");
    this[8][4] = new Option("佳木斯市", "07");
    this[8][5] = new Option("牡丹江市", "08");
    this[8][6] = new Option("齐齐哈尔市", "10");
    this[8][7] = new Option("七台河市", "09");
    this[8][8] = new Option("双鸭山市", "11");
    this[8][9] = new Option("绥化市", "12");
    this[8][10] = new Option("伊春市", "13");
    this[8][11] = new Option("鹤岗市", "04");
    this[8][12] = new Option("黑河市", "05");

    this[16] = new Array(14);
    this[16][0] = new Option("武汉市", "01");
    this[16][1] = new Option("黄冈市", "04");
    this[16][2] = new Option("黄石市", "05");
    this[16][3] = new Option("恩施土家族苗族自治州", "03");
    this[16][4] = new Option("鄂州市", "02");
    this[16][5] = new Option("荆门市", "06");
    this[16][6] = new Option("荆州市", "07");
    this[16][7] = new Option("孝感市", "16");
    this[16][8] = new Option("省直辖县级行政单位", "1608");
    this[16][9] = new Option("十堰市", "10");
    this[16][10] = new Option("襄樊市", "15");
    this[16][11] = new Option("咸宁市", "14");
    this[16][12] = new Option("宜昌市", "宜昌");
    this[16][13] = new Option("随州市", "11");
    this[16][14] = new Option("潜江", "08");
    this[16][15] = new Option("神农架林区", "09");
    this[16][16] = new Option("天门", "12");
    this[16][17] = new Option("仙桃", "13");

    
    
    this[17] = new Array(14);
    this[17][0] = new Option("长沙市", "01");
    this[17][1] = new Option("怀化市", "1701");
    this[17][2] = new Option("郴州市", "03");
    this[17][3] = new Option("常德市", "02");
    this[17][4] = new Option("娄底市", "05");
    this[17][5] = new Option("邵阳市", "06");
    this[17][6] = new Option("湘潭市", "07");
    this[17][7] = new Option("湘西土家族苗族自治州", "08");
    this[17][8] = new Option("衡阳市", "04");
    this[17][9] = new Option("永州市", "10");
    this[17][10] = new Option("益阳市", "09");
    this[17][11] = new Option("岳阳市", "11");
    this[17][12] = new Option("株洲市", "13");
    this[17][13] = new Option("张家界市", "12");
    
    this[9] = new Array(13);
    this[9][0] = new Option("南京市", "01");
    this[9][1] = new Option("淮安市", "03");
    this[9][2] = new Option("常州市", "02");
    this[9][3] = new Option("连云港市", "04");
    this[9][4] = new Option("南通市", "05");
    this[9][5] = new Option("徐州市", "10");
    this[9][6] = new Option("苏州市", "06");
    this[9][7] = new Option("无锡市", "09");
    this[9][8] = new Option("盐城市", "11");
    this[9][9] = new Option("扬州市", "12");
    this[9][10] = new Option("镇江市", "13");
    this[9][11] = new Option("泰州市", "08");
    this[9][12] = new Option("宿迁市", "07");
    
    this[13] = new Array(11);
    this[13][0] = new Option("南昌市", "01");
    this[13][1] = new Option("抚州市", "03");
    this[13][2] = new Option("赣州市", "04");
    this[13][3] = new Option("吉安市", "05");
    this[13][4] = new Option("景德镇市", "06");
    this[13][5] = new Option("九江市", "02");
    this[13][6] = new Option("萍乡市", "07");
    this[13][7] = new Option("新余市", "09");
    this[13][8] = new Option("上饶市", "08");
    this[13][9] = new Option("鹰潭市", "11");
    this[13][10] = new Option("宜春市", "10");
    
    this[7] = new Array(9);
    this[7][0] = new Option("长春市", "04");
    this[7][1] = new Option("白城市", "02");
    this[7][2] = new Option("白山市", "03");
    this[7][3] = new Option("吉林市", "01");
    this[7][4] = new Option("辽源市", "05");
    this[7][5] = new Option("四平市", "06");
    this[7][6] = new Option("松原市", "07");
    this[7][7] = new Option("通化市", "08");
    this[7][8] = new Option("延边朝鲜族自治州", "09");
    
    this[6] = new Array(14);
    this[6][0] = new Option("沈阳市", "01");
    this[6][1] = new Option("大连市", "05");
    this[6][2] = new Option("阜新市", "08");
    this[6][3] = new Option("抚顺市", "07");
    this[6][4] = new Option("本溪市", "03");
    this[6][5] = new Option("鞍山市", "02");
    this[6][6] = new Option("丹东市", "06");
    this[6][7] = new Option("锦州市", "10");
    this[6][8] = new Option("朝阳市", "04");
    this[6][9] = new Option("辽阳市", "11");
    this[6][10] = new Option("盘锦市", "12");
    this[6][11] = new Option("铁岭市", "13");
    this[6][12] = new Option("营口市", "14");
    this[6][13] = new Option("葫芦岛市", "09");
    
    this[28] = new Array(12);
    this[28][0] = new Option("呼和浩特市", "2800");
    this[28][1] = new Option("阿拉善盟", "02");
    this[28][2] = new Option("巴彦淖尔盟", "03");
    this[28][3] = new Option("包头市", "01");
    this[28][4] = new Option("赤峰市", "04");
    this[28][5] = new Option("兴安盟", "12");
    this[28][6] = new Option("乌兰察布盟", "10");
    this[28][7] = new Option("乌海市", "09");
    this[28][8] = new Option("锡林郭勒盟", "11");
    this[28][9] = new Option("呼伦贝尔盟", "07");
    this[28][10] = new Option("呼和浩特", "06");
    this[28][11] = new Option("通辽市", "08");
    this[28][12] = new Option("鄂尔多斯", "05");

    
    this[29] = new Array(5);
    this[29][0] = new Option("银川市", "01");
    this[29][1] = new Option("固原市", "02");
    this[29][2] = new Option("石嘴山市", "03");
    this[29][3] = new Option("吴忠市", "04");
    
    this[25] = new Array(8);
    this[25][0] = new Option("西宁市", "01");
    this[25][1] = new Option("海西蒙古族藏族自治州", "05");
    this[25][2] = new Option("海南藏族自治州", "04");
    this[25][3] = new Option("海北藏族自治州", "03");
    this[25][4] = new Option("黄南藏族自治州", "06");
    this[25][5] = new Option("果洛藏族自治州", "02");
    this[25][6] = new Option("玉树藏族自治州", "07");
    
    this[2] = new Array(1);
    this[2][0] = new Option("上海市", "01");
    
    this[14] = new Array(17);
    this[14][0] = new Option("济南市", "01");
    this[14][1] = new Option("东营市", "04");
    this[14][2] = new Option("滨州市", "02");
    this[14][3] = new Option("淄博市", "17");
    this[14][4] = new Option("德州市", "03");
    this[14][5] = new Option("济宁市", "06");
    this[14][6] = new Option("聊城市", "08");
    this[14][7] = new Option("临沂市", "09");
    this[14][8] = new Option("莱芜市", "07");
    this[14][9] = new Option("青岛市", "10");
    this[14][10] = new Option("日照市", "11");
    this[14][11] = new Option("威海市", "13");
    this[14][12] = new Option("泰安市", "12");
    this[14][13] = new Option("潍坊市", "14");
    this[14][14] = new Option("烟台市", "15");
    this[14][15] = new Option("菏泽市", "05");
    this[14][16] = new Option("枣庄市", "16");
    
    this[5] = new Array(11);
    this[5][0] = new Option("太原市", "01");
    this[5][1] = new Option("大同市", "03");
    this[5][2] = new Option("晋城市", "04");
    this[5][3] = new Option("晋中市", "05");
    this[5][4] = new Option("长治市", "02");
    this[5][5] = new Option("临汾市", "06");
    this[5][6] = new Option("吕梁地区", "07");
    this[5][7] = new Option("忻州市", "09");
    this[5][8] = new Option("朔州市", "08");
    this[5][9] = new Option("阳泉市", "10");
    this[5][10] = new Option("运城市", "11");
    
    this[23] = new Array(10);
    this[23][0] = new Option("西安市", "01");
    this[23][1] = new Option("宝鸡市", "03");
    this[23][2] = new Option("安康市", "02");
    this[23][3] = new Option("商洛市", "05");
    this[23][4] = new Option("铜川市", "06");
    this[23][5] = new Option("渭南市", "07");
    this[23][6] = new Option("咸阳市", "08");
    this[23][7] = new Option("延安市", "09");
    this[23][8] = new Option("汉中市", "04");
    this[23][9] = new Option("榆林市", "10");
    
    this[20] = new Array(21);
    this[20][0] = new Option("成都市", "01");
    this[20][1] = new Option("达川市", "04");
    this[20][2] = new Option("甘孜藏族自治州", "06");
    this[20][3] = new Option("自贡市", "20");
    this[20][4] = new Option("阿坝藏族羌族自治州", "02");
    this[20][5] = new Option("巴中市", "03");
    this[20][6] = new Option("德阳市", "05");
    this[20][7] = new Option("广安市", "07");
    this[20][8] = new Option("广元市", "08");
    this[20][9] = new Option("凉山彝族自治州", "10");
    this[20][10] = new Option("乐山市", "09");
    this[20][11] = new Option("攀枝花市", "15");
    this[20][12] = new Option("南充市", "13");
    this[20][13] = new Option("内江市", "14");
    this[20][14] = new Option("泸州市", "21");
    this[20][15] = new Option("绵阳市", "12");
    this[20][16] = new Option("遂宁市", "16");
    this[20][17] = new Option("雅安市", "17");
    this[20][18] = new Option("宜宾市", "18");
    this[20][19] = new Option("眉山市", "11");
    this[20][20] = new Option("资阳市", "19");
    
    this[1] = new Array(1);
    this[1][0] = new Option("天津市", "01");
    
    this[30] = new Array(15);
    this[30][0] = new Option("乌鲁木齐市", "01");
    this[30][1] = new Option("喀什地区", "09");
    this[30][2] = new Option("克孜勒苏柯尔克孜自治", "11");
    this[30][3] = new Option("克拉玛依市", "10");
    this[30][4] = new Option("阿克苏地区", "02");
    this[30][5] = new Option("五家渠", "15");
    this[30][6] = new Option("巴音郭楞蒙古自治州", "04");
    this[30][7] = new Option("哈密地区", "07");
    this[30][8] = new Option("博尔塔拉蒙古自治州", "05");
    this[30][9] = new Option("昌吉回族自治州", "06");
    this[30][10] = new Option("塔城地区", "3010");
    this[30][11] = new Option("吐鲁番地区", "14");
    this[30][12] = new Option("和田地区", "08");
    this[30][13] = new Option("石河子市", "12");
    this[30][14] = new Option("伊犁哈萨克自治州", "16");
    this[30][15] = new Option("阿拉尔", "03");
    this[30][16] = new Option("图木舒克", "13");
    
    this[26] = new Array(7);
    this[26][0] = new Option("拉萨市", "01");
    this[26][1] = new Option("阿里地区", "02");
    this[26][2] = new Option("昌都市", "03");
    this[26][3] = new Option("林芝地区", "04");
    this[26][4] = new Option("那曲地区", "05");
    this[26][5] = new Option("山南地区", "07");
    this[26][6] = new Option("日喀则地区", "06");
    
    this[22] = new Array(16);
    this[22][0] = new Option("昆明市", "01");
    this[22][1] = new Option("大理白族自治州", "04");
    this[22][2] = new Option("昭通市", "16");
    this[22][3] = new Option("保山市", "02");
    this[22][4] = new Option("德宏傣族景颇族自治州", "05");
    this[22][5] = new Option("迪庆藏族自治州", "06");
    this[22][6] = new Option("楚雄彝族自治州", "03");
    this[22][7] = new Option("临沧地区", "09");
    this[22][8] = new Option("丽江市", "08");
    this[22][9] = new Option("怒江傈僳族自治州", "10");
    this[22][10] = new Option("曲靖市", "11");
    this[22][11] = new Option("思茅地区", "12");
    this[22][12] = new Option("西双版纳傣族自治州", "14");
    this[22][13] = new Option("文山壮族苗族自治州", "13");
    this[22][14] = new Option("红河哈尼族彝族自治州", "07");
    this[22][15] = new Option("玉溪市", "15");
    
    this[10] = new Array(11);
    this[10][0] = new Option("杭州市", "01");
    this[10][1] = new Option("嘉兴市", "03");
    this[10][2] = new Option("金华市", "04");
    this[10][3] = new Option("衢州市", "11");
    this[10][4] = new Option("丽水市", "05");
    this[10][5] = new Option("宁波市", "06");
    this[10][6] = new Option("绍兴市", "07");
    this[10][7] = new Option("台州市", "08");
    this[10][8] = new Option("温州市", "09");
    this[10][9] = new Option("湖州市", "02");
    this[10][10] = new Option("舟山市", "10");
    

    return this;
}
function countylist() {
    this[0] = new Array();
    this[0][0] = new Array(5);
    this[0][0][0] = new Option("东城区", "01");
    this[0][0][1] = new Option("西城区", "02");
    this[0][0][2] = new Option("宣武区", "03");
    this[0][0][3] = new Option("崇文区", "04");
    this[0][0][4] = new Option("近郊区", "05");

    this[13] = new Array();
    this[13][0] = new Array(6);
    this[13][0][0] = new Option("新建县", "01");
    this[13][0][1] = new Option("南昌县", "02");
    this[13][0][2] = new Option("进贤县", "03");
    this[13][0][3] = new Option("安义县", "04");
    this[13][0][4] = new Option("招贤镇", "05");
    this[13][0][5] = new Option("长堎镇", "06");

    this[23] = new Array();
    this[23][0] = new Array(4);
    this[23][0][0] = new Option("东郊", "01");
    this[23][0][1] = new Option("西郊", "02");
    this[23][0][2] = new Option("南郊", "03");
    this[23][0][3] = new Option("北郊", "04");
}


provinceOp = new provinceList();
cityOp = new cityList();
countyop = new countylist();

provinceOp2 = new provinceList();
cityOp2 = new cityList();

//子函数加省份
function initialize(provID, cityID) {
    province = form1.province;
    city = form1.city;

    if (provID == undefined) {
        provID = 0;
    }
    
    for (i = 0; i < provinceOp.length; i++) {
        try {
            province.add(provinceOp[i]); //work only IE
        }
        catch (e) {
            province.add(provinceOp[i], null); //standards compliant ,doesn's work in IE.
        }
    }
    
    province.options[provID].selected = true;
 
    addCity(province, city);
    if (cityID != undefined) {
        city.value = cityID;
    } else {
        city.value = 0;
    }
}

//子函数加城市
function addCity(province, city) {
    try {
        var i = province.selectedIndex;
        for (j = 0; j < cityOp[i].length; j++) {
            //if (cityOp[i][j].text!=''){
            try
        { city.add(cityOp[i][j]); }
            catch (e) { city.add(cityOp[i][j], null); }
            // }
        }
    } catch (Error)
    { }
}

function addCounty(province, city, county) {
    
    try {
        var i = province.selectedIndex;
        var k = city.selectedIndex;
        for (j = 0; j < countyop[i][k].length; j++) {
            //if (cityOp[i][j].text!=''){
            try
            { county.add(countyop[i][k][j]); }
            catch (e) { county.add(countyop[i][k][j], null); }
            // }
        }
    } catch (Error)
    { }
}

//子函数删城市
function delCity(city,county) {
    var len = city.length;
    for (i = 0; i < len; i++) {
        city.remove(0);
    }
    delCounty(county);
}

function delCounty(county) {
    var len = county.length;
    for (i = 0; i < len; i++) {
        county.remove(0);
    }
}

//子函数：控制可选城市随所选省份改变
function province_onchange(province, city,county) {
    delCity(city, county);
    addCity(province, city);
    addCounty(province, city, county);
}

function county_onchange(province, city, county) {
    delCounty(county)
    addCounty(province, city, county);
}
