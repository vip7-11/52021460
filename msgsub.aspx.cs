using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class msgsub : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["u_id"] == null)
            {
                pnmsg1.Visible = true;
                pnmsg2.Visible = false;
            }
            else
            {
                pnmsg1.Visible = false;
                pnmsg2.Visible = true;
            }
            try
            {
                string msg_no = "";
                string msg_title = "";
                string msg_date = "";
                string msg_time = "";
                string msg_author = "";
                string msg_content = "";

                msg_no = Request.QueryString["no"].ToString();

                string sql = "select * from msg where msg_no = '" + msg_no + "'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    msg_title = (rd["msg_title"].ToString());
                    msg_date = (rd["msg_date"].ToString());
                    msg_time = (rd["msg_time"].ToString());
                    msg_author = (rd["msg_author"].ToString());
                    msg_content = (rd["msg_content"].ToString());
                }
                rd.Close();
                conn.Close();

                lblmsg_no.Text = msg_no;
                lblmsg_title.Text = msg_title;
                lblmsg_date.Text = msg_date;
                lblmsg_time.Text = msg_time;
                lblmsg_author.Text = msg_author;
                lblmsg_content.Text = Server.HtmlDecode(msg_content);

                string sql1 = "select * from msgsub where msg_no = '" + msg_no + "'";
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader rd1 = cmd1.ExecuteReader();

                if (rd1.HasRows)
                {
                    pnMsg.Visible = false;
                    pnList.Visible = true;
                }
                else
                {
                    lblmsg.Text = "目前沒有任何回覆！";
                    pnMsg.Visible = true;
                    pnList.Visible = false;
                }
            }
            catch
            {
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void replyGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
            e.Row.Cells[1].Visible = false; //設欄位隱藏
        }
    }
    protected void replyGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        replyGv.PageIndex = e.NewPageIndex;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtContent.Value.Trim() == "")
        {
            string alert = "回覆內容不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string msg_no = lblmsg_no.Text;
            string msgsub_no = Mei.GetMaxNoCond(6, "msgsub", "msgsub_no", "msg_no", msg_no);
            string msgsub_content = txtContent.Value.Replace("'", "''");
            string msgsub_date = DateTime.Now.ToString("yyyy/MM/dd");
            string msgsub_time = DateTime.Now.ToString("HH:mm:ss");
            string msgsub_author = Session["u_name"].ToString();

            try
            {
                string sql = "";
                sql += "INSERT INTO msgsub ( msg_no, msgsub_no, msgsub_content, msgsub_date, msgsub_time, msgsub_author ) VALUES (";
                sql += "'" + msg_no + "',";
                sql += "'" + msgsub_no + "',";
                sql += "N'" + msgsub_content + "',";
                sql += "'" + msgsub_date + "',";
                sql += "'" + msgsub_time + "',";
                sql += "'" + msgsub_author + "')";
                Mei.connSql(sql);

                txtContent.Value = "";
                replyGv.DataBind();
                SqlDataSource1.DataBind();
                pnMsg.Visible = false;
                pnList.Visible = true;

                string alert = "回覆成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法新增資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
}