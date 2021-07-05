using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_msg_add : System.Web.UI.Page
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
            string msg_no = Mei.GetMaxNo(6, "msg", "msg_no");
            string msg_title = YamaZoo.SaveString(txtTitle.Text, true);
            string msg_content = txtContent.Value.Replace("'", "''");
            string msg_date = DateTime.Now.ToString("yyyy/MM/dd");
            string msg_time = DateTime.Now.ToString("HH:mm:ss");
            string msg_author = Session["u_name"].ToString();

            try
            {
                string sql = "";
                sql += "INSERT INTO msg ( msg_no, msg_title, msg_content, msg_date, msg_time, msg_author ) VALUES (";
                sql += "'" + msg_no + "',";
                sql += "N'" + msg_title + "',";
                sql += "N'" + msg_content + "',";
                sql += "'" + msg_date + "',";
                sql += "'" + msg_time + "',";
                sql += "'" + msg_author + "')";
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