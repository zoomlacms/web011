namespace Zoomla.Website.Shop
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
    using System.IO;
    using ZoomLa.Web;
    using ZoomLa.BLL;
    using ZoomLa.Common;
    using ZoomLa.Model;
    using ZoomLa.Components;


    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            B_User buser = new B_User();
            buser.CheckIsLogin();

            if (IsPostBack)
            {
                fileupload.Visible = false;
                uploadok.Text = "正在上传...请稍候!";
                uploadok.Enabled = false;
            }
        }

        protected void uploadok_Click(object sender, EventArgs e)
        {
            string upclass, newtimename, filenames, filext, filesname, indexname, timename, tempfilename, showfilename; 
            upclass = Server.HtmlEncode(Request.QueryString["menu"]);

            fileupload.Visible = false;
            uploadok.Text = "正在上传...请稍候!";
            uploadok.Enabled = false;

            Int32 filesize;
            filenames = fileupload.FileName;
            filext = fileupload.PostedFile.ContentType;
            filesize = fileupload.PostedFile.ContentLength;

            if (filenames.Length > 0)
            {
                if (filenames.IndexOf(".") > 0)
                {
                    filesname = filenames.Substring(filenames.LastIndexOf(".")).ToLower();
                    Random indexcc = new Random();
                    indexname = Convert.ToString(indexcc.Next(9999));
                    timename = Convert.ToString(DateTime.Now);
                    string dirname;
                    dirname = Convert.ToString(DateTime.Now.Date.ToShortDateString());

                    if (!Directory.Exists(Server.MapPath("../" + SiteConfig.SiteOption.UploadDir + "/" + dirname)))
                    {
                        Directory.CreateDirectory(Server.MapPath("../" + SiteConfig.SiteOption.UploadDir + "/" + dirname));
                    }
                    newtimename = Convert.ToString(DateTime.Now.Year) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Millisecond);
                    tempfilename = "../" + SiteConfig.SiteOption.UploadDir + "/" + dirname + "/" + newtimename + indexname + filesname;
                    showfilename =   dirname + "/" + newtimename + indexname + filesname;

                    if (fileupload.HasFile)
                    {
                        if (!chackext(filesname))
                        {
                            uploadok.Visible = false;
                            Response.Write("错误的文件类型！系统不支持" + filesname + "格式　<a href=FileUpload.aspx?menu=" + upclass + ">重新上传</a>");
                        }
                        else
                        {
                            try
                            {
                                SafeSC.SaveFile(tempfilename, fileupload, newtimename + indexname + filesname);
                                uploadok.Visible = false;
                                Response.Write("<script>parent.form1." + upclass + ".value='" + showfilename + "';document.oncontextmenu = new Function('return false');</script>");
                                Response.Write("上传成功! 文件大小:" + filesize + "字节　<a href=FileUpload.aspx?menu=" + upclass + ">重新上传</a>");
                            }
                            catch (Exception err)
                            {
                                uploadok.Visible = false;
                                Response.Write("上传失败!错误原因:" + err.Message + "　<a href=FileUpload.aspx?menu=" + upclass + ">重新上传</a>");
                            }
                        }
                    }
                    else
                    {
                        uploadok.Visible = false;
                        Response.Write("请选择非空图片文件再上传!　<a href=FileUpload.aspx?menu=" + upclass + ">重新上传</a>");
                    }
                }
                else
                {
                    uploadok.Visible = false;
                    Response.Write("系统不支持扩展名为空格式的文件!　<a href=FileUpload.aspx?menu=" + upclass + ">重新上传</a>");
                }
            }
            else
            {
                uploadok.Visible = false;
                Response.Write("请选择图片文件再上传!　<a href=FileUpload.aspx?menu=" + upclass + ">重新上传</a>");
            }
        }


        public bool chackext(string sstr)
        {
            if (sstr.Length > 0)
            {
                sstr = sstr.Replace(".", "").Replace(",", "");
                string fstr = ",jpg,gif,png,bmp,jpeg,psd,cdr,pcx,tiff,dxf,cgm,wmf,eps,emf,pict";
                int indd;
                indd = fstr.IndexOf(sstr);
                if (indd > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}