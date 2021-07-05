using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class user_webintro : System.Web.UI.Page
{
    string sqlLink;
    DataTable dtLink;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string web_ad1 = "";
                string web_ad2 = "";
                string web_ad3 = "";
                string web_ad4 = "";
                string web_ad5 = "";
                string web_ad1_link = "";
                string web_ad2_link = "";
                string web_ad3_link = "";
                string web_ad4_link = "";
                string web_ad5_link = "";


                string sql = "select * from web";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    web_ad1 = (rd["web_ad1"].ToString());
                    web_ad2 = (rd["web_ad2"].ToString());
                    web_ad3 = (rd["web_ad3"].ToString());
                    web_ad4 = (rd["web_ad4"].ToString());
                    web_ad5 = (rd["web_ad5"].ToString());
                    web_ad1_link=(rd["web_ad1_link"].ToString());
                    web_ad2_link=(rd["web_ad2_link"].ToString());
                    web_ad3_link=(rd["web_ad3_link"].ToString());
                    web_ad4_link=(rd["web_ad4_link"].ToString());
                    web_ad5_link=(rd["web_ad5_link"].ToString());
                }
                rd.Close();
                conn.Close();

                //txtWebAd1.Value = Server.HtmlDecode(web_ad1);
                lblimg1.Text = Server.HtmlDecode(web_ad1);
                lblimg2.Text = Server.HtmlDecode(web_ad2);
                lblimg3.Text = Server.HtmlDecode(web_ad3);
                lblimg4.Text = Server.HtmlDecode(web_ad4);
                lblimg5.Text = Server.HtmlDecode(web_ad5);
                txt_web_ad1_link.Text = web_ad1_link;
                txt_web_ad2_link.Text = web_ad2_link;
                txt_web_ad3_link.Text = web_ad3_link;
                txt_web_ad4_link.Text = web_ad4_link;
                txt_web_ad5_link.Text = web_ad5_link;
                webadimg1.ImageUrl = "../load/image/" + lblimg1.Text;
                webadimg2.ImageUrl = "../load/image/" + lblimg2.Text;
                webadimg3.ImageUrl = "../load/image/" + lblimg3.Text;
                webadimg4.ImageUrl = "../load/image/" + lblimg4.Text;
                webadimg5.ImageUrl = "../load/image/" + lblimg5.Text;

            }
            catch
            {
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }            
        }
    }
    protected void UpLoadImg(FileUpload file, string filename, int w_size, int h_size, int index)
    {
        string alert = "";
        string vsname = "";
        if (file.HasFile)
        {
            string extname = (file.FileName).Substring(file.FileName.Length - 3).ToLower();
            if (extname == "gif" || extname == "jpg" || extname == "peg" || extname == "png")
            {
                if (extname == "peg") extname = "jpg";
                try
                {
                    //string path1 = Server.MapPath("~/load/image/" + filename + "_" + index.ToString() + "_." + extname);//暫存圖檔
                    //string path2 = Server.MapPath("~/load/image/" + filename + "_" + index.ToString() + "." + extname);//實質圖檔
                    string path1 = Server.MapPath("~/load/image/" + filename + "_");//暫存圖檔
                    string path2 = Server.MapPath("~/load/image/" + filename);//實質圖檔
                    file.SaveAs(path1);
                    Mei.resizepPic(path1, path2, filename, extname, w_size, h_size);
                    vsname = string.Concat("ad", index);
                    ViewState[vsname] = filename + "_" + index.ToString() + "." + extname;
                }
                catch { alert = "發生不明錯誤，無法儲存圖片！"; YamaZoo.scriptAlert(alert); }
            }
            else { alert = "圖片格式只接受Jpg與Gif檔案格式！"; YamaZoo.scriptAlert(alert); }
        }
    }
    
    protected void btnUpdateWebAd1_Click(object sender, EventArgs e)
    {
        int w_size = 959;
        int h_size = 320;
        int index = 1;
        string filename = lblimg1.Text;
        if (FUD_web_ad1.HasFile)
        {
            try
            {
                string extname = (FUD_web_ad1.FileName).Substring(FUD_web_ad1.FileName.Length - 3).ToLower();
                UpLoadImg(FUD_web_ad1, filename, w_size, h_size, index);
                webadimg1.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string sql = "UPDATE web SET web_ad1 = '" + filename + "', web_ad1_link='" + txt_web_ad1_link.Text + "' WHERE web_id = '00001'";
                Mei.connSql(sql);
                lblimg1.Text = filename;
                webadimg1.ImageUrl = "../load/image/" + lblimg1.Text;
                string alert = "更新資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
        else
        {
            try
            {
                sqlLink = "UPDATE web SET web_ad1_link='" + txt_web_ad1_link.Text + "' WHERE web_id = '00001'";
                Mei.GetDataTable(sqlLink);
                string alert = "更新超連結成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnUpdateWebAd2_Click(object sender, EventArgs e)
    {
        int w_size = 960;
        int h_size = 320;
        int index = 1;
        string filename = lblimg2.Text;
        if (FUD_web_ad2.HasFile)
        {
            try
            {
                string extname = (FUD_web_ad2.FileName).Substring(FUD_web_ad2.FileName.Length - 3).ToLower();
                UpLoadImg(FUD_web_ad2, filename, w_size, h_size, index);
                webadimg2.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string sql = "UPDATE web SET web_ad2 = '" + filename + "', web_ad2_link='" + txt_web_ad2_link.Text + "' WHERE web_id = '00001'";
                Mei.connSql(sql);
                lblimg2.Text = filename;
                webadimg2.ImageUrl = "../load/image/" + lblimg2.Text;
                string alert = "更新資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
        else
        {
            try
            {
                sqlLink = "UPDATE web SET web_ad2_link='" + txt_web_ad2_link.Text + "' WHERE web_id = '00001'";
                Mei.GetDataTable(sqlLink);
                string alert = "更新超連結成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnUpdateWebAd3_Click(object sender, EventArgs e)
    {
        int w_size = 960;
        int h_size = 320;
        int index = 1;
        string filename = lblimg3.Text;
        if (FUD_web_ad3.HasFile)
        {
            try
            {
                string extname = (FUD_web_ad3.FileName).Substring(FUD_web_ad3.FileName.Length - 3).ToLower();
                UpLoadImg(FUD_web_ad3, filename, w_size, h_size, index);
                webadimg3.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string sql = "UPDATE web SET web_ad3 = '" + filename + "', web_ad3_link='" + txt_web_ad3_link.Text + "' WHERE web_id = '00001'";
                Mei.connSql(sql);
                lblimg3.Text = filename;
                webadimg3.ImageUrl = "../load/image/" + lblimg3.Text;
                string alert = "更新資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
        else
        {
            try
            {
                sqlLink = "UPDATE web SET web_ad3_link='" + txt_web_ad3_link.Text + "' WHERE web_id = '00001'";
                Mei.GetDataTable(sqlLink);
                string alert = "更新超連結成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnUpdateWebAd4_Click(object sender, EventArgs e)
    {
        int w_size = 960;
        int h_size = 320;
        int index = 1;
        string filename = lblimg4.Text;
        if (FUD_web_ad4.HasFile)
        {
            try
            {
                string extname = (FUD_web_ad4.FileName).Substring(FUD_web_ad4.FileName.Length - 3).ToLower();
                UpLoadImg(FUD_web_ad4, filename, w_size, h_size, index);
                webadimg4.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string sql = "UPDATE web SET web_ad4 = '" + filename + "', web_ad4_link='" + txt_web_ad4_link.Text + "' WHERE web_id = '00001'";
                Mei.connSql(sql);
                lblimg4.Text = filename;
                webadimg4.ImageUrl = "../load/image/" + lblimg4.Text;
                string alert = "更新資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
        else
        {
            try
            {
                sqlLink = "UPDATE web SET web_ad4_link='" + txt_web_ad4_link.Text + "' WHERE web_id = '00001'";
                Mei.GetDataTable(sqlLink);
                string alert = "更新超連結成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnUpdateWebAd5_Click(object sender, EventArgs e)
    {
        int w_size = 960;
        int h_size = 320;
        int index = 1;
        string filename = lblimg5.Text;
        if (FUD_web_ad5.HasFile)
        {
            try
            {
                string extname = (FUD_web_ad5.FileName).Substring(FUD_web_ad5.FileName.Length - 3).ToLower();
                UpLoadImg(FUD_web_ad5, filename, w_size, h_size, index);
                webadimg5.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string sql = "UPDATE web SET web_ad5 = '" + filename + "', web_ad5_link='" + txt_web_ad5_link.Text + "' WHERE web_id = '00001'";
                Mei.connSql(sql);
                lblimg5.Text = filename;
                webadimg5.ImageUrl = "../load/image/" + lblimg5.Text;
                string alert = "更新資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
        else
        {
            try
            {
                sqlLink = "UPDATE web SET web_ad5_link='" + txt_web_ad5_link.Text + "' WHERE web_id = '00001'";
                Mei.GetDataTable(sqlLink);
                string alert = "更新超連結成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法更新資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
}