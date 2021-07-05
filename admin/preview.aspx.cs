using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;

public partial class admin_preview : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!String.IsNullOrEmpty(Request.ServerVariables["HTTP_X_ORIGINAL_URL"])) form.Action = Request.ServerVariables["HTTP_X_ORIGINAL_URL"];

        //string store = Page.User.Identity.Name;

        //if (!IsPostBack)
        //{
        //    MembershipUser currentUser = Membership.GetUser(store);
        //    ProfileCommon currentUserProfile = Profile.GetProfile(store);
        //    string userid = currentUser.ProviderUserKey.ToString();
        //    string sql = "select web_class_id, web_subclass_id, user_id, web_title, web_slogan, web_customstyle from web where user_id= '" + userid + "'";
        //    string web_id = YamaZoo.getWebId(store);
        //    ViewState["wid"] = web_id;
        //    string web_class_id, web_subclass_id, user_id, web_title, web_slogan, web_customstyle = "";
        //    DataTable dt = YamaZoo.GetDataTable(sql);
        //    web_class_id = dt.Rows[0]["web_class_id"].ToString();
        //    web_subclass_id = dt.Rows[0]["web_subclass_id"].ToString();
        //    user_id = dt.Rows[0]["user_id"].ToString();
        //    web_title = dt.Rows[0]["web_title"].ToString();
        //    web_slogan = dt.Rows[0]["web_slogan"].ToString();
        //    web_customstyle = dt.Rows[0]["web_customstyle"].ToString();

        //    lblTitle.Text = YamaZoo.SaveString(web_title, false);
        //    lblSlogan.Text = YamaZoo.SaveString(web_slogan, false);

        //    //------------ 網站橫幅 -------------------------------------------------------

        //    if (Request.QueryString["p"].ToString() == "head")
        //    {
        //        banner.Text = Session["preview"].ToString();
        //    }
        //    else
        //    {
        //        FileInfo bannerfile = new FileInfo(Server.MapPath("~/web/" + YamaZoo.getWebName(currentUser.UserName.ToString()) + "/uploads/" + currentUserProfile.Web.Banner));

        //        if (currentUserProfile.Web.customHead)
        //        {
        //            try
        //            {
        //                string sqludb = "select head from web_udblock where web_id = " + web_id;
        //                DataTable dt2 = YamaZoo.GetDataTable(sqludb);
        //                banner.Text = dt2.Rows[0]["head"].ToString();
        //            }
        //            catch
        //            {
        //            }
        //        }
        //        else
        //        {
        //            if (bannerfile.Extension.ToLower() == ".swf")
        //            {
        //                banner.Text = "<embed pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"uploads/" + currentUserProfile.Web.Banner + "\" play=\"true\" loop=\"true\" menu=\"true\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"" + currentUserProfile.Web.Banner_w.ToString() + "\" height=\"" + currentUserProfile.Web.Banner_h.ToString() + "\"></embed>";
        //            }
        //            else
        //            {
        //                banner.Text = "<a href=\"/web/" + YamaZoo.getWebName(currentUser.UserName.ToString()) + "\"><img src=\"/web/" + YamaZoo.getWebName(currentUser.UserName.ToString()) + "/uploads/" + currentUserProfile.Web.Banner + "\" alt=\"\" width=\"960\" style=\"border: 0px;\" /></a>";
        //            }
        //        }
        //    }


        //    //------------ 網站樣式 -------------------------------------------------------
        //    if (web_customstyle.Trim().ToLower() == "true")
        //    {
        //        themes.Text = "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/styles.css\" />";
        //    }
        //    else
        //    {
        //        themes.Text = "<link rel=\"stylesheet\" type=\"text/css\" href=\"../../templates/style/" + YamaZoo.getStyleFolder(currentUserProfile.Web.style) + "/styles.css\" />";
        //    }
        //    style.Text = "<style>";

        //    if (currentUserProfile.Web.BackGround != "")
        //    {
        //        //------------ 網站背景 -------------------------------------------------------
        //        style.Text += "body{ background-image: url(" + "uploads/" + currentUserProfile.Web.BackGround + ");}";
        //    }

        //    style.Text += "</style>";
        //}



        ////==============================================================
        //string type = Request.QueryString["p"].ToString();

        //try
        //{
        //    switch (type)
        //    {
        //        case "uds":
        //            side.Text = Session["preview"].ToString();
        //            break;

        //        case "uds2":
        //            side2.Text = Session["preview"].ToString();
        //            break;

        //        case "main":
        //            main.Text = Session["preview"].ToString();
        //            break;
        //    }
        //}
        //catch { }
    }
}