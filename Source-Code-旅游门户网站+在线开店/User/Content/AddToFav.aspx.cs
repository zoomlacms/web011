namespace ZoomLa.WebSite.User.Content
{
    using System;
    using System.Data;
    using System.Configuration;
    using System.Collections;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;
    using ZoomLa.BLL;
    using ZoomLa.Common;
    using ZoomLa.Model;
    public partial class AddToFav : System.Web.UI.Page
    {
        protected M_UserInfo muser = new M_UserInfo();
        protected B_User buser = new B_User();
        protected M_Favorite mfave = new M_Favorite();
        protected B_Favorite bfave = new B_Favorite();
        protected DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            buser.CheckIsLogin();
            if (!this.Page.IsPostBack)
            {
                if (!IsPostBack)
                {
                    string itemid = !string.IsNullOrEmpty(Request.Form["itemid"]) ? Request.Form["itemid"] : Request.QueryString["itemid"];  //收藏内容ID
                    string Url = !string.IsNullOrEmpty(Request.Form["Url"]) ? Request.Form["Url"] : Request.QueryString["Url"];   //收藏内容URl
                    string type = !string.IsNullOrEmpty(Request.Form["type"]) ? Request.Form["type"] : Request.QueryString["type"];  //收藏类型
                    string Content = !string.IsNullOrEmpty(Request.Form["Content"]) ? Request.Form["Content"] : Request.QueryString["Content"];  //收藏内容相关ID
                    if (!string.IsNullOrEmpty(itemid))
                    {
                        int InfoId = DataConverter.CLng(itemid);
                        int userId = buser.GetLogin().UserID;
                        mfave.AddDate = DateTime.Now;
                        mfave.Owner = userId;
                        mfave.InfoID = InfoId;
                        mfave.FavItemID = Content;
                        mfave.FavoriType = DataConverter.CLng(type);
                        mfave.FavUrl = BaseClass.CheckInjection(Url);
                        dt = bfave.SelBy(mfave);
                        if (dt != null && dt.Rows.Count > 0)
                        {
				             function.WriteSuccessMsg("提示：该信息此前已被加入收藏夹! 本页面10秒后自动关闭...也可点击这里手工[<a href=\"javascript:window.close();\">关闭</a>]", Url);
                        }
                        else
                        {
                             bfave.AddFavorite(mfave);
                             function.WriteSuccessMsg("恭喜！该内容成功添加到您的收藏夹了！本页面10秒后自动关闭...也可点击这里手工[<a href=\"javascript:window.close();\">关闭</a>]", Url);
                        }
                    }
                    else
                    {
                        function.WriteErrMsg("没有指定要添加到收藏夹的内容ID");
                    }
                }
            }
        }
    }
}