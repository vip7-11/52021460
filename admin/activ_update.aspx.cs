using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;

public partial class user_activ_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string activ_id = "";
                string activ_title = "";
                string activ_state = "";
                string activ_content = "";
                string activ_img = "";

                activ_id = Request.QueryString["activ_id"].ToString();

                string sql = "select * from activ where activ_id = '" + activ_id + "'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    activ_title = (rd["activ_title"].ToString());
                    activ_state = (rd["activ_state"].ToString().Trim());
                    activ_content = (rd["activ_content"].ToString());
                    activ_img = (rd["activ_img"].ToString());
                }
                rd.Close();
                conn.Close();

                lblactivId.Text = activ_id;
                txtactivTitle.Text = activ_title;
                if (activ_state == "01")
                    rdoactivStateA.Checked = true;
                else if (activ_state == "02")
                    rdoactivStateB.Checked = true;
                txtactivContent.Value = Server.HtmlDecode(activ_content);
                actimg.ImageUrl = "../web/activ/" + activ_img + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            }
            catch
            {
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }            
        }
    }
    protected void btnactivUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string activ_id = lblactivId.Text;
            string activ_title = YamaZoo.SaveString(txtactivTitle.Text, true);
            string activ_state = "";
            string activ_content = txtactivContent.Value.Replace("'", "''");

            if (rdoactivStateA.Checked == true)
                activ_state = "01";
            else if (rdoactivStateB.Checked == true)
                activ_state = "02";

            string sql = "UPDATE activ SET ";
            sql += "activ_title = N'" + activ_title + "', ";
            sql += "activ_state = '" + activ_state + "', ";
            sql += "activ_content = N'" + activ_content + "' ";
            sql += "WHERE activ_id = '" + activ_id + "'";
            Mei.connSql(sql);

            string alert = "更新資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnactivBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("activ_list.aspx?menu=5");
    }
    protected void btnactivDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "DELETE FROM activ WHERE activ_id = '" + lblactivId.Text.Trim() + "'";
            Mei.connSql(sql);
            FileInfo tempfile = new FileInfo(Server.MapPath("~/web/activ/" + lblactivimg.Text.Trim()));
            tempfile.Delete();
            Response.Redirect("activ_list.aspx?menu=5");
        }
        catch
        {
            string alert = "發生不明錯誤，無法刪除資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fudActivImg.HasFile)
        {
            string extname = (fudActivImg.FileName).Substring(fudActivImg.FileName.Length - 3).ToLower();

            if (extname == "gif" || extname == "jpg" || extname == "peg")
            {
                if (extname == "peg") extname = "jpg";
                string filename = "a" + lblactivId.Text;
                string activ_img = filename + "." + extname;
                fudActivImg.SaveAs(Server.MapPath("~/web/activ/" + filename + "_." + extname));
                //---只修改圖片寬度---
                resizepPic(Server.MapPath("~/web/activ/" + filename + "_." + extname), filename, extname, 180);
                actimg.ImageUrl = "../web/activ/" + filename + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            }
        }
    }
    protected void resizepPic(string path, string filename, string extname, int size)
    {
        System.Drawing.Image image = System.Drawing.Image.FromFile(path);
        ImageFormat thisFormat = image.RawFormat;

        if (image.Width > size || image.Width < size)
        {
            //---重繪圖檔至指定大小---
            Bitmap imageOutput = new Bitmap(image, size, image.Height);
            //---將修改後的圖檔儲存---
            imageOutput.Save(Server.MapPath("~/web/activ/" + filename + "." + extname), thisFormat);
            imageOutput.Dispose();
            image.Dispose();
            FileInfo tempfile = new FileInfo(path);
            tempfile.Delete();
        }
        else
        {
            image.Dispose();
            FileInfo tempfile = new FileInfo(Server.MapPath("~/web/activ/" + filename + "_." + extname));
            FileInfo delfile = new FileInfo(Server.MapPath("~/web/activ/" + filename + "." + extname));
            delfile.Delete();
            tempfile.MoveTo(Server.MapPath("~/web/activ/" + filename + "." + extname));
        }
    }
}