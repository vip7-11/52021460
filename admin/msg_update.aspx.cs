using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_msg_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string msg_no = "";
                string msg_title = "";
                string msg_content = "";

                msg_no = Request.QueryString["msg_no"].ToString();

                string sql = "select * from msg where msg_no = '" + msg_no + "'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    msg_title = (rd["msg_title"].ToString());
                    msg_content = (rd["msg_content"].ToString());
                }
                rd.Close();
                conn.Close();

                lblmsg_no.Text = msg_no;
                txtTitle.Text = msg_title;
                txtContent.Value = Server.HtmlDecode(msg_content);
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
            string msg_no = lblmsg_no.Text;
            string msg_title = YamaZoo.SaveString(txtTitle.Text, true);
            string msg_content = txtContent.Value.Replace("'", "''");

            string sql = "UPDATE msg SET ";
            sql += "msg_title = N'" + msg_title + "', ";
            sql += "msg_content = N'" + msg_content + "' ";
            sql += "WHERE msg_no = '" + msg_no + "'";
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
            string sql = "DELETE FROM msg WHERE msg_no = '" + lblmsg_no.Text.Trim() + "'";
            Mei.connSql(sql);
            Response.Redirect("msg_list.aspx?menu=5");
        }
        catch
        {
            string alert = "發生不明錯誤，無法刪除資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("msg_list.aspx?menu=5");
    }
}