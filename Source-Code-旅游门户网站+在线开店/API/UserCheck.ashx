<%@ WebHandler Language="C#" Class="OALogin" %>
using System;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
public class OALogin : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{
    public void ProcessRequest(HttpContext context)
    {
        string action = context.Request.Params["action"];
        B_User buser = new B_User();
        M_UserInfo mu = new M_UserInfo();
        switch (action)
        {
            case "HasLogged":
                mu = buser.GetLogin();
                if (mu != null && !mu.IsNull)
                {
                    M_Uinfo basemod = buser.GetUserBaseByuserid(mu.UserID);
                    string result = "{\"UserID\":\"" + mu.UserID + "\",\"UserName\":\"" + mu.UserName + "\",\"UserFace\":\"" + basemod.UserFace + "\",\"TrueName\":\"" + basemod.TrueName + "\"}";
                    context.Response.Write(result);
                }
                else context.Response.Write("-1");
                break;
            default:
                string uname = context.Request.Params["value"].Split(':')[0], upwd = context.Request.Params["value"].Split(':')[1];
                if (!string.IsNullOrEmpty(uname) && !string.IsNullOrEmpty(upwd))
                {
                    mu = buser.AuthenticateUser(uname, upwd);
                    if (mu.IsNull)
                    {
                        context.Response.Write("-1");
                    }
                    else
                    {
                        buser.SetLoginState(mu, "Day");
                        M_Uinfo basemod = buser.GetUserBaseByuserid(mu.UserID);
                        string result = "{\"UserID\":\"" + mu.UserID + "\",\"UserName\":\"" + mu.UserName + "\",\"UserFace\":\"" + basemod.UserFace + "\",\"TrueName\":\"" + basemod.TrueName + "\"}";
                        context.Response.Write(result);
                    }
                }
                break;
        }
        context.Response.Flush();
        context.Response.End();
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}