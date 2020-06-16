using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.API;
using ZoomLa.DZNT;
using System.Xml;
using System.Text;
using ZoomLa.SQLDAL;
using System.Collections;
using System.Data.SqlClient;

public partial class User_PreViewOrder : BasePage
{
    protected B_Content contentBll = new B_Content();
    private B_User buser = new B_User();
    private M_UserInfo muser = new M_UserInfo();
    protected B_OrderList oll = new B_OrderList();
    protected B_UserOrderList uobll = new B_UserOrderList();
    protected B_UserProduct buserproduct = new B_UserProduct();
    protected B_Cart cll = new B_Cart();
    protected B_Delivier dll = new B_Delivier();
    protected B_CartPros pll = new B_CartPros();
    protected B_UserCart busercart = new B_UserCart();
    protected B_UserCartPro ucll = new B_UserCartPro();
    protected B_Products bll = new B_Products();
    protected B_Product pro = new B_Product();
    protected B_S_FloGoods bsFlogoods = new B_S_FloGoods();
    protected B_S_FloPack bspack = new B_S_FloPack();
    protected B_Stock bstock = new B_Stock();
    protected B_OrderBaseField borderbasefiled = new B_OrderBaseField();
    public int sid = 0;
    public string cardId;
    public string txtlabel11;
    public string Company;
    public string KDKey;
    public string Menu { get { return Request.QueryString["menu"]; } }
    //1为店铺订单,其他视为一般订单
    public int OrderType { get {
        if (ViewState["Type"] == null)
            ViewState["Type"] = Request.QueryString["type"];
        return DataConvert.CLng(ViewState["Type"]);
    }
        set { ViewState["Type"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (function.isAjax(Request))
        {
            M_OrderList m = new M_OrderList();
            string orderNum=Request.Form["Num"];
            SqlParameter[] sp = new SqlParameter[] {new SqlParameter("@OrderNo",orderNum) };
            m = oll.SelReturnModel("Where OrderNo =@OrderNo ",sp);
            if (m != null)
                Response.Write(SiteConfig.ConfigInfo().SiteOption.KDKey);//这里返回CDkey,公司名称等，有需求再加入
            else
                Response.Write(-1);
            Response.Flush();
            Response.End();
        }
        //-------------------------------
        switch (OrderType)
        {
            case 0:
            case 3:
                BatDel_Btn.Visible = true;
                break;
            case 5:
                Recoverty_Btn.Visible = true;
                BatDel2_Btn.Visible = true;
                break;
        }
        this.sid = DataConverter.CLng(Request.QueryString["id"]);
        M_UserInfo info = buser.GetLogin();
        string UserName = info.UserName;
        if (info.IsNull)
        {
            Response.Redirect("Login.aspx");
        }
        string url = Request.CurrentExecutionFilePath;
        DataTable list = buser.SelByUserID(currentUser);
        if (list.Rows.Count != 0)
        {
            string str = list.Rows[0]["seturl"].ToString();
            string[] strarr = str.Split(',');
            for (int i = 0; i <= strarr.Length - 1; i++)
            {
                if (strarr[i].ToLower() == url.ToLower())
                {
                    DV_show.Visible = false;
                    Login.Visible = true;
                }
            }

        }
        int sid;
        if (Menu == "Cartinfo")
        {
            Button11.Visible = false;
        }
        else
        {
            Button11.Visible = true;
        }
        switch (Menu)
        {
            case "":
                Response.Redirect("PreViewOrder.aspx?menu=Orderinfo");
                break;
            case "Orderinfo":
                if (!IsPostBack)
                {
                    GetOrderinfo();
                }
                break;
            case "Cartinfo":
                if (!IsPostBack)
                {
                    GetCartinfo();
                }
                break;
            case "delcart":
                sid = DataConverter.CLng(Request.QueryString["id"]);
                cll.DeleteByID(sid);
                Response.Redirect("PreViewOrder.aspx?menu=Cartinfo");
                break;
            case "ViewCart":
                sid = DataConverter.CLng(Request.QueryString["id"]);
                Orderlist.Visible = false;
                Cartinfo.Visible = false;
                ViewCartpro.Visible = true;
                OrderProlist.Visible = false;
                Panel1.Visible = false;
                this.Label1.Text = "查看购物车: [ " + cll.GetCartByid(sid).Cartid + " ] 的物品清单";
                DataTable protable = pll.GetCartProCartID(sid, UserName);
                cartproinfo.DataSource = protable.DefaultView;
                cartproinfo.DataBind();
                break;
            case "delcartpro":
                sid = DataConverter.CLng(Server.HtmlEncode(Request.QueryString["id"]));
                M_CartPros tempros = pll.GetCartProByid(sid);
                if (tempros.Username != UserName)
                {
                    function.WriteErrMsg("●此商品的购物车不属于您! 您不能删除此商品");
                }
                else
                {
                    int pronumpro = tempros.Pronum;
                    int cartid = tempros.CartID;
                    M_Cart cartinfo = cll.GetCartByid(cartid);
                    cartinfo.Pronum = cartinfo.Pronum - pronumpro;
                    cartinfo.AllMoney = cartinfo.AllMoney - tempros.AllMoney;
                    cll.Update(cartinfo);
                    pll.DeleteByID(sid);
                    Response.Redirect("PreViewOrder.aspx?menu=Cartinfo&id=" + cartid + "");
                }
                break;
            case "delprecartpro":
                sid = DataConverter.CLng(Request.QueryString["id"]);
                M_CartPros pretempros = pll.GetCartProByid(sid);
                if (pretempros.Username != UserName)
                {
                    function.WriteErrMsg("●此商品不属于您! 您不能删除此商品");
                }
                else
                {
                    int proid = pretempros.Orderlistid;
                    pll.DeleteByPreID(sid);
                    Response.Redirect("PreViewOrder.aspx?menu=ViewOrderlist&tp=Pre&id=" + proid + "");
                }
                break;
            case "actcart":
                sid = DataConverter.CLng(Request.QueryString["id"]);
                if (cll.GetCartByid(sid).Username != UserName)
                {
                    function.WriteErrMsg("●此购物车不属于您! 您不能提交此订单");
                }
                else
                {
                    string usercartid = cll.GetCartByid(sid).Cartid;
                    HttpContext.Current.Response.Cookies["Shopby"]["OrderNo"] = usercartid;
                    Response.Write("<script language=javascript>location.href='PreViewOrder.aspx?menu=Cartinfo';window.open(\"../UserOrderlist.aspx\",\"_blank\");</script>");
                }
                break;
            case "Aside":
                sid = DataConverter.CLng(Request.QueryString["id"]);
                if (oll.GetOrderListByid(sid).Rename != UserName)
                {
                    M_UserOrderList uoders = uobll.GetOrderListByid(sid);
                    uoders.Aside = 1;
                    uobll.Update(uoders);
                }
                else
                {
                    M_OrderList orders = oll.GetOrderListByid(sid);
                    orders.Aside = 1;
                    oll.Update(orders);
                }
                Response.Redirect("PreViewOrder.aspx?menu=Orderinfo");
                break;
            case "asign":
                string dorderno = Request.QueryString["orderno"];
                int oid = DataConverter.CLng(Request.QueryString["sid"]);
                DataTable usoders = uobll.GetOrderbyOrderNo(dorderno);
                int score = 0;
                int uid = 0;
                string rname = "";
                int SendPointStatus = 1 ;
                string met = "";
                if (usoders != null && usoders.Rows.Count > 0)
                {
                    //店铺订单
                    met = "店铺订单";
                    rname = usoders.Rows[0]["Reuser"].ToString();
                    muser = buser.GetUserIDByUserName(rname);
                    M_UserOrderList useroders = uobll.GetOrderListByid(oid);
                    useroders.Signed = 1;
                    uobll.Update(useroders);
                    uid = useroders.Userid;
                    M_UserInfo user = new M_UserInfo();
                    score = useroders.Score;
                    SendPointStatus = Convert.ToInt32(usoders.Rows[0]["SendPointStatus"].ToString());


                    string orderid = usoders.Rows[0]["id"] as string;
                    SqlParameter[] sp = new SqlParameter[] { new SqlParameter("@orderid", orderid) }; 
                    DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select ProID,AllMoney,Pronum from ZL_UserCartPro where Orderlistid=@orderid", sp);
                    Dictionary<string, string> dic = new Dictionary<string, string>();
                    Dictionary<string, int> dic1 = new Dictionary<string, int>();
                    foreach (DataRow dr in dt.Rows)
                    {
                        //根据订单内商品所属的不同店铺，计算出该给每位卖家增加多少金额
                        string proID = dr["ProID"].ToString();
                        string AllMoney = Convert.ToDouble(dr["AllMoney"]).ToString("0.00");
                        DataTable dt1 = SqlHelper.ExecuteTable(CommandType.Text, "select UserID,Integral from ZL_UserShop where ID=" + proID, null);
                        string UserID = dt1.Rows[0]["UserID"].ToString();
                        //string UserID = SqlHelper.ExecuteTable(CommandType.Text, "select UserID from ZL_UserShop where ID=" + proID, null).Rows[0]["UserID"].ToString();
                        if (dic.ContainsKey(UserID))
                        {
                            dic[UserID] = (Convert.ToInt32(dic[UserID]) + Convert.ToInt32(AllMoney)).ToString("0.00");
                        }
                        else
                        {
                            dic.Add(UserID, AllMoney);
                        }

                        //根据订单内商品所属的不同店铺，计算出该给每位卖家增加多少积分
                        int Pronum = Convert.ToInt32(dr["Pronum"]);
                        int Integral = Convert.ToInt32(dt1.Rows[0]["Integral"]);
                        int AllExp = Pronum * Integral;
                        if (dic1.ContainsKey(UserID))
                        {
                            //dic[UserID] = (Convert.ToInt32(dic[UserID]) + Convert.ToInt32(AllMoney)).ToString();
                            dic1[UserID] = dic1[UserID] + AllExp;
                        }
                        else
                        {
                            dic1.Add(UserID, AllExp);
                        }
                    }

                    if (useroders.PayMethod == 0)
                    {
                        foreach (string key in dic.Keys)
                        {
                            if (buser.AddPurse(Convert.ToInt32(key), Convert.ToDouble(dic[key])))
                            {
                                M_UserExpDomP hist = new M_UserExpDomP();
                                hist.UserID = Convert.ToInt32(key);
                                hist.Operator = muser.UserID;
                                hist.Detail = "会员" + rname + "的店铺订单" + dorderno + "[已确认收货]，获得成交金额+" + dic[key];
                                hist.Score = Convert.ToDouble(dic[key]);
                                hist.OperatorIP = Request.UserHostAddress;
                                hist.HisTime = DateTime.Now;
                                B_History.GetInsert(hist);
                            }
                        }
                    }
                    else if (useroders.PayMethod == 1)
                    {
                        foreach (string key in dic.Keys)
                        {
                            if (buser.AddSilverCoin(Convert.ToInt32(key), Convert.ToDouble(dic[key])))
                            {
                                M_UserCoinHis hist = new M_UserCoinHis();
                                hist.UserID = Convert.ToInt32(key);
                                hist.Operator = muser.UserID;
                                hist.detail = "会员" + rname + "的店铺订单" + dorderno + "[已确认收货]，获得成交银币+" + dic[key];
                                hist.SilverCoin = Convert.ToDouble(dic[key]);
                                hist.HisTime = DateTime.Now;
                                hist.OperatorIP = Request.UserHostAddress;
                                B_History.AddCoinHis(hist);
                            }
                        }
                    }

                    //扣除卖家积分,卖家积分不足时将根据扣除其金额
                    foreach (string key in dic1.Keys)
                    {
                        DataTable dt2 = SqlHelper.ExecuteTable(CommandType.Text, "select UserExp from ZL_User where UserID=" + Convert.ToInt32(key), null);
                        int UserExp = Convert.ToInt32(dt2.Rows[0]["UserExp"]);
                        if (UserExp >= dic1[key])
                        {
                            //if (SqlHelper.ExecuteProc(""))
                            if (buser.DelExp(Convert.ToInt32(key), dic1[key]))
                            {
                                M_UserExpHis hist = new M_UserExpHis();
                                hist.UserID = Convert.ToInt32(key);
                                hist.Operator = muser.UserID;
                                //hist.detail = "会员" + rname + "的" + met + dorderno + "[已确认收货]，扣除卖家" + key + "积分-" + score.ToString();
                                hist.detail = "会员" + rname + "的" + met + dorderno + "[已确认收货]，扣除卖家积分-" + dic1[key].ToString();
                                hist.score = 0 - dic1[key];
                                hist.HisTime = DateTime.Now;
                                hist.OperatorIP = Request.UserHostAddress;
                                B_History.AddExpHis(hist);
                            }
                        }
                        //卖家积分不足时，根据折算率扣除 相应的支付币种
                        else
                        {
                            //读取积分折算率
                            B_Shopconfig sll = new B_Shopconfig();
                            M_Shopconfig uinfo = sll.GetShopconfig();
                            int point = uinfo.ScorePoint;

                            if (buser.DelExp(Convert.ToInt32(key), dic1[key]))
                            {
                                M_UserExpHis hist = new M_UserExpHis();
                                hist.UserID = Convert.ToInt32(key);
                                hist.Operator = muser.UserID;
                                hist.detail = "会员" + rname + "的" + met + dorderno + "[已确认收货]，扣除卖家积分-" + UserExp.ToString();
                                hist.score = 0 - UserExp;
                                hist.HisTime = DateTime.Now;
                                hist.OperatorIP = Request.UserHostAddress;
                                B_History.AddExpHis(hist);
                            }
                            double Purse = Convert.ToDouble(point * (dic1[key] - UserExp))/100;
                            //Purse = Math.Round(Purse, 2);
                            Purse = Convert.ToDouble(Purse.ToString("0.00"));
                            if (useroders.PayMethod == 0)
                            {
                                if (buser.MinusPurse(Convert.ToInt32(key), Purse))
                                {
                                    
                                    M_UserExpDomP hist = new M_UserExpDomP();
                                    hist.UserID = Convert.ToInt32(key);
                                    hist.Operator = muser.UserID;
                                    hist.Detail = "会员" + rname + "的店铺订单" + dorderno + "[已确认收货]，由于卖家积分不足，扣除卖家金额-" + Purse.ToString();
                                    hist.Score = 0 - Purse;
                                    hist.OperatorIP = Request.UserHostAddress;
                                    hist.HisTime = DateTime.Now;
                                    B_History.GetInsert(hist);
                                }
                            }
                            else if(useroders.PayMethod == 1)
                            {
                                if (buser.MinSilverCoin(Convert.ToInt32(key), Purse))
                                {
                                    M_UserCoinHis hist = new M_UserCoinHis();
                                    hist.UserID = Convert.ToInt32(key);
                                    hist.Operator = muser.UserID;
                                    hist.detail = "会员" + rname + "的店铺订单" + dorderno + "[已确认收货]，由于卖家积分不足，扣除卖家银币-" + Purse.ToString();
                                    hist.SilverCoin = 0 - Purse;
                                    hist.HisTime = DateTime.Now;
                                    hist.OperatorIP = Request.UserHostAddress;
                                    B_History.AddCoinHis(hist);
                                }
                            }
                        }
                    }

                }
                else
                {
                    //商城订单
                    met = "商城订单";
                    M_OrderList orders = oll.GetOrderListByid(oid);
                    orders.Signed = 1;
                    bool result = oll.Update(orders);
                    score = orders.Integral;
                    uid = orders.Userid;
                    rname = orders.Reuser;
                    SendPointStatus=orders.SendPointStatus;
                }


                if (SendPointStatus == 0 && score!=0)
                {
                    score = DataConverter.CLng(score);
                    string adminname = HttpContext.Current.Request.Cookies["ManageState"]["LoginName"];
                    adminname = StringHelper.Base64StringDecode(adminname);
                    //增加积分
                    if (buser.AddExp(uid, score))
                    {
                        M_UserExpHis hist = new M_UserExpHis();
                        hist.UserID = uid;
                        hist.Operator = muser.UserID;
                        hist.detail = "会员" + rname + "的" + met + dorderno + "[已确认收货]，获得积分+" + score.ToString();
                        hist.score = score;
                        hist.HisTime = DateTime.Now;
                        hist.OperatorIP = Request.UserHostAddress;
                        B_History.AddExpHis(hist);
                    }
                    string str = "SendPointStatus=1";
                    SafeSC.CheckDataEx(dorderno);
                    if (usoders != null && usoders.Rows.Count > 0)
                    {
                        uobll.Update(str, "OrderNo='" + dorderno + "'");
                    }
                    else
                    {
                        oll.UpOrderinfo(str, oid);
                    }
                }


                Response.Redirect("PreViewOrder.aspx?menu=Orderinfo");
                break;
            case "ViewOrderlist":
                sid = DataConverter.CLng(Request.QueryString["id"]);
                string aa = "";
                aa = Request.QueryString["tp"];
                //Response.Write("<script>alert('" + aa + "');</script>");
                Orderlist.Visible = false;
                Cartinfo.Visible = false;
                ViewCartpro.Visible = false;
                Panel1.Visible = false;

                if (string.IsNullOrEmpty(Request.QueryString["tp"]))
                {
                    OrderProlist.Visible = true;
                    Panel2.Visible = false;
                }
                else
                {
                    OrderProlist.Visible = false;
                    Panel2.Visible = true;
                }
                //if (oll.GetOrderListByid(sid).Rename != UserName)
                if (oll.GetOrderListByid(sid).OrderNo != Request.QueryString["ordid"].ToString())
                {
                    //用户商品，关闭禁止功能2013.9.16
                    if (uobll.GetOrderListByid(sid).Rename != UserName)
                    {
                        function.WriteErrMsg("●此订单不属于您! 您不能操作此订单");
                    }
                    else
                    {
                        OrderProlist.Visible = true;
                        Panel2.Visible = false;
                        userorderproview.Visible = true;
                        orderview.Visible = false;
                        OrderType = 1;  //保存查看类型,1为店铺订单,其他为一般订单
                        M_UserOrderList userorderlist = uobll.GetOrderListByid(sid);
                        label9.Text = userorderlist.Company +"/"+ userorderlist.ExpressDelivery;// userorderlist.ExpressNum;
                        string strOrder = userorderlist.OrderNo.ToString();
                        cardId = strOrder;
                        if (userorderlist.ExpressDelivery != "")
                        {
                            ULB_Track.Visible = true;
                        }
                        else
                        {
                            ULB_Track.Visible = false;
                        }
                        this.Label1.Text = "查看订单ID: [ " + strOrder + " ] 的物品清单";
                        txtlabel11 = userorderlist.ExpressDelivery;
                        string KDCom = userorderlist.Company;

                        XmlDocument xml = new XmlDocument();
                        xml.Load(Server.MapPath("~/config/TrackProduct.xml"));
                        XmlNode com = xml.SelectSingleNode("/company");
                        XmlNodeList li = com.ChildNodes;
                        foreach (XmlNode x in li)
                        {
                            XmlElement s = (XmlElement)x;
                            if (KDCom == s.Attributes["china"].Value)
                            {
                                Company = s.Attributes["PY"].Value;
                            }
                        }
                        LB_KDCompany.Text = KDCom;
                        SiteConfigInfo obj = SiteConfig.ConfigInfo();
                        if (obj.SiteOption.KDAPI == 0)
                        {
                            ULB_Track.Visible = false;
                        }
                        else
                        {
                            ULB_Track.Visible = true;
                            KDKey = obj.SiteOption.KDKey;
                        }

                        DataTable orderlist = ucll.GetCartProOrderID(sid);
                        userrep.DataSource = orderlist;
                        userrep.DataBind();

                        DataTable orderlistW = ucll.GetCartProOrderID(sid);
                        userrep.DataSource = orderlistW;
                        userrep.DataBind();
                        StringBuilder sb = new StringBuilder();
                        DataTable dtorders = uobll.GetOrderListsByid(userorderlist.id);
                        if (dtorders != null && dtorders.Rows.Count > 0)
                        {
                            DataTable dtOrderFile = borderbasefiled.Select_Type(1);
                            if (dtOrderFile != null && dtOrderFile.Rows.Count > 0)
                            {
                                for (int i = 0; i < dtOrderFile.Rows.Count; i++)
                                {
                                    sb.Append("<li style='width: 98.5%; float: none; line-height: 24px; text-align: left; background-color: #F7F7F7'>");
                                    sb.Append(dtOrderFile.Rows[i]["FieldAlias"].ToString() + "：\n");
                                    sb.Append(dtorders.Rows[0][dtOrderFile.Rows[i]["FieldName"].ToString()].ToString() + "</li>\n");
                                }
                            }
                        }
                        ModelHtml.Text = sb.ToString();

                        DataTable newtable = orderlist.DefaultView.ToTable(false, "Shijia", "Pronum");
                        double allmoney = 0;

                        for (int i = 0; i < newtable.Rows.Count; i++)
                        {
                            allmoney = allmoney + DataConverter.CDouble(orderlist.Rows[i]["Allmoney"]);
                        }

                        double jia = System.Math.Round(userorderlist.Ordersamount, 2);
                        string jiage = jia.ToString();

                        if (jiage.IndexOf(".") == -1)
                        {
                            jiage = jiage + ".00";
                        }

                        M_S_FloGoods msflogoods = bsFlogoods.GetSelect(userorderlist.Delivery);
                        double yunfei = msflogoods.Price;
                        string oyun = yunfei.ToString();
                        if (oyun.IndexOf(".") == -1)
                        {
                            oyun = oyun + ".00";
                        }
                        this.oyunfei01.Text = oyun + "元";
                        this.ojiage01.Text = jiage + "元";
                        this.ojiages01.Text = jiage;
                        this.cyunfei01.Text = oyun;
                        M_S_FloPack mspack = bspack.GetSelect(userorderlist.packID);
                        if (msflogoods != null)
                        {
                            if (mspack != null)
                            {
                                this.lblpack.Text = mspack.PackPrice.ToString("0.00");
                                this.pack01.Text = mspack.PackPrice.ToString("0.00");
                            }
                            else
                            {
                                this.lblpack.Text = "0";
                                this.pack01.Text = "0";
                            }
                        }
                        double allorm = jia + yunfei;
                        allorm = System.Math.Round(allorm, 2);
                        string strallorm = allorm.ToString();
                        if (strallorm.IndexOf(".") == -1)
                        {
                            strallorm = strallorm + ".00";
                        }
                        this.orderallpromoney01.Text = (userorderlist.Ordersamount + yunfei + DataConverter.CDouble(pack01.Text)).ToString() + "元";
                        double pp = uobll.GetOrderListByid(sid).Receivablesamount;
                        pp = System.Math.Round(pp, 2);
                        string temppp = pp.ToString();
                        if (temppp.IndexOf(".") == -1)
                        {
                            temppp = temppp + ".00";
                        }

                        if (userorderlist.Paymentstatus != 1)
                        {
                            Button6.Visible = false;
                            Button7.Visible = true;
                            Button12.Visible = true;
                        }
                        else
                        {
                            Button6.Visible = true;
                            Button7.Visible = false;
                            Button12.Visible = false;
                        }
                        labelmoney01.Text = temppp.ToString() + "元";
                    }
                }
                else
                {
                    OrderProlist.Visible = true;
                    Panel2.Visible = false;
                    userorderproview.Visible = false;
                    orderview.Visible = true;
                    M_OrderList uorlist = oll.GetOrderListByid(sid);
                    this.Label1.Text = "查看订单ID: [ " + oll.GetOrderListByid(sid).OrderNo.ToString() + " ] 的物品清单";
                    DataTable orderlist = pll.GetCartProOrderID(sid, UserName);
                    if (orderlist.Rows.Count > 0)
                    {
                        OrderProview.DataSource = orderlist;
                        OrderProview.DataBind();
                    }
                    DataTable orderlistW = pll.GetCartProOrderIDW(sid);
                    if (orderlistW.Rows.Count > 0)
                    {
                        Repeater2.DataSource = orderlistW;
                        Repeater2.DataBind();
                    }
                    Label10.Text = uorlist.ExpressNum;
                    label11.Text = uorlist.ExpressNum;
                    txtlabel11 = uorlist.ExpressNum;
                    string KDCom = uorlist.Company;
                    
                    XmlDocument xml = new XmlDocument();
                    xml.Load(Server.MapPath("~/config/TrackProduct.xml"));
                    XmlNode com = xml.SelectSingleNode("/company");
                    XmlNodeList li = com.ChildNodes;
                    foreach (XmlNode x in li)
                    {
                        XmlElement s = (XmlElement)x;
                        if (KDCom == s.Attributes["china"].Value)
                        { 
                            Company=s.Attributes["PY"].Value;
                        }
                    }
                    LB_KDCompany.Text = KDCom;
                    SiteConfigInfo obj = SiteConfig.ConfigInfo();
                    if (obj.SiteOption.KDAPI == 0)
                    {
                        LB_Track.Visible = false;
                    }
                    else
                    {
                        LB_Track.Visible = true;
                        KDKey = obj.SiteOption.KDKey;
                    }
                   // throw new Exception(uorlist.ExpressNum);
                    if (uorlist.ExpressNum != "")
                    {
                        LB_Track.Visible = true;
                    }
                    else
                    {
                        LB_Track.Visible = false;
                    }
                    DataTable newtable = orderlist.DefaultView.ToTable(false, "Shijia", "Pronum");
                    double allmoney = 0;

                    for (int i = 0; i < newtable.Rows.Count; i++)
                    {
                        allmoney = allmoney + DataConverter.CDouble(orderlist.Rows[i]["Allmoney"]);
                    }

                    double jia = System.Math.Round(uorlist.Ordersamount, 2);
                    string jiage = jia.ToString();

                    if (jiage.IndexOf(".") == -1)
                    {
                        jiage = jiage + ".00";
                    }

                    #region 扩展信息
                    StringBuilder sbs = new StringBuilder();
                    DataTable dtorders = oll.GetOrderListByids(uorlist.id);
                    if (dtorders != null && dtorders.Rows.Count > 0)
                    {
                        DataTable dtOrderFile = borderbasefiled.Select_Type(0);
                        if (dtOrderFile != null && dtOrderFile.Rows.Count > 0)
                        {
                            for (int i = 0; i < dtOrderFile.Rows.Count; i++)
                            {
                                sbs.Append("<li style='width: 98.5%; float: none; line-height: 24px; text-align: left; background-color: #F7F7F7'>");
                                sbs.Append(dtOrderFile.Rows[i]["FieldAlias"].ToString() + "：\n");
                                sbs.Append(dtorders.Rows[0][dtOrderFile.Rows[i]["FieldName"].ToString()].ToString() + "\n");
                                sbs.Append(" </li>\n");
                            }
                        }
                    }
                    Literal1.Text = sbs.ToString();

                    #endregion

                    int Deliverys = oll.GetOrderListByid(sid).Delivery;
                    M_Delivier Dstr = dll.GetDelivierByid(Deliverys);
                    double shuil = Dstr.shuilv;
                    double yunfei = Dstr.delitype;
                    yunfei = yunfei + yunfei * (shuil / 100);

                    yunfei = System.Math.Round(yunfei, 2);
                    string oyun = yunfei.ToString();
                    if (oyun.IndexOf(".") == -1)
                    {
                        oyun = oyun + ".00";
                    }
                    if (uorlist.Ordertype == 4)
                    {
                        this.oyunfei.Text = DataConverter.CLng(DataConverter.CDouble(oyun)).ToString();
                        this.ojiage.Text = DataConverter.CLng(DataConverter.CDouble(jiage)).ToString();
                        this.ojiages.Text = DataConverter.CLng(DataConverter.CDouble(jiage)).ToString();
                        this.cyunfei.Text = DataConverter.CLng(DataConverter.CDouble(oyun)).ToString();

                        this.preoyunfei.Text = DataConverter.CLng(DataConverter.CDouble(oyun)).ToString();
                        this.preojiage.Text = DataConverter.CLng(DataConverter.CDouble(jiage)).ToString();
                        this.preojiages.Text = DataConverter.CLng(DataConverter.CDouble(jiage)).ToString();
                        this.precyunfei.Text = DataConverter.CLng(DataConverter.CDouble(oyun)).ToString();
                    }
                    else
                    {
                        this.oyunfei.Text = oyun + "元";
                        this.ojiage.Text = jiage + "元";

                        this.ojiages.Text = jiage;
                        this.cyunfei.Text = oyun;

                        this.preoyunfei.Text = oyun + "元";
                        this.preojiage.Text = jiage + "元";
                        this.preojiages.Text = jiage;
                        this.cyunfei.Text = oyun;
                    }
                    double allorm = jia + yunfei;
                    allorm = System.Math.Round(allorm, 2);
                    string strallorm = allorm.ToString();
                    if (strallorm.IndexOf(".") == -1)
                    {
                        strallorm = strallorm + ".00";
                    }
                    if (uorlist.Ordertype == 4)
                    {
                        this.orderallpromoney.Text = DataConverter.CLng(allorm).ToString();// strallorm;
                        this.preorderallpromoney.Text = DataConverter.CLng(allorm).ToString(); //strallorm;
                    }
                    else
                    {
                        this.orderallpromoney.Text = (allorm).ToString() + "元";// strallorm;
                        this.preorderallpromoney.Text = (allorm).ToString() + "元"; //strallorm;
                    }
                    double pp = oll.GetOrderListByid(sid).Receivablesamount;
                    pp = System.Math.Round(pp, 2);
                    string temppp = pp.ToString();
                    if (temppp.IndexOf(".") == -1)
                    {
                        temppp = temppp + ".00";
                    }
                    if (uorlist.Ordertype == 4)
                    {
                        this.labelmoney.Text = DataConverter.CLng(DataConverter.CDouble(temppp)).ToString();// strallorm;
                        this.prelabelmoney.Text = DataConverter.CLng(DataConverter.CDouble(temppp)).ToString(); //strallorm;
                    }
                    else
                    {
                        labelmoney.Text = temppp.ToString() + "元";
                        prelabelmoney.Text = temppp.ToString() + "元";
                    }
                    if (uorlist.Paymentstatus != 1)
                    {
                        Button6.Visible = false;
                        Button7.Visible = true;
                        Button12.Visible = true;
                    }
                    else
                    {
                        Button6.Visible = true;
                        Button7.Visible = false;
                        Button12.Visible = false;
                    }
                }
                break;
            case "rebuy":
                if (OrderType == 1)  //1为店铺订单,其他为一般订单
                {
                    Rebuy();
                }
                else
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        int id = DataConverter.CLng(Request.QueryString["id"]);

                        M_OrderList pro = oll.GetOrderListByid(id);
                        M_Cart cart = new M_Cart();
                        string OrderNo = "";
                        OrderNo = "CT" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
                        string TOrderNo = OrderNo.ToString();
                        string aaa = StringHelper.MD5A(TOrderNo, 10, 6);
                        string nowtime = DateTime.Now.ToString();
                        string bbb = StringHelper.MD5A(nowtime, 5, 10);
                        string ccc = StringHelper.MD5A(pro.AddUser, 5, 10);
                        string cartid = aaa + "-" + bbb + "-" + ccc;
                        HttpContext.Current.Response.Cookies["Shopby"]["OrderNo"] = cartid;

                        cart.AllMoney = DataConverter.CDouble(pro.Ordersamount);
                        cart.Cartid = cartid;

                        cart.Pronum = 0;// ;
                        cart.userid = buser.GetUserByName(pro.AddUser).UserID;
                        cart.Username = pro.AddUser;
                        cart.Getip = EnviorHelper.GetUserIP();
                        cart.Addtime = DateTime.Now;
                        cll.Add(cart);

                        DataTable cartinfo = cll.FondCartno(cartid);
                        int ID = DataConverter.CLng(cartinfo.Rows[0]["ID"].ToString());

                        #region 将商品放入购物车
                        DataTable prolist = pll.GetCartProOrderID(id);

                        M_Cart cartcontent = cll.GetCartByid(ID);
                        cartcontent.Pronum = prolist.Rows.Count;
                        cll.Update(cartcontent);

                        for (int i = 0; i < prolist.Rows.Count; i++)
                        {
                            M_CartPros cartproinfos = pll.GetCartProByid(DataConverter.CLng(prolist.Rows[i]["ID"]));
                            cartproinfos.CartID = ID;
                            pll.Add(cartproinfos);
                        }

                        #endregion
                        Response.Redirect("/UserCart.aspx");
                    }
                }
                break;
            case "rebuys":
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int id = DataConverter.CLng(Request.QueryString["id"]);
                    M_OrderList pro = oll.GetOrderListByid(id);
                    M_Cart cart = new M_Cart();

                    string OrderNo = "";
                    OrderNo = "CT" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
                    string TOrderNo = OrderNo.ToString();
                    string aaa = StringHelper.MD5A(TOrderNo, 10, 6);
                    string nowtime = DateTime.Now.ToString();
                    string bbb = StringHelper.MD5A(nowtime, 5, 10);
                    string ccc = StringHelper.MD5A(pro.AddUser, 5, 10);
                    string cartid = aaa + "-" + bbb + "-" + ccc;
                    HttpContext.Current.Response.Cookies["Shopby"]["OrderNo"] = cartid;

                    cart.AllMoney = DataConverter.CDouble(pro.Ordersamount);
                    cart.Pronum = 0;// DataConverter.CLng(pro.);
                    cart.Username = pro.Rename;
                    cart.Cartid = cartid;
                    cart.userid = buser.GetUserByName(pro.Rename).UserID;
                    cart.Getip = EnviorHelper.GetUserIP();
                    cart.Addtime = DateTime.Now;
                    cll.Add(cart);
                    DataTable cartinfo = cll.FondCartno(cartid);
                    int ID = DataConverter.CLng(cartinfo.Rows[0]["ID"].ToString());
                    #region 将商品放入购物车

                    DataTable prolist = pll.GetCartProOrderID(id);

                    M_Cart cartcontent = cll.GetCartByid(ID);
                    cartcontent.Pronum = prolist.Rows.Count;
                    cll.Update(cartcontent);

                    for (int i = 0; i < prolist.Rows.Count; i++)
                    {
                        M_CartPros cartproinfos = pll.GetCartProByid(DataConverter.CLng(prolist.Rows[i]["ID"]));
                        cartproinfos.CartID = ID;
                        pll.Add(cartproinfos);
                    }

                    #endregion
                    Response.Redirect("/ShopCar.aspx");

                }
                break;
            default:
                Response.Redirect("PreViewOrder.aspx?menu=Orderinfo");
                break;
        }

    }
    protected void sure_Click(object sender, EventArgs e)
    {
        M_UserInfo info = buser.GetLogin();
        string PWD = Second.Text;

        if (StringHelper.MD5(PWD) == info.PayPassWord)
        {


            DV_show.Visible = true;
            Login.Visible = false;
        }
        else
        {
            Response.Write("<script>alert('密码错误,请重新输入！');</script>");
            DV_show.Visible = false;
            Login.Visible = true;
            ;
        }
    }
    private void Rebuy()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            int id = DataConverter.CLng(Request.QueryString["id"]);

            M_UserOrderList pro = uobll.GetOrderListByid(id);
            M_UserCart cart = new M_UserCart();
            string OrderNo = "";
            OrderNo = "CT" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
            string TOrderNo = OrderNo.ToString();
            string aaa = StringHelper.MD5A(TOrderNo, 10, 6);
            string nowtime = DateTime.Now.ToString();
            string bbb = StringHelper.MD5A(nowtime, 5, 10);
            string ccc = StringHelper.MD5A(pro.AddUser, 5, 10);
            string cartid = aaa + "-" + bbb + "-" + ccc;
            HttpContext.Current.Response.Cookies["Shopby"]["OrderNo"] = cartid;

            cart.AllMoney = DataConverter.CDouble(pro.Ordersamount);
            cart.Cartid = cartid;
            cart.Pronum = 0;// ;
            cart.Userid = buser.GetUserByName(pro.AddUser).UserID;
            cart.Username = pro.AddUser;
            cart.Getip = EnviorHelper.GetUserIP();
            cart.Addtime = DateTime.Now;
            cart.Userid = buser.GetLogin().UserID;
            cart.Username = buser.GetLogin().UserName;
            busercart.Add(cart);
            DataTable cartinfo = busercart.FondCartno(cartid);
            int ID = DataConverter.CLng(cartinfo.Rows[0]["ID"].ToString());
            #region 将商品放入购物车
            DataTable prolist = ucll.GetCartProOrderID(id);
            M_UserCart cartcontent = busercart.GetCartByid(ID);
            cartcontent.Pronum = prolist.Rows.Count;
            busercart.Update(cartcontent);

            for (int i = 0; i < prolist.Rows.Count; i++)
            {
                M_UserCartPro cartproinfos = ucll.GetCartProByid(DataConverter.CLng(prolist.Rows[i]["ID"]));
                cartproinfos.CartID = ID;
                ucll.Add(cartproinfos);
            }
            #endregion
            Response.Redirect("/store/StoreCart.aspx?message=加入购物车成功&types=" + pro.Ordertype + "&SID=" + pro.SId);
        }
    }
    //数据绑定
    protected void GetOrderinfo()
    {
        string UserName = buser.GetLogin().UserName;
        OrderType = DataConverter.CLng(Request.QueryString["type"]);
        int type = OrderType;
        int panel = DataConverter.CLng(Request.QueryString["panel"]);
        if ((type == 6) || (panel == 1))
        {
            Orderlist.Visible = false;
            Cartinfo.Visible = false;
            ViewCartpro.Visible = false;
            OrderProlist.Visible = false;
            Panel1.Visible = true;
        }
        else
        {
            Orderlist.Visible = true;
            Cartinfo.Visible = false;
            ViewCartpro.Visible = false;
            OrderProlist.Visible = false;
            Panel1.Visible = false;
        }
        #region 获取页数
        int CPage;
        int temppage;

        if (Request.Form["DropDownList1"] != null)
        {
            temppage = Convert.ToInt32(Request.Form["DropDownList1"]);
        }
        else
        {
            temppage = Convert.ToInt32(Request.QueryString["CurrentPage"]);
        }
        CPage = temppage;
        if (CPage <= 0)
        {
            CPage = 1;
        }
        #endregion
        this.Label1.Text = "我的订单列表";
        DataTable olist = oll.GetUserlist(UserName, type, "0,4");//OrderInfo订单表
        DataTable uolist = uobll.GetUserlist(UserName, type);
        foreach (DataRow dr in uolist.Rows)
        {
            olist.ImportRow(dr);
        }
        PagedDataSource cc = new PagedDataSource();
        cc.DataSource = olist.DefaultView;
        cc.AllowPaging = true;
        if (Request.QueryString["txtPage"] != null && Request.QueryString["txtPage"] != "")
        {
            cc.PageSize = DataConverter.CLng(Request.QueryString["txtPage"]);
        }
        if (Request.Form["txtPage"] != null && Request.Form["txtPage"] != "")
        {
            cc.PageSize = DataConverter.CLng(Request.Form["txtPage"]);
        }

        if (olist != null && cc.PageSize >= olist.Rows.Count)
        {
            cc.CurrentPageIndex = 0;
            CPage = 1;
        }
        cc.CurrentPageIndex = CPage - 1;
        Ordertable.DataSource = cc;
        Ordertable.DataBind();
        #region 设置翻页
        Allnum.Text = olist.DefaultView.Count.ToString();
        int thispagenull = cc.PageCount;//总页数
        int CurrentPage = cc.CurrentPageIndex;
        int nextpagenum = CPage - 1;//上一页
        int downpagenum = CPage + 1;//下一页
        int Endpagenum = thispagenull;
        if (thispagenull <= CPage)
        {
            downpagenum = thispagenull;
            Downpage.Enabled = false;
        }
        else
        {
            Downpage.Enabled = true;
        }
        if (nextpagenum <= 0)
        {
            nextpagenum = 0;
            Nextpage.Enabled = false;
        }
        else
        {
            Nextpage.Enabled = true;
        }

        Toppage.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=0>首页</a>";
        Nextpage.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=" + nextpagenum.ToString() + ">上一页</a>";
        Downpage.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=" + downpagenum.ToString() + ">下一页</a>";
        Endpage.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=" + Endpagenum.ToString() + ">尾页</a>";
        PageSize.Text = thispagenull.ToString();
        Nowpage.Text = CPage.ToString();
        txtPage.Text = cc.PageSize.ToString();
        DropDownList1.Items.Clear();
        for (int i = 1; i <= thispagenull; i++)
        {
            this.DropDownList1.Items.Add(i.ToString());
        }
        for (int j = 0; j < DropDownList1.Items.Count; j++)
        {
            if (DropDownList1.Items[j].Value == Nowpage.Text)
            {
                DropDownList1.SelectedValue = Nowpage.Text;
                break;
            }
        }
        if (Request.Form["DropDownList3"] != null)
        {
            temppage = Convert.ToInt32(Request.Form["DropDownList3"]);
        }
        else
        {
            temppage = Convert.ToInt32(Request.QueryString["CurrentPage"]);
        }
        CPage = temppage;
        if (CPage <= 0)
        {
            CPage = 1;
        }
        if (Request.QueryString["txtPage"] != null && Request.QueryString["txtPage"] != "")
        {
            cc.PageSize = DataConverter.CLng(Request.QueryString["txtPage"]);
        }
        if (Request.Form["txtpages"] != null && Request.Form["txtpages"] != "")
        {
            cc.PageSize = DataConverter.CLng(Request.Form["txtpages"]);
        }

        if (olist != null && cc.PageSize >= olist.Rows.Count)
        {
            cc.CurrentPageIndex = 0;
            CPage = 1;
        }
        Repeater1.DataSource = cc;
        Repeater1.DataBind();
        Label2.Text = olist.DefaultView.Count.ToString();
        int thispagenull3 = cc.PageCount;//总页数
        int CurrentPage3 = cc.CurrentPageIndex;
        int nextpagenum3 = CPage - 1;//上一页
        int downpagenum3 = CPage + 1;//下一页
        int Endpagenum3 = thispagenull;
        if (thispagenull <= CPage)
        {
            downpagenum = thispagenull;
            Downpage.Enabled = false;
        }
        else
        {
            Downpage.Enabled = true;
        }
        if (nextpagenum <= 0)
        {
            nextpagenum = 0;
            Nextpage.Enabled = false;
        }
        else
        {
            Nextpage.Enabled = true;
        }
        Label3.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=0>首页</a>";
        Label4.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=" + nextpagenum.ToString() + ">上一页</a>";
        Label5.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=" + downpagenum.ToString() + ">下一页</a>";
        Label6.Text = "<a href=?menu=Orderinfo&type=" + type + "&txtPage=" + cc.PageSize + "&Currentpage=" + Endpagenum.ToString() + ">尾页</a>";
        Label7.Text = thispagenull.ToString();
        Label8.Text = CPage.ToString();
        txtpages.Text = cc.PageSize.ToString();
        DropDownList3.Items.Clear();
        for (int i = 1; i <= thispagenull; i++)
        {
            this.DropDownList3.Items.Add(i.ToString());
        }
        for (int j = 0; j < DropDownList3.Items.Count; j++)
        {
            if (DropDownList3.Items[j].Value == Label8.Text)
            {
                DropDownList3.SelectedValue = Label8.Text;
                break;
            }
        }
        #endregion

    }
    protected void GetCartinfo()
    {
        string UserName = buser.GetLogin().UserName;
        Orderlist.Visible = false;
        Cartinfo.Visible = true;
        ViewCartpro.Visible = false;
        OrderProlist.Visible = false;
        Panel1.Visible = false;

        #region 获取页数
        int CPage;
        int temppage;

        if (Request.Form["DropDownList2"] != null)
        {
            temppage = DataConverter.CLng(Request.Form["DropDownList2"]);
        }
        else
        {
            temppage = DataConverter.CLng(Request.QueryString["CurrentPage"]);
        }
        CPage = temppage;
        if (CPage <= 0)
        {
            CPage = 1;
        }
        #endregion

        this.Label1.Text = "我的购物车列表";
        DataTable clist = cll.GetCartUser(UserName);
        PagedDataSource cc = new PagedDataSource();
        cc.DataSource = clist.DefaultView;
        cc.AllowPaging = true;
        if (Request.QueryString["txtPage"] != null && Request.QueryString["txtPage"] != "")
        {
            cc.PageSize = DataConverter.CLng(Request.QueryString["txtPage"]);
        }
        if (Request.Form["txtpage2"] != null && Request.Form["txtpage2"] != "")
        {
            cc.PageSize = DataConverter.CLng(Request.Form["txtpage2"]);
        }
        if (clist != null && cc.PageSize >= clist.Rows.Count)
        {
            cc.CurrentPageIndex = 0;
            CPage = 1;
        }
        cc.CurrentPageIndex = CPage - 1;
        Carttable.DataSource = cc;
        Carttable.DataBind();

        #region 设置翻页
        Allnum1.Text = clist.DefaultView.Count.ToString();
        int thispagenull = cc.PageCount;//总页数
        int CurrentPage = cc.CurrentPageIndex;
        int nextpagenum = CPage - 1;//上一页
        int downpagenum = CPage + 1;//下一页
        int Endpagenum = thispagenull;
        if (thispagenull <= CPage)
        {
            downpagenum = thispagenull;
            Downpage.Enabled = false;
        }
        else
        {
            Downpage.Enabled = true;
        }
        if (nextpagenum <= 0)
        {
            nextpagenum = 0;
            Nextpage.Enabled = false;
        }
        else
        {
            Nextpage.Enabled = true;
        }

        Toppage1.Text = "<a href=?menu=Cartinfo&Currentpage=0" + "&txtPage=" + cc.PageSize + ">首页</a>";
        Nextpage1.Text = "<a href=?menu=Cartinfo&Currentpage=" + nextpagenum.ToString() + "&txtPage=" + cc.PageSize + ">上一页</a>";
        Downpage1.Text = "<a href=?menu=Cartinfo&Currentpage=" + downpagenum.ToString() + "&txtPage=" + cc.PageSize + ">下一页</a>";
        Endpage1.Text = "<a href=?menu=Cartinfo&Currentpage=" + Endpagenum.ToString() + "&txtPage=" + cc.PageSize + ">尾页</a>";
        PageSize1.Text = thispagenull.ToString();
        Nowpage1.Text = CPage.ToString();
        txtpage2.Text = cc.PageSize.ToString();
        DropDownList2.Items.Clear();
        for (int i = 1; i <= thispagenull; i++)
        {
            this.DropDownList2.Items.Add(i.ToString());
        }
        for (int j = 0; j < DropDownList3.Items.Count; j++)
        {
            if (DropDownList2.Items[j].Value == Nowpage1.Text)
            {
                DropDownList2.SelectedValue = Nowpage1.Text;
                break;
            }
        }
        #endregion
    }
    protected string getAction(string id)
    {
        int sid = DataConverter.CLng(Request.QueryString["id"]);//订单ID
        string restr = "";
        if (oll.GetOrderListByid(sid).Rename == buser.GetLogin().UserName)
        {
            M_OrderList olist = oll.GetOrderListByid(sid);//订单信息
            if (olist.Paymentstatus == 1 && olist.StateLogistics == 1 && olist.OrderStatus == 1)//付款状态-物流状态-订单状态
            {
                restr = "<font id='state' color=red>成交OK</font>";
            }
            else if (olist.OrderStatus == 1 || olist.Paymentstatus == 1)//付款状态-订单状态,只要确认一个就不能删除
            {
                restr = "<font id='state' color=green>已确认无权再操作</font>";
            }
            else
            {
                restr = "<a id='dela' href=?menu=delprecartpro&id=" + id + " onclick=\"return confirm('不可恢复性删除数据,你确定将该数据删除吗？');\">删除</a>";
            }
        }
        // else
        //{
        //    function.WriteErrMsg("");           
        //}
        return restr;
    }
    public string getbotton(string id)
    {
        string restr = "";
        int sid = DataConverter.CLng(id);
        if (oll.GetOrderListByid(sid).Rename == buser.GetLogin().UserName)
        {
            M_OrderList olist = oll.GetOrderListByid(sid);
            //if ( olist.Settle == 1 || olist.Signed == 1 || olist.OrderStatus == 1)
            //{
            if (olist.Paymentstatus == 1 && olist.StateLogistics == 1 && olist.OrderStatus == 1)//付款状态-物流状态-订单状态
            {
                restr = "<font id='state' color=red>成交OK</font>";
            }
            else if (olist.OrderStatus == 1 || olist.Paymentstatus == 1)//付款状态-订单状态,只要确认一个就不能删除
            {
                restr = "<font id='state' color=green>交易中</font>";
            }
            else if (olist.Aside == 1)
            {
                restr = "<span id='state' color=#ddd>已删除</span>";
            }
            else
            {
                restr = "<a id='dela' href=?menu=Aside&id=" + sid + " onclick=\"return confirm('删除后此订单不可再交易,你确定要打操作吗？')\">删除</a>";
            }
            if (olist.Signed != 1 && olist.StateLogistics == 1 && olist.Aside != 1)
            {
                restr += "&nbsp;<a id='signa' href='?menu=asign&sid=" + sid + "&orderno=" + olist.OrderNo + "' onclick=\"return confirm('确定已收货？')\" >收货</a>";
            }
        }
        #region 改动前注释代码
        else
        {
            M_UserOrderList olist = uobll.GetOrderListByid(sid);
            if (olist.Aside == 1 || olist.Settle == 1 || olist.Signed == 1 || olist.OrderStatus == 1)
            {
                if (olist.Settle == 1 || olist.Signed == 1)
                {
                    restr = "<font color=red>成交OK</font>";
                }
                else if (olist.OrderStatus == 1)
                {
                    restr = "<font color=green>交易中</font>";
                }
                else
                {
                    restr = "<font color=#CCCCCC>已删除</font>";
                }
            }
            else
            {
                restr = "<a href=?menu=Aside&id=" + sid + " onclick=\"return confirm('删除后此订单不可再交易,你确定将该订单删除吗？')\">删除</a>";
            }
            orderID.Value = olist.id.ToString();
            if (olist.StateLogistics != 1 && olist.Aside != 1)
            {
                restr += "&nbsp;<a id='signa' href='#' onclick='SelectSuspend()' >延迟</a>";
            }
            if (olist.Paymentstatus != 0 && olist.StateLogistics != 1 && olist.Aside != 1)
            {
                restr += "&nbsp;<a id='signa' href='#' onclick='SelectState()' >退款</a>";
            }
            if (olist.Signed != 1 && olist.StateLogistics == 2 && olist.Aside != 1)
            {
                //throw new Exception(olist.OrderNo);
                restr += "&nbsp;<a id='signa' href='?menu=asign&sid=" + sid + "&orderno=" + olist.OrderNo + "' onclick=\"return confirm('确定已收货？')\" >收货</a>";
            }
        }
        #endregion
        return restr;
    }
    public string Gettypes(string id)
    {
        int sid = DataConverter.CLng(id);
        int type = pro.GetproductByid(sid).Priority;
        if (type == 1) { return "<font color=green>[绑]</font>"; } else { return ""; }
    }
    public string formatcc(string type, string moneys)
    {
        string mm = "";
        double cc1, cc2;
        cc1 = DataConverter.CDouble(moneys);
        cc2 = System.Math.Round(cc1, 2);
        mm = cc2.ToString();
        if (mm.IndexOf(".") == -1)
        {
            mm = mm + ".00";
        }
        if (type == "4")
        {
            mm = DataConverter.CLng(DataConverter.CDouble(mm)).ToString();
        }
        return mm;
    }
    public string formatzt(string zt, string selects)
    {
        string outstr;
        int zts, intselect;
        outstr = "";
        zts = DataConverter.CLng(zt);
        intselect = DataConverter.CLng(selects);
        switch (intselect)
        {
            case 0:
                switch (zts)
                {
                    case 0:
                        outstr = "<font color=red>等待确认</font>";
                        break;
                    case 1:
                        outstr = "<font color=blue>已经确认</font>";
                        break;
                    default:
                        outstr = "<font color=red>等待确认</font>";
                        break;
                }
                break;
            case 1:
                switch (zts)
                {
                    case 0:
                        outstr = "<font color=red>等待汇款</font>";
                        break;
                    case 1:
                        outstr = "<font color=blue>已经汇款</font>";
                        break;
                    default:
                        outstr = "<font color=red>等待汇款</font>";
                        break;
                }
                break;
            case 2:
                switch (zts)
                {
                    case 0:
                        outstr = "<font color=red>配送中</font>";
                        break;
                    case 1:
                        outstr = "<font color=blue>已发货</font>";
                        break;
                    default:
                        outstr = "<font color=red>配送中</font>";
                        break;
                };
                break;
            default:
                outstr = "";
                break;

        }
        return outstr;
    }
    protected string ChkExtra(string str, string id)
    {
        DataTable dt = new DataTable(); 
        DataTable orderlist = uobll.GetOrderbyOrderNo(str);
            if (orderlist.Rows.Count>0)
        { 
                dt = uobll.Getsouchinfo(1, str,  DataConverter.CLng(orderlist.Rows[0]["Userid"]), "0,4");
        }
        else
        {
            dt = oll.Getsouchinfo(1, str, "0,4");
        }
        if (dt != null && dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["Paymentstatus"].ToString() == "1")
            {
                return "<font color=blue>成功付款</font>";
            }
            else
            {
                if (dt.Rows[0]["ordertype"].ToString() == "4")
                {
                    return "<font color=red>等待支付</font>";
                }
                else
                {
                    return "<a href=\"#\" onclick=\"javascript:window.open('Shopfee/PayWindow.aspx?sid=" + id + "','','width=600,heigth=350,scrollbars=no') \"> <font color=red>等待支付</font></a>";
                }
            }
        }
        else
        {
            return "<font color=blue>待确认</font>";
        }
    }
    public string fapiao(string cc)
    {
        int cc1;
        string dd1;
        dd1 = "";
        cc1 = DataConverter.CLng(cc);

        if (cc1 == 0)
        {
            dd1 = "<font color=red>×</font>";
        }
        else if (cc1 == 1)
        {
            dd1 = "<font color=blue>√</font>";
        }

        return dd1;
        //        string js = @"<Script language='JavaScript'>
        //                        display();
        //                        </Script>";
        //        ClientScript.RegisterStartupScript(Page.GetType(), "myalert", js);
    }
    public string getshijiage(string id)
    {
        int Sid = DataConverter.CLng(id);
        object s;
        //    string shijiage = "";
        if (oll.GetOrderListByid(sid).Rename == buser.GetLogin().UserName)
        {
            M_OrderList orders = oll.GetOrderListByid(Sid);//GetOrderbyOrderNo
            DataTable tb = oll.GetOrderbyOrderNo(orders.OrderNo, "0,4");
            s = tb.Compute("sum(ordersamount)", "orderno='" + orders.OrderNo + "'");
            if (orders.Ordertype != 4)
            {
                s = DataConverter.CDouble(s).ToString("0.00");
            }
            else
            {
                s = DataConverter.CLng(DataConverter.CDouble(s)).ToString();
            }
        }
        else
        {
            M_UserOrderList orders = uobll.GetOrderListByid(Sid);
            DataTable tb = uobll.GetOrderbyOrderNo(orders.OrderNo);
            s = tb.Compute("sum(ordersamount)", "orderno='" + orders.OrderNo + "'");
            if (orders.Ordertype != 4)
            {
                s = DataConverter.CDouble(s).ToString("0.00");
            }
            else
            {
                s = DataConverter.CLng(DataConverter.CDouble(s)).ToString();
            }
        }
        
        return s.ToString();
    }
    public string GetPrice(string id, string val)
    {
        int Sid = DataConverter.CLng(id);
        M_OrderList orders = oll.GetOrderListByid(Sid);
        if (orders.Ordertype == 4)
        {
            return DataConverter.CLng(val).ToString();
        }
        else
        {
            return DataConverter.CDouble(val).ToString("F2");
        }
    }

    public string getproimg(string proid)
    {
        int pid = DataConverter.CLng(proid);
        M_Product pinfo = pro.GetproductByid(pid);
        string restring, type;

        restring = "";

        type = pinfo.Thumbnails;


        if (type != "") { type = type.ToLower(); }
        if (type != "" && (type.IndexOf(".gif") > -1 || type.IndexOf(".jpg") > -1 || type.IndexOf(".png") > -1))
        {
            restring = "<img src=../../" + type + " width=60 height=45>";
        }
        else
        {
            restring = "<img src=../../UploadFiles/nopic.gif width=60 height=45>";
        }
        return restring;

    }

    public string getProUnit(string proid)
    {
        int pid = DataConverter.CLng(proid);
        M_Product pinfo = pro.GetproductByid(pid);
        return pinfo.ProUnit.ToString();
    }

    public string getjiage(string proclass, string type, string proid)
    {
        int pid = DataConverter.CLng(proid);
        int ptype = DataConverter.CLng(type);
        M_Product pinfo = pro.GetproductByid(pid);
        string jiage;
        jiage = "";
        if (type == "1")
        {
            double jia = System.Math.Round(pinfo.ShiPrice, 2);
            jiage = jia.ToString();

        }
        else
        {
            double jia = System.Math.Round(pinfo.LinPrice, 2);
            jiage = jia.ToString();
        }

        if (jiage.IndexOf(".") == -1)
        {
            jiage = jiage + ".00";
        }
        if (proclass == "3")
        {
            jiage = pinfo.PointVal.ToString();
        }
        if (OrderType == 1)  //1为店铺订单,其他为一般订单
        {
            M_UserProduct pinfos = buserproduct.GetproductByid(pid);
            jiage = "";
            if (type == "1")
            {
                double jia = DataConverter.CDouble(System.Math.Round(pinfos.ShiPrice, 2));
                jiage = jia.ToString();

            }
            else
            {
                double jia = DataConverter.CDouble(System.Math.Round(pinfos.LinPrice, 2));
                jiage = jia.ToString();
            }

            if (jiage.IndexOf(".") == -1)
            {
                jiage = jiage + ".00";
            }
        }
        return jiage;
    }

    public string formatnewstype(string proid)
    {
        int pid = DataConverter.CLng(proid);
        M_Product pinfo = pro.GetproductByid(pid);
        int type = pinfo.ProClass;
        int newtype;
        string restring;
        restring = "";
        newtype = DataConverter.CLng(type.ToString());

        if (newtype == 2)
        {
            restring = "<font color=red>特价</font>";
        }
        else if (newtype == 1)
        {
            restring = "<font color=blue>正常</font>";
        }
        else if (newtype == 3)
        {
            restring = "<font color=blue>积分商品</font>";
        }
        if (OrderType == 1)  //1为店铺订单,其他为一般订单
        {
            M_UserProduct pinfos = buserproduct.GetproductByid(pid);
            int types = pinfos.ProClass;
            int newtypes;
            restring = "";
            newtypes = DataConverter.CLng(types.ToString());

            if (newtypes == 2)
            {
                restring = "<font color=red>特价</font>";
            }
            else if (newtypes == 1)
            {
                restring = "<font color=blue>正常</font>";
            }
        }
        return restring;
    }

    public string getprojia(string type, string cid)
    {
        int pid = DataConverter.CLng(cid);
        string jiage = "";
        M_CartPros minfo = pll.GetCartProByid(pid, 0);
        //double jiag = System.Math.Round(minfo.Shijia * minfo.Pronum, 2);
        double jiag = System.Math.Round(minfo.AllMoney, 2);
        jiage = jiag.ToString();

        if (jiage.IndexOf(".") == -1)
        {
            jiage = jiage + ".00";
        }
        if (type == "3")
        {
            jiage = DataConverter.CLng(DataConverter.CDouble(jiage)).ToString();
        }
        if (OrderType == 1)  //1为店铺订单,其他为一般订单
        {
            M_UserCartPro minfos = ucll.GetCartProByid(pid);
            double jiags = System.Math.Round(minfos.AllMoney, 2);
            jiage = jiags.ToString();
            if (jiage.IndexOf(".") == -1)
            {
                jiage = jiage + ".00";
            }
            if (type == "3")
            {
                jiage = DataConverter.CLng(DataConverter.CDouble(jiage)).ToString();
            }
        }
        return jiage;
    }

    public string shijia(string jiage)
    {
        double jia;
        jia = DataConverter.CDouble(jiage);
        double jiag = System.Math.Round(jia, 2);
        string jj = jiag.ToString();

        if (jj.IndexOf(".") == -1)
        {
            jj = jj + ".00";
        }
        return jj;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int sid = DataConverter.CLng(Request.QueryString["id"]);
        string strOrder = oll.GetOrderListByid(sid, 0).OrderNo.ToString();
        DataTable dt = oll.Getsouchinfo(1, strOrder);
        if (dt != null && dt.Rows.Count > 0)
        {
            M_OrderList order = oll.GetOrderListByid(DataConverter.CLng(dt.Rows[0]["id"] + ""));
            order.Paymentstatus = 1;
            oll.Update(order);
        }
    }
    //代购重新购买
    protected void btnANewbuys_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            int id = DataConverter.CLng(Request.QueryString["id"]);
            M_OrderList pro = oll.GetOrderListByid(id);
            M_Cart cart = new M_Cart();

            string OrderNo = "";
            OrderNo = "CT" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
            string TOrderNo = OrderNo.ToString();
            string aaa = StringHelper.MD5A(TOrderNo, 10, 6);
            string nowtime = DateTime.Now.ToString();
            string bbb = StringHelper.MD5A(nowtime, 5, 10);
            string ccc = StringHelper.MD5A(pro.AddUser, 5, 10);
            string cartid = aaa + "-" + bbb + "-" + ccc;
            HttpContext.Current.Response.Cookies["Shopby"]["OrderNo"] = cartid;
            HttpContext.Current.Response.Cookies["Shopby"]["Reuser"] = cartid;
            cart.userid = buser.GetUserByName(pro.Rename).UserID;     //添加用户名到数据库ccc
            cart.Username = buser.GetUserByName(pro.Rename).UserName;

            cart.AllMoney = DataConverter.CDouble(pro.Ordersamount);
            cart.Pronum = 0;// DataConverter.CLng(pro.);
            cart.Username = pro.AddUser;
            cart.Cartid = cartid;
            cart.userid = buser.GetUserByName(pro.AddUser).UserID;
            cart.Getip = EnviorHelper.GetUserIP();
            cart.Addtime = DateTime.Now;
            cll.Add(cart);
            Cartinfo.DataBind();

            DataTable cartinfo = cll.FondCartno(cartid);
            int ID = DataConverter.CLng(cartinfo.Rows[0]["ID"].ToString());

            #region 将商品放入购物车

            DataTable prolist = pll.GetCartProOrderID(id);

            M_Cart cartcontent = cll.GetCartByid(ID);
            cartcontent.Pronum = prolist.Rows.Count;
            cll.Update(cartcontent);
            cart.AllMoney = DataConverter.CDouble(pro.Ordersamount);
            cart.Pronum = 0;// DataConverter.CLng(pro.);
            cart.Username = pro.Rename;
            cart.Cartid = cartid;
            cart.userid = buser.GetUserByName(pro.Rename).UserID;
            cart.Getip = EnviorHelper.GetUserIP();
            cart.Addtime = DateTime.Now;
            cll.Add(cart);

            for (int i = 0; i < prolist.Rows.Count; i++)
            {
                M_CartPros cartproinfos = pll.GetCartProByid(DataConverter.CLng(prolist.Rows[i]["ID"]));
                cartproinfos.CartID = ID;
                pll.Add(cartproinfos);
            }
            #endregion
            Response.Write("<script>window.open('/ShopCar.aspx');</script>");
        }
    }

    //订单管理重新购买
    protected void btnANewBuy_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            int id = DataConverter.CLng(Request.QueryString["id"]);
            M_OrderList morder = new M_OrderList();
            M_OrderList pro = oll.GetOrderListByid(id);
            M_Cart cart = new M_Cart();
            string OrderNo = "";
            OrderNo = "CT" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
            string TOrderNo = OrderNo.ToString();
            string aaa = StringHelper.MD5A(TOrderNo, 10, 6);
            string nowtime = DateTime.Now.ToString();
            string bbb = StringHelper.MD5A(nowtime, 5, 10);
            string ccc = StringHelper.MD5A(pro.AddUser, 5, 10);
            string cartid = aaa + "-" + bbb + "-" + ccc;
            HttpContext.Current.Response.Cookies["Shopby"]["OrderNo"] = cartid;

            cart.AllMoney = DataConverter.CDouble(pro.Ordersamount);
            cart.Cartid = cartid;
            cart.Pronum = 0;
            cart.userid = buser.GetUserByName(pro.Rename).UserID;     //添加用户名到数据库ccc
            cart.Username = buser.GetUserByName(pro.Rename).UserName;
            oll.AddPaypal(morder); cartproinfo.DataBind();
            oll.Update(morder); cartproinfo.DataBind();
            cart.Getip = EnviorHelper.GetUserIP();
            cart.Addtime = DateTime.Now;
            pro.Rename = "";
            cll.Add(cart); Cartinfo.DataBind();
            cll.Update(cart); Cartinfo.DataBind();
            cll.GetCartAll();
            DataTable cartinfo = cll.FondCartno(cartid);
            int ID = DataConverter.CLng(cartinfo.Rows[0]["ID"].ToString());
            #region 将商品放入购物车
            DataTable prolist = pll.GetCartProOrderID(id);

            M_Cart cartcontent = cll.GetCartByid(ID);
            cartcontent.Pronum = prolist.Rows.Count;
            cll.Update(cartcontent);


            for (int i = 0; i < prolist.Rows.Count; i++)
            {
                M_CartPros cartproinfos = pll.GetCartProByid(DataConverter.CLng(prolist.Rows[i]["ID"]));
                cartproinfos.CartID = ID;

                pll.Add(cartproinfos);
            }
            DataTable minfolist = cll.GetCartAll();

            Carttable.DataSource = minfolist;
            #endregion
            Response.Write("<script>window.open('/UserCart.aspx');</script>");
        }
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        M_UserOrderList orderlists = uobll.GetOrderListByid(this.sid);
        if (orderlists != null && orderlists.id > 0)
        {
            string urls = "../PayOnline/Orderpay.aspx?OrderCode=" + orderlists.OrderNo;
            Response.Redirect(urls);
        }
        else
        {
            M_OrderList orderlist = oll.GetOrderListByid(this.sid);
            if (orderlist != null && orderlist.Ordertype == 4)
            {
                M_UserInfo info = buser.GetLogin();
                if (info != null)
                {
                    int point = 0;
                    if (orderlist.Ordersamount > point)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('对不起,您积分不够,赶快去充值吧！')</script>");
                    }
                    else
                    {
                        AddStoc(orderlist.id, orderlist.AddUser);
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('支付成功！');</script>");
                        Button6.Enabled = false;
                    }
                }
            }
            else
            {
                string urls = "../PayOnline/Orderpay.aspx?OrderCode=" + orderlist.OrderNo;
                Response.Redirect(urls);
            }
        }
    }

    /// <summary>
    ///  添加出库记录
    /// </summary>
    /// <param name="id">订单ID</param>
    /// <param name="user">添加用户</param>
    private void AddStoc(int id, string user)
    {
        DataTable cplist = pll.GetCartProOrderID(id);
        if (cplist != null && cplist.Rows.Count > 0)
        {
            foreach (DataRow dr in cplist.Rows)
            {
                M_Stock CData = new M_Stock();
                CData.proid = DataConverter.CLng(dr["ProID"].ToString());
                CData.stocktype = 1;
                CData.proname = dr["Proname"].ToString();
                CData.danju = "CK" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
                CData.adduser = user;
                CData.addtime = DateTime.Now;
                CData.content = "订单:" + user + "发货";
                CData.Pronum = DataConverter.CLng(dr["pronum"]);
                bstock.AddStock(CData);
            }
        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        M_UserOrderList orderlists = uobll.GetOrderListByid(this.sid);
        if (orderlists != null && orderlists.id > 0)
        {
            string urls = "../PayOnline/Orderpay.aspx?OrderCode=" + orderlists.OrderNo;
            Response.Write("<script>window.open('" + urls + "','','resizable=yes,location=yes,status=yes,toolbar=yes');</script>");
        }
        else
        {
            M_OrderList orderlist = oll.GetOrderListByid(this.sid);
            if (orderlist != null && orderlist.Ordertype == 4)
            {
                M_UserInfo info = buser.GetLogin();
                if (info != null)
                {
                    ExpOrderMan orderman = new ExpOrderMan();
                    Dictionary<string, int> val = orderman.GetUserPoint();
                    int point = 0;
                    if (val != null)
                    {
                        point = val["userpoint"] + val["blogpoint"] + val["dizpoint"];  //+ val["userpoint"]
                        if (orderlist.Ordersamount > point)
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('对不起,您积分不够,赶快去充值吧！')</script>");
                        }
                        else
                        {
                            //先扣博客积分,然后是扣论坛积分,最后是用户积分
                            bool result = orderman.GetUpdateorder(info.UserName, val, orderlist.id, DataConverter.CLng(orderlist.Ordersamount));
                            if (result)
                            {
                                AddStoc(orderlist.id, orderlist.AddUser);
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('支付成功！');</script>");
                                Button7.Enabled = false;
                            }
                            else
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('支付失败！');</script>");
                            }
                        }
                    }
                }
            }
            else
            {
                string urls = "../PayOnline/Orderpay.aspx?OrderCode=" + orderlist.OrderNo;
                Response.Write("<script>window.open('" + urls + "','','resizable=yes,location=yes,status=yes,toolbar=yes');</script>");
            }
        }
    }
    protected void txtPage_TextChanged(object sender, EventArgs e)
    {
        ViewState["page"] = "1";
        GetOrderinfo();
    }

    protected void txtpages_TextChanged(object sender, EventArgs e)
    {
        ViewState["page"] = "1";
        GetOrderinfo();
    }
    protected void txtpage2_TextChanged(object sender, EventArgs e)
    {
        ViewState["page"] = "1";
        GetCartinfo();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetOrderinfo();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCartinfo();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect(CustomerPageAction.customPath+"iServer/FiServer.aspx?OrderID=orderid");
    }
    protected void UserPurseBTN_Click(object sender, EventArgs e)
    {
        M_UserInfo mui = new M_UserInfo();
        buser.CheckIsLogin();
        mui = buser.GetLogin();
        DataTable orderinfo = new DataTable();
        orderinfo = oll.GetOrderbyOrderlist(Request["id"]);
        if (orderinfo != null && orderinfo.Rows.Count > 0)
        {
            int orderid = DataConverter.CLng(orderinfo.Rows[0]["id"]);
            M_OrderList mol = new M_OrderList();
            mol = oll.GetOrderListByid(orderid);
            if (mui.Purse >= (mol.Ordersamount + dll.GetDelivierByid(mol.Delivery).delitype))
            {
                //运费+价格
                mui.Purse = mui.Purse - (mol.Ordersamount + dll.GetDelivierByid(mol.Delivery).delitype);
                mol.Receivablesamount = mol.Ordersamount + dll.GetDelivierByid(mol.Delivery).delitype;
                buser.UpDateUser(mui);
                mol.Paymentstatus = 1;
                if (oll.Update(mol))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('恭喜你，使用用户余额支付成功!');location.href='/User/PreViewOrder.aspx?menu=Orderinfo';</script>");
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script>alert('用户余额不足!');</script>");
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "<script>alert('此订单不存在!');</script>");
        }
    }
    protected void LB_Track_Click(object sender, EventArgs e)
    {
        Orders.Visible = true;
    }
    protected void ULB_Track_Click(object sender, EventArgs e)
    {
        UOrders.Visible = true;
    }
    public string GetUserShopID()
    {
        return contentBll.GetGeneralID(buser.GetLogin().UserName);
    }
    //正常：3：已交易完成的订单
    //作废：5：用户删除的订单(作废)
    //批量删除至回收站 Aside=1,为安全考虑不合为一个事件
    protected void BatDel_Btn_Click(object sender, EventArgs e)
    {
        string ids = Request.Form["idchk"];
        if (!string.IsNullOrEmpty(ids))
        {
            oll.DelByIDS_U(ids, buser.GetLogin().UserID,1);
        }
        Response.Redirect(Request.RawUrl);
    }
    //回收站删除,Aside=2
    protected void BatDel2_Btn_Click(object sender, EventArgs e)
    {
        string ids = Request.Form["idchk"];
        if (!string.IsNullOrEmpty(ids))
        {
            oll.DelByIDS_U(ids, buser.GetLogin().UserID, 2);
        }
        Response.Redirect(Request.RawUrl);
    }
    //还原
    protected void Recoverty_Btn_Click(object sender, EventArgs e)
    {
        string ids = Request.Form["idchk"];
        if (!string.IsNullOrEmpty(ids))
        {
            oll.DelByIDS_U(ids, buser.GetLogin().UserID, 0);
        }
        Response.Redirect(Request.RawUrl);
    }
    protected void Dels_Click(object sender, EventArgs e)
    {
        string ids = Request.Form["idchk"];
        if (!string.IsNullOrEmpty(ids))
        {
            cll.DelByids(ids);
        }
        Response.Redirect(Request.RawUrl);
    }
}