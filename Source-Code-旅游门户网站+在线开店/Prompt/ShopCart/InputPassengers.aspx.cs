using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ZoomLa.BLL;
using ZoomLa.Components;
using System.Data;
using ZoomLa.Model;
using ZoomLa.Common;

public partial class ShopCart_InputPassengers : System.Web.UI.Page
{
    B_User user = new B_User();
    B_Products bll = new B_Products();
    B_Cart ACl = new B_Cart();
    B_CartPros Cll = new B_CartPros();
    B_Passenger b_pass = new B_Passenger();
    B_OrderList OCl = new B_OrderList();
    B_Product b_prod = new B_Product();
    B_CartPro Clls = new B_CartPro();
    B_CardType bcType = new B_CardType();
    B_Card bc = new B_Card();
    B_Arrive barr = new B_Arrive();

    //订单类型,1:酒店,2:航班
    public string Type { get { return string.IsNullOrEmpty(Request["type"]) ? "1" : Request["type"]; } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            M_UserInfo infos = user.GetLogin();
            string url = GetPath();
            if (infos == null || infos.UserID <= 0)
            {
                Response.Redirect("/User/Login.aspx?returnUrl=" + url);
            }
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Type))
                {
                    this.hftype.Value = Type;
                    SetLable();
                    if (!string.IsNullOrEmpty(Request.QueryString["valu"]) || Type == "1")  //进入确定页面
                    {
                        baoxian.Visible = false;
                        repPassener.Visible = false;
                        isConsts.Visible = false;
                        arrive.Visible = true;
                        Contact.Visible = false;
                        add.Visible = false;
                        commit.Visible = true;
                        repPass.Visible = true;

                        if (Session["Passener"] != null)  //乘客信息
                        {
                            Dictionary<int, M_Passenger> pass = (Dictionary<int, M_Passenger>)Session["Passener"];
                            repPass.DataSource = pass;
                            repPass.DataBind();
                            this.lblAllMoney.Text = Request.QueryString["price"];
                        }
                        if (Type == "1")  //如果为酒店信息
                        {
                            Session["Passener"] = null;
                            GetHotelData();
                            AddSessProduct();
                        }
                        else
                        {
                            lblInfo2.Visible = true;
                            Hotels.Visible = false;
                        }
                        if (Session["OrderList"] != null && Session["product"] != null)  //联系人和航班信息
                        {
                            M_Products pro = (M_Products)Session["product"];
                            M_OrderList ord = (M_OrderList)Session["OrderList"];

                            GetProduct(pro, ord);
                        }
                    }
                    else   //进入预定页面
                    {
                        repPassener.Visible = true;
                        Contact.Visible = true;
                        add.Visible = true;
                        isConsts.Visible = true;
                        arrive.Visible = false;
                        Hotels.Visible = false;
                        repPass.Visible = false;
                        commit.Visible = false;

                        Session["Passener"] = null;
                        BindCb();
                        if (Type == "2")  //航班
                        {
                            baoxian.Visible = true;
                            GetFeightDate();
                        }
                        if (Type == "3")  //旅游
                        {
                            baoxian.Visible = true;
                            GetTripDate();
                        }
                        AddDic(DataConverter.CLng(lblStock.Text), 1);   //初始化保存乘客信息的数据
                        bind();
                        AddSess();
                        //初始化联系人信息
                        M_UserInfo info = user.GetLogin();
                        M_Uinfo uinfo = user.GetUserBaseByuserid(info.UserID);
                        txtNecName.Value = info.UserName;
                        txtMail.Value = info.Email;
                        txtAddress.Value = uinfo.Address;
                        txtZipCode.Value = uinfo.ZipCode;
                        txtPhone.Value = uinfo.HomePhone;
                    }
                }
            }
        }
    }
    #region private function

    private string GetPath()
    {
        string strPath = "http://" + Request.ServerVariables["HTTP_HOST"] + Request.ServerVariables["PATH_INFO"] + "?" + Request.ServerVariables["QUERY_STRING"];
        if(strPath.EndsWith("?"))
        {
            strPath = strPath.Substring(0, strPath.Length - 1);
        }
        return strPath;
    }

    #region 初始信息
    /// <summary>
    /// 获取初始航班信息
    /// </summary>
    private void GetFeightDate()
    {
        this.lblNo.Text = Server.UrlDecode(Request.QueryString["Proname"]);         //航班名称
        this.lblDate.Text = Server.UrlDecode(Request.QueryString["comedate"]);      //起飞时间
        hfComdate.Value = Server.UrlDecode(Request.QueryString["comedate"]);        //起飞时间
        hfArriveTime.Value = Server.UrlDecode(Request.QueryString["ArrivalDate"]);  //到达时间
        lblPrice.Text = Server.UrlDecode(Request.QueryString["Wholesaleone"]);      //价格
        lblStock.Text = Server.UrlDecode(Request.QueryString["Stock"]);             //数量
        hfcity.Value = Server.UrlDecode(Request.QueryString["city"]);                //到达城市
        lblInsurance.Text = Request.QueryString["Insurance"];  //保险价格
        lblJiJian.Text = "￥" + Server.UrlDecode(Request.QueryString["AirOilTax"]) + "/￥" + Server.UrlDecode(Request.QueryString["AirPortTax"]); //  机建/燃油
        AirOilTax.Value = Server.UrlDecode(Request.QueryString["AirOilTax"]);       //燃油价格
        AirPortTax.Value = Server.UrlDecode(Request.QueryString["AirPortTax"]);     //机建价格
        countRate.Value = Server.UrlDecode(Request.QueryString["countRate"]);       //折扣数
        hfProinfo.Value = lblJiJian.Text;
    }

    //初始旅游信息
    private void GetTripDate()
    {
        this.lblNo.Text = !string.IsNullOrEmpty(Request.Form["Proname"]) ? Request.Form["Proname"] : Request.QueryString["Proname"];      //旅游线路
        this.lblDate.Text = !string.IsNullOrEmpty(Request.Form["comedate"]) ? Request.Form["comedate"] : Request.QueryString["comedate"];   //出发时间
        hfComdate.Value = !string.IsNullOrEmpty(Request.Form["comedate"]) ? Request.Form["comedate"] : Request.QueryString["comedate"];
        this.lblPrice.Text = !string.IsNullOrEmpty(Request.Form["PePrice"]) ? Request.Form["PePrice"] : Request.QueryString["PePrice"];   //成人价格
        this.hfChNum.Value = !string.IsNullOrEmpty(Request.Form["chNum"]) ? Request.Form["chNum"] : Request.QueryString["chNum"];   //儿童人数
        this.lblJiJian.Text = !string.IsNullOrEmpty(Request.Form["chNum"]) ? Request.Form["chNum"] : Request.QueryString["chNum"];
        this.hfPeNum.Value = !string.IsNullOrEmpty(Request.Form["peNum"]) ? Request.Form["peNum"] : Request.QueryString["peNum"];   //成人人数
        Session["chNum"] = lblJiJian.Text;
        hfProinfo.Value = !string.IsNullOrEmpty(Request.Form["GenerId"]) ? Request.Form["GenerId"] : Request.QueryString["GenerId"];  //内容ID
        lblInsurance.Text = !string.IsNullOrEmpty(Request.Form["Insurance"]) ? Request.Form["Insurance"] : Request.QueryString["Insurance"];  //保险价格
        this.lblStock.Text = DataConverter.CLng(hfPeNum.Value).ToString();   //数量
    }

    /// <summary>
    /// 获取初始酒店信息
    /// </summary>
    private void GetHotelData()
    {
        lblInfo2.Visible = false;
        Hotels.Visible = true;
        this.lblNo.Text = Request.QueryString["Proname"];     //酒店名称
        this.lblDate.Text = Request.QueryString["comedate"];  //入住日期
        hfArriveTime.Value =Request.QueryString["outdate"];  //离店时间
        lblStock.Text =  Request.QueryString["Stock"];                           //数量
        hfcity.Value = Request.QueryString["city"];           //城市
        txtNecName.Value = Request.QueryString["ContractName"];    //联系人姓名
        txtPhone.Value =Request.QueryString["mobile"];
        lblAllMoney.Text =Request.QueryString["Wholesaleone"];
        lblJiJian.Text =Request.QueryString["city"];
        hfProinfo.Value = Request.QueryString["guestName"];     //入住人姓名
        lblHotel.Text = hfProinfo.Value + "(共" + lblStock.Text + "人)";
        lblPrice.Text = (DataConverter.CDouble(lblAllMoney.Text) / DataConverter.CLng(lblStock.Text)).ToString();  //价格
        repPass.Visible = false;
        AddConOrder();
    }

    private void SetLable()
    {
        string show1 = "";
        string show2 = "";
        if (Type == "1")  //酒店类型
        {
            show1 = "入住人";
            show2 = "酒店";
            lblNo1.Text = "酒店名称";
            lblDate1.Text = "入住时间";
            lblJiJian1.Text = "城市";
        }
        if (Type == "2")  //航班信息
        {
            show1 = "乘客";
            show2 = "航班";
            lblNo1.Text = "航班号";
            lblDate1.Text = "起飞时间";
            lblJiJian1.Text = "机建/燃油";
        }
        if (Type == "3")  //旅游信息
        {
            show1 = "旅客";
            show2 = "旅游";
            lblNo1.Text = "旅游线路";
            lblDate1.Text = "出发时间";
            lblPrice1.Text = "成人价格";
            lblJiJian1.Text = "儿童人数";
            lblStock1.Text = "成人人数";
        }
        lblInfo1.Text = show2 + "信息";
        lblInfo2.Text = show1 + "信息";
    }

    #endregion

    private void GetVal()
    {
        M_UserInfo info = user.GetLogin();
        if (string.IsNullOrEmpty(hfConstVlaue.Value))
        {
            List<M_Passenger> passes = b_pass.GetSelectByUserID(info.UserID);
            foreach (M_Passenger item in passes)
            {
                hfConstVlaue.Value += item.Id.ToString() + ",";
            }
        }

    }
    private void BindCb()
    {
        M_UserInfo info = user.GetLogin();
        if (info != null && info.UserID > 0)
        {
            List<M_Passenger> passes = b_pass.GetSelectByUserID(info.UserID);
            GetVal();
            string values = hfConstVlaue.Value;
            string[] vals = values.Split(',');
            cbConst.Items.Clear();
            if (passes != null && passes.Count > 0)
            {
                foreach (M_Passenger item in passes)
                {
                    ListItem li = new ListItem();
                    li.Text = item.Name == "" ? item.Name_EN : item.Name;
                    li.Value = item.Id.ToString();
                    if (vals != null && vals.Length > 0)
                    {
                        for (int j = 0; j < vals.Length; j++)
                        {
                            if (li.Value == vals[j])
                            {
                                li.Selected = false;
                                break;
                            }
                            else
                            {
                                li.Selected = true;
                            }
                        }

                    }
                    cbConst.Items.Add(li);
                }
            }
        }
    }


    #region 将航班/机票/旅游信息保存到商品表中
    /// <summary>
    /// 将航班/机票信息保存到商品表中
    /// </summary>
    private void AddSessProduct()
    {
        Session["product"] = null;
        string adminname = StringHelper.Base64StringDecode(user.GetLogin().UserName);
        M_Products CData = new M_Products();
        CData.Class = 0;
        CData.Proname = lblNo.Text;
        CData.ServerType = 3;
        CData.ProClass = 1;
        CData.Properties = 0;
        CData.Sales = 1;
        CData.Proinfo = hfProinfo.Value;
        CData.Wholesaleone = DataConverter.CDouble(lblPrice.Text);
        CData.Quota = -1;
        CData.DownQuota = -1;
        CData.Stock = DataConverter.CLng(lblStock.Text);
        CData.StockDown = 1;
        CData.Rateset = 1;
        CData.Dengji = 3;
        CData.ShiPrice = DataConverter.CDouble(lblPrice.Text);
        CData.LinPrice = DataConverter.CDouble(lblPrice.Text);

        CData.AllClickNum = 1;
        CData.UpdateTime = DataConverter.CDate(hfComdate.Value);
        CData.AddUser = adminname;
        CData.DownCar = 0;
        CData.Istrue = 1;
        CData.Isgood = 0;
        CData.MakeHtml = 0;
        CData.AddTime = DataConverter.CDate(hfComdate.Value);
        CData.isnew = 1;
        if (!string.IsNullOrEmpty(Type))
        {
            int type = DataConverter.CLng(Type);
            if (type == 1) //酒店类型
            {
                CData.Wholesaleone = DataConverter.CDouble(lblAllMoney.Text) / DataConverter.CDouble(lblStock.Text);
                CData.ShiPrice = DataConverter.CDouble(lblPrice.Text);
                CData.LinPrice = DataConverter.CDouble(lblPrice.Text);
            } 
        }
        Session["product"] = CData;
    }
    #endregion


    #region 获取session中商品和联系人信息
    private void GetProduct(M_Products pro, M_OrderList orderlist)
    {
        this.lblNo.Text = pro.Proname;
        this.lblDate.Text = pro.AddTime.ToString();
        hfComdate.Value = pro.AddTime.ToString();
        lblPrice.Text = pro.Wholesaleone.ToString();
        lblStock.Text = pro.Stock.ToString();
        hfcity.Value = orderlist.city;
        lblJiJian.Text = pro.Proinfo;
        if (Type == "3")
        {
            lblJiJian.Text = Session["chNum"].ToString();
            hfProinfo.Value = pro.Proinfo; //儿童票
        }
    }
    #endregion

    #region 将联系人信息保存至订单中
    private void AddConOrder()
    {
        Session["OrderList"] = null;
        M_OrderList order = new M_OrderList();
        order.Reuser = txtNecName.Value;
        order.Rename = user.GetLogin().UserName;
        order.Phone = txtPhone.Value;
        order.Jiedao = txtAddress.Value;
        order.ZipCode = txtZipCode.Value;
        order.Email = txtMail.Value;
        order.city = hfcity.Value;
        if (Type == "3" || Type == "2")
        {
            order.Freight =DataConverter.CLng(txtIns.Text);
        }
        Session["OrderList"] = order;
    }
    #endregion

    private void bind()
    {
        if (Session["Passener"] != null)
        {
            Dictionary<int, M_Passenger> passener = (Dictionary<int, M_Passenger>)Session["Passener"];
            if (passener != null && passener.Count > 0)
            {
                repPassener.DataSource = passener;
                repPassener.DataBind();
            }
        }
    }


    /// <summary>
    /// 修改乘客信息
    /// </summary>
    /// <param name="key"></param>
    /// <param name="passer"></param>
    private void GetPassenes(int key, M_Passenger passer)
    {
        if (Session["Passener"] != null)
        {
            Dictionary<int, M_Passenger> passener = (Dictionary<int, M_Passenger>)Session["Passener"];
            if (passener != null && passener.Count > 0)
            {
                foreach (int item in passener.Keys)
                {
                    if (item == key)
                    {
                        passener[item] = passer;
                        break;
                    }
                }
            }
            Session["Passener"] = passener;
        }
    }

    private string GetCreType(string type)
    {
        switch (type)
        {
            case "0":
                return "身份证";
            case "1":
                return "护照";
            case "2":
                return "军人证";
            case "3":
                return "港澳通行证";
            case "4":
                return "台胞证";
            case "5":
                return "回乡证";
            case "6":
                return "国际海员证";
            case "7":
                return "外国人永久居留证";
            case "8":
                return "旅行证";
            case "9":
                return "其他";
        }
        return "";
    }

    /// <summary>
    /// 获取证件类型和证件号码
    /// </summary>
    /// <param name="value"></param>
    /// <returns></returns>
    private string[] GetType(string value)
    {
        if (!string.IsNullOrEmpty(value))
        {
            string[] va = value.Split('|');
            if (va != null && va.Length > 0)
            {
                string[] cre = va[0].Split(':');
                return cre;
            }
            else
            {
                return null;
            }
        }
        else
        {
            return null;
        }
    }

    /// <summary>
    /// 判断是否为中文名
    /// </summary>
    /// <param name="name"></param>
    private bool NameCk(string name)
    {
        if (name.LastIndexOf(' ') > -1)
        {
            return false;
        }
        return true;
    }


    private string GetClientID(string name)
    {
        int length = name.LastIndexOf('_');
        if (length > -1)
        {
            return name.Substring(0, length + 1);
        }
        return "";
    }
    #endregion

    /// <summary>
    /// 绑定事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void repPassener_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        hfClientID.Value = "";
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfID = e.Item.FindControl("hfId") as HiddenField;
            HiddenField passID = e.Item.FindControl("passID") as HiddenField;
            HtmlInputText txtName = e.Item.FindControl("txtName") as HtmlInputText;
            HtmlSelect ddlCreID = e.Item.FindControl("ddlCreID") as HtmlSelect;
            HtmlInputText txtCreID = e.Item.FindControl("txtCreID") as HtmlInputText;
            TextBox txtFlyerCart = e.Item.FindControl("txtFlyerCart") as TextBox;
            DropDownList ddType = e.Item.FindControl("ddType") as DropDownList;
            TextBox txtPhone = e.Item.FindControl("txtPhone") as TextBox;
            CheckBox cbIsConst = e.Item.FindControl("chAdd") as CheckBox;
            Label lblPri = e.Item.FindControl("lblChPrice") as Label;

            hfName.Value += txtName.ClientID + ",";
            hfClientID.Value += txtName.ClientID.Substring(0, txtName.ClientID.LastIndexOf('_') + 1) + ",";
            hfCreType.Value += ddlCreID.ClientID + ",";
            hfCreID.Value += txtCreID.ClientID + ",";
            if (Type == "3")
            {
                lblPri.Visible = false;
            }
            if (Session["Passener"] != null)
            {
                Dictionary<int, M_Passenger> passener = (Dictionary<int, M_Passenger>)Session["Passener"];
                foreach (int item in passener.Keys)
                {
                    if (item == DataConverter.CLng(hfID.Value))
                    {
                        M_Passenger pass = passener[item];
                        if (pass != null)
                        {
                            txtName.Value = pass.Name != "" ? pass.Name : pass.Name_EN;
                            string[] types = GetType(pass.CreID);
                            if (types != null && types.Length > 1)
                            {
                                ddlCreID.Value = types[0];
                                txtCreID.Value = types[1];
                            }
                            passID.Value = pass.Id.ToString();
                            txtFlyerCart.Text = pass.FlyerCart;
                            txtPhone.Text = pass.Mobile;
                            cbIsConst.Checked = pass.IsConst == 1 ? true : false;
                            ddType.SelectedValue = pass.TicType.ToString();
                        }
                    }
                }
            }
        }
    }

    //预订
    protected void btnCommit_Click(object sender, EventArgs e)
    {
        if (CheckCon())
        {
            if (repPassener != null && repPassener.Items.Count > 0)
            {
                AddSess();
                AddSessProduct();
                AddConOrder();
                string price = ViewState["price"].ToString();
                Response.Redirect("InputPassengers.aspx?valu=1&type=" + Type + "&price=" + price);
            }
        }
    }

    #region private function


    /// <summary>
    /// 验证联系人信息
    /// </summary>
    /// <returns></returns>
    private bool CheckCon()
    {
        if (txtNecName.Value.Trim() == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('请输入联系人信息!')</script>");
            return false;
        }
        if (txtPhone.Value.Trim() == "")
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('请输入联系电话!')</script>");
            return false;
        }
        return true;
    }

    private void AddSess()
    {
        double price = 0.00;  //价格
        int chnum = 0;
        int peNum = 0;
        for (int i = 0; i < repPassener.Items.Count; i++)
        {
            HiddenField hfID = repPassener.Items[i].FindControl("hfId") as HiddenField;
            HiddenField passID = repPassener.Items[i].FindControl("passID") as HiddenField;
            HtmlInputText txtName = repPassener.Items[i].FindControl("txtName") as HtmlInputText;
            HtmlSelect ddlCreID = repPassener.Items[i].FindControl("ddlCreID") as HtmlSelect;
            HtmlInputText txtCreID = repPassener.Items[i].FindControl("txtCreID") as HtmlInputText;
            TextBox txtFlyerCart = repPassener.Items[i].FindControl("txtFlyerCart") as TextBox;
            DropDownList ddType = repPassener.Items[i].FindControl("ddType") as DropDownList;
            CheckBox cbIsConst = repPassener.Items[i].FindControl("chAdd") as CheckBox;
            TextBox txtPhone = repPassener.Items[i].FindControl("txtPhone") as TextBox;

            M_Passenger passer = new M_Passenger();
            if (NameCk(txtName.Value.Trim()))  //判断是中文名还是英文名
            {
                passer.Name = txtName.Value.Trim();
            }
            else
            {
                passer.Name_EN = txtName.Value.Trim();
            }
            passer.Id = DataConverter.CLng(passID.Value);
            passer.CreID = ddlCreID.Value + ":" + txtCreID.Value;
            passer.FlyerCart = txtFlyerCart.Text;
            passer.TicType = DataConverter.CLng(ddType.SelectedValue);
            if (passer.TicType == 2) //儿童
            {
                chnum += 1;
                if (Type == "2")  //机票
                {
                    if (DataConverter.CDouble(countRate.Value) < 100)
                    {
                        price += (DataConverter.CDouble(lblPrice.Text) * 100 / DataConverter.CDouble(countRate.Value)) * 0.5
                           + (DataConverter.CDouble(lblPrice.Text) * 100 % DataConverter.CDouble(countRate.Value)) * 0.5
                        + DataConverter.CDouble(AirOilTax.Value) + DataConverter.CDouble(AirPortTax.Value);
                    }
                    else
                    {
                        price += DataConverter.CDouble(lblPrice.Text) * 0.5 + DataConverter.CDouble(AirOilTax.Value) + DataConverter.CDouble(AirPortTax.Value);
                    }
                }
                if (Type == "3")
                {
                    price += DataConverter.CDouble(lblPrice.Text);
                }
            }
            if (passer.TicType == 1)  //成人
            {
                peNum += 1;
                price += DataConverter.CDouble(lblPrice.Text) + DataConverter.CDouble(AirOilTax.Value) + DataConverter.CDouble(AirPortTax.Value);
            }
            passer.Mobile = txtPhone.Text;
            if (cbIsConst.Checked)  //是否为常用客户
            {
                passer.IsConst = 1;
            }
            else
            {
                passer.IsConst = 0;
            }
            M_UserInfo info = user.GetLogin();
            if (info != null && info.UserID > 0)
            {
                passer.UserID = info.UserID;
            }
            GetPassenes(DataConverter.CLng(hfID.Value), passer);
        }
        if (Type == "3" || Type == "2")
        {
            price = price + (DataConverter.CDouble(lblInsurance.Text) * DataConverter.CLng(txtIns.Text));
        }
        lblAllMoney.Text = price.ToString();
        ViewState["price"] = price; //总价格
        if (Type == "3")
        {
            lblStock.Text = peNum.ToString();
            lblJiJian.Text = chnum.ToString();
            Session["chNum"] = lblJiJian.Text;
        }
        else
        {
            lblStock.Text = repPassener.Items.Count.ToString();
        }
    }

    private void AddDic(int item,int val)
    {
        if (item > 0)
        {
            Dictionary<int, M_Passenger> passener = new Dictionary<int, M_Passenger>();
            if (Session["Passener"] != null)
            {
                passener = (Dictionary<int, M_Passenger>)Session["Passener"];
            }
            int key = passener.Count + 1;
            if (val > 0)
            {
                if (!string.IsNullOrEmpty(hfPeNum.Value) || !string.IsNullOrEmpty(hfChNum.Value))
                {
                    for (int i = 0; i < DataConverter.CLng(hfPeNum.Value); i++)
                    {
                        M_Passenger passen = new M_Passenger();
                        passen.TicType = 1;
                        passener.Add(key, passen);
                        key += 1;
                    }
                    for (int i = 0; i < DataConverter.CLng(hfChNum.Value); i++)
                    {
                        M_Passenger passen = new M_Passenger();
                        passen.TicType = 2;
                        passener.Add(key, passen);
                        key += 1;
                    }
                }
                else
                {
                    for (int i = 0; i < item; i++)
                    {
                        passener.Add(key, null);
                        key += 1;
                    }
                }
            }
            else
            {
                for (int i = 0; i < item; i++)
                {
                    passener.Add(key, null);
                    key += 1;
                }
            }
            Session["Passener"] = passener;
        }
    }
  

    #region 添加到订单列表中
    private string AddOrderinfo(string ids)
    {
        string Cartno = HttpContext.Current.Request.Cookies["Shopby"]["OrderNo"];//购物车NOID
        /////添加判断是否存在此ID;
        DataTable Cart = ACl.FondCartno(Cartno);    //购物车信息
        if (Cart.Rows.Count < 1)
        {
        }
        string iid = Cart.Rows[0]["id"].ToString();
        DataTable getid = OCl.GetPaypayIs(iid);
        DataRow[] getcount = getid.Select();
        //删除Paypal支付的订单号

        if (getcount.Length > 0)
        {
            int orderid = Convert.ToInt16(getid.Rows[0]["id"]);
            OCl.DeleteByID(orderid);
        }

        string UserName = user.GetLogin().UserName;
        int projuct = DataConverter.CLng(Request.Form["prodectid"]);
        if (projuct > 0)
        {
            string Cartnod = HttpContext.Current.Request.Cookies["Shopby"]["OrderNo"].ToString();

            M_Product produinfo = b_prod.GetproductByid(projuct);
            M_CartPro Cdata = new M_CartPro();
            Cdata.Addtime = DataConverter.CDate(hfComdate.Value);
            Cdata.CartID = DataConverter.CLng(ACl.FondCartno(Cartnod).Rows[0]["ID"]); //购物车ID
            Cdata.ProID = projuct;
            Cdata.Pronum = DataConverter.CLng(lblStock.Text);
            Cdata.Shijia = produinfo.Wholesaleone;   //////指定价格
            Cdata.PerID = hfArriveTime.Value;//绑定到达(航班)/离店(酒店)的时间
            Cdata.Danwei = produinfo.ProUnit;
            Cdata.Proname = produinfo.Proname;

            Cdata.AllMoney = DataConverter.CDouble(lblAllMoney.Text);
            Cdata.Username = UserName;
            if (!string.IsNullOrEmpty(Type))
            {
                int type = DataConverter.CLng(Type);
                Cdata.city = this.hfcity.Value;
                Cdata.Pronum = DataConverter.CLng(this.lblStock.Text);
                Cdata.Shijia = produinfo.Wholesaleone * produinfo.Stock;
                Cdata.type = type;
                if (type == 3)  //旅游
                {
                    Cdata.Bindpro = hfProinfo.Value;   //内容ID
                    Cdata.PerID = lblJiJian.Text;      //儿童人数
                }
            }
            Clls.Add(Cdata);
        }
        int errnum = 0;
        string carterrinfo = "";
        int Userid = 0;
        if (user.GetLogin().UserName != null)
        {
            M_UserInfo Nameinfo = user.GetUserByName(user.GetLogin().UserName);
            Userid = Nameinfo.UserID;
        }
        else
        {
            UserName = "";
        }
        ////////////////////////////////////////////////////////////////

        if (Cart.Rows.Count > 0)
        {
            int Cartid = DataConverter.CLng(Cart.Rows[0]["id"]);    //购物车ID
            //历遍所有商品数量，查找库存///////////////////
            DataTable Unew = Cll.GetCartProCartID(Cartid);
            for (int s = 0; s < Unew.Rows.Count; s++)
            {
                int Onum = DataConverter.CLng(Unew.Rows[s]["Pronum"]);
                int Opid = DataConverter.CLng(Unew.Rows[s]["ProID"]);
                M_Product pdin = b_prod.GetproductByid(Opid);
                int Allowed = pdin.Allowed;

                if (pdin.JisuanFs == 1 && Allowed == 0)
                {
                    int pstock = pdin.Stock - Onum;//库存结果
                    if (pstock <= 0)
                    {
                        errnum = errnum + 1;
                        carterrinfo = carterrinfo + Unew.Rows[s]["Proname"] + "、";
                    }
                }
            }
            //////////////////////////////////////////////////////
            if (errnum == 0)
            {
                int Cid = DataConverter.CLng(Cart.Rows[0]["id"].ToString());
                string Cartusername = Cart.Rows[0]["Username"].ToString();
                string Cartcartid = Cart.Rows[0]["Cartid"].ToString();
                int Cartuserid = DataConverter.CLng(Cart.Rows[0]["Userid"].ToString());
                DateTime Cartaddtime = DataConverter.CDate(Cart.Rows[0]["Addtime"].ToString());
                string Cartgetip = Cart.Rows[0]["Getip"].ToString();
                double Cartallmoney = DataConverter.CDouble(lblAllMoney.Text);
                int Cartpronum = DataConverter.CLng(Cart.Rows[0]["Pronum"].ToString());

                string codeid = "DD" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
                M_OrderList Odata = new M_OrderList();
                if (Session["OrderList"] != null)
                {
                    Odata = (M_OrderList)Session["OrderList"];
                }
                Odata.id = 0;
                Odata.Receiver = DataSecurity.FilterBadChar(Request.Form["Receiver"]);
                Odata.Invoice = " ";

                Odata.OrderNo = codeid;
                Odata.Guojia = "";//国家
                Odata.Shengfen = "";//省份
                Odata.Chengshi = "";//城市
                Odata.Diqu = "";//地区
                Odata.Outstock = 0;//缺货处理
                Odata.Ordermessage = "";//订货留言

                Odata.Merchandiser = ids;//乘客
                Odata.Internalrecords = ""; //内部记录

                M_UserInfo uinfo = user.GetLogin();
                Odata.Ordersamount = Cartallmoney;//订单金额
                Odata.Receivablesamount = 0;//收款金额
                Odata.Specifiedprice = Cartallmoney; ; //订单金额;
                Odata.Developedvotes = 0;
                Odata.OrderStatus = 0;//订单状态
                Odata.Signed = 0;//签收
                Odata.Settle = 0;//结清
                Odata.Aside = 0;//作废
                Odata.Suspended = 0;//暂停
                Odata.Ordertype = 0;//订单类型
                Odata.AddTime = DataConverter.CDate(hfComdate.Value);
                Odata.AddUser = UserName;
                Odata.Userid = DataConverter.CLng(Userid);
                Odata.Freight_remark = "";
                Odata.Balance_price = 0;
                Odata.Balance_remark = "";
                Odata.Mobile = 0;
                if (!string.IsNullOrEmpty(Type))
                {
                    int type = DataConverter.CLng(Type);
                    Odata.Ordertype = type;
                }
                int oid;
                if (OCl.Add(Odata))
                {
                    DataTable Ordertables = OCl.GetOrderbyOrderNo(codeid);
                    if (Ordertables.Rows.Count > 0)
                    {
                        oid = DataConverter.CLng(Ordertables.Rows[0]["id"]);
                        //历遍所有商品数量，查找库存///////////////////
                        int cartid;
                        cartid = DataConverter.CLng(Cart.Rows[0]["id"]);
                        DataTable Unews = Cll.GetCartProCartID(cartid);
                        int Onum, Opid;

                        for (int s = 0; s < Unews.Rows.Count; s++)
                        {
                            Onum = DataConverter.CLng(Unews.Rows[s]["Pronum"].ToString());
                            Opid = DataConverter.CLng(Unews.Rows[s]["ProID"].ToString());

                            M_Product pdin = b_prod.GetproductByid(Opid);
                            if (pdin.JisuanFs == 1)
                            {
                                int pstock = pdin.Stock - Onum;//库存结果
                                bll.ProUpStock(Opid, pstock);
                            }
                        }
                        //////////////////////////////////////////////////////
                        oid = DataConverter.CLng(Ordertables.Rows[0]["id"]);//订单ID

                        Cll.UpCartProorcode(oid, Cid);//更新车体的订单ＩＤ
                        ACl.DeleteByID(Cid);//删除购物车ＩＤ
                        Session["city"] = "";
                    }
                }
                return codeid;
            }
        }
        return "";
    }
    #endregion

    #region 添加客户信息
    private string AddPasser(Dictionary<int, M_Passenger> passer)
    {
        string ids = "";
        if (passer != null && passer.Count > 0)
        {
            foreach (int item in passer.Keys)
            {
                M_Passenger pass = passer[item];
                if (pass != null)
                {
                    if (pass != null && pass.Id <= 0)  //不存在则添加
                    {
                        int id = b_pass.GetInsert(pass);
                        ids += id+",";
                    }
                    else if (pass != null)
                    {
                        bool resul = b_pass.GetUpdate(pass);
                        ids += pass.Id+",";
                    }
                }
            }

        }
        return ids;
    }
    #endregion

    #region 添加购物车
    private void AddCart(int id)
    {
        #region 业务实体
        M_Products proinfo = bll.GetproductByid(id);
        M_Cart OData = new M_Cart();
        M_CartPros Cdata = new M_CartPros();
        M_Products Pdata = new M_Products();
        #endregion

        int Propeidsnum = proinfo.Propeid;//重载自选数量

        #region 初始化数据
        int Cid;
        string Cartusername;
        string Cartcartid;
        int Cartuserid;
        DateTime Cartaddtime;
        string Cartgetip;
        double Cartallmoney;
        int Cartpronum;
        int Userid = user.GetLogin().UserID;
        string UserName = user.GetLogin().UserName;
        #endregion

        #region 生成购物车编号
        if (HttpContext.Current.Request.Cookies["Shopby"] == null || HttpContext.Current.Request.Cookies["Shopby"]["OrderNo"] == null || HttpContext.Current.Request.Cookies["Shopby"]["OrderNo"] == "")
        {
            string OrderNo = "";
            OrderNo = "CT" + Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
            string TOrderNo = OrderNo.ToString();
            string aaa = StringHelper.MD5A(TOrderNo, 10, 6);
            string nowtime = DataConverter.CDate(hfComdate.Value).ToString();
            string bbb = StringHelper.MD5A(nowtime, 5, 10);
            string ccc = StringHelper.MD5A(UserName, 5, 10);
            string cartid = aaa + "-" + bbb + "-" + ccc;
            HttpContext.Current.Response.Cookies["Shopby"]["OrderNo"] = cartid;
        }

        string Cartno = HttpContext.Current.Request.Cookies["Shopby"]["OrderNo"];//重载
        #endregion

        #region 处理购物车数据(存在则更新，不存在则添加)
        /////添加判断是否存在此ID;
        DataTable Cart = ACl.FondCartno(Cartno);
        if (Cart.Rows.Count < 1)
        /////如果不存在
        {
            //////添加购物车///////
            OData.ID = 0;
            OData.Username = UserName.ToString();
            OData.Cartid = Cartno.ToString();
            OData.userid = Userid;
            OData.Addtime = DataConverter.CDate(hfComdate.Value);
            OData.AllMoney = 0;
            OData.Pronum = 0;
            ACl.Add(OData);

            DataTable Cartend = ACl.FondCartno(Cartno);
            if (Cartend.Rows.Count > 0)
            {
            
            }
                Cid = DataConverter.CLng(Cartend.Rows[0]["id"].ToString());

                Cartusername = Cartend.Rows[0]["Username"].ToString();
                Cartcartid = Cartend.Rows[0]["Cartid"].ToString();
                Cartuserid = DataConverter.CLng(Cartend.Rows[0]["Userid"].ToString());
                Cartaddtime = DataConverter.CDate(Cartend.Rows[0]["Addtime"].ToString());
                Cartgetip = Cartend.Rows[0]["Getip"].ToString();
                Cartallmoney = DataConverter.CDouble(Cartend.Rows[0]["AllMoney"].ToString());
                Cartpronum = DataConverter.CLng(Cartend.Rows[0]["Pronum"].ToString());
           
            ///////////////////////
        }
        ////否则
        else
        {
            //读取数据
            Cid = DataConverter.CLng(Cart.Rows[0]["id"].ToString());
            Cartusername = Cart.Rows[0]["Username"].ToString();
            Cartcartid = Cart.Rows[0]["Cartid"].ToString();
            Cartuserid = DataConverter.CLng(Cart.Rows[0]["Userid"].ToString());
            Cartaddtime = DataConverter.CDate(Cart.Rows[0]["Addtime"].ToString());
            Cartgetip = Cart.Rows[0]["Getip"].ToString();
            Cartallmoney = DataConverter.CDouble(Cart.Rows[0]["AllMoney"].ToString());
            Cartpronum = DataConverter.CLng(Cart.Rows[0]["Pronum"].ToString());

            //读取购物车ID
        }
        //////////////////以上为购物车信息////////////////
        #endregion

        double alljia = 0;
        //double s1 = 0;    //最小批发数量
        //double s2 = 0;
        //double s3 = 0;    //最小批发数量

        int shuliang = DataConverter.CLng(lblStock.Text);//重载

        alljia = proinfo.LinPrice * shuliang;

        #region 单件商品实体数据定义
        //单件商品信息
        Cdata.Addtime = DataConverter.CDate(hfComdate.Value);
        Cdata.CartID = Cid; //购物车ID
        Cdata.ProID = proinfo.ID;
        Cdata.Pronum = shuliang;///////数量
        Cdata.Shijia = proinfo.LinPrice;
        Cdata.Danwei = proinfo.ProUnit;
        Cdata.Proname = proinfo.Proname;
        Cdata.AllMoney = alljia;
        Cdata.Username = UserName;
        Cdata.Bindpro = "";//绑定的商品
        Cdata.ProSeller = proinfo.ProSeller;//
        if (!string.IsNullOrEmpty(Type))
        {
            int type = DataConverter.CLng(Type);
            Cdata.city = hfcity.Value;
            Cdata.type = type;
            if (type == 1)//酒店类型
            {
                Cdata.AllMoney = DataConverter.CDouble(lblAllMoney.Text);
                Cdata.Shijia = DataConverter.CDouble(lblPrice.Text);
            }

            if (type == 2)//航班类型
            {
                Cdata.AllMoney = DataConverter.CDouble(lblAllMoney.Text);
                Cdata.Shijia = DataConverter.CDouble(lblPrice.Text);
            }
            if (type == 3)
            {
                Cdata.PerID = Session["chNum"].ToString(); //儿童价格
                Cdata.Bindpro = hfProinfo.Value;   //内容ID
            }
        }

        #endregion
        int kucun = proinfo.Stock;

        //允许单独购买

        Cll.Add(Cdata);
        bll.ProUpStock(proinfo.ID, kucun);
        OData.ID = Cid;
        OData.Username = Cartusername.ToString();
        OData.Cartid = Cartcartid.ToString();
        OData.userid = DataConverter.CLng(Cartuserid);
        OData.Addtime = Cartaddtime;
        OData.AllMoney = Cartallmoney + alljia;
        OData.Pronum = Cartpronum + shuliang;
        ACl.Update(OData);
    }
    #endregion

    #region 添加航班/酒店/旅游信息(商品)
    /// <summary>
    /// 添加航班/酒店/旅游信息(商品)
    /// </summary>
    private int AddProduct()
    {
        int ComModelID = 0;
        if (Session["product"] != null)
        {
            M_Products CData = (M_Products)Session["product"];
            ComModelID = bll.AddCommodities(CData);
        }
        return ComModelID;
    }
    #endregion

    #endregion

    //绑定乘客信息
    protected void repPass_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfKey = e.Item.FindControl("hfKey") as HiddenField;
            Label lblName = e.Item.FindControl("lblName") as Label;
            Label lblCreType = e.Item.FindControl("lblCreType") as Label;
            Label lblCreID = e.Item.FindControl("lblCreID") as Label;
            Label lblTicType = e.Item.FindControl("lblTicType") as Label;

            if (Session["Passener"] != null)  //乘客信息
            {
                Dictionary<int, M_Passenger> pass = (Dictionary<int, M_Passenger>)Session["Passener"];
                foreach (int item in pass.Keys)
                {
                    if (item == DataConverter.CLng(hfKey.Value))
                    {
                        if (pass[item] != null)
                        {
                            lblName.Text = pass[item].Name != "" ? pass[item].Name : pass[item].Name_EN;
                            string[] types = GetType(pass[item].CreID);
                            if (types != null && types.Length > 1)
                            {
                                lblCreType.Text = GetCreType(types[0]);
                                lblCreID.Text = types[1];
                            }
                            lblTicType.Text = pass[item].TicType == 1 ? "成人票" : "儿童票";
                        }
                    }
                }
            }
        }
    }

    //命令
    protected void repPassener_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (repPassener != null && repPassener.Items.Count > 0)
        {
            AddSess();
        }
        if (e.CommandName == "Del")
        {
            if (Session["Passener"] != null)
            {
                Dictionary<int, M_Passenger> passener = (Dictionary<int, M_Passenger>)Session["Passener"];
                foreach (int item in passener.Keys)
                {

                    if (item == DataConverter.CLng(e.CommandArgument))
                    {
                        hfConstVlaue.Value = "";
                        for (int i = 0; i < cbConst.Items.Count; i++)
                        {
                            if (!cbConst.Items[i].Selected)
                            {
                                hfConstVlaue.Value += cbConst.Items[i].Value + ",";
                            }
                        }
                        hfConstVlaue.Value += passener[item].Id.ToString() + ",";
                        passener.Remove(item);
                        break;
                    }
                }
                Dictionary<int, M_Passenger> passenerNew = new Dictionary<int, M_Passenger>();
                int key = 1;
                foreach (M_Passenger item in passener.Values)
                {
                    passenerNew.Add(key, item);
                    key++;
                }
                Session["Passener"] = passenerNew;
                BindCb();
                bind();
            }
        }
        if (e.CommandName == "Add")
        {
            AddDic(1,0);
            bind();
        }
        //lblStock.Text = repPassener.Items.Count.ToString();
        AddSess();
    }

    //取消预订
    protected void btnCan_Click(object sender, EventArgs e)
    {
         Response.Redirect(SiteConfig.SiteInfo.SiteUrl);
    }

    //确认提交
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (DataConverter.CDouble(lblTip.Text) > 0)
        {
            lblAllMoney.Text = (DataConverter.CDouble(lblAllMoney.Text) - DataConverter.CDouble(lblTip.Text)).ToString();
        }
        string orderid = "";  //订单编号
        int comModelID = AddProduct();  //添加商品信息
        AddCart(comModelID);    //添加购物车
        string ids = "";
        if (Session["Passener"] != null)
        {
            Dictionary<int, M_Passenger> passener = (Dictionary<int, M_Passenger>)Session["Passener"];
            ids = AddPasser(passener);  //添加乘客或旅客
        }
        orderid = AddOrderinfo(ids);  //添加订单
        Response.Redirect("/OrderOver.aspx?OrderCode=" + orderid);
    }

    public string GetId(object re)
    {
        M_Passenger pas = (M_Passenger)re;
        if (pas != null)
        {
            return ((M_Passenger)re).Id.ToString();
        }
        else
        {
            return "0";
        }
    }

    protected void cbConst_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfConstVlaue.Value = "";
        Dictionary<int, M_Passenger> passener = new Dictionary<int, M_Passenger>();
        int j = 0;
        AddSess();
        Dictionary<int, M_Passenger> passenerNew = (Dictionary<int, M_Passenger>)Session["Passener"];
        for (int i = 0; i < cbConst.Items.Count; i++)
        {
            if (!cbConst.Items[i].Selected)
            {
                hfConstVlaue.Value += cbConst.Items[i].Value + ",";
            }
            else
            {
                M_Passenger pass = b_pass.GetSelectById(DataConverter.CLng(cbConst.Items[i].Value));
                passener.Add(j, pass);
                j++;
            }
        }
        int m = passener.Count;  //所有选择的用户
        if (passenerNew != null && passenerNew.Count > 0)
        {
            foreach (int item in passener.Keys)
            {
                foreach (M_Passenger val in passenerNew.Values)
                {
                    if (val.Id ==passener[item].Id)
                    {
                        m--;
                        break;
                    }
                }
            }
        }
        int[] keys = new int[m]; //放置将删除的key值
        if (passenerNew != null && passenerNew.Count > 0)
        {
            foreach (int item in passenerNew.Keys)
            {
                if (m > 0)
                {
                    bool res = string.IsNullOrEmpty(passenerNew[item].Name) && string.IsNullOrEmpty(passenerNew[item].Name_EN);
                    if (passenerNew[item] == null || (passenerNew[item].Id <= 0 && res))
                    {
                        keys[m - 1] = item;
                        m--;
                    }
                }
            }
        }

        if (passenerNew != null && passenerNew.Count > 0)
        {
            for (int n = 0; n < keys.Length; n++)
            {
                passenerNew.Remove(keys[n]);
            }
        }

        if (passenerNew != null && passenerNew.Count > 0)
        {
            foreach (int item in passenerNew.Keys)
            {
                if (passenerNew[item] == null || passenerNew[item].Id <= 0)
                {
                    passener.Add(j, passenerNew[item]);
                    j++;
                }
            }
        }
        Session["Passener"] = passener;
        bind();
        AddSess();
    }

    //使用抵用劵
    protected void btnUser_Click(object sender, EventArgs e)
    {
        lblTip.Visible = true;
        string no = txtArrive.Text.Trim();
        M_Arrive arrive = barr.GetArriveByNo(no);
        if (arrive != null && arrive.ID > 0)
        {
            if (arrive.State == 0)  //未使用
            {
                if (arrive.UserID == user.GetLogin().UserID)
                {
                    if (arrive.EndTime.CompareTo(DateTime.Now) > 0)
                    {
                        lblTip.Text = "优惠劵金额:" + arrive.Amount.ToString();
                        lblAllMoney.Text = (DataConverter.CDouble(lblAllMoney.Text) - arrive.Amount).ToString();
                        bool res = barr.GetUpdateState(arrive.ID);
                    }
                    else
                    {
                        lblTip.Text = "对不起,该优惠劵已过期!";
                    }
                }
                else
                {
                    lblTip.Text = "对不起,该优惠劵不属于您,您无权使用!";
                }
            }
            else
            {
                lblTip.Text = "该优惠劵已使用,请重新填写!";
            }
        }
        else
        {
            lblTip.Text = "不存在该优惠劵!";
        }
    }
    protected void ddType_SelectedIndexChanged(object sender, EventArgs e)
    {
        AddSess();
    }

    //保险价格
    protected void txt_TextChanged(object sender, EventArgs e)
    {
        //double insMon = DataConverter.CDouble(lblInsurance.Text);
        //int insNum = DataConverter.CLng(txtIns.Text);
        //lblAllMoney.Text = (DataConverter.CDouble(lblAllMoney.Text) - (insMon * insNum)).ToString();
        AddSess();
    }
}
