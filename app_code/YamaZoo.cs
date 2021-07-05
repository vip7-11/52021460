using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Xml;
using AjaxControlToolkit;
using System.Net;
using System.Net.Mail;
using System.Text;

/// <summary>
/// YamaZoo 的摘要描述
/// </summary>
public class YamaZoo
{
    public static DataTable GetDataTable(string strsql)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        try
        {
            //建立DataAdapter
            SqlDataAdapter com = new SqlDataAdapter(strsql, con);
            //取得DataSet
            con.Open();
            DataTable tb = new DataTable();
            try
            {
                com.Fill(tb);
            }
            catch { }
            con.Close();
            return tb;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    public static Boolean ExecuteNoQuery(string strsql)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        try
        {
            SqlCommand  com = new SqlCommand (strsql, con);
            com.Connection.Open();
            com.ExecuteNonQuery();
            com.Connection.Close();
            return true;
        }
        catch
        {
            con.Close();
            con.Dispose(); 
            return false ;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    public static string subString(string str, int length)
    {
        string s = "";

        if (str.Length > length)
        {
            try
            {
                s = str.Substring(0, length);
            }
            catch
            {

            }
        }
        else
        {
            s = str;
        }

        return s; 
    }
    public static string file_get_contents(string fileName)
    {

        string sContents = string.Empty;

        if (fileName.ToLower().IndexOf("http:") > -1)
        { // URL 

            System.Net.WebClient wc = new System.Net.WebClient();

            byte[] response = wc.DownloadData(fileName);

            sContents = System.Text.Encoding.ASCII.GetString(response);

        }
        else
        {

            // Regular Filename 

            System.IO.StreamReader sr = new System.IO.StreamReader(fileName);

            sContents = sr.ReadToEnd();

            sr.Close();

        }

        return sContents;

    }
    public static string getWebName(string user)
    {
        string web_name = "";

        string sql = "select web_name from web where user_id = '" + userNameToID(user) + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            web_name = cmd.ExecuteScalar().ToString();
        }
        catch
        {
            web_name = user;
        }
        conn.Close();

        return web_name;
    }
    public static string webToUser(string web_name)
    {
        string user = "";

        string sql = "select user_id from web where web_name = '" + web_name + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        user = userIDToName(cmd.ExecuteScalar().ToString());
        conn.Close();

        return user;    
    }
    public static string getCity(string city_id)
    {
        string city = "";
        string sql = "select city_name from city where city_id = " + city_id + " and city_id != 0";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            city = cmd.ExecuteScalar().ToString();
        }
        catch {}
        conn.Close();
        return city;    
    }
    public static string getDistrict(string district_id)
    {
        string district = "";
        string sql = "select district_name from district where district_id = " + district_id + " and district_id != 0";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            district = cmd.ExecuteScalar().ToString();
        }
        catch { }
        conn.Close();    
        return district; 
    }
    public static string userNameToID(string username)
    {
        string user_id = "";

        try
        {
            MembershipUser user = Membership.GetUser(username);
            user_id = user.ProviderUserKey.ToString();
        }
        catch { }

        return user_id;
    }
    public static string userIDToName(string userid)
    {
        string user_name = "";

        Guid user_id = new Guid(userid);

        try
        {
            MembershipUser user = Membership.GetUser(user_id);
            user_name = user.UserName.ToString();
        }
        catch { }

        return user_name;
    }
    public static string getWebId(string username)
    {
        string web_id = "";

        string sql = "select web_id from web where user_id = '" + userNameToID(username) + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            web_id = cmd.ExecuteScalar().ToString();
        }
        catch
        {
            web_id = "0";
        }
        conn.Close();

        if (web_id.Trim().Length == 0) web_id = "0";

        return web_id;
    }
    public static string getStoreName(string user_id)
    { 
        string store_name = "";

        string sql = "select web_title from web where web_id = '" + user_id + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            store_name = YamaZoo.SaveString(cmd.ExecuteScalar().ToString(), false);
        }
        catch {
            store_name = "";
        }
        conn.Close();

        return store_name;
    }
    public static string getECBankCode(string owner_id)
    {
        string bankCode = "";

        //string sqlgw = "select gwStoreCode from web where web_id = '" + owner_id + "'";
        string sqlgw = "select gwStoreCode from web where web_id = '00001'";
        SqlConnection conngw = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdgw = new SqlCommand(sqlgw, conngw);
        conngw.Open();
        bankCode = cmdgw.ExecuteScalar().ToString();
        conngw.Close();

        return bankCode;
    }
    public static string getECBankEnc(string owner_id)
    {
        string bankEnc = "";

        string sqlgw = "select gwStoreCheck from web where web_id = '" + owner_id + "'";
        SqlConnection conngw = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdgw = new SqlCommand(sqlgw, conngw);
        conngw.Open();
        bankEnc = cmdgw.ExecuteScalar().ToString();
        conngw.Close();

        return bankEnc;
    }
    public static string getObjName(string obj_id)
    {
        string obj_name = "";

        string sql = "select obj_name from obj where obj_id = '" + obj_id + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        obj_name = YamaZoo.SaveString(cmd.ExecuteScalar().ToString(), false);
        conn.Close();

        return obj_name;
    }
    public static string getObjPic(string obj_id)
    {
        string filename = "";
        string sqlfirst = "select top 1 obj_upload_file from obj_upload where obj_id = " + obj_id + " and obj_upload_type = 'jpg' order by obj_upload_first desc, obj_upload_id asc";
        SqlConnection connfirst = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdfirst = new SqlCommand(sqlfirst, connfirst);
        connfirst.Open();
        filename = cmdfirst.ExecuteScalar().ToString();
        connfirst.Close();

        return filename;
    }
    public static string getStyleFolder(string stylename)
    {
        string style_folder = "style01";
        string sql = "select style_folder from style where style_name = '" + stylename + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        style_folder = cmd.ExecuteScalar().ToString();
        conn.Close();

        return style_folder;
    }
    public static string getStyleName(string stylefolder)
    {
        string style_name = "";
        string sql = "select style_name from style where style_folder = '" + stylefolder + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        style_name = cmd.ExecuteScalar().ToString();
        conn.Close();

        return style_name;
    }
    public static string UrlFilter(string str)
    {
        string querystring = str ;
        str = System.Web.HttpUtility.UrlEncode(str.Trim());

        return querystring;
    }
    public static string SaveString(string str, Boolean b)
    {
        switch (b)
        {
            case true:
                str = Regex.Replace(str, @"</script>", "script}", RegexOptions.IgnoreCase);
                str = Regex.Replace(str, @"<script (?<x>[^\>]*)>", "{script", RegexOptions.IgnoreCase);
                str = Regex.Replace(str, @"{script(?<x>[^\>]*)script}", "", RegexOptions.IgnoreCase);
                str = HttpContext.Current.Server.HtmlEncode(str.Trim()).Replace("'", "&#39;").Replace("--", "&#8211;&#8211;").Replace(" ", "&nbsp;").Replace("\r\n", "<br>");
                break;

            case false:
                str = HttpContext.Current.Server.HtmlDecode(str.Replace("&#39;", "'").Replace("&#8211;&#8211;", "--").Replace("&nbsp;", " ").Replace("<br>", "\r\n"));
                break;
        }

        return str;
    }
    public static void IsAuthenticate()
    {
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
            HttpContext.Current.Response.Redirect("login.aspx");
    }
    public static void IsAuthenticate(string role)
    {
        IsAuthenticate();

        if(!HttpContext.Current.User.IsInRole(role))
            HttpContext.Current.Response.Redirect("login.aspx");
    }
    public static void IsAuthenticate(string role1, string role2)
    {
        IsAuthenticate();

        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2))
            HttpContext.Current.Response.Redirect("login.aspx");
    }
    public static void IsAuthenticate(string role1, string role2, string role3)
    {
        IsAuthenticate();

        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3))
            HttpContext.Current.Response.Redirect("login.aspx");
    }
    public static void IsAuthenticate(string role1, string role2, string role3, string role4)
    {
        IsAuthenticate();

        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3) && !HttpContext.Current.User.IsInRole(role4))
            HttpContext.Current.Response.Redirect("login.aspx");
    }
    public static void IsAuthenticate(string role1, string role2, string role3, string role4, string role5)
    {
        IsAuthenticate();

        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3) && !HttpContext.Current.User.IsInRole(role4) && !HttpContext.Current.User.IsInRole(role5))
            HttpContext.Current.Response.Redirect("login.aspx");

    }
    public static void IsAuthenticate(string role1, string role2, string role3, string role4, string role5, string role6)
    {
        IsAuthenticate();

        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3) && !HttpContext.Current.User.IsInRole(role4) && !HttpContext.Current.User.IsInRole(role5) && !HttpContext.Current.User.IsInRole(role6))
            HttpContext.Current.Response.Redirect("login.aspx");
    }
    public static bool checkAuthenticate()
    {
        bool authenticate = true;
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {
            authenticate = false;
        }
        return authenticate;
    }
    public static bool checkAuthenticate(string role)
    {
        bool authenticate = true;
        if (!HttpContext.Current.User.IsInRole(role)) authenticate = false;
        return authenticate;
    }
    public static bool checkAuthenticate(string role1, string role2)
    {
        bool authenticate = true;
        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2)) authenticate = false;
        return authenticate;
    }
    public static bool checkAuthenticate(string role1, string role2, string role3)
    {
        bool authenticate = true;
        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3)) authenticate = false;
        return authenticate;
    }
    public static bool checkAuthenticate(string role1, string role2, string role3, string role4)
    {
        bool authenticate = true;
        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3) && !HttpContext.Current.User.IsInRole(role4)) authenticate = false;
        return authenticate;
    }
    public static bool checkAuthenticate(string role1, string role2, string role3, string role4, string role5)
    {
        bool authenticate = true;
        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3) && !HttpContext.Current.User.IsInRole(role4) && !HttpContext.Current.User.IsInRole(role5)) authenticate = false;
        return authenticate;
    }
    public static bool checkAuthenticate(string role1, string role2, string role3, string role4, string role5, string role6)
    {
        bool authenticate = true;
        if (!HttpContext.Current.User.IsInRole(role1) && !HttpContext.Current.User.IsInRole(role2) && !HttpContext.Current.User.IsInRole(role3) && !HttpContext.Current.User.IsInRole(role4) && !HttpContext.Current.User.IsInRole(role5) && !HttpContext.Current.User.IsInRole(role6)) authenticate = false;
        return authenticate;
    }
    public static bool isWeb(string account)
    {
        bool isWeb = false;

        string sql = "select count(user_id) from web where user_id = '" + userNameToID(account) + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        try
        {
            if (Int32.Parse(cmd.ExecuteScalar().ToString()) > 0) isWeb = true;
        }
        catch { }
        conn.Close();

        return isWeb;
    }
    public static string StripHtml(string html, int length, bool allowHarmlessTags)
    {
        if (html == null || html == string.Empty)
        {
            return string.Empty;
        }
        else
        {
            html = Regex.Replace(html, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
        }

        if (allowHarmlessTags)
            return System.Text.RegularExpressions.Regex.Replace(html, "", string.Empty);

        if (System.Text.RegularExpressions.Regex.Replace(html, "<[^>]*>", string.Empty).Length > length)
        {
            return System.Text.RegularExpressions.Regex.Replace(html, "<[^>]*>", string.Empty).Substring(0, length);
        }
        else
        {
            return System.Text.RegularExpressions.Regex.Replace(html, "<[^>]*>", string.Empty);
        }
    }
    public static void checkWeb(string id)
    {
        System.Web.UI.Page page = (System.Web.UI.Page)System.Web.HttpContext.Current.Handler;

        bool isLock = false;
        string jslock = "";
        string timeend = "";
        string weblock = "";
        string username = "";
        string sql = "select web.web_timeend, web.web_lock, aspnet_Users.UserName from web inner join aspnet_Users on web.user_id = aspnet_Users.UserId where web_id = " + id;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            timeend = rd["web_timeend"].ToString();
            weblock = rd["web_lock"].ToString();
            username = rd["UserName"].ToString();
        }
        conn.Close();

        jslock = "$(document).ready(function() { $('#stop').fancybox({'overlayOpacity': 0.9,'overlayColor': '#000','frameWidth':500,'frameHeight':420,'hideOnContentClick': false,'hideOnOverlayClick': false,'enableEscapeButton': false,'showCloseButton': false}).trigger('click'); });";

        //日期限制 or 系統鎖定
        if ((DateTime.Now > DateTime.Parse(timeend) || weblock.ToLower() == "true") && !(HttpContext.Current.User.IsInRole("系統管理員")))        {
            
            isLock = true;
        }        

        if (isLock)
        {
            if (!System.IO.Path.GetFileName(HttpContext.Current.Request.PhysicalPath).ToString().Contains("index")) 
                HttpContext.Current.Response.Redirect("/web/" + username + "/index.html");

            scriptRegister(jslock);
        }
    }
    public static void addToCart(string obj_id)
    {
        //System.Web.UI.Page page = (System.Web.UI.Page)System.Web.HttpContext.Current.Handler;

        //if (page.User.Identity.IsAuthenticated)
        //{
        //    string store_id = "";
        //    string sqlstore = "select web.user_id from web inner join obj on web.web_id = obj.web where obj.obj_id = " + obj_id;
        //    SqlConnection connstore = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        //    SqlCommand cmdstore = new SqlCommand(sqlstore, connstore);
        //    connstore.Open();
        //    store_id = cmdstore.ExecuteScalar().ToString();
        //    connstore.Close();

        //    ProfileCommon ownerProfile = new ProfileCommon();
        //    ownerProfile = ownerProfile.GetProfile(YamaZoo.userIDToName(store_id));

        //    string sqlcount = "select count(user_id) from cart where user_id = '" + YamaZoo.userNameToID(page.User.Identity.Name.ToString()) + "' and obj_id = " + obj_id;
        //    SqlConnection conncount = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        //    SqlCommand cmdcount = new SqlCommand(sqlcount, conncount);
        //    conncount.Open();
        //    int count = (Int32)cmdcount.ExecuteScalar();
        //    conncount.Close();

        //    if (!ownerProfile.Cart.Open)
        //    {
        //        string alert1 = "店家已暫停購物功能！";
        //        scriptAlert(alert1);
        //    }
        //    else if (count > 0)
        //    {
        //        string alert2 = "商品已在購物車中囉！";
        //        scriptAlert(alert2);
        //    }
        //    else
        //    {
        //        string sql = "insert into cart (user_id, owner_id, obj_id) values ('" + YamaZoo.userNameToID(page.User.Identity.Name.ToString()) + "','" + store_id + "'," + obj_id + ")";
        //        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        //        SqlCommand cmd = new SqlCommand(sql, conn);
        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();

        //        string alert3 = "商品已加入購物車！";
        //        scriptAlert(alert3);
        //    }
        //}
        //else
        //{
        //    string alert = "要先登入才能加入購物車喔！";
        //    scriptAlert(alert);
        //}
    }
    public static string getIP()
    {
        string user_ip = "";

        if (HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
        {
            user_ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        else
        {
            user_ip = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"].ToString();
        }
        return (user_ip);
    }
    public static void scriptAlert(string alert)
    {
        System.Web.UI.Page page = (System.Web.UI.Page)System.Web.HttpContext.Current.Handler;

        alert = "<script language='javascript' type='text/javascript'>alert('" + alert + "');</script>";

        if (!(page.ClientScript.IsStartupScriptRegistered("msg")))
        ToolkitScriptManager.RegisterStartupScript(page, alert.GetType(), "msg", alert, false);
    }
    public static void scriptRegister(string js)
    {
        System.Web.UI.Page page = (System.Web.UI.Page)System.Web.HttpContext.Current.Handler;

        js = "<script language='javascript' type='text/javascript'>" + js + "</script>";

        if (!(page.ClientScript.IsStartupScriptRegistered("script")))
            ToolkitScriptManager.RegisterStartupScript(page, js.GetType(), "js", js, false);
    }
    public static string CheckCPID(string num)
    {
        num = num.ToUpper();
        string result = "";
        string num_first_code = "";

        if (num.Length == 10)
        {
            if (num.Substring(1, 1) != "1" && num.Substring(1, 1) != "2")
            {
                result = "身分證格式錯誤！";
            }
            else
            {
                switch (num.Substring(0, 1))
                {
                    case "A":
                        num_first_code = "10";
                        break;
                    case "B":
                        num_first_code = "11";
                        break;
                    case "C":
                        num_first_code = "12";
                        break;
                    case "D":
                        num_first_code = "13";
                        break;
                    case "E":
                        num_first_code = "14";
                        break;
                    case "F":
                        num_first_code = "15";
                        break;
                    case "G":
                        num_first_code = "16";
                        break;
                    case "H":
                        num_first_code = "17";
                        break;
                    case "I":
                        num_first_code = "34";
                        break;
                    case "J":
                        num_first_code = "18";
                        break;
                    case "K":
                        num_first_code = "19";
                        break;
                    case "L":
                        num_first_code = "20";
                        break;
                    case "M":
                        num_first_code = "21";
                        break;
                    case "N":
                        num_first_code = "22";
                        break;
                    case "O":
                        num_first_code = "35";
                        break;
                    case "P":
                        num_first_code = "23";
                        break;
                    case "Q":
                        num_first_code = "24";
                        break;
                    case "R":
                        num_first_code = "25";
                        break;
                    case "S":
                        num_first_code = "26";
                        break;
                    case "T":
                        num_first_code = "27";
                        break;
                    case "U":
                        num_first_code = "28";
                        break;
                    case "V":
                        num_first_code = "29";
                        break;
                    case "W":
                        num_first_code = "32";
                        break;
                    case "X":
                        num_first_code = "30";
                        break;
                    case "Y":
                        num_first_code = "31";
                        break;
                    case "Z":
                        num_first_code = "33";
                        break;
                    default:
                        result = "身分證格式錯誤！";
                        break;
                }

                int iAllNum = Convert.ToInt32(num_first_code.Substring(0, 1)) +
                    Convert.ToInt32(num_first_code.Substring(1, 1)) * 9 +
                    Convert.ToInt32(num.Substring(1, 1)) * 8 +
                    Convert.ToInt32(num.Substring(2, 1)) * 7 +
                    Convert.ToInt32(num.Substring(3, 1)) * 6 +
                    Convert.ToInt32(num.Substring(4, 1)) * 5 +
                    Convert.ToInt32(num.Substring(5, 1)) * 4 +
                    Convert.ToInt32(num.Substring(6, 1)) * 3 +
                    Convert.ToInt32(num.Substring(7, 1)) * 2 +
                    Convert.ToInt32(num.Substring(8, 1)) * 1 +
                    Convert.ToInt32(num.Substring(9, 1)) * 1;

                if (iAllNum % 10 != 0)
                {
                    result = "身分證格式錯誤！";
                }
            }
         }
        else if (num.Length == 8)
        {
            int int_result;
            if (!int.TryParse(num, out int_result))
            {
                result = "統一編號格式錯誤！";
            }
            else
            {
                int[] Logic = new int[] { 1, 2, 1, 2, 1, 2, 4, 1 };
                int addition, sum = 0, j = 0, x;
                for (x = 0; x < Logic.Length; x++)
                {
                    int no = Convert.ToInt32(num.Substring(x, 1));
                    j = no * Logic[x];
                    addition = ((j / 10) + (j % 10));
                    sum += addition;
                }
                if (sum % 10 != 0)
                {
                    result = "統一編號格式錯誤！";
                }
                if (num.Substring(6, 1) == "7")
                {
                    if (sum % 10 != 9)
                    {
                        result = "統一編號格式錯誤！";
                    }
                }
            }
        }
        else
        {
            result = "身分證/統一編號格式錯誤！";
            return result;
        }

        return result;
    }
    //public static string userIconPath(string user)
    //{ 
    //    string imgpath = "";

    //    if (user.Length == 0)
    //    {
    //        imgpath = "/images/UserIcon.jpg";
    //    }
    //    else
    //    {
    //        ProfileCommon userProfile = new ProfileCommon();
    //        userProfile = userProfile.GetProfile(user);
    //        imgpath = "/profile/" + user + "/images/" + userProfile.Icon;
    //    }

    //    return imgpath;
    //}
    public static void logout()
    {
        FormsAuthentication.SignOut();
        HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
    }
    public static void logout(string url)
    {
        FormsAuthentication.SignOut();
        HttpContext.Current.Response.Redirect(url);
    }

    public static void sentMail(string strfrom, string strto, string subject, string msg)
    {
        MailAddress from = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["mailService"], strfrom, Encoding.UTF8);
        MailAddress to = new MailAddress(strto);
        MailMessage mail = new MailMessage(from, to);

        mail.SubjectEncoding = Encoding.UTF8;
        mail.BodyEncoding = Encoding.UTF8;
        mail.IsBodyHtml = true;

        mail.Subject = subject;        
        mail.Body = msg;

        SmtpClient smtp = new SmtpClient(System.Configuration.ConfigurationManager.AppSettings["mailSMTP"], Int32.Parse(System.Configuration.ConfigurationManager.AppSettings["mailSMTPort"]));
        smtp.Credentials = new NetworkCredential(System.Configuration.ConfigurationManager.AppSettings["mailService"], System.Configuration.ConfigurationManager.AppSettings["mailPassword"]);
        smtp.EnableSsl = true;

        try
        {
            smtp.Send(mail);
        }
        catch { }
    }
}