using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_faq_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string faq_no = "";
                string faq_title = "";
                string faq_content = "";

                faq_no = Request.QueryString["faq_no"].ToString();

                string sql = "select * from faq where faq_no = '" + faq_no + "'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    faq_title = (rd["faq_title"].ToString());
                    faq_content = (rd["faq_content"].ToString());
                }
                rd.Close();
                conn.Close();

                lblfaq_no.Text = faq_no;
                txtTitle.Text = faq_title;
                txtContent.Value = Server.HtmlDecode(faq_content);
            }
            catch
            {
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string faq_no = lblfaq_no.Text;
            string faq_title = YamaZoo.SaveString(txtTitle.Text, true);
            string faq_content = txtContent.Value.Replace("'", "''");

            string sql = "UPDATE faq SET ";
            sql += "faq_title = N'" + faq_title + "', ";
            sql += "faq_content = N'" + faq_content + "' ";
            sql += "WHERE faq_no = '" + faq_no + "'";
            Mei.connSql(sql);

            string alert = "修改資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "DELETE FROM faq WHERE faq_no = '" + lblfaq_no.Text.Trim() + "'";
            Mei.connSql(sql);
            Response.Redirect("faq_list.aspx?menu=6");
        }
        catch
        {
            string alert = "發生不明錯誤，無法刪除資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("faq_list.aspx?menu=6");
    }
}