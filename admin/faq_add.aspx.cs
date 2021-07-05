using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_faq_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text.Trim() == "" || txtContent.Value.Trim() == "")
        {
            string alert = "標題及內容不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string faq_no = Mei.GetMaxNo(6, "faq", "faq_no");
            string faq_title = YamaZoo.SaveString(txtTitle.Text, true);
            string faq_content = txtContent.Value.Replace("'", "''");
            string faq_date = DateTime.Now.ToString("yyyy/MM/dd");
            string faq_time = DateTime.Now.ToString("HH:mm:ss");
            //string faq_author = Session["u_name"].ToString();

            try
            {
                string sql = "";
                sql += "INSERT INTO faq (faq_no, faq_title, faq_content, faq_date, faq_time) VALUES (";
                sql += "'" + faq_no + "',";
                sql += "N'" + faq_title + "',";
                sql += "N'" + faq_content + "',";
                sql += "'" + faq_date + "',";
                sql += "'" + faq_time + "')";
                Mei.connSql(sql);

                txtTitle.Text = "";
                txtContent.Value = "";

                string alert = "新增資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，資料新增失敗！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
}