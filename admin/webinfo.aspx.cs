using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class user_webinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //---限定只有第一次會執行---
        if (!IsPostBack)
        {
            //Address();

            string web_id = "";
            string web_title = "";
            string web_slogan = "";
            string web_marquee = "";
            string web_contentprotect = "";
            string web_company = "";
            string web_companyphone = "";
            string web_companycellphone = "";
            string web_companyfax = "";
            string web_companypostalcode = "";
            string web_companycity = "";
            string web_companydistrict = "";
            string web_companyaddress = "";
            string web_taxid = "";
            string web_keyword = "";
            string web_description = "";
            string web_logo = "";


            //---讀取網站資料---
            string sql = "select * from web";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                web_id = rd["web_id"].ToString();
                web_title = rd["web_title"].ToString();
                web_slogan = rd["web_slogan"].ToString();
                web_marquee = rd["web_marquee"].ToString();
                web_contentprotect = rd["web_contentprotect"].ToString();
                web_company = rd["web_company"].ToString();
                web_companyphone = rd["web_companyphone"].ToString();
                web_companycellphone = rd["web_companycellphone"].ToString();
                web_companyfax = rd["web_companyfax"].ToString();
                web_companypostalcode = rd["web_companypostalcode"].ToString();
                web_companycity = rd["web_companycity"].ToString();
                web_companydistrict = rd["web_companydistrict"].ToString();
                web_companyaddress = rd["web_companyaddress"].ToString();
                web_taxid = rd["web_taxid"].ToString();
                web_keyword = rd["web_keyword"].ToString();
                web_description = rd["web_description"].ToString();
                web_logo = rd["web_logo"].ToString();
            }
            rd.Close();
            conn.Close();

            lblWebid.Text = web_id;
            txtWebTitle.Text = YamaZoo.SaveString(web_title, false);
            txtWebSlogan.Text = YamaZoo.SaveString(web_slogan, false);
            //txtMarquee.Text = YamaZoo.SaveString(web_marquee, false);
            txtCompany.Text = YamaZoo.SaveString(web_company, false);
            txtCompanyPhone.Text = YamaZoo.SaveString(web_companyphone, false);
            txtCompanyCellPhone.Text = YamaZoo.SaveString(web_companycellphone, false);
            txtCompanyFax.Text = YamaZoo.SaveString(web_companyfax, false);
            //txtCompanyPostalCode.Text = YamaZoo.SaveString(web_companypostalcode, false);           
            if (web_companycity.Trim() != "")
                ddlCompanyCity.SelectedValue = web_companycity;
            if (web_companydistrict.Trim() != "")
            {
                ddlCompanyCity.DataBind();
                SqlDataSource6.DataBind();
                ddlCompanyDistrict.SelectedValue = web_companydistrict;
            }
            txtCompanyAddress.Text = YamaZoo.SaveString(web_companyaddress, false);
            txtTaxID.Text = YamaZoo.SaveString(web_taxid, false);
            txtWebKeyword.Text = YamaZoo.SaveString(web_keyword, false);
            txtWebDescription.Text = YamaZoo.SaveString(web_description, false);
            //Img_logo.ImageUrl = "../images/" + web_logo + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string web_id = "";
            string web_title = "";
            string web_slogan = "";
            string web_marquee = "";
            string web_contentprotect = "";
            string web_company = "";
            string web_companyphone = "";
            string web_companycellphone = "";
            string web_companyfax = "";
            //string web_companypostalcode = "";
            string web_companycity = "";
            string web_companydistrict = "";
            string web_companyaddress = "";
            string web_taxid = "";
            string web_keyword = "";
            string web_description = "";
            string web_logo = "";


            web_id = lblWebid.Text;
            web_title = YamaZoo.SaveString(txtWebTitle.Text, true);
            web_slogan = YamaZoo.SaveString(txtWebSlogan.Text, true);
            web_marquee = "";// YamaZoo.SaveString(txtMarquee.Text, true);
            web_company = YamaZoo.SaveString(txtCompany.Text, true);
            web_companyphone = YamaZoo.SaveString(txtCompanyPhone.Text, true);
            web_companycellphone = YamaZoo.SaveString(txtCompanyCellPhone.Text, true);
            web_companyfax = YamaZoo.SaveString(txtCompanyFax.Text, true);
            //web_companypostalcode = YamaZoo.SaveString(txtCompanyPostalCode.Text, true);
            web_companycity = ddlCompanyCity.SelectedValue.ToString();
            web_companydistrict = ddlCompanyDistrict.SelectedValue.ToString();
            web_companyaddress = YamaZoo.SaveString(txtCompanyAddress.Text, true);
            web_taxid = YamaZoo.SaveString(txtTaxID.Text, true);
            web_keyword = YamaZoo.SaveString(txtWebKeyword.Text, true);
            web_description = YamaZoo.SaveString(txtWebDescription.Text, true);
            //**************
            //網站logo
            //int w_size = 480;
            //int h_size = 640;
            //int index = 1;

            //string filename = "web_logo";
            //if (FUL_logo.HasFile)
            //{
            //    string extname = (FUL_logo.FileName).Substring(FUL_logo.FileName.Length - 3).ToLower();
            //    UpLoadImg(FUL_logo, filename, w_size, h_size, index);
            //    Img_logo.ImageUrl = "../images/" + filename + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            //    //btnDImg1.Enabled = true;
            //    string sqlimg = "UPDATE web SET web_logo = '" + filename + "." + extname + "' WHERE web_id = '00001'";
            //    Mei.connSql(sqlimg);
            //    lblimg1.Text = filename;
            //    //pnimg1.Visible = true;
            //}
            //**************

            string sql = "";
            sql += "UPDATE web SET ";
            sql += "web_title = N'" + web_title + "', ";
            sql += "web_slogan = N'" + web_slogan + "', ";
            sql += "web_marquee = N'" + web_marquee + "', ";
            sql += "web_contentprotect = N'" + web_contentprotect + "', ";
            sql += "web_company = N'" + web_company + "', ";
            sql += "web_companyphone = N'" + web_companyphone + "', ";
            sql += "web_companycellphone = N'" + web_companycellphone + "', ";
            sql += "web_companyfax = N'" + web_companyfax + "', ";
            //sql += "web_companypostalcode = N'" + web_companypostalcode + "', ";
            sql += "web_companycity = '" + web_companycity + "', ";
            sql += "web_companydistrict = '" + web_companydistrict + "', ";
            sql += "web_companyaddress = N'" + web_companyaddress + "', ";
            sql += "web_taxid = N'" + web_taxid + "', ";
            sql += "web_keyword = N'" + web_keyword + "', ";
            sql += "web_description = N'" + web_description + "' ";
            sql += "WHERE web_id = " + lblWebid.Text;
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
                    string path1 = Server.MapPath("~/images/" + filename + "_." + extname);//暫存圖檔
                    string path2 = Server.MapPath("~/images/" + filename + "." + extname);//實質圖檔
                    file.SaveAs(path1);
                    Mei.resizepPic(path1, path2, filename, extname, w_size, h_size);
                    vsname = string.Concat("web_logo");
                    ViewState[vsname] = filename + "." + extname;
                }
                catch { alert = "發生不明錯誤，無法儲存圖片！"; YamaZoo.scriptAlert(alert); }
            }
            else { alert = "圖片格式只接受Jpg與Gif檔案格式！"; YamaZoo.scriptAlert(alert); }
        }
    }
}