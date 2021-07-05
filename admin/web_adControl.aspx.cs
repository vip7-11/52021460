using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


public partial class admin_web_adControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string web_pdt_ad_img1 = "";
                string web_pdt_ad_img2 = "";
                string web_pdt_ad_img3 = "";
                string web_pdt_ad_ckb1 = "";
                string web_pdt_ad_ckb2 = "";
                string web_pdt_ad_ckb3 = "";
                CheckBox1.Checked = false;
                CheckBox2.Checked = false;
                CheckBox3.Checked = false;
                string sql = "select * from web";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    web_pdt_ad_img1 = (rd["web_pdt_ad_img1"].ToString().Trim());
                    web_pdt_ad_img2 = (rd["web_pdt_ad_img2"].ToString().Trim());
                    web_pdt_ad_img3 = (rd["web_pdt_ad_img3"].ToString().Trim());
                    web_pdt_ad_ckb1 = (rd["web_pdt_ad_ckb1"].ToString().Trim());
                    web_pdt_ad_ckb2 = (rd["web_pdt_ad_ckb2"].ToString().Trim());
                    web_pdt_ad_ckb3 = (rd["web_pdt_ad_ckb3"].ToString().Trim());
                    txt_Link1.Text = (rd["web_pdt_ad_lnk1"].ToString().Trim());
                    txt_link2.Text = (rd["web_pdt_ad_lnk2"].ToString().Trim());
                    txt_link3.Text = (rd["web_pdt_ad_lnk3"].ToString().Trim());
                }
                rd.Close();
                conn.Close();
                lblImg1.Text = web_pdt_ad_img1;
                lblImg2.Text = web_pdt_ad_img2;
                lblImg3.Text = web_pdt_ad_img3;
                Image1.ImageUrl = "../load/image/" + web_pdt_ad_img1;
                Image2.ImageUrl = "../load/image/" + web_pdt_ad_img2;
                Image3.ImageUrl = "../load/image/" + web_pdt_ad_img3;
                if (web_pdt_ad_ckb1 == "1") { CheckBox1.Checked = true; } else { CheckBox1.Checked = false; }
                if (web_pdt_ad_ckb2 == "1") { CheckBox2.Checked = true; } else { CheckBox2.Checked = false; }
                if (web_pdt_ad_ckb3 == "1") { CheckBox3.Checked = true; } else { CheckBox3.Checked = false; }
            }
            catch
            {
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string web_pdt_ad_ckb1 = ""; if (CheckBox1.Checked == true) { web_pdt_ad_ckb1 = "1"; } else { web_pdt_ad_ckb1 = "0"; }
            string web_pdt_ad_ckb2 = ""; if (CheckBox2.Checked == true) { web_pdt_ad_ckb2 = "1"; } else { web_pdt_ad_ckb2 = "0"; }
            string web_pdt_ad_ckb3 = ""; if (CheckBox3.Checked == true) { web_pdt_ad_ckb3 = "1"; } else { web_pdt_ad_ckb3 = "0"; }
            string sql;
            sql = "update web set web_pdt_ad_ckb1='" + web_pdt_ad_ckb1 + "', web_pdt_ad_ckb2='" + web_pdt_ad_ckb2 + "',web_pdt_ad_ckb3='" + web_pdt_ad_ckb3 + "', web_pdt_ad_lnk1='" + txt_Link1.Text + "', web_pdt_ad_lnk2='" + txt_link2.Text + "', web_pdt_ad_lnk3='" + txt_link3.Text + "'";
            Mei.GetDataTable(sql);
            string alert = "更新資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void UpLoadImg(FileUpload file, string filename, int w_size, int h_size, int index)
    {
        string alert = "";
        string vsname = "";
        if (file.HasFile)
        {
            string extname = (file.FileName).Substring(file.FileName.Length - 3).ToLower();
            if (extname == "gif" || extname == "jpg" || extname == "peg")
            {
                if (extname == "peg") extname = "jpg";
                try
                {
                    string path1 = Server.MapPath("~/load/image/" + filename + "_" + index.ToString() + "_." + extname);//暫存圖檔
                    string path2 = Server.MapPath("~/load/image/" + filename + "_" + index.ToString() + "." + extname);//實質圖檔
                    file.SaveAs(path1);
                    Mei.resizepPic(path1, path2, filename, extname, w_size, h_size);
                    vsname = string.Concat("pdt_ad_img", index);
                    ViewState[vsname] = filename + "_" + index.ToString() + "." + extname;
                }
                catch { alert = "發生不明錯誤，無法儲存圖片！"; YamaZoo.scriptAlert(alert); }
            }
            else { alert = "圖片格式只接受Jpg與Gif檔案格式！"; YamaZoo.scriptAlert(alert); }
        }
    }
    protected void btnLogoUpload1_Click(object sender, EventArgs e)
    {
        int w_size = 746;
        int h_size = 230;
        int index = 1;
        string filename = lblImg1.Text;
        if (fudPdtImg1.HasFile)
        {
            string extname = (fudPdtImg1.FileName).Substring(fudPdtImg1.FileName.Length - 3).ToLower();
            UpLoadImg(fudPdtImg1, filename, w_size, h_size, index);
            Image1.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            string sql = "UPDATE web SET web_pdt_ad_img1 = '" + filename + "_" + index.ToString() + "." + extname + "' WHERE web_id = '00001'";
            Mei.connSql(sql);
            lblImg1.Text = filename;
        }
    }
    protected void btnLogoUpload2_Click(object sender, EventArgs e)
    {
        int w_size = 746;
        int h_size = 230;
        int index = 1;
        string filename = lblImg2.Text;
        if (fudPdtImg2.HasFile)
        {
            string extname = (fudPdtImg2.FileName).Substring(fudPdtImg2.FileName.Length - 3).ToLower();
            UpLoadImg(fudPdtImg2, filename, w_size, h_size, index);
            Image2.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            string sql = "UPDATE web SET web_pdt_ad_img2 = '" + filename + "_" + index.ToString() + "." + extname + "' WHERE web_id = '00001'";
            Mei.connSql(sql);
            lblImg2.Text = filename;
        }
    }
    protected void btnLogoUpload3_Click(object sender, EventArgs e)
    {
        int w_size = 746;
        int h_size = 230;
        int index = 1;
        string filename = lblImg3.Text;
        if (fudPdtImg3.HasFile)
        {
            string extname = (fudPdtImg3.FileName).Substring(fudPdtImg3.FileName.Length - 3).ToLower();
            UpLoadImg(fudPdtImg3, filename, w_size, h_size, index);
            Image3.ImageUrl = "../load/image/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            string sql = "UPDATE web SET web_pdt_ad_img3 = '" + filename + "_" + index.ToString() + "." + extname + "' WHERE web_id = '00001'";
            Mei.connSql(sql);
            lblImg3.Text = filename;
        }
    }
}