using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ZoomLa.BLL;
using ZoomLa.BLL.AlipayBank;
using ZoomLa.BLL.User.Develop;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.User.Develop;
using ZoomLa.SQLDAL;
namespace ZoomLa.WebSite.Shop
{
    public partial class PayOnline : System.Web.UI.Page
    {
        private M_Payment pinfo = new M_Payment();//支付信息，同于支付日志类,不过只记录用现金，银联等付款
        private M_PayPlat payPlat = new M_PayPlat();

        private B_PayPlat bll = new B_PayPlat();//支付平台
        private B_Delivier deliver = new B_Delivier();
        private B_Payment paymentBll = new B_Payment();
        private B_OrderList orderBll = new B_OrderList();//订单业务类
        private B_CartPro cartBll = new B_CartPro();//数据库中购物车业务类
        private B_Order_PayLog paylogBll = new B_Order_PayLog();//支付日志类,用于记录用户付款信息
        private M_Order_PayLog paylogMod = new M_Order_PayLog();
        private B_User buser = new B_User();
        private M_UserInfo info = new M_UserInfo();

        private string urlReq1 = "";//网站路径,用于设置返回页面
        private DataTable list = new DataTable();
        private DataTable ordertable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            B_User.CheckIsLogged();
            string url = Request.CurrentExecutionFilePath;
            urlReq1 = Request.Url.AbsoluteUri.ToString().Substring(0, Request.Url.AbsoluteUri.ToString().LastIndexOf('/'));
            string PayMethod = Request.QueryString["method"];
            if (string.IsNullOrEmpty(PayMethod))
            {
                string v_mid = "";                 //商户编号
                string v_url = "";                 //支付动作完成后返回到该url，支付结果以POST方式发送
                string MD5Key = "";        //MD5安全私钥
                decimal vmoney = 0;           //支付金额 
                string v_amount = "";              //实际支付金额
                int payPlatId = 0;           //支付平台ID
                string paymentNum = "";       //支付序号
                string selleremail = "";       //卖家email
                double delitype = 0;          //物流价格
                string deliname = "";           //物流方式
               
                int payid = DataConverter.CLng(Request.QueryString["PayID"]);

                pinfo = paymentBll.GetPamentByID(payid);
               
                DataTable orderDB1 = orderBll.GetOrderbyOrderNo(pinfo.PaymentNum);//订单表,ZL_OrderInfo
                int orderType = 0;
                if (orderDB1.Rows.Count>0)
                {
                    orderType = DataConvert.CLng(orderDB1.Rows[0]["OrderType"]);
                }
                if (orderType == 8)//有需要检测库存的订单类型，放此
                {
                    if (!cartBll.CheckStock(Convert.ToInt32(orderDB1.Rows[0]["OrderType"])))
                    {
                        function.WriteErrMsg("商品库存数量不足，请重新购买");
                    }
                }
                M_Payment paymentModel1 = paymentBll.GetPaymentByName(pinfo.PaymentNum);  //支付账单模型

                if (pinfo.IsNull)
                {
                    function.WriteErrMsg("<li>没有找到对应的支付信息</li>");
                }
                info = buser.GetLogin();
                list = Sql.Sel("ZL_User", "UserID=" + info.UserID, "");
                payPlatId = pinfo.PayPlatID;
                vmoney = pinfo.MoneyPay;
                v_amount = pinfo.MoneyTrue.ToString("f2");
                paymentNum = pinfo.PaymentNum;
                DataTable ordertable = orderBll.GetOrderbyOrderNo(paymentNum);
                int DeliveryID = 0; //送货方式ID

                if (ordertable != null && ordertable.Rows.Count > 0)
                {
                    DeliveryID = DataConverter.CLng(ordertable.Rows[0]["Delivery"]);
                }
                M_Delivier delivierinfo = deliver.GetDelivierByid(DeliveryID);

                delitype = delivierinfo.delitype;
                deliname = delivierinfo.deliname;
                payPlat = bll.GetPayPlatByid(payPlatId);
                if (pinfo.PayPlatID == 0 && !string.IsNullOrEmpty(pinfo.PlatformInfo))//支付宝网银支付 
                {
                    payPlat = bll.GetPayPlatByClassID("15");
                    alipayBank(pinfo.PlatformInfo);
                }
                if (!payPlat.IsNull)
                {
                    v_mid = payPlat.AccountID;
                    MD5Key = payPlat.MD5Key;
                    selleremail = payPlat.SellerEmail;
                }
                else
                {
                    function.WriteErrMsg("<li>没有找到对应的支付平台信息！</li>");
                }
                StringBuilder v_urlBuilder = new StringBuilder();    //构造返回URL
                StringBuilder strHiddenField = new StringBuilder();
                StringBuilder md5Builder = new StringBuilder();
                string applicationName = paymentBll.GetApplicationName();
                if (!applicationName.EndsWith("/"))
                {
                    applicationName = applicationName + "/";
                }
                v_urlBuilder.Append("http://");
                v_urlBuilder.Append(applicationName);
                int payclass = bll.GetPayPlatByid(payPlatId).PayClass;
                string v_ShowResultUrl = v_urlBuilder.ToString() + "PayOnline/ShowReturn.aspx?";
                string gateway = "";

                if (payclass == 100)
                {
                    display1.Visible = false;
                    SecPwd.Visible = false;
                    Cancel.Visible = false;
                    display2.Visible = true;
                    display3.Visible = false;
                    Title = "下单成功！";
                    display3.Visible = false;
                }
                else
                {
                    display1.Visible = true;
                    if (list.Rows.Count != 0)
                    {
                        string str = list.Rows[0]["seturl"].ToString();
                        string[] strarr = str.Split(',');
                        for (int i = 0; i <= strarr.Length - 1; i++)
                        {
                            if (strarr[i].ToLower() == url.ToLower())
                            {
                                SecPwd.Visible = true;
                            }
                        }
                    } 
                    display2.Visible = false;
                    display3.Visible = false;
                }
                switch (payclass)//现仅开通 12:支付宝即时到账和支付宝网银服务,15支付宝网银服务(上方代码中处理),银币与余额服务
                {
                    #region 各种支付方式
                    //case 1:    //支付宝即时到账
                    //    string urlReq = Request.Url.AbsoluteUri.ToString().Substring(0, Request.Url.AbsoluteUri.ToString().LastIndexOf('/'));
                    //    M_Alipay_config con = new M_Alipay_config(plat.SellerEmail, "www.baidu.com", "收款方");
                    //    gateway = "https://www.alipay.com/cooperate/gateway.do?";
                    //    //签约支付宝账号或卖家支付宝帐户
                    //    //con.Seller_email = "gxcyts@gmail.com";//
                    //    //付完款后跳转的页面 要用 http://格式的完整路径，不允许加?id=123这类自定义参数
                    //    con.Return_url = urlReq + "/AlipayReturn.aspx";
                    //    //交易过程中服务器通知的页面 要用 http://格式的完整路径，不允许加?id=123这类自定义参数
                    //    con.Notify_url = urlReq + "/AlipayNotify.aspx";
                    //    //收款方名称，如：公司名称、网站名称、收款人姓名等
                    //    // con.Mainname = "公司名称";
                    //    //网站商品的展示地址，不允许加?id=123这类自定义参数
                    //    //con.Show_url = urlReq + "/text.aspx";
                    //    string input_charset = con.Input_charset;
                    //    string notify_url = con.Notify_url;
                    //    string return_url = con.Return_url;
                    //    string show_url = con.Show_url;
                    //    string sign_type = con.Sign_type;
                    //    ///////////////////////以下参数是需要通过下单时的订单数据传入进来获得////////////////////////////////
                    //    //必填参数
                    //    DataTable orderDB = orderBll.GetOrderbyOrderNo(pinfo.PaymentNum);
                    //    M_Payment paymentModel = payment.GetPaymentByName(pinfo.PaymentNum);
                    //    string price = Convert.ToDouble(pinfo.MoneyTrue.ToString()).ToString();//订单总金额，显示在支付宝收银台里的“商品单价”里
                    //    string logistics_fee = "0.00";//物流费用，即运费。
                    //    string logistics_type = "POST";//物流类型，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
                    //    string logistics_payment = "SELLER_PAY";//物流支付方式，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
                    //    string out_trade_no = pinfo.PaymentNum;                    //请与贵网站订单系统中的唯一订单号匹配
                    //    string subject = pinfo.Remark;                          //订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
                    //    string body = pinfo.Remark;                   //订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里         		
                    //    string quantity = "1";              							//商品数量，建议默认为1，不改变值，把一次交易看成是一次下订单而非购买一件商品。
                    //    string receive_name = "";               //收货人姓名，如：张三
                    //    string receive_address = "";		                //收货人地址，如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
                    //    string receive_zip = "";             			    //收货人邮编，如：123456
                    //    string receive_phone = "";	    //收货人电话号码，如：0571-81234567
                    //    string receive_mobile = "";           		    //收货人手机号码，如：13312341234

                    //    if (orderDB.Rows.Count != 0)
                    //    {
                    //        M_Delivier delivlerModer = deliver.GetDelivierByid(Convert.ToInt32(orderDB.Rows[0]["Delivery"] + ""));
                    //        receive_name = orderDB.Rows[0]["Reuser"] + "";                 //收货人姓名，如：张三
                    //        receive_address = orderDB.Rows[0]["Jiedao"] + "";		                //收货人地址，如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
                    //        receive_zip = orderDB.Rows[0]["ZipCode"] + "";              			    //收货人邮编，如：123456
                    //        receive_phone = orderDB.Rows[0]["Phone"] + "";		    //收货人电话号码，如：0571-81234567
                    //        receive_mobile = orderDB.Rows[0]["MobileNum"] + "";            		    //收货人手机号码，如：13312341234
                    //        if (!String.IsNullOrEmpty(orderDB.Rows[0]["Delivery"] + ""))
                    //        {
                    //            price = ((Convert.ToDouble(price) * 100 - delivlerModer.delitype * 100)) / 100 + "";
                    //            logistics_fee = delivlerModer.delitype + "";
                    //            switch (orderDB.Rows[0]["Delivery"] + "")
                    //            {
                    //                case "2": logistics_type = "EMS"; break;
                    //                case "3": logistics_type = "EXPRESS"; break;
                    //            }
                    //        }
                    //    }
                    //    //扩展参数——第二组物流方式
                    //    //物流方式是三个为一组成组出现。若要使用，三个参数都需要填上数据；若不使用，三个参数都需要为空
                    //    //有了第一组物流方式，才能有第二组物流方式，且不能与第一个物流方式中的物流类型相同，
                    //    //即logistics_type="EXPRESS"，那么logistics_type_1就必须在剩下的两个值（POST、EMS）中选择
                    //    string logistics_fee_1 = "";                					//物流费用，即运费。
                    //    string logistics_type_1 = "";               					//物流类型，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
                    //    string logistics_payment_1 = "";           					    //物流支付方式，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）

                    //    //扩展参数——第三组物流方式
                    //    //物流方式是三个为一组成组出现。若要使用，三个参数都需要填上数据；若不使用，三个参数都需要为空
                    //    //有了第一组物流方式和第二组物流方式，才能有第三组物流方式，且不能与第一组物流方式和第二组物流方式中的物流类型相同，
                    //    //即logistics_type="EXPRESS"、logistics_type_1="EMS"，那么logistics_type_2就只能选择"POST"
                    //    string logistics_fee_2 = "";                					//物流费用，即运费。
                    //    string logistics_type_2 = "";               					//物流类型，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
                    //    string logistics_payment_2 = "";            					//物流支付方式，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
                    //    //扩展功能参数——其他
                    //    string buyer_email = "";                    					//默认买家支付宝账号
                    //    string discount = "";                       					//折扣，是具体的金额，而不是百分比。若要使用打折，请使用负数，并保证小数点最多两位数
                    //    /////////////////////////////////////////////////////////////////////////////////////////////////////
                    //    //构造请求函数，无需修改
                    //    B_Alipay_trade_service aliService = new B_Alipay_trade_service(
                    //    payPlat.AccountID,
                    //    payPlat.SellerEmail,
                    //    return_url,
                    //    notify_url,
                    //    show_url,
                    //    out_trade_no,
                    //    subject,
                    //    body,
                    //    price,
                    //    logistics_fee,
                    //    logistics_type,
                    //    logistics_payment,
                    //    quantity,
                    //    receive_name,
                    //    receive_address,
                    //    receive_zip,
                    //    receive_phone,
                    //    receive_mobile,
                    //    logistics_fee_1,
                    //    logistics_type_1,
                    //    logistics_payment_1,
                    //    logistics_fee_2,
                    //    logistics_type_2,
                    //    logistics_payment_2,
                    //    buyer_email,
                    //    discount,
                    //    payPlat.MD5Key,
                    //    input_charset,
                    //    sign_type);
                    //    this.LblHiddenValue.Text = aliService.Build_Form();
                    //    break;
                    //case 2: //快钱即时到帐
                    //    gateway = "https://www.99bill.com/gateway/recvMerchantInfoAction.htm";
                    //    //人民币网关账户号
                    //    ///请登录快钱系统获取用户编号，用户编号后加01即为人民币网关账户号。
                    //    string merchantAcctId = selleremail;
                    //    //人民币网关密钥
                    //    ///区分大小写.请与快钱联系索取
                    //    String key = MD5Key;
                    //    //字符集.固定选择值。可为空。
                    //    ///只能选择1、2、3.
                    //    ///1代表UTF-8; 2代表GBK; 3代表gb2312
                    //    ///默认值为1
                    //    string inputCharset = "1";
                    //    //接受支付结果的页面地址.与[bgUrl]不能同时为空。必须是绝对地址。
                    //    ///如果[bgUrl]为空，快钱将支付结果Post到[pageUrl]对应的地址。
                    //    ///如果[bgUrl]不为空，并且[bgUrl]页面指定的<redirecturl>地址不为空，则转向到<redirecturl>对应的地址
                    //    string pageUrl = v_ShowResultUrl;
                    //    v_urlBuilder.Append("PayOnline/PayResultAlipayInstant.aspx?");
                    //    v_url = v_urlBuilder.ToString();
                    //    //服务器接受支付结果的后台地址.与[pageUrl]不能同时为空。必须是绝对地址。
                    //    ///快钱通过服务器连接的方式将交易结果发送到[bgUrl]对应的页面地址，在商户处理完成后输出的<result>如果为1，页面会转向到<redirecturl>对应的地址。
                    //    ///如果快钱未接收到<redirecturl>对应的地址，快钱将把支付结果post到[pageUrl]对应的页面。
                    //    string bgUrl = v_url;
                    //    //网关版本.固定值
                    //    ///快钱会根据版本号来调用对应的接口处理程序。
                    //    ///本代码版本号固定为v2.0
                    //    string version = "v2.0";
                    //    //语言种类.固定选择值。
                    //    ///只能选择1、2、3
                    //    ///1代表中文；2代表英文
                    //    ///默认值为1
                    //    string language = "1";
                    //    //签名类型.固定值
                    //    ///1代表MD5签名
                    //    ///当前版本固定为1
                    //    string signType = "1";
                    //    //支付人姓名
                    //    ///可为中文或英文字符
                    //    string payerName = "payerName";
                    //    //支付人联系方式类型.固定选择值
                    //    ///只能选择1
                    //    ///1代表Email
                    //    string payerContactType = "1";
                    //    //支付人联系方式
                    //    ///只能选择Email或手机号
                    //    string payerContact = "";
                    //    //商户订单号
                    //    ///由字母、数字、或[-][_]组成
                    //    string orderId = paymentNum;// DateTime.Now.ToString("yyyyMMddHHmmss");
                    //    //订单金额
                    //    ///以分为单位，必须是整型数字
                    //    ///比方2，代表0.02元
                    //    double moneys = DataConverter.CDouble(v_amount);
                    //    moneys = moneys * 100;
                    //    string orderAmount = DataConverter.CLng(moneys).ToString();

                    //    //订单提交时间
                    //    ///14位数字。年[4位]月[2位]日[2位]时[2位]分[2位]秒[2位]
                    //    ///如；20080101010101
                    //    string orderTime = DateTime.Now.ToString("yyyyMMddHHmmss");
                    //    //商品名称
                    //    ///可为中文或英文字符
                    //    string productName = paymentNum;
                    //    //商品数量
                    //    ///可为空，非空时必须为数字
                    //    string productNum = "1";
                    //    //商品代码
                    //    ///可为字符或者数字
                    //    string productId = paymentNum;
                    //    //商品描述
                    //    string productDesc = pinfo.Remark;
                    //    //扩展字段1
                    //    ///在支付结束后原样返回给商户
                    //    string ext1 = paymentNum;
                    //    //扩展字段2
                    //    ///在支付结束后原样返回给商户
                    //    string ext2 = "";
                    //    //支付方式.固定选择值
                    //    ///只能选择00、10、11、12、13、14
                    //    ///00：组合支付（网关支付页面显示快钱支持的各种支付方式，推荐使用）10：银行卡支付（网关支付页面只显示银行卡支付）.11：电话银行支付（网关支付页面只显示电话支付）.12：快钱账户支付（网关支付页面只显示快钱账户支付）.13：线下支付（网关支付页面只显示线下支付方式）.14：B2B支付（网关支付页面只显示B2B支付，但需要向快钱申请开通才能使用）
                    //    string payType = "00";

                    //    //银行代码
                    //    ///实现直接跳转到银行页面去支付,只在payType=10时才需设置参数
                    //    ///具体代码参见 接口文档银行代码列表
                    //    string bankId = "";

                    //    //同一订单禁止重复提交标志
                    //    ///固定选择值： 1、0
                    //    ///1代表同一订单号只允许提交1次；0表示同一订单号在没有支付成功的前提下可重复提交多次。默认为0建议实物购物车结算类商户采用0；虚拟产品类商户采用1
                    //    string redoFlag = "0";

                    //    //快钱的合作伙伴的账户号
                    //    ///如未和快钱签订代理合作协议，不需要填写本参数
                    //    string pid = "";

                    //    //生成加密签名串
                    //    ///请务必按照如下顺序和规则组成加密串！
                    //    String signMsgVal = "";
                    //    signMsgVal = appendParam(signMsgVal, "inputCharset", inputCharset);
                    //    signMsgVal = appendParam(signMsgVal, "pageUrl", pageUrl);
                    //    signMsgVal = appendParam(signMsgVal, "bgUrl", bgUrl);
                    //    signMsgVal = appendParam(signMsgVal, "version", version);
                    //    signMsgVal = appendParam(signMsgVal, "language", language);
                    //    signMsgVal = appendParam(signMsgVal, "signType", signType);
                    //    signMsgVal = appendParam(signMsgVal, "merchantAcctId", v_mid);//merchantAcctId
                    //    signMsgVal = appendParam(signMsgVal, "payerName", payerName);
                    //    signMsgVal = appendParam(signMsgVal, "payerContactType", payerContactType);
                    //    signMsgVal = appendParam(signMsgVal, "payerContact", payerContact);
                    //    signMsgVal = appendParam(signMsgVal, "orderId", orderId);
                    //    signMsgVal = appendParam(signMsgVal, "orderAmount", orderAmount);
                    //    signMsgVal = appendParam(signMsgVal, "orderTime", orderTime);
                    //    signMsgVal = appendParam(signMsgVal, "productName", productName);
                    //    signMsgVal = appendParam(signMsgVal, "productNum", productNum);
                    //    signMsgVal = appendParam(signMsgVal, "productId", productId);
                    //    signMsgVal = appendParam(signMsgVal, "productDesc", productDesc);
                    //    signMsgVal = appendParam(signMsgVal, "ext1", ext1);
                    //    signMsgVal = appendParam(signMsgVal, "ext2", ext2);
                    //    signMsgVal = appendParam(signMsgVal, "payType", payType);
                    //    signMsgVal = appendParam(signMsgVal, "bankId", bankId);
                    //    signMsgVal = appendParam(signMsgVal, "redoFlag", redoFlag);
                    //    signMsgVal = appendParam(signMsgVal, "pid", pid);
                    //    signMsgVal = appendParam(signMsgVal, "key", key);
                    //    string signMsg = GetMD5(signMsgVal, "utf-8").ToUpper();

                    //    strHiddenField.Append("<input type='hidden' name='inputCharset' value='" + inputCharset + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='bgUrl' value='" + bgUrl + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='pageUrl' value='" + pageUrl + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='version' value='" + version + "' >\n");
                    //    strHiddenField.Append("<input type='hidden' name='language' value='" + language + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='signType' value='" + signType + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='signMsg' value='" + signMsg + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='merchantAcctId' value='" + v_mid + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='payerName' value='" + payerName + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='payerContactType' value='" + payerContactType + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='payerContact' value='" + payerContact + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='orderId' value='" + orderId + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name=\"orderAmount\" value=\"" + orderAmount + "\">\n");
                    //    strHiddenField.Append("<input type='hidden' name='orderTime' value='" + orderTime + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='productName' value='" + productName + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='productNum' value='" + productNum + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='productId' value='" + productId + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='productDesc' value='" + productDesc + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='ext1' value='" + ext1 + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='ext2' value='" + ext2 + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='payType' value='" + payType + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='bankId' value='" + bankId + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='redoFlag' value='" + redoFlag + "'>	\n");
                    //    strHiddenField.Append("<input type='hidden' name='pid' value='" + pid + "'>	\n");
                    //    strHiddenField.Append("<input type='hidden' name='Package' value='" + Request.QueryString["Package"] + "'>\n");
                    //    break;
                    case 3:    //银联在线
                        gateway = "https://pay3.chinabank.com.cn/PayGate?encoding=UTF-8";
                        //必要的交易信息
                        string wv_amount = v_amount;       // 订单金额
                        string wv_moneytype = "CNY";    // 币种
                        string wv_md5info;      // 对拼凑串MD5私钥加密后的值
                        string wv_mid = v_mid;		 // 商户号
                        //v_urlBuilder.Append("http://localhost:86/PayOnline/PayReceive.aspx?PayID=" +payid);
                        v_url = urlReq1 + "/PayReceive.aspx?PayID=" + payid;
                        string wv_url = v_url;		 // 返回页地址
                        string wv_oid = paymentNum;		 // 推荐订单号构成格式为 年月日-商户号-小时分钟秒
                        //两个备注

                        // wv_mid = "1001";				 商户号，这里为测试商户号20000400，替换为自己的商户号即可
                        // wv_url = "http://localhost/chinabank/Receive.aspx";  商户自定义返回接收支付结果的页面
                        // MD5密钥要跟订单提交页相同，如Send.asp里的 key = "test" ,修改""号内 test 为您的密钥
                        string wkey = MD5Key;				 // 如果您还没有设置MD5密钥请登陆我们为您提供商户后台，地址：https://merchant3.chinabank.com.cn/
                        // 登陆后在上面的导航栏里可能找到“B2C”，在二级导航栏里有“MD5密钥设置”
                        // 建议您设置一个16位以上的密钥或更高，密钥最多64位，但设置16位已经足够了
                        wv_amount = v_amount;       // 订单金额
                        wv_moneytype = "CNY";    // 币种
                        //对拼凑串MD5私钥加密后的值
                        wv_mid = v_mid;		 // 商户号
                        //v_url = v_ShowResultUrl;
                        wv_url = v_url;		 // 返回页地址
                        wv_oid = paymentNum;		 // 推荐订单号构成格式为 年月日-商户号-小时分钟秒

                        if (wv_oid == null || wv_oid.Equals(""))
                        {
                            DateTime dt = DateTime.Now;
                            string wv_ymd = dt.ToString("yyyyMMdd"); // yyyyMMdd
                            string wtimeStr = dt.ToString("HHmmss"); // HHmmss
                            wv_oid = wv_ymd + wv_mid + wtimeStr;
                        }
                        string text = wv_amount + wv_moneytype + wv_oid + wv_mid + wv_url + wkey; // 拼凑加密串
                        wv_md5info = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(text, "md5").ToUpper();
                        //收货信息
                        //wv_rcvname = Request["v_rcvname"];
                        //wv_rcvaddr = Request["v_rcvaddr"];
                        //wv_rcvtel = Request["v_rcvtel"];
                        //wv_rcvpost = Request["v_rcvpost"];
                        //wv_rcvemail = Request["v_rcvemail"];
                        //wv_rcvmobile = Request["v_rcvmobile"];
                        //订货人信息
                        //wv_ordername = Request["v_ordername"];
                        //wv_orderaddr = Request["v_orderaddr"];
                        //wv_ordertel = Request["v_ordertel"];
                        //wv_orderpost = Request["v_orderpost"];
                        //wv_orderemail = Request["v_orderemail"];
                        //wv_ordermobile = Request["v_ordermobile"];
                        //wremark1 = Request["remark1"];
                        //wremark2 = Request["remark2"];
                        strHiddenField.Append("<input type='hidden' name='v_md5info' value='" + wv_md5info + "'>\n");
                        strHiddenField.Append("<input type='hidden' name='v_mid' value='" + wv_mid + "'>\n");
                        strHiddenField.Append("<input type='hidden' name='v_oid' value='" + wv_oid + "'>\n");
                        strHiddenField.Append("<input type='hidden' name='v_amount' value='" + wv_amount + "' >\n");
                        strHiddenField.Append("<input type='hidden' name='v_moneytype' value='" + wv_moneytype + "'>\n");
                        strHiddenField.Append("<input type='hidden' name='v_url' value='" + wv_url + "'>\n");
                    //    //以下几项只是用来记录客户信息，可以不用，不影响支付 
                    //    strHiddenField.Append("<input type='hidden' name='v_rcvname' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_rcvaddr' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_rcvtel' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_rcvpost' value='" + "" + "' >\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_rcvemail' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_rcvmobile' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_ordername' value='" + "" + "' >\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_orderaddr' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_ordertel' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_orderpost' value='" + "" + "' >\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_orderemail' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='v_ordermobile' value='" + "" + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='Package' value='" + Request.QueryString["Package"] + "'>\n");
                        break;
                    //case 4:    //财付通在线支付
                    //    gateway = "http://service.tenpay.com/cgi-bin/v3.0/payservice.cgi";
                    //    //商户号
                    //    string bargainor_id = v_mid;
                    //    //密钥
                    //    string keey = MD5Key;
                    //    //当前时间 yyyyMMdd
                    //    string date = DateTime.Now.ToString("yyyyMMdd");

                    //    //生成订单10位序列号，此处用时间和随机数生成，商户根据自己调整，保证唯一
                    //    string strReq = "" + DateTime.Now.ToString("HHmmss") + tenpay.TenpayUtil.BuildRandomStr(4);

                    //    //商户订单号，不超过32位，财付通只做记录，不保证唯一性
                    //    string sp_billno = strReq;

                    //    //财付通订单号，10位商户号+8位日期+10位序列号，需保证全局唯一
                    //    string transaction_id = bargainor_id + date + strReq;

                    //    //创建PayRequestHandler实例
                    //    tenpay.PayRequestHandler reqHandler = new tenpay.PayRequestHandler(Context);

                    //    //设置密钥
                    //    reqHandler.setKey(keey);

                    //    //初始化
                    //    reqHandler.init();

                    //    //-----------------------------
                    //    //设置支付参数
                    //    //-----------------------------
                    //    reqHandler.setParameter("bargainor_id", bargainor_id);			//商户号
                    //    reqHandler.setParameter("sp_billno", paymentNum);				//商家订单号
                    //    reqHandler.setParameter("transaction_id", transaction_id);		//财付通交易单号
                    //    reqHandler.setParameter("return_url", v_ShowResultUrl);				//支付通知url
                    //    reqHandler.setParameter("desc", "订单号：" + paymentNum);	//商品名称
                    //    reqHandler.setParameter("attach", "payclass=" + payclass + "||payid=" + payid);	//商家数据包，原样返回
                    //    reqHandler.setParameter("total_fee", (DataConverter.CDouble(v_amount) * 100).ToString());						//商品金额,以分为单位
                    //    //用户ip,测试环境时不要加这个ip参数，正式环境再加此参数
                    //    reqHandler.setParameter("spbill_create_ip", Page.Request.UserHostAddress);

                    //    //获取请求带参数的url
                    //    string requestUrl = reqHandler.getRequestURL();
                    //    //string a_link = "<a target=\"_blank\" href=\"" + requestUrl + "\">" + "财付通支付" + "</a>";
                    //    //Response.Write(a_link);
                    //    //get实现方式
                    //    reqHandler.getRequestURL();
                    //    //Response.Write("<form method=\"get\" action=\"" + reqHandler.getGateUrl() + "\" >\n");
                    //    Hashtable ht = reqHandler.getAllParameters();
                    //    foreach (DictionaryEntry de in ht)
                    //    {
                    //        strHiddenField.Append("<input type=\"hidden\" name=\"" + de.Key + "\" value=\"" + de.Value + "\" >");
                    //        //Response.Write("<input type=\"hidden\" name=\"" + de.Key + "\" value=\"" + de.Value + "\" >\n");
                    //    }
                    //    //Response.Write("<input type=\"submit\" value=\"财付通支付\" >\n</form>\n");
                    //    //获取debug信息
                    //    //string debuginfo = reqHandler.getDebugInfo();
                    //    //Response.Write("<br/>" + debuginfo + "<br/>");
                    //    //重定向到财付通支付
                    //    //reqHandler.doSend();

                    //    //string porNum = v_mid;
                    //    //string total_fee = v_amount;
                    //    //string desc = v_mid;
                    //    //spbill_create_ip = System.Net.Dns.GetHostAddresses(System.Net.Dns.GetHostName())[0].ToString();
                    //    //attach = transaction_id;
                    //    ////连接sign签名规则顺序
                    //    //sign = "cmdno=" + cmdno + "&date=" + Date + "&bargainor_id=" + bargainor_id
                    //    //+ "&transaction_id=" + Transaction_id + "&sp_billno=" + sp_billno + "&total_fee="
                    //    //+ total_fee + "&fee_type=" + fee_type + "&return_url=" + return_url + "&attach=" + Attach + "&spbill_create_ip=" + spbill_create_ip + "&key=" + keys;
                    //    //sign = MD5Encrypt(sign, keys);
                    //    //gateway = "http://service.tenpay.com/cgi-bin/v3.0/payservice.cgi";
                    //    ////strHiddenField.Append("<form method=\"post\" action=\"http://service.tenpay.com/cgi-bin/v3.0/payservice.cgi\">");
                    //    //strHiddenField.Append("<input type='hidden' name='cmdno' value='" + cmdno + "'/>\n");
                    //    //strHiddenField.Append("<input type='hidden' name='date'  value='" + date + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='bank_type'   value='" + bank_type + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='desc'  value='" + desc + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden'name='purchaser_id'  value='" + purchaser_id + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='bargainor_id'  value='" + bargainor_id + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='transaction_id'  value='" + transaction_id + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='sp_billno'  value='" + sp_billno + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='total_fee'  value='" + total_fee + "'/>\n");
                    //    //strHiddenField.Append("<input type='hidden' name='fee_type'  value='" + fee_type + "'/>\n");
                    //    //strHiddenField.Append("<input type='hidden' name='return_url' value='http://localhost/tenpayApp/return_url.aspx' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='attach'  value='" + attach + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='spbill_create_ip'  value='" + spbill_create_ip + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='cs'  value='" + cs + "' />\n");
                    //    //strHiddenField.Append("<input type='hidden' name='sign'  value='" + sign + "' />\n");
                    //    break;
                    //case 6:
                    //    gateway = "https://www.yeepay.com/app-merchant-proxy/node";
                    //    string p1_MerId = "10000432521";           //商家ID
                    //    string keyValue = "8UPp0KE8sq73zVP370vko7C39403rtK1YwX40Td6irH216036H27Eb12792t";  // 商家密钥
                    //    // 商户订单号,选填.
                    //    //若不为""，提交的订单号必须在自身账户交易中唯一;为""时，易宝支付会自动生成随机的商户订单号.
                    //    string p2_Order = paymentNum;
                    //    // 支付金额,必填.
                    //    //单位:元，精确到分.    
                    //    string p3_Amt = v_amount;
                    //    string p4_Cur = "CNY";                   //交易币种,固定值"CNY".
                    //    string p5_Pid = paymentNum;              //商品名称   //用于支付时显示在易宝支付网关左侧的订单产品信息.
                    //    string p6_Pcat = paymentNum;            //商品种类
                    //    string p7_Pdesc = "商品描述";           //商品描述
                    //    string p8_Url = v_ShowResultUrl;     //商户接收支付成功数据的地址,支付成功后易宝支付会向该地址发送两次成功通知.
                    //    string p9_SAF = "0";                          //送货地址  //为“1”: 需要用户将送货地址留在易宝支付系统;为“0”: 不需要，默认为 ”0”.
                    //    string pa_MP = "商户扩展信息";                         //商户扩展信息           //商户可以任意填写1K 的字符串,支付成功时将原样返回.
                    //    string pd_FrpId = "";                               //银行编码 //默认为""，到易宝支付网关.若不需显示易宝支付的页面，直接跳转到各银行、神州行支付、骏网一卡通等支付页面，该字段可依照附录:银行列表设置参数值.
                    //    string pr_NeedResponse = "1";                //应答机制 //为"1": 需要应答机制;为"0": 不需要应答机制.
                    //    string hmac = com.yeepay.Buy.CreateBuyUrl(p1_MerId, keyValue, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse);
                    //    strHiddenField.Append("<input type='hidden' name='p1_MerId' value='" + p1_MerId + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p2_Order' value='" + p2_Order + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p3_Amt' value='" + p3_Amt + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p4_Cur' value='" + p4_Cur + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p5_Pid' value='" + p5_Pid + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p6_Pcat' value='" + p6_Pcat + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p7_Pdesc' value='" + p7_Pdesc + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p8_Url' value='" + p8_Url + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='p9_SAF' value='" + p9_SAF + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='pa_MP' value='" + pa_MP + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='pd_FrpId' value='" + pd_FrpId + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='pr_NeedResponse' value='" + pr_NeedResponse + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='hmac' value='" + hmac + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='Package' value='" + Request.QueryString["Package"] + "'>\n");
                    //    break;
                    //case 9:
                    //    gateway = "https://payment.chinapay.com/pay/TransGet";
                    //    // 支付交易
                    //    ZoomLa.Components.BankPay bp = new ZoomLa.Components.BankPay();
                    //    bp.PayChecked(v_amount, "http://" + Request.Url.Authority + "/UnionPay/Chinapay_Bgreturn.aspx", "http://" + Request.Url.Authority + "/UnionPay/Chinapay_Pgreturn.aspx", pinfo.PaymentID.ToString(), paymentNum);
                    //    bp.GotoBankPage(strHiddenField);
                    //    break;
                    //case 10://盛付通
                    //    //gateway = "http://pre.netpay.sdo.com/PayGate/ibankpay.aspx";//测试环境请求地址
                    //    gateway = "http://netpay.sdo.com/paygate/default.aspx";//正式环境请求地址
                    //    string Version = "3.0";//1.接口版本号
                    //    string Amount = Convert.ToString(v_amount);//2.订单金额，小数点后保留两位小数
                    //    string OrderNo = paymentNum;//3.商户订单号，最多32位，商户需保证其唯一性，不能为空
                    //    string MerchantNo = v_mid;//4.商户号，6位数字，每位商户有唯一商户号，由盛大技术人员提供。不能为空
                    //    string MerchantUserId = "";//5.商户系统的用户名，最多50位。非必须。
                    //    string PayChannel = "04";//6.显示的支付渠道。只能传商户支持的渠道,多个用逗号隔开，不传显示所有支持渠道。03:盛大卡支付;04:网上银行支付。更多支付类型参考"商户开发规格.doc"。必需。
                    //    string PostBackUrl = "http://" + Request.Url.Authority + "/PayOnline/PostBack.aspx";//7.支付成功返回页面(用户可见)，将回发返回数据，必需
                    //    string NotifyUrl = "http://" + Request.Url.Authority + "/PayOnline/Notify.aspx";//8.服务器通知地址:支付成功(底层，用户不可见)，服务端通知商户发货地址，必需
                    //    string BackUrl = "";//9.重新发起订单的页面：用户取消或修改订单的页面，非必需
                    //    string OrderTime = System.DateTime.Now.ToString("yyyyMMddHHmmss");//10.下单时间。必须为14位数字，格式为yyyyMMddHHmmss(20090717141755),年4位数字，月日时分秒各两位，"时"为24小时制
                    //    string CurrencyType = "RMB";//11.货币类型。必需传入“RMB”，即人民币。
                    //    string NotifyUrlType = "http";//12.服务器通知地址类型:支付成功，服务端通知商户发货地址NotifyUrl的类型，必需。可为：http,tcp,https等
                    //    string SignType = "1";//13.签名类型。1：RSA,2：MD5。必需，建议使用RSA
                    //    string ProductNo = paymentNum;// 14.产品编号。商户定义，最多32位，非必须,回调时会传回给商户
                    //    string ProductDesc = paymentNum;//15.产品描述。商户定义，最多128字。非必须,回调时会传回给商户
                    //    string Remark1 = "Remark1";//16.备注1,回调时会传回给商户
                    //    string Remark2 = "Remark2";//17.备注2,回调时会传回给商户
                    //    string BankCode = "SDTBNK";//18.银行编码
                    //    string DefaultChannel = "04";//19.默认支付渠道
                    //    string ProductUrl = "";// "http://" + Request.Url.Authority + "/PayOnline/PayOnline.aspx";//20.产品展示地址
                    //    string MAC = "";//21.签名。将上面的字段按顺序连接成一个字符串,并使用SignType所指定的方式签名,签名方法见“接口组件使用说明”
                    //    //签名。将上面的字段按顺序连接成一个字符串,并使用SignType所指定的方式签名. 
                    //    string originStr = Version + Amount + OrderNo + MerchantNo + MerchantUserId + PayChannel + PostBackUrl + NotifyUrl + BackUrl + OrderTime + CurrencyType + NotifyUrlType + SignType + ProductNo + ProductDesc + Remark1 + Remark2 + BankCode + DefaultChannel + ProductUrl;
                    //    if (SignType == "1")
                    //    {
                    //        //rsa签名，使用盛大提供的签名组件签名
                    //        //商户用自己的私钥签名,对应公钥可以从商户后台上传至盛大数据库
                    //        MAC = new RSASign.SDRSASign().Sign(originStr);
                    //    }
                    //    else if (SignType == "2")
                    //    {
                    //        //md5签名,使用FCL类库中MD5CryptoServiceProvider进行签名，商户与盛大使用相同的密钥(eKey)，商户可在后台修改此密钥
                    //        string eKey = "your_md5_key";
                    //        MAC = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(originStr + eKey, System.Web.Configuration.FormsAuthPasswordFormat.MD5.ToString());
                    //    }
                    //    //验证签名是否有效
                    //    //Response.Write(new RSASign.SDRSASign().VerifySign(originStr, MAC));
                    //    strHiddenField.Append("\r<input type=\"hidden\" name=\"Version\" id=\"Version\" value=\"" + Version + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"Amount\" id=\"Amount\" value=\"" + Amount + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"OrderNo\" id=\"OrderNo\" value=\"" + OrderNo + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"MerchantNo\" id=\"MerchantNo\" value=\"" + MerchantNo + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"MerchantUserId\" id=\"MerchantUserId\" value=\"" + MerchantUserId + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"PayChannel\" id=\"PayChannel\" value=\"" + PayChannel + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"PostBackUrl\" id=\"PostBackUrl\" value=\"" + PostBackUrl + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"NotifyUrl\" id=\"NotifyUrl\" value=\"" + NotifyUrl + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"BackUrl\" id=\"BackUrl\" value=\"" + BackUrl + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"OrderTime\" id=\"OrderTime\" value=\"" + OrderTime + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"CurrencyType\" id=\"CurrencyType\" value=\"" + CurrencyType + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"NotifyUrlType\" id=\"NotifyUrlType\" value=\"" + NotifyUrlType + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"SignType\" id=\"SignType\" value=\"" + SignType + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"ProductNo\" id=\"ProductNo\" value=\"" + ProductNo + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"ProductDesc\" id=\"ProductDesc\" value=\"" + ProductDesc + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"Remark1\" id=\"Remark1\" value=\"" + Remark1 + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"Remark2\" id=\"Remark2\" value=\"" + Remark2 + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"BankCode\" id=\"BankCode\" value=\"" + BankCode + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"DefaultChannel\" id=\"DefaultChannel\" value=\"" + DefaultChannel + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"ProductUrl\" id=\"ProductUrl\" value=\"" + ProductUrl + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" name=\"MAC\" id=\"MAC\" value=\"" + MAC + "\" />\r");
                    //    strHiddenField.Append("<input type=\"hidden\" id=\"actionurl\" value=\"" + gateway + "\" />\r");
                    //    break;
                    //case 11://paypal
                    //    gateway = "https://www.paypal.com/cgi-bin/webscr";

                    //    //strHiddenField.Append("<input type='image' src='https://www.sandbox.paypal.com/en_US/i/logo/paypal_logo.gif' border='0' name='submit' alt='PayPal is the safer, easier way to pay - PayPal'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='cmd' value='_xclick'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='business' value='" + selleremail + "'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='item_name' value='BoAo International Trading '>\n");  //商品名
                    //    strHiddenField.Append("<input type='hidden' name='item_number' value='" + pinfo.PaymentNum + "'>\n"); // 订单号
                    //    strHiddenField.Append("<input type='hidden' name='amount' value='" + v_amount + "'>\n");  //价格
                    //    strHiddenField.Append("<input type='hidden' name='quantity' value='1'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='currency_code' value='USD'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='cancel_return' value='http://127.0.0.1:761/manage'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='return' value='http://zoomla.cn'>\n");
                    //    strHiddenField.Append("<input type='hidden' name='Package' value='" + Request.QueryString["Package"] + "'>\n");
                    //    break;
                    case 12://支付宝[即时到帐](正在用的)
                        //M_Alipay_config con1 = new M_Alipay_config(payPlat.SellerEmail, "win01:86", "收款方");
                        M_Alipay_config con1 = new M_Alipay_config(urlReq1 + "AlipayReturn.aspx");
                        gateway = "https://www.alipay.com/cooperate/gateway.do?";
                        //签约支付宝账号或卖家支付宝帐户
                        con1.Seller_email = payPlat.SellerEmail;
                        //付完款后跳转的页面 要用 http://格式的完整路径，不允许加?id=123这类自定义参数
                        con1.Return_url = urlReq1 + "/AlipayReturn.aspx";
                        //付完款后服务器AJAX通知的页面 要用 http://格式的完整路径，不允许加?id=123这类自定义参数
                        con1.Notify_url = urlReq1 + "/AlipayNotify.aspx";
                        //收款方名称，如：公司名称、网站名称、收款人姓名等
                        // con.Mainname = "公司名称";
                        //网站商品的展示地址，不允许加?id=123这类自定义参数
                        //con.Show_url = urlReq + "/text.aspx";
                        string input_charset1 = con1.Input_charset;
                        string notify_url1 = con1.Notify_url;
                        string return_url1 = con1.Return_url;
                        string show_url1 = con1.Show_url;
                        string sign_type1 = con1.Sign_type;
                        ///////////////////////以下参数是需要通过下单时的订单数据传入进来获得////////////////////////////////
                        //必填参数
                        string price1 = Convert.ToDouble(pinfo.MoneyTrue.ToString()).ToString();//订单总金额，显示在支付宝收银台里的“商品单价”里
                        string logistics_fee1 = "0.00";//物流费用，即运费。
                        string logistics_type1 = "POST";//物流类型，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
                        string logistics_payment1 = "SELLER_PAY";//物流支付方式，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
                        string out_trade_no1 = pinfo.PaymentNum;                    //请与贵网站订单系统中的唯一订单号匹配
                        string subject1 = pinfo.Remark;                          //订单名称，显示在支付宝收银台里的“商品名称”里，显示在支付宝的交易管理的“商品名称”的列表里。
                        string body1 = pinfo.Remark;                   //订单描述、订单详细、订单备注，显示在支付宝收银台里的“商品描述”里         		
                        string quantity1 = "1";              							//商品数量，建议默认为1，不改变值，把一次交易看成是一次下订单而非购买一件商品。
                        string receive_name1 = "";               //收货人姓名，如：张三
                        string receive_address1 = "";		                //收货人地址，如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
                        string receive_zip1 = "";             			    //收货人邮编，如：123456
                        string receive_phone1 = "";	    //收货人电话号码，如：0571-81234567
                        string receive_mobile1 = "";           		    //收货人手机号码，如：13312341234

                        if (orderDB1.Rows.Count != 0)
                        {
                            M_Delivier delivlerModer = deliver.GetDelivierByid(Convert.ToInt32(orderDB1.Rows[0]["Delivery"] + ""));
                          string  receive_name = orderDB1.Rows[0]["Reuser"] + "";                 //收货人姓名，如：张三
                          string receive_address = orderDB1.Rows[0]["Jiedao"] + "";		                //收货人地址，如：XX省XXX市XXX区XXX路XXX小区XXX栋XXX单元XXX号
                          string receive_zip = orderDB1.Rows[0]["ZipCode"] + "";              			    //收货人邮编，如：123456
                          string receive_phone = orderDB1.Rows[0]["Phone"] + "";		    //收货人电话号码，如：0571-81234567
                          string receive_mobile = orderDB1.Rows[0]["MobileNum"] + "";            		    //收货人手机号码，如：13312341234
                            if (!String.IsNullOrEmpty(orderDB1.Rows[0]["Delivery"] + ""))
                            {
                                string price = ((Convert.ToDouble(price1) * 100 - delivlerModer.delitype * 100)) / 100 + "";
                                string logistics_fee = delivlerModer.delitype + "";
                                //string logistics_type = "";
                                //switch (orderDB1.Rows[0]["Delivery"] + "")
                                //{
                                //    case "2": logistics_type = "EMS"; break;
                                //    case "3": logistics_type = "EXPRESS"; break;
                                //}
                            }
                        }
                        //扩展参数——第二组物流方式
                        //物流方式是三个为一组成组出现。若要使用，三个参数都需要填上数据；若不使用，三个参数都需要为空
                        //有了第一组物流方式，才能有第二组物流方式，且不能与第一个物流方式中的物流类型相同，
                        //即logistics_type="EXPRESS"，那么logistics_type_1就必须在剩下的两个值（POST、EMS）中选择
                        string logistics_fee_3 = "";                					//物流费用，即运费。
                        string logistics_type_3 = "";               					//物流类型，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
                        string logistics_payment_3 = "";           					    //物流支付方式，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）

                        //扩展参数——第三组物流方式
                        //物流方式是三个为一组成组出现。若要使用，三个参数都需要填上数据；若不使用，三个参数都需要为空
                        //有了第一组物流方式和第二组物流方式，才能有第三组物流方式，且不能与第一组物流方式和第二组物流方式中的物流类型相同，
                        //即logistics_type="EXPRESS"、logistics_type_1="EMS"，那么logistics_type_2就只能选择"POST"
                        string logistics_fee_4 = "";                					//物流费用，即运费。
                        string logistics_type_4 = "";               					//物流类型，三个值可选：EXPRESS（快递）、POST（平邮）、EMS（EMS）
                        string logistics_payment_4 = "";            					//物流支付方式，两个值可选：SELLER_PAY（卖家承担运费）、BUYER_PAY（买家承担运费）
                        //扩展功能参数——其他
                        string buyer_email1 = "";                    					//默认买家支付宝账号
                        string discount1 = "";                       					//折扣，是具体的金额，而不是百分比。若要使用打折，请使用负数，并保证小数点最多两位数
                        /////////////////////////////////////////////////////////////////////////////////////////////////////
                        //构造请求函数，无需修改
                        B_AliPay_trades_Services aliService1 = new B_AliPay_trades_Services(
                        payPlat.AccountID,
                        payPlat.SellerEmail,
                        return_url1,
                        notify_url1,
                        show_url1,
                        out_trade_no1,
                        subject1,
                        body1,
                        price1,
                        logistics_fee1,
                        logistics_type1,
                        logistics_payment1,
                        quantity1,
                        receive_name1,
                        receive_address1,
                        receive_zip1,
                        receive_phone1,
                        receive_mobile1,
                        logistics_fee_3,
                        logistics_type_3,
                        logistics_payment_3,
                        logistics_fee_4,
                        logistics_type_4,
                        logistics_payment_4,
                        buyer_email1,
                        discount1,
                        payPlat.MD5Key,
                        input_charset1,
                        sign_type1);
                        this.LblHiddenValue.Text = aliService1.Build_Form();
                        break;
                    //#region 汇付天下
                    //case 13:
                    //    //gateway = "http://test.chinapnr.com/gar/OnlineBuyTrans.do";   //测试环境时
                    //    gateway = "http://mas.chinapnr.com/gar/OnlineBuyTrans.do";      //生产环境时
                    //    string MsgData;
                    //    string ChkValue = "";

                    //    Version = "10";                             //版本号
                    //    string CmdId = "buy";                       //消息类型
                    //    string UsrId = payPlat.AccountID;              //用户号
                    //    string OrdId = pinfo.PaymentID.ToString();  //订单号
                    //    string OrdAmt = v_amount;                   //订单金额
                    //    string GateId = "";                         //银行ID
                    //    string UsrMp = "";                          //购买者手机号
                    //    string MerPriv = "";                        //商户私有域
                    //    string Key = payPlat.MD5Key;                   //商户配置的key

                    //    MsgData = Version + CmdId + UsrId + OrdId + OrdAmt + GateId + UsrMp + MerPriv + Key;
                    //    System.Security.Cryptography.MD5CryptoServiceProvider MD5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                    //    byte[] data = MD5.ComputeHash(Encoding.Default.GetBytes(MsgData));
                    //    StringBuilder sBuilder = new StringBuilder();
                    //    for (int i = 0; i < data.Length; i++)
                    //    {
                    //        sBuilder.Append(data[i].ToString("x2"));
                    //    }
                    //    ChkValue = sBuilder.ToString().ToUpper();

                    //    strHiddenField.Append("<input type='hidden' id='Version' name='Version' Value='" + Version + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='CmdId' name='CmdId' Value='" + CmdId + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='OrdId' name='OrdId' Value='" + OrdId + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='OrdAmt' name='OrdAmt' Value='" + OrdAmt + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='UsrMp' name='UsrMp' Value='" + UsrMp + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='UsrId' name='UsrId' Value='" + UsrId + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='MerPriv' name='MerPriv' Value='" + MerPriv + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='GateId' name='GateId' Value='" + GateId + "' />");
                    //    strHiddenField.Append("<input type='hidden' id='ChkValue' name='ChkValue' Value='" + ChkValue + "' />");
                    //    break;
                    //#endregion
                //    case 14:
                //        gateway =SiteConfig.BankComm.BankcommUrl;//"http://pay.2011.hx008.com/Merchant.aspx";// SiteConfig.BankComm.BankcommUrl;//https://pbanktest.95559.com.cn/netpay/MerPayB2C";//正式环境请求地址
                //        string interfaceVersion = "1.0.0.0";//1.消息版本号固定填写 1.0.0.0
                //        string merID = Convert.ToString(v_mid);//2.商户客户号,商户客户号是银行生成的 15位编号 
                //        string orderid = paymentNum;//3.订单号 商户应保证 3个月以上的唯一性，不能为空
                //        string orderDate = System.DateTime.Now.ToString("yyyyMMdd");// v_mid;//4.商户订单日期 
                //        string JorderTime = System.DateTime.Now.ToString("HHmmss");//5.商户系统的用户名，最多50位。非必须。
                //        string tranType = "0";//6.交易类别 。必需。
                //        string amount = v_amount;// 订单金额 
                //        string curType = "CNY";//11.货币类型。必需传入“RMB”，即人民币。 
                //        string orderContent = "";//9.订单内容
                //        string orderMono ="";//10.商家备注 
                //        string phdFlag = "";//11.物流配送标志 0 非物流 1 物流配送 
                //        string notifyType = "0";//12.通知方式  0 不通知 1 通知 2 转页面   
                //        string merURL = "";//主动通知 URL,为空则不发通知  
                //        string goodsURL ="http://" + Request.Url.Authority + "/PayOnline/PostJBack.aspx" ;//13.取货 URL,为空则不显示按钮，不自动跳转  返回地址
                //        string jumpSeconds = "";// 14.自动跳转时间,等待 n秒后自动跳转取货 URL；若不填写则表示不自动跳转  
                //        string payBatchNo = "";//15.商户批次号,商家可填入自己的批次号，对账使用   
                //        string proxyMerName = "";//16.代理商家名称,二级商户编号/或证件号码  
                //        string proxyMerType = "";//17.代理商家证件类型,  备注2,回调时会传回给商户
                //        string proxyMercredentials = "";//18.代理商家证件号码   银行编码
                //        string netType = "0";//19.渠道编号,固定填 0:（html渠道） 
                //        string merSignMsg  = "";//21. 0:（html渠道） 
                //       string issBankNo  = jhBankCode.Text;//发卡行行号
                //        string tranCode = "cb2200_sign";
                //        //签名。将上面的字段按顺序连接成一个字符串,并使用SignType所指定的方式签名. 
                    
                        
                //    string strss=  "<div class='cashier-bank long-logo ' sizcache='1' sizset='5'>"
                //                        +"        <div>选择支付银行</div>"
                //                        +"        <ul class='ui_bank' sizcache='1' sizset='5'>"
                //                        +"            <li class='cashier-bank '>"
                //                        +"                <input name='issBankNo' id='cd_1' type='radio' value='BOCOM' checked='checked' />"
                //                        +"              <label class='icon-box' >"
                //                        +"                   <span title='中国交通银行' class='icon BOCOM'></span>"
                //                        +"                   <span class='bank-name'>文本 - 中国交通银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"           <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio1' type='radio' value='ICBC'/>"
                //                        +"               <label class='icon-box' >"
                //                        +"                   <span title='中国工商银行' class='icon ICBC'></span>"
                //                        +"                   <span class='bank-name'>文本 - 中国工商银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"            <li class='cashier-bank '>"
                //                        +"              <input name='issBankNo' id='Radio2' type='radio' value='CCB'/>"
                //                        +"                <label class='icon-box' >"
                //                        +"                   <span title='中国建设银行' class='icon CCB'></span>"
                //                        +"                   <span class='bank-name'>文本 - 中国建设银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"              <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio15' type='radio' value='ABC'/>"
                //                        +"               <label class='icon-box' >"
                //                        +"                   <span title='中国农业银行' class='icon ABC'></span>"
                //                        +"                   <span class='bank-name'>文本 - 中国农业银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"              <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio3' type='radio' value='BOC'/>"
                //                        +"               <label class='icon-box' >"
                //                        +"                   <span title='中国银行大额' class='icon BOC'></span>"
                //                        +"                   <span class='bank-name'>文本 - 中国银行大额</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"             <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio4' type='radio' value='BOCSH'/>"
                //                        +"               <label class='icon-box' >"
                //                        +"                   <span title='中国银行' class='icon BOCSH'></span>"
                //                        +"                   <span class='bank-name'>文本 - 中国银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"             <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio5' type='radio' value='CMB'/>"
                //                        +"               <label class='icon-box' >"
                //                        +"                   <span title='中国招商银行' class='icon CMB'></span>"
                //                        +"                   <span class='bank-name'>文本 - 中国招商银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"            <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio6' type='radio' value='SPDB'/>"
                //                        +"              <label class='icon-box' >"
                //                        +"                  <span title='浦发银行' class='icon SPDB'></span>"
                //                        +"                   <span class='bank-name'>文本 - 浦发银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"              <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio7' type='radio' value='GDB'/>"
                //                        +"               <label class='icon-box' >"
                //                        +"                   <span title='广发银行' class='icon GDB'></span>"
                //                        +"                   <span class='bank-name'>文本 - 广发银行</span>"
                //                        +"               </label>"
                //                        +"             </li>"
                //                        +"           <li class='cashier-bank '>"
                //                        +"               <input name='issBankNo' id='Radio8' type='radio' value='PSBC'/>"
                //                        +"               <label class='icon-box' >"
                //                        +"                    <span title='中国邮政储蓄银行' class='icon PSBC'></span>"
                //                        +"                    <span class='bank-name'>文本 - 中国邮政储蓄银行</span>"
                //                        +"                </label>"
                //                        +"            </li>"
                //                        +"            <li class='cashier-bank '>"
                //                        +"              <input name='issBankNo' id='Radio9' type='radio' value='CNCB'/>"
                //                        +"              <label class='icon-box' >"
                //                        +"                  <span title='中信银行' class='icon CNCB'></span>"
                //                        +"                  <span class='bank-name'>文本 - 中信银行</span>"
                //                        +"              </label>"
                //                        +"            </li>"
                //                        +"           <li class='cashier-bank '>"
                //                        +"              <input name='issBankNo' id='Radio10' type='radio' value='CEB'/>"
                //                        +"              <label class='icon-box' >"
                //                        +"                  <span title='中国光大银行' class='icon CEB'></span>"
                //                        +"                  <span class='bank-name'>文本 - 中国光大银行</span>"
                //                        +"              </label>"
                //                        +"            </li> "
                //                        +"           <li class='cashier-bank '>"
                //                        +"              <input name='issBankNo' id='Radio14' type='radio' value='HXB'/>"
                //                        +"              <label class='icon-box' >"
                //                        +"                  <span title='华夏银行' class='icon HXB'></span>"
                //                        +"                  <span class='bank-name'>文本 - 华夏银行</span>"
                //                        +"              </label>"
                //                        +"            </li>"
                //                        +"           <li class='cashier-bank '>"
                //                        +"              <input name='issBankNo' id='Radio11' type='radio' value='CMBC'/>"
                //                        +"              <label class='icon-box' >"
                //                        +"                  <span title='中国民生银行' class='icon CMBC'></span>"
                //                        +"                  <span class='bank-name'>文本 - 中国民生银行</span>"
                //                        +"              </label>"
                //                        +"            </li>"
                //                        +"           <li class='cashier-bank '>"
                //                        +"              <input name='issBankNo' id='Radio12' type='radio' value='CIB'/>"
                //                        +"              <label class='icon-box' >"
                //                        +"                  <span title='兴业银行' class='icon CIB'></span>"
                //                        +"                  <span class='bank-name'>文本 - 兴业银行</span>"
                //                        +"              </label>"
                //                        +"            </li>"
                //                        +"           <li class='cashier-bank '>"
                //                        +"              <input name='issBankNo' id='Radio13' type='radio' value='OTHERS'/>"
                //                        +"             <label class='icon-box' >"
                //                        +"                 <span title='其他银行' class='icon OTHERS'></span>"
                //                        +"                 <span class='bank-name'>文本 - 其他银行</span>"
                //                        +"             </label>"
                //                        +"           </li>"
                //                        +"     </ul>"
                //                        +" </div> ";//"发卡行行号: <input type=\"text\" disabled=\"disabled\" id=\"issBankNo\"name=\"issBankNo\"  value=\"" + issBankNo + "\" />不输默认为交行<br />";
                ////验证签名是否有效
                ////Response.Write(new RSASign.SDRSASign().VerifySign(originStr, MAC));
                //strHiddenField.Append("\r<input type=\"hidden\" name=\"interfaceVersion\" id=\"interfaceVersion\" value=\"" + interfaceVersion + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"orderid\" id=\"orderid\" value=\"" + orderid + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"merID\" id=\"merID\" value=\"" + merID + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"orderDate\" id=\"orderDate\" value=\"" + orderDate + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"orderTime\" id=\"orderTime\" value=\"" + JorderTime + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"tranType\" id=\"tranType\" value=\"" + tranType + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"amount\" id=\"amount\" value=\"" + amount + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"curType\" id=\"curType\" value=\"" + curType + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"orderContent\" id=\"orderContent\" value=\"" + orderContent + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"orderMono\" id=\"orderMono\" value=\"" + orderMono + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"phdFlag\" id=\"phdFlag\" value=\"" + phdFlag + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"notifyType\" id=\"notifyType\" value=\"" + notifyType + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"merURL\" id=\"merURL\" value=\"" + merURL + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"goodsURL\" id=\"goodsURL\" value=\"" + goodsURL + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"jumpSeconds\" id=\"jumpSeconds\" value=\"" + jumpSeconds + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"payBatchNo\" id=\"payBatchNo\" value=\"" + payBatchNo + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"proxyMerName\" id=\"proxyMerName\" value=\"" + proxyMerName + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"proxyMerType\" id=\"proxyMerType\" value=\"" + proxyMerType + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" name=\"proxyMerCredentials\" id=\"proxyMerCredentials\" value=\"" + proxyMercredentials + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" id=\"netType\"name=\"netType\"  value=\"" + netType + "\" />\r");
                //strHiddenField.Append("<input type=\"hidden\" id=\"merSignMsg\"name=\"merSignMsg\" />\r");
                //strHiddenField.Append(strss+"\r");//<input type=\"hidden\" id=\"issBankNo\"name=\"issBankNo\"  value=\"" + issBankNo + "\" />
              
                //        break; 
                    case 100:
                        gateway = "/";
                        zfpt.Text = payPlat.PayPlatName;
                        ddh.Text = pinfo.PaymentNum;
                        zfje.Text = Convert.ToDecimal(vmoney).ToString("F2") + " 元";
                        sxf.Text = payPlat.Rate.ToString() + " %";
                        sjhbje.Text = v_amount + " 元";
                        break;
                    #endregion
                }
                if (gateway != "https://www.alipay.com/cooperate/gateway.do?")
                {
                    string endFrom;
                    string newForm = "\r<form method=\"post\" action=\"" + gateway + "\" id=\"form1\" name=\"form1\" target=\"_blank\">";
                    if (gateway == "https://www.paypal.com/cgi-bin/webscr")
                    {
                        endFrom = "<input type=\"image\" src=\"../../Skin/blue/Images/paypal.gif\" border=\"0\" name=\"submit\" alt=\"PayPal is the safer, easier way to pay - PayPal\"> </form>";
                    }
                    else
                    {
                        endFrom = "\r<input type=\"submit\" id=\"submit\" value=\"确认支付\" /></form>";
                    }
                    string m_HiddenValue = newForm + strHiddenField.ToString() + endFrom;
                    LblHiddenValue.Text = m_HiddenValue;
                }
                //给页面赋值
                LblPayPlatform.Text = payPlat.PayPlatName;
                LblOid.Text = pinfo.PaymentNum;
                LblPayMoney.Text = Convert.ToDecimal(vmoney).ToString("F2") + " 元";
                LblRate.Text = payPlat.Rate.ToString() + " %";
                LblvMoney.Text = v_amount + " 元";
                LblvMoney.Visible = false;
                Confirm.Visible = false;
            }
            else//非现金支付,给用户显示确认支付页,实际支付行为在Confirm_Click
            {
                LblvMoney.Visible = true;
                this.aa.Visible = false;
                this.bb.Visible = false;
                display1.Visible = true;
                display2.Visible = false;
                display3.Visible = false;
                ActualAmount1.Visible = false;
                this.Paymoney.Visible = true;
                this.Paymoney2.Visible = false;

                if (list.Rows.Count != 0)
                {
                    string str = list.Rows[0]["seturl"].ToString();
                    string[] strarr = str.Split(',');
                    for (int i = 0; i <= strarr.Length - 1; i++)
                    {
                        if (strarr[i].ToLower() == url.ToLower())
                        {
                            SecPwd.Visible = true;
                        }
                    }
                }

                this.LblOid.Text = Request["OrderCode"];
                this.Plat.Text = "支付方式：";
                B_User buser = new B_User();
                buser.CheckIsLogin();
                string OrderCode = buser.GetLogin().Purse.ToString();
                M_UserInfo mui = new M_UserInfo();
                mui = buser.GetLogin();
                string uordmount = "";
                string type = Request["type"];
                DataTable dt = new DataTable();
                M_OrderList mol = new M_OrderList();
                dt = orderBll.GetOrderbyOrderNo(Request["OrderCode"]);
                if (dt.Rows[0]["Paymentstatus"].ToString() != "1")
                {
                    if (dt.Rows.Count < 1)
                        dt = orderBll.GetOrderbyOrderNo(Request["OrderCode"]);
                    if (dt != null && !string.IsNullOrEmpty(dt.Rows[0]["id"].ToString()))
                    {
                        if (dt.Rows.Count > 0 && dt != null && !string.IsNullOrEmpty(dt.Rows[0]["id"].ToString()))
                        {
                            int orderid = DataConverter.CLng(dt.Rows[0]["id"]);
                            mol = orderBll.GetOrderListByid(orderid);
                            uordmount = Convert.ToDecimal(mol.Ordersamount).ToString("F2");
                            string id = string.Empty;
                            this.Label1.Text = uordmount + " 元";
                            this.LblvMoney.Text = this.Label1.Text;
                            switch (PayMethod)
                            {
                                case "Purse":
                                    this.Titles.Text = "余额支付操作（确认支付款项)";
                                    this.Fee.Text = "帐户剩余金额:";
                                    this.LblRate.Text = mui.Purse + "元";
                                    this.LblPayPlatform.Text = "帐户余额支付";
                                    break;
                                case "SilverCoin":
                                    this.Titles.Text = "银币支付操作（确认支付款项)";
                                    this.Fee.Text = "帐户剩余银币：";
                                    this.LblRate.Text = mui.SilverCoin + "元";
                                    this.LblPayPlatform.Text = "账户银币支付";
                                    break;
                            }
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Script", "<script>document.getElementById('pay_con').innerHTML='<div id=noOrder>此订单不存在!</div>';</script>");
                        }
                    }
                    else
                    {
                        display1.Visible = false;
                        SecPwd.Visible = false;
                        display2.Visible = false;
                        display3.Visible = true;
                        Confirm.Visible = false;
                    }
                }
            }
        }
        //余额,银币确认支付
        protected void Confirm_Click(object sender, EventArgs e)
        {
            string paymethod1 = Request["Method"];
            if (SecPwd.Visible == true)
            {
                M_UserInfo info = buser.GetLogin();
                string PWD = Second.Text;
                if (StringHelper.MD5(PWD) == info.PayPassWord)
                {
                    pay(paymethod1);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Script", "<script>alert('二级密码错误,请重新输入！');</script>");
                    return;
                }
            }
            else
            {
                pay(paymethod1);
            }
        }
        //余额与银币支付
        protected void pay(string payed)
        {
            M_UserInfo mui =  buser.GetLogin();
            DataTable dtt = new DataTable();
            DataTable dt = orderBll.GetOrderbyOrderNo(Request["OrderCode"]);//订单表
            int orderlistID = Convert.ToInt32(dt.Rows[0]["ID"]);
            M_OrderList orderMod = orderBll.SelReturnModel(orderlistID);

            //-----------------------付前检测区域
            //订单状态检测
            if (Convert.ToInt32(dt.Rows[0]["PayMentStatus"]) == 1)
            {
                function.WriteErrMsg("该订单已支付过，不能重复付款!");
            }
            else if (orderMod.Ordertype == 8)//需要检测库存的商品,如有任意一项不足，则订单不允许进行,主用于云购
            {
                if (!cartBll.CheckStock(orderMod.id))
                {
                    function.WriteErrMsg("商品库存数量不足，请重新购买");
                }
            }
            //-----------------------

            M_OrderList mol = new M_OrderList();
            if (dt.Rows.Count < 1)
                dt = orderBll.GetOrderbyOrderNo(Request["OrderCode"]);
            if (dt != null && !string.IsNullOrEmpty(dt.Rows[0]["id"].ToString()))
            {
                int orderid = DataConverter.CLng(dt.Rows[0]["id"]);
                mol = orderBll.GetOrderListByid(orderid);
                this.ActualAmount.Visible = false;
                paylogMod.AddTime = DateTime.Now;
                paylogMod.UserID = mui.UserID;
                switch (payed)
                {
                    case "Purse":
                        if (mui.Purse >= mol.Ordersamount)
                        {
                            mui.Purse = mui.Purse - mol.Ordersamount;
                            buser.UpDateUser(mui);
                            mol.Paymentstatus = 1;
                            mol.Receivablesamount = mol.Ordersamount;
                            mol.AddTime = DateTime.Now;
                            if (orderBll.Update(mol))
                            {
                                M_UserExpDomP hist = new M_UserExpDomP();
                                hist.UserID = mui.UserID;
                                hist.Operator = mol.Userid;
                                hist.Detail = "会员" + mol.Rename + "的商城订单" + mol.OrderNo + "[购买生效]，扣除金额-" + Convert.ToDecimal(mol.Ordersamount).ToString("F2");
                                hist.Score = 0 - Convert.ToDouble(Convert.ToDecimal(mol.Ordersamount).ToString("F2"));
                                hist.OperatorIP = Request.UserHostAddress;
                                hist.HisTime = DateTime.Now;
                                B_History.GetInsert(hist);
                                paylogMod.OrderID = mol.id;
                                paylogMod.PayMethod = (int)M_Order_PayLog.PayMethodEnum.Purse;
                                paylogMod.PayMoney = mol.Ordersamount;
                                paylogMod.Remind = "商城订单" + mol.OrderNo + "购买生效";
                                paylogMod.PayMethod = (int)M_Order_PayLog.PayMethodEnum.Purse;

                                zfpt.Text = "余额";
                                ddh.Text = Request["OrderCode"];
                                zfje.Text = Convert.ToDecimal(mol.Ordersamount).ToString("F2") + " 元";
                                sjhbje.Text = mol.Ordersamount + " 元";
                                fees.Text = "所剩余额";
                                sxf.Text = mui.Purse + " 元";
                            }
                        }
                        else
                        {
                            function.WriteErrMsg("用户金币不足！ 请<a href='/PayOnline/SelectPayPlat.aspx' target='_blank' style='margin-left:5px;color:#f00;'>充值 ！</a>");
                        }
                        break;
                    case "SilverCoin":
                        if (mui.SilverCoin >= mol.Ordersamount)
                        {
                            mui.SilverCoin = mui.SilverCoin - mol.Ordersamount;
                            buser.UpDateUser(mui);
                            mol.Paymentstatus = 1;
                            mol.Receivablesamount = mol.Ordersamount;
                            mol.AddTime = DateTime.Now;
                            if (orderBll.Update(mol))
                            {
                                M_UserCoinHis hist = new M_UserCoinHis();
                                hist.UserID = mui.UserID;
                                hist.Operator = mol.Userid;
                                hist.detail = "会员" + mol.Rename + "的商城订单" + mol.OrderNo + "[购买生效]，扣除银币-" + Convert.ToDecimal(mol.Ordersamount).ToString("F2");
                                hist.SilverCoin = 0 - Convert.ToDouble(Convert.ToDecimal(mol.Ordersamount).ToString("F2"));
                                hist.OperatorIP = Request.UserHostAddress;
                                hist.HisTime = DateTime.Now;
                                B_History.AddCoinHis(hist);
                                paylogMod.OrderID = mol.id;
                                paylogMod.PayMethod = (int)M_Order_PayLog.PayMethodEnum.Silver;
                                paylogMod.PayMoney = mol.Ordersamount;
                                paylogMod.Remind = "商城订单" + mol.OrderNo + "购买生效";
                                paylogMod.PayMethod = (int)M_Order_PayLog.PayMethodEnum.Silver;
                                zfpt.Text = "银币";
                                ddh.Text = Request["OrderCode"];
                                zfje.Text = Convert.ToDecimal(mol.Ordersamount).ToString("F2") + " 元";
                                sjhbje.Text = mol.Ordersamount + " 元";
                                this.fees.Text = "剩余银币";
                                sxf.Text = mui.SilverCoin + " 元";
                            }
                        }
                        else
                        {
                            function.WriteErrMsg("银币不足！请使用<a href='/User/Info/ExchangeSilverCoin.aspx'  target='_blank' style='margin-left:5px;color:#f00;'>积分兑换</a>！");
                        }
                        break;
                }
                //-----------------------付款后处理区域
                display1.Visible = false;
                display2.Visible = true;
                display3.Visible = false;
                SecPwd.Visible = false;
                Confirm.Visible = false;
                Cancel.Visible = false;

                paylogMod.AddTime = DateTime.Now;
                paylogMod.UserID = buser.GetLogin().UserID;
                paylogMod.OrderID = orderMod.id;
                paylogMod.PayMoney = orderMod.Ordersamount;
                paylogMod.PayPlatID = 0;

                FinalStep(orderMod);//支付成功后处理步步骤,允许操作paylogMod

                paylogBll.insert(paylogMod);
                //-----------------------
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Script", "<script>document.getElementById('pay_con').innerHTML='<div id=noOrder>此订单不存在!</div>';</script>");
            }
        }
        //支付宝网银支付
        public void alipayBank(string bankName) 
        {
            B_Alipay_Bank_Submit sub = new B_Alipay_Bank_Submit();//网银专用
            //-------------------支付宝网银支付
            ////////////////////////////////////////////请求参数////////////////////////////////////////////
            //支付类型
            string payment_type = "1";
            //必填，不能修改
            //服务器异步通知页面路径
            string notify_url = urlReq1 + "/AlipayReturn.aspx";
            //需http://格式的完整路径，不能加?id=123这类自定义参数
            //页面跳转同步通知页面路径
            string return_url = urlReq1 + "/AlipayNotify.aspx";
            //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
            //卖家支付宝帐户
            string seller_email = payPlat.SellerEmail;
            //必填
            //商户订单号
            string out_trade_no = pinfo.PaymentNum;
            //商户网站订单系统中唯一订单号，必填
            //订单名称
            string subject = pinfo.Remark;
            //必填
            //付款金额
            string total_fee = Convert.ToDouble(pinfo.MoneyTrue.ToString()).ToString();
            //订单描述
            string body = pinfo.Remark;
            //默认支付方式
            string paymethod = "bankPay";
            //必填
            //默认网银
            string defaultbank = bankName;
            //必填，银行简码请参考接口技术文档

            //商品展示地址
            string show_url = pinfo.PaymentNum;
            //需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html

            //防钓鱼时间戳
            string anti_phishing_key = "";
            //若要使用请调用类文件submit中的query_timestamp函数
            //客户端的IP地址
            string exter_invoke_ip = "";
            //非局域网的外网IP地址，如：221.0.0.1
            ////////////////////////////////////////////////////////////////////////////////////////////////

            //把请求参数打包成数组
            SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
            sParaTemp.Add("partner", payPlat.AccountID.Trim());
            sParaTemp.Add("_input_charset", "utf-8");
            sParaTemp.Add("service", "create_direct_pay_by_user");
            sParaTemp.Add("payment_type", payment_type);
            sParaTemp.Add("notify_url", notify_url);
            sParaTemp.Add("return_url", return_url);
            sParaTemp.Add("seller_email", seller_email);
            sParaTemp.Add("out_trade_no", out_trade_no);
            sParaTemp.Add("subject", subject);
            sParaTemp.Add("total_fee", total_fee);
            sParaTemp.Add("body", body);
            sParaTemp.Add("paymethod", paymethod);//支付方式,  string paymethod = "bankPay";
            sParaTemp.Add("defaultbank", defaultbank);//银行
            sParaTemp.Add("show_url", show_url);
            sParaTemp.Add("anti_phishing_key", anti_phishing_key);
            sParaTemp.Add("exter_invoke_ip", exter_invoke_ip);
            //建立请求
            string sHtmlText = sub.BuildRequest(sParaTemp, "get", "确认");
            Response.Write(sHtmlText);
        }
        //金币与Purse支付完成后处,淘宝等在回调页面AlipayReturn处理
        public void FinalStep(M_OrderList mod) 
        {
            if (mod.Ordertype == (int)M_OrderList.OrderEnum.Domain)//域名订单
            {
                orderBll.UpOrderinfo("OrderStatus=1", mod.id);
                Response.Redirect("~/Plugins/Domain/DomReg2.aspx?OrderNo=" + mod.OrderNo);
            }
            else if (mod.Ordertype == (int)M_OrderList.OrderEnum.IDC)//IDC服务
            {
                orderBll.UpOrderinfo("OrderStatus=1", mod.id);
                cartBll.UpdateByOrderListID(mod.id, DateTime.Now.ToString());
                remindHtml.Text = "<span>付款成功--></span><a style='color:red;' href='/Plugins/Domain/ViewHave.aspx' title='已购服务'>点击查看已购服务</a><br />";
            }
            else if((mod.Ordertype == (int)M_OrderList.OrderEnum.IDCRen))//IDC服务续费
            {
                B_Product proBll=new B_Product();
                //更新旧订单的期限
                if (string.IsNullOrEmpty(mod.Ordermessage))
                {
                    function.WriteErrMsg("出错,无需续费订单信息,请联系管理员!!!");
                }
                M_CartPro newCartMod=cartBll.SelModByOrderID(mod.id);
                M_Product proMod = proBll.GetproductByid(newCartMod.ProID);
                //更新延长旧服务的到期时间，旧服务是存在CartPro的EndTime当中

                M_CartPro oldCartMod = cartBll.SelReturnModel(Convert.ToInt32(mod.Ordermessage));
                if (oldCartMod.EndTime < DateTime.Now) oldCartMod.EndTime = DateTime.Now;//如已过期，则将时间更新至今日
                oldCartMod.EndTime = proBll.GetEndTime(proMod,newCartMod.Pronum,oldCartMod.EndTime);
                cartBll.UpdateByID(oldCartMod);
                paylogMod.Remind = "为" + mod.Ordermessage + "订单续费(购物车)";
                remindHtml.Text = "<span>付款成功--></span><a style='color:red;' href='/Plugins/Domain/ViewHave.aspx' title='已购服务'>点击查看已购服务</a><br />";
            }
            else if (mod.Ordertype == (int)M_OrderList.OrderEnum.Cloud)//云购订单
            {
                //根据份数生成幸运码,写入表中,并减去库存 ZL_Order_LuckCode
                remindHtml.Text = "<span style='color:red;'>付款成功,你的云购幸运码是<br/>" + orderBll.CreateLuckCode(mod) + "</span>";
            }
            else//其他旅游订单等,只更新状态
            {
                orderBll.UpOrderinfo("OrderStatus=99", mod.id);//成功的订单
            }
        }

