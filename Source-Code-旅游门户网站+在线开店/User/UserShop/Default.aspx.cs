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
using ZoomLa.Components;
using ZoomLa.SQLDAL;

public partial class User_UserShop_Default : System.Web.UI.Page
{
    #region 业务对象
    B_ModelField mfbll = new B_ModelField();
    B_Content cbll = new B_Content();
    B_User ubll = new B_User();
    B_Model bmll = new B_Model();
    B_StoreStyleTable sstbll = new B_StoreStyleTable();
    protected B_Sensitivity sll = new B_Sensitivity();
    #endregion

    #region 初始化页面
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (SiteConfig.SiteOption.IsMall)
            {
                this.MultiView1.ActiveViewIndex = 0;
                GetInit();
            }
            else
            {
                this.MultiView1.ActiveViewIndex = 1;
            }
        }
    }
    #endregion

    #region 页面方法
    private int gid
    {
        get
        {
            if (ViewState["gid"] != null)
                return int.Parse(ViewState["gid"].ToString());
            else
                return 0;
        }
        set
        {
            gid = value;
        }
    }
    //初始化
    private void GetInit()
    {
        DataTable shopinfo = mfbll.SelectTableName("ZL_CommonModel", "where tablename like 'ZL_Store_%' and Inputer='" + ubll.GetLogin().UserName + "'");
        
        if (shopinfo.Rows.Count < 1)
        {
            Response.Redirect("StoreApply.aspx");//申请店铺
        }
        else
        {

            ViewState["gid"] = shopinfo.Rows[0]["GeneralID"].ToString();
            this.Label2.Text = "<a href=\"/Store/StoreIndex.aspx?id=" + shopinfo.Rows[0]["GeneralID"].ToString() + "\" target=\"_blank\">浏览店铺</a>";
            if (shopinfo.Rows[0]["Status"].ToString() != "99")
            {
                Response.Redirect("StoreEdit.aspx");
            }
            else
            {
                int id = Convert.ToInt32(shopinfo.Rows[0]["ItemID"].ToString());
                string TableName = shopinfo.Rows[0]["TableName"].ToString();
                DataTable st = Sql.Sel(TableName,"ID="+id,"");
                if (st.Rows.Count != 0)
                {
                    this.Nametxt.Text = st.Rows[0]["StoreName"].ToString();
                }
                else 
                {
                    this.Nametxt.Text = "";
                }
                
                DataTable modeinfo = mfbll.SelectTableName("ZL_Model", "where TableName='" + TableName + "'");
                if (modeinfo.Rows.Count > 0)
                {
                    DataTable cmdinfo = cbll.GetContent(gid);
                    if (cmdinfo.Rows.Count > 0)
                    {
                        this.Label3.Text = cmdinfo.Rows[0]["StoreCredit"].ToString();
                        this.Label4.Text = GetState(cmdinfo.Rows[0]["StoreCommendState"].ToString());
                        M_ModelInfo mi = bmll.GetModelById(int.Parse(cmdinfo.Rows[0]["StoreModelID"].ToString()));
                        this.Label1.Text = mi.ModelName;
                        //DataTable slist = sstbll.GetStyleByModel(int.Parse(cmdinfo.Rows[0]["StoreModelID"].ToString()), 1);
                        DataTable slist = sstbll.GetStyleByModel(int.Parse(cmdinfo.Rows[0]["StoreModelID"].ToString()), 1);
                    
                        this.HiddenField1.Value = cmdinfo.Rows[0]["StoreModelID"].ToString();
                        this.SSTDownList.DataSource = slist;
                        this.SSTDownList.DataTextField = "StyleName";
                        this.SSTDownList.DataValueField = "ID";
                        this.SSTDownList.DataBind();
                        this.SSTDownList.SelectedValue = cmdinfo.Rows[0]["StoreStyleID"].ToString();
                        M_StoreStyleTable sst = sstbll.GetStyleByID(int.Parse(cmdinfo.Rows[0]["StoreStyleID"].ToString()));
                        this.Image1.ImageUrl = "~/UploadFiles/" + sst.StylePic;
                        if (cmdinfo.Rows.Count > 0)
                        {
                            this.ModelHtml.Text = this.mfbll.GetUpdateHtmlUser(int.Parse(cmdinfo.Rows[0]["StoreModelID"].ToString()), 0, cmdinfo);
                        }
                        else
                        {
                            this.ModelHtml.Text = this.mfbll.GetInputHtmlUser(int.Parse(cmdinfo.Rows[0]["StoreModelID"].ToString()), 0);
                        }
                        //function.WriteErrMsg(ModelHtml.Text.ToString().Replace("<","左"));
                    }

                }
                else
                {
                    cbll.DelContent(gid);
                    Response.Redirect("Default.aspx");
                    this.Label3.Text = "不可用";
                    this.Label4.Text = "不可用";
                    this.Label1.Text = "不可用";
                    this.SSTDownList.Items.Add(new ListItem("无",""));
                    this.Image1.Visible = false;
                }
                
            }
        }
    }
    private string GetState(string state)
    {
        switch (state)
        {
            case "0": return "普通"; 
            case "1": return "推荐"; 
            case "2": return "关闭"; 
            default: return ""; 
        }
    }


    protected void EBtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = this.mfbll.GetModelFieldList(int.Parse(this.HiddenField1.Value)).Tables[0];
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("FieldName", typeof(string)));
            table.Columns.Add(new DataColumn("FieldType", typeof(string)));
            table.Columns.Add(new DataColumn("FieldValue", typeof(string)));

            foreach (DataRow dr in dt.Rows)
            {
                if (DataConverter.CBool(dr["IsNotNull"].ToString()))
                {
                    if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + dr["FieldName"].ToString()]))
                    {
                        function.WriteErrMsg(dr["FieldAlias"].ToString() + "不能为空!");
                    }
                }
                if (dr["FieldType"].ToString() == "FileType")
                {
                    string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                    bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                    string sizefield = Sett[1].Split(new char[] { '=' })[1];
                    if (chksize && sizefield != "")
                    {
                        DataRow row2 = table.NewRow();
                        row2[0] = sizefield;
                        row2[1] = "FileSize";
                        row2[2] = this.Page.Request.Form["txt_" + sizefield];
                        table.Rows.Add(row2);
                    }
                }
                if (dr["FieldType"].ToString() == "MultiPicType")
                {
                    string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                    bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                    string sizefield = Sett[1].Split(new char[] { '=' })[1];
                    if (chksize && sizefield != "")
                    {
                        if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + sizefield]))
                        {
                            function.WriteErrMsg(dr["FieldAlias"].ToString() + "的缩略图不能为空!");
                        }
                        DataRow row1 = table.NewRow();
                        row1[0] = sizefield;
                        row1[1] = "ThumbField";
                        row1[2] = this.Page.Request.Form["txt_" + sizefield];
                        table.Rows.Add(row1);
                    }
                }
                DataRow row = table.NewRow();
                row[0] = dr["FieldName"].ToString();
                string ftype = dr["FieldType"].ToString();
                row[1] = ftype;
                string fvalue = this.Page.Request.Form["txt_" + dr["FieldName"].ToString()];
                if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
                {
                    fvalue = sll.ProcessSen(fvalue);
                }
                row[2] = fvalue;
                table.Rows.Add(row);
            }

            string uname = ubll.GetLogin().UserName;

            DataRow rs4 = table.NewRow();
            rs4[0] = "StoreName";
            rs4[1] = "TextType";
            rs4[2] = this.Nametxt.Text;
            table.Rows.Add(rs4);

            DataRow rs5 = table.NewRow();
            rs5[0] = "StoreStyleID";
            rs5[1] = "int";
            rs5[2] = DataConverter.CLng(this.SSTDownList.Text);
            table.Rows.Add(rs5);

            M_StoreStyleTable sst = sstbll.GetStyleByID(int.Parse(this.SSTDownList.Text));

            M_CommonData CData = cbll.GetCommonData(gid);
            CData.Template = sst.StyleUrl;
            CData.Title = this.Nametxt.Text;
            //throw new Exception();
            cbll.UpdateContent(table, CData);
            Response.Write("<script language=javascript>alert('提交成功!');location.href='Default.aspx';</script>");

        }
        catch (Exception ee)
        {
            function.WriteErrMsg(ee.Message);
        }

    }
    protected void SSTDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        M_StoreStyleTable sst = sstbll.GetStyleByID(int.Parse(this.SSTDownList.Text));
        this.Image1.ImageUrl = "~/" + sst.StylePic;
    }
    #endregion
   
}
