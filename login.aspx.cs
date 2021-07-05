using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Text;
using System.Net;
using System.Net.Mail;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void logingOK_Click(object sender, EventArgs e)
    {
        if (txtL_id.Text.Trim().Length != 0 && txtL_password.Text.Trim().Length != 0)
        {
            try
            {
                string sql = "select * from users where users_id = '" + txtL_id.Text + "' and users_password = '" + txtL_password.Text + "' and users_check!=0";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lblL_msg.Visible = false;
                    Session["u_id"] = (rd["users_id"].ToString());
                    Session["u_role"] = (rd["users_role"].ToString().Trim());
                    Session["u_name"] = (rd["users_name"].ToString().Trim());

                    //最後登入日期
                    sql = "update users set users_logindate='" + DateTime.Now.ToString("yyyy/MM/dd") + "' where users_id='" + rd["users_id"].ToString() + "'";
                    Mei.connSql(sql);

                    Response.Write("<script language='javascript'>alert('歡迎會員 " + Session["u_name"].ToString() + " 登入！');location.href='index.aspx';</script>");
                }
                else
                {
                    Session.Remove("u_id");
                    //lblL_msg.Visible = true;
                    //lblL_msg.Text = "帳號或密碼錯誤，請重新輸入！";
                    string alert = "帳號或密碼錯誤，請重新輸入！";
                    YamaZoo.scriptAlert(alert);
                }
                rd.Close();
                conn.Close();
            }
            catch
            {
                //lblL_msg.Visible = true;
                //lblL_msg.Text = "發生不明錯誤，無法讀取資料！";
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
        else
        {
            //lblL_msg.Visible = true;
            //lblL_msg.Text = "請輸入帳號、密碼！";
            string alert = "請輸入帳號、密碼！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btn_passwd_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btn_cnl_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btn_forgetpasswd_Click(object sender, EventArgs e)
    {
        if (txt_id.Text.Length != 0 && txt_email.Text.Length != 0)
        {
            string users_id = txt_id.Text.Trim();
            string users_email = txt_email.Text.Trim();

            string sql = "select users_password from users where users_id='" + users_id + "' and users_mail='" + users_email + "'";
            DataTable dt = YamaZoo.GetDataTable(sql);
            if (dt.Rows.Count != 0)
            {
                sentMail(dt.Rows[0]["users_password"].ToString(), users_email);
                YamaZoo.scriptAlert("您的密碼已寄出，快去看看吧！");
            }
            else
            {
                YamaZoo.scriptAlert("帳號密碼錯誤！");
            }
        }
        else
        {
            YamaZoo.scriptAlert("帳號或信箱尚未輸入！");
        }
    }
    private void sentMail(string users_password, string users_email)
    {
        MailAddress from = new MailAddress(users_email, "VIP商城購物網", Encoding.UTF8);
        MailMessage msgMail = new MailMessage(from, new MailAddress(users_email));
        msgMail.Subject = "VIP商城購物網 - 會員密碼通知信";
        msgMail.SubjectEncoding = Encoding.UTF8;
        string strBody = "<html><body>";
        strBody += "<div>";
        strBody += "親愛的會員<strong>" + txt_id.Text.Trim() + "</strong>您好，以下為您的設定密碼<br />";
        strBody += "密碼為：<strong>" + users_password + "<strong><br /><br />";
        strBody += "<span style=\"color:#f00;\">請您務必在登入後盡快修改您的密碼，以確保資訊安全！</span>";
        strBody += "</div><br />";
        strBody += "---------------------------------------------------------------------<br />";
        strBody += "本訊息由系統自動寄出，請勿直接回覆此信。<br />";
        strBody += "VIP商城購物網 - <a href=\"http://www.vip7-11.com.tw\">www.vip7-11.com.tw</a><br />";
        strBody += "</body></html>";
        msgMail.Body = strBody;
        msgMail.BodyEncoding = Encoding.UTF8;
        msgMail.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient(ConfigurationSettings.AppSettings["mailSMTP"], Int32.Parse(ConfigurationSettings.AppSettings["mailSMTPort"]));
        smtp.Credentials = new NetworkCredential(ConfigurationSettings.AppSettings["mail104look"], ConfigurationSettings.AppSettings["mailPassword"]);
        smtp.EnableSsl = true;

        smtp.Send(msgMail);
    }
}