        #region 功能支持方法
        //功能函数。将变量值不为空的参数组成字符串
        String appendParam(String returnStr, String paramId, String paramValue)
        {
            if (returnStr != "")
            {
                if (paramValue != "")
                {
                    returnStr += "&" + paramId + "=" + paramValue;
                }
            }
            else
            {
                if (paramValue != "")
                {
                    returnStr = paramId + "=" + paramValue;
                }
            }
            return returnStr;
        }
        //功能函数。将变量值不为空的参数组成字符串。结束
        /// <summary>
        /// 生成随机字符串，返回值是由参数pwdchars中的字符组成
        /// </summary>
        public string MakeRandomString(string pwdchars, int pwdlen)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            for (int i = 0; i < pwdlen; i++)
            {
                int num = random.Next(pwdchars.Length);
                builder.Append(pwdchars[num]);
            }
            return builder.ToString();
        }
        private string GetMD5(string encypStr)
        {
            string retStr;
            System.Security.Cryptography.MD5CryptoServiceProvider m5 = new System.Security.Cryptography.MD5CryptoServiceProvider();

            //创建md5对象
            byte[] inputBye;
            byte[] outputBye;

            //使用GB2312编码方式把字符串转化为字节数组．
            inputBye = Encoding.GetEncoding("gb2312").GetBytes(encypStr);

            outputBye = m5.ComputeHash(inputBye);

            retStr = System.BitConverter.ToString(outputBye);
            retStr = retStr.Replace("-", "").ToUpper();
            return retStr;
        }
        private string GetMD5(string dataStr, string codeType)
        {
            System.Security.Cryptography.MD5 md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] t = md5.ComputeHash(System.Text.Encoding.GetEncoding(codeType).GetBytes(dataStr));
            System.Text.StringBuilder sb = new System.Text.StringBuilder(32);
            for (int i = 0; i < t.Length; i++)
            {
                sb.Append(t[i].ToString("x").PadLeft(2, '0'));
            }
            return sb.ToString();
        }
        #endregion
    }
}