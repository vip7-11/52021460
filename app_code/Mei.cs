using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Net;
using System.Net.Mail;
using System.Text;
using AjaxControlToolkit;
using System.Text.RegularExpressions;

/// <summary>
/// Mei 的摘要描述
/// </summary>
public class Mei
{
    public static void connSql(string sql)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    public static DataTable GetDataTable(string sql)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        try
        {
            //建立DataAdapter
            SqlDataAdapter com = new SqlDataAdapter(sql, conn);
            //取得DataSet
            conn.Open();
            DataTable tb = new DataTable();
            try
            {
                com.Fill(tb);
            }
            catch { }
            conn.Close();
            return tb;
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }
    }
    private static string ChaLength(int strLength, string str)
    {
        int index;
        string no = "";
        string nostr = "";
        
        if (str.Trim().Length != 0)
        {
            index = Convert.ToInt32(str);
            index = index + 1;
            nostr = index.ToString();
            no = str.Trim(); 
        } 
        else 
        {
            index = 1;
            nostr = index.ToString();
            no = "1"; 
        }
        for (int i = index.ToString().Length; i < strLength; i++)
        {
            nostr = string.Concat("0", nostr);
        }

        return nostr;
    }
	public static string GetMaxNo(int index, string db, string maxstr)
    {
        string str = "";
        string sql = "";

        try
        {
            sql = "SELECT Max ( " + maxstr + " ) as A1 FROM " + db;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                str = (rd["A1"].ToString());
            }
            rd.Close();
            conn.Close();

            str = ChaLength(index, str);
        }
        catch { }        

        return str;
	}
    public static string GetMaxNoCond(int index, string db, string maxstr, string Qu1, string An1)
    {
        string str = "";
        string sql = "";

        try
        {
            sql = "SELECT Max ( " + maxstr + " ) as A1 FROM " + db + " WHERE " + Qu1 + " = '" + An1 + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                str = (rd["A1"].ToString());
            }
            rd.Close();
            conn.Close();

            str = ChaLength(index, str);
        }
        catch { }

        return str;
    }
    public static Boolean GetDtRowCount(string sql)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        DataTable dt = GetDataTable(sql);
        if (dt.Rows.Count != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
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
// public void ImgResize()
//{
//  Bitmap orgbmp,resizebmp;
//  orgbmp= new Bitmap(Pic);
//  resizebmp = new Bitmap(orgbmp, Width, Height);
//  pictureBox1.Image = resizebmp;
//  pictureBox1.Refresh();
//}
    //private void MakeSLT(string oldImagePath, string newImagePath)
    //{
    //    //oldImagePath -原圖地址 newImagePath 生成縮略圖地址
    //    int width = 150;//縮略圖的寬度
    //    int height = 112;// 縮略圖的高度
    //    int level = 100; //縮略圖的質量 1-100的範圍
    //    System.Drawing.Image oldimage = System.Drawing.Image.FromFile(oldImagePath);
    //    System.Drawing.Image thumbnailImage = oldimage.GetThumbnailImage(width, height, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
    //    Bitmap bm = new Bitmap(thumbnailImage);
    //    //處理JPG質量的函數
    //    ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
    //    ImageCodecInfo ici = null;
    //    foreach (ImageCodecInfo codec in codecs)
    //    {
    //        if (codec.MimeType == "image/jpeg")
    //            ici = codec;
    //    }
    //    EncoderParameters ep = new EncoderParameters();
    //    ep.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, (long)level);
    //    bm.Save(newImagePath, ici, ep);
    //}
    public static void resizepPic(string path1, string path2, string filename, string extname, int w_size, int h_size)
    {
        System.Drawing.Image image = System.Drawing.Image.FromFile(path1);
        ImageFormat thisFormat = image.RawFormat;

        //if (image.Width > w_size || image.Height > h_size)
        //{
        //    //---重繪圖檔至指定大小---
        //    Bitmap imageOutput = new Bitmap(image, w_size, h_size);
        //    //---將修改後的圖檔儲存---
        //    imageOutput.Save(path2, thisFormat);
        //    imageOutput.Dispose();
        //    image.Dispose();
        //    FileInfo tempfile = new FileInfo(path1);
        //    tempfile.Delete();
        //}
        //else
        //{
            image.Dispose();
            FileInfo tempfile = new FileInfo(path1);
            FileInfo delfile = new FileInfo(path2);
            delfile.Delete();
            tempfile.MoveTo(path2);
        //}
    }
    public static void scriptAlert(string alert)
    {
        System.Web.UI.Page page = (System.Web.UI.Page)System.Web.HttpContext.Current.Handler;

        alert = "<script language='javascript' type='text/javascript'>alert('" + alert + "');</script>";

        if (!(page.ClientScript.IsStartupScriptRegistered("msg")))
            ToolkitScriptManager.RegisterStartupScript(page, alert.GetType(), "msg", alert, false);
    }
    public static void sentMail2(string receiverMail, string title, string content, string me)//寄給1188用
    {
        //(收件者 內容 寄出者)
        string receiver = receiverMail;
        MailAddress from = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["mailService"], System.Configuration.ConfigurationManager.AppSettings["mailService"], Encoding.UTF8);//從變數meXXX寄出去的
        MailMessage msgMail = new MailMessage(from, new MailAddress(receiver));
        msgMail.Subject = title;  //標題
        msgMail.SubjectEncoding = Encoding.UTF8;
        string strBody = content;   //內容
        msgMail.Body = strBody;
        msgMail.BodyEncoding = Encoding.UTF8;
        msgMail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient(System.Configuration.ConfigurationManager.AppSettings["mailSMTP"], Int32.Parse(System.Configuration.ConfigurationManager.AppSettings["mailSMTPort"]));
        smtp.Credentials = new NetworkCredential(System.Configuration.ConfigurationManager.AppSettings["mail104look"], System.Configuration.ConfigurationManager.AppSettings["mailPassword"]);
        smtp.EnableSsl = true;
        smtp.Send(msgMail);
    }
}