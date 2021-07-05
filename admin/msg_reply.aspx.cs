using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_msg_reply : System.Web.UI.Page
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
                lblTitle.Text = msg_title;
                lblContent.Text = Server.HtmlDecode(msg_content);

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
    protected void btnReply_Click(object sender, EventArgs e)
    {
        pnAdd.Visible = true;
    }
    protected void replyGv_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
            e.Row.Cells[1].Visible = false; //設欄位隱藏
        }
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
            string msgsub_author = "系統管理員";

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
                pnAdd.Visible = false;
                replyGv.DataBind();
                SqlDataSource1.DataBind();
                pnMsg.Visible = false;
                pnList.Visible = true;

                string alert = "新增資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法新增資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void replyGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        replyGv.PageIndex = e.NewPageIndex;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string msg_no = lblmsg_no.Text;

            string sql = "DELETE FROM msg WHERE msg_no = '" + msg_no + "'";
            Mei.connSql(sql);
            string sql1 = "DELETE FROM msgsub WHERE msg_no = '" + msg_no + "'";
            Mei.connSql(sql1);

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
    protected void replyGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DEL")
        {
            //---取得編號資料---
            string index = Convert.ToString(e.CommandArgument);
            char[] Ch = new char[] { ',' };
            string[] C1 = index.Split(Ch, StringSplitOptions.RemoveEmptyEntries);

            string msg_no = C1[0];
            string msgsub_no = C1[1];            

            try
            {
                string sql = "DELETE FROM msgsub WHERE msg_no = '" + msg_no + "' AND msgsub_no = '" + msgsub_no + "'";
                Mei.connSql(sql);

                replyGv.DataBind();
                SqlDataSource1.DataBind();

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

                string alert = "刪除資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法刪除資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtContent.Value = "";
        pnAdd.Visible = false;
    }
}