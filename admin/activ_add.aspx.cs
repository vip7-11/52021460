using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;

public partial class user_activ_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtactivTitle.Text.Trim() == "" || txtactivContent.Value.Trim() == "")
        {
            string alert = "標題及內容不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string activ_id = Mei.GetMaxNo(6, "activ", "activ_id");
            string activ_title = YamaZoo.SaveString(txtactivTitle.Text, true);
            string activ_state = "";
            string activ_content = txtactivContent.Value.Replace("'", "''");
            string activ_date = DateTime.Now.ToString("yyyy/MM/dd");
            string activ_time = DateTime.Now.ToString("HH:mm:ss");
            string activ_img = "";

            if (rdoactivStateA.Checked == true)
                activ_state = "01";
            else if (rdoactivStateB.Checked == true)
                activ_state = "02";

            if (fudActivImg.HasFile)
            {
                string extname = (fudActivImg.FileName).Substring(fudActivImg.FileName.Length - 3).ToLower();

                if (extname == "gif" || extname == "jpg" || extname == "peg")
                {
                    if (extname == "peg") extname = "jpg";
                    try
                    {
                        string filename = "a" + activ_id;
                        activ_img = filename + "." + extname;

                        string sql = "";
                        sql += "INSERT INTO activ ( activ_id, activ_title, activ_state, activ_content, activ_date, activ_time, activ_img ) VALUES (";
                        sql += "'" + activ_id + "',";
                        sql += "'" + activ_title + "',";
                        sql += "'" + activ_state + "',";
                        sql += "'" + activ_content + "',";
                        sql += "'" + activ_date + "',";
                        sql += "'" + activ_time + "',";
                        sql += "'" + activ_img + "')";
                        Mei.connSql(sql);

                        //System.Drawing.Image image = System.Drawing.Image.FromFile("~/web/activ/" + filename + "_." + extname);
                        UpLoadImg(fudActivImg, filename, 180, 250);
                        //fudActivImg.SaveAs(Server.MapPath("~/web/activ/" + filename + "_." + extname));
                        //---只修改圖片寬度---
                        //resizepPic(Server.MapPath("~/web/activ/" + filename + "_." + extname), filename, extname, 180);

                        txtactivTitle.Text = "";
                        rdoactivStateA.Checked = true;
                        rdoactivStateB.Checked = false;
                        rdoactivStateB.Checked = false;
                        txtactivContent.Value = "";

                        string alert = "新增資料成功！";
                        YamaZoo.scriptAlert(alert);
                    }
                    catch
                    {
                        string alert = "發生不明錯誤，無法建立資料！";
                        YamaZoo.scriptAlert(alert);
                    }
                }
                else
                {
                    string alert = "圖片格式只接受Jpg與Gif檔案格式！";
                    YamaZoo.scriptAlert(alert);
                }
            }
            else
            {
                string alert = "您尚未選擇要上傳的圖檔！";
                YamaZoo.scriptAlert(alert);
            }            
        }
    }
    protected void UpLoadImg(FileUpload file, string filename, int w_size, int h_size)
    {
        string alert = "";
        if (file.HasFile)
        {
            string extname = (file.FileName).Substring(file.FileName.Length - 3).ToLower();
            if (extname == "gif" || extname == "jpg" || extname == "peg")
            {
                if (extname == "peg") extname = "jpg";
                try
                {
                    string path1 = Server.MapPath("~/web/activ/" + filename + "_." + extname);//暫存圖檔
                    string path2 = Server.MapPath("~/web/activ/" + filename + "." + extname);//實質圖檔
                    file.SaveAs(path1);
                    Mei.resizepPic(path1, path2, filename, extname, w_size, h_size);
                }
                catch { alert = "發生不明錯誤，無法儲存圖片！"; YamaZoo.scriptAlert(alert); }
            }
            else { alert = "圖片格式只接受Jpg與Gif檔案格式！"; YamaZoo.scriptAlert(alert); }
        }
    }
}