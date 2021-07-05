using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_pdt_num : System.Web.UI.Page
{
    string sql_pdt_num;
    DataTable dt_pdt_num;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                sql_pdt_num = "select pdt_num_pic, pdt_num_link, pdt_num_check from pdt_num where pdt_num_id='1'";
                dt_pdt_num = Mei.GetDataTable(sql_pdt_num);
                if (dt_pdt_num.Rows.Count != null)
                {
                    Image1.ImageUrl = "../web/pdt/" + dt_pdt_num.Rows[0]["pdt_num_pic"].ToString().Trim();
                    txt_pdt_num_link.Text = dt_pdt_num.Rows[0]["pdt_num_link"].ToString().Trim();
                    lblpdt_num_pic.Text = dt_pdt_num.Rows[0]["pdt_num_pic"].ToString().Trim();
                    CheckBox1.Checked = Convert.ToBoolean(dt_pdt_num.Rows[0]["pdt_num_check"].ToString().Trim());
                }
                
            }
            catch
            {
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        int w_size = 168;
        int h_size = 90;
        int index = 1;
        string filename = lblpdt_num_pic.Text;
        if (ful_pdt_num_pic.HasFile)
        {
            try
            {
                string extname = (ful_pdt_num_pic.FileName).Substring(ful_pdt_num_pic.FileName.Length - 3).ToLower();
                UpLoadImg(ful_pdt_num_pic, filename, w_size, h_size, index);
                Image1.ImageUrl = "../web/pdt/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                string sql = "UPDATE pdt_num SET pdt_num_pic = '" + filename + "', pdt_num_link='" + txt_pdt_num_link.Text + "', pdt_num_check='" + CheckBox1.Checked + "' WHERE pdt_num_id = '1'";
                Mei.connSql(sql);
                lblpdt_num_pic.Text = filename;
                Image1.ImageUrl = "../web/pdt/" + lblpdt_num_pic.Text;
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
                sql_pdt_num = "UPDATE pdt_num SET pdt_num_link='" + txt_pdt_num_link.Text + "', pdt_num_check='" + CheckBox1.Checked + "' WHERE pdt_num_id = '1'";
                Mei.GetDataTable(sql_pdt_num);
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
                    string path1 = Server.MapPath("../web/pdt/" + filename + "_");//暫存圖檔
                    string path2 = Server.MapPath("../web/pdt/" + filename);//實質圖檔
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
}