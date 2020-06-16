<%@ WebHandler Language="C#" Class="CameraUp" %> 

using System;
using System.Web;
using System.Drawing;
using System.IO;

public class CameraUp : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string base64String = context.Request["data"];
        Image img = this.Base64ToImage(base64String);
        
         string filePath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase + "UploadFiles\\Camera\\";

         //判断路径是否存在,若不存在则创建路径
         DirectoryInfo upDir = new DirectoryInfo(filePath);
         if (!upDir.Exists)
         {
             upDir.Create();
         } 
        //生成随机文件名
        Random objRand = new Random();
        DateTime date = DateTime.Now;

        //生成随机文件名
        string saveName = date.Year.ToString() + date.Month.ToString() + date.Day.ToString() + date.Hour.ToString() + date.Minute.ToString() + date.Second.ToString() + Convert.ToString(objRand.Next(99) * 97 + 100);
        string fileName = saveName + ".jpg";
        img.Save(filePath + fileName, System.Drawing.Imaging.ImageFormat.Png); 
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    //把base64字串轉成Image物件
    public Image Base64ToImage(string base64String)
    {
        // Convert Base64 String to byte[]
        byte[] imageBytes = Convert.FromBase64String(base64String);
        MemoryStream ms = new MemoryStream(imageBytes, 0,
          imageBytes.Length);

        // Convert byte[] to Image
        ms.Write(imageBytes, 0, imageBytes.Length);
        Image image = Image.FromStream(ms, true);
        return image;
    }

}