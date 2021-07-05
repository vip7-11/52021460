using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;

public partial class reg : System.Web.UI.Page
{
    string ChkOk = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.Get("reg") != null)
            {
                try
                {
                    string user_id = Request.QueryString.Get("reg").ToString();
                    //成正式會員
                    string sql = "update users set users_check='1' where users_id='" + user_id + "'";
                    Mei.connSql(sql);
                    registerMultiView.ActiveViewIndex = 2;
                }
                catch
                {
                    string alert = "發生不明錯誤，請洽管理員！";
                    YamaZoo.scriptAlert(alert);
                    return;
                }
            }
        }
    }
    protected void btnNotAgree_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void btnAgree_Click(object sender, EventArgs e)
    {
        registerMultiView.ActiveViewIndex = 1;
    }
    protected void ckbArgee_CheckedChanged(object sender, EventArgs e)
    {
        btnAgree.Enabled = ckbArgee.Checked;
    }
    protected void btnCheckAccount_Click(object sender, EventArgs e)
    {
        resetCheckAccount();
    }
    private void resetCheckAccount()
    {
        string users_id = "";
        users_id = txtUserId.Text.Trim();

        if (users_id.Length == 0)
        {
            lblCheckAccount.ForeColor = System.Drawing.Color.Red;
            lblCheckAccount.Text = "帳號不可為空白！";
            lblAddUserMsg.Text = "請重新輸入您的帳號！";
            ChkOk = "1";
        }
        else
        {
            //---讀取網站資料---
            string sql = "select users_id from users where users_id = '" + users_id + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                lblCheckAccount.ForeColor = System.Drawing.Color.Red;
                lblCheckAccount.Text = "帳號名稱已存在！";
                lblAddUserMsg.Text = "請重新輸入您的帳號！";
                ChkOk = "1";
            }
            else
            {
                lblCheckAccount.ForeColor = System.Drawing.Color.Red;
                lblCheckAccount.Text = "帳號可以使用！";
                lblAddUserMsg.Text = "*為必填欄位！";
                ChkOk = "2";
            }
            rd.Close();
            conn.Close();
        }
    }
    private void resetCheckPassword()
    {
        string users_password = "";
        users_password = txtPassword.Text.Trim();

        if (users_password.Length == 0)
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "密碼不可為空白！";
            lblAddUserMsg.Text = "請重新輸入您的密碼！";
            ChkOk = "1";
        }
        else if (users_password.Length < 6)
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "密碼格式錯誤！";
            lblAddUserMsg.Text = "請重新輸入您的密碼！";
            ChkOk = "1";
        }
        else
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "";
            lblAddUserMsg.Text = "*為必填欄位！";
            ChkOk = "2";
        }
    }
    private void resetCheckEmail()
    {
        string users_chkmail = "";
        users_chkmail = txtEmail.Text.Trim();

        if (users_chkmail.Length == 0)
        {
            lblCheckEmail.ForeColor = System.Drawing.Color.Red;
            lblCheckEmail.Text = "電子郵件不可為空白！";
            lblAddUserMsg.Text = "請重新輸入您的電子郵件！";
            ChkOk = "1";
        }
    }
    private void resetCheckPid()
    {
        string users_chkpid = "";
        users_chkpid = txtUserPID.Text.Trim();

        if (users_chkpid.Length == 0)
        {
            lblCheckID.ForeColor = System.Drawing.Color.Red;
            lblCheckID.Text = "身分證不可為空白！";
            lblAddUserMsg.Text = "請重新輸入您的身分證！";
            ChkOk = "1";
        }
        else
        {
            users_chkpid = YamaZoo.CheckCPID(txtUserPID.Text);
            //---身分證驗證無錯誤回報---
            if (users_chkpid.Length == 0)
            {
                lblCheckID.ForeColor = System.Drawing.Color.Red;
                lblCheckID.Text = "";
                lblAddUserMsg.Text = "*為必填欄位！";
                ChkOk = "2";
            }
            else
            {
                lblCheckID.ForeColor = System.Drawing.Color.Red;
                lblCheckID.Text = users_chkpid;
                lblAddUserMsg.Text = "請重新輸入您的身分證！";
                ChkOk = "1";
            }
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        ChkOk = "2";
        if (ChkOk == "2") { resetCheckAccount(); }
        if (ChkOk == "2") { resetCheckPassword(); }
        if (ChkOk == "2") { resetCheckEmail(); }
        if (ChkOk == "2") { resetCheckPid(); }

        if (ChkOk == "2")
        {
            try
            {
                string users_id = txtUserId.Text.Trim();
                string users_password = txtPassword.Text.Trim();
                string users_role = "02"; //01管理者; 02一般
                string users_mail = txtEmail.Text.Trim();
                string users_pid = txtUserPID.Text.Trim();
                string users_name = txtName.Text.Trim();
                string users_nickname = txtNickname.Text.Trim();
                string users_sex = "";
                if (rdoUserSexMale.Checked == true) { users_sex = "1"; }
                else if (rdoUserSexFemale.Checked == true) { users_sex = "2"; }
                string users_birthday = txtBirthday.Text.Trim();
                string users_phone = txtPhone.Text.Trim();
                string users_cellphone = txtCellphone.Text.Trim();
                string users_fax = txtFax.Text.Trim();
                string users_city = ddlCity.SelectedValue.ToString();
                string users_district = ddlVillage.SelectedValue.ToString();
                string users_address = txtAddress.Text.Trim();
                string users_portalcode = ddlVillage.SelectedValue.ToString();
                string users_date = DateTime.Today.ToString("yyyy/MM/dd");
                string users_registerdate = users_date;
                string users_logindate = users_date;
                //string users_epaper = cbEpaper.Checked.ToString();
                string users_epaper = "False";

                string sql = "";
                sql += "INSERT INTO users ( users_id, users_password, users_role, users_mail, users_name, users_nickname, users_sex, users_pid, users_birthday, users_phone, users_cellphone, users_fax, users_city, users_district, users_address, users_portalcode, users_registerdate, users_logindate, users_check, users_epaper ) VALUES (";
                sql += "'" + users_id + "',";
                sql += "'" + users_password + "',";
                sql += "'" + users_role + "',";
                sql += "'" + users_mail + "',";
                sql += "N'" + users_name + "',";
                sql += "N'" + users_nickname + "',";
                sql += "'" + users_sex + "',";
                sql += "'" + users_pid + "',";
                sql += "'" + users_birthday + "',";
                sql += "'" + users_phone + "',";
                sql += "'" + users_cellphone + "',";
                sql += "'" + users_fax + "',";
                sql += "'" + users_city + "',";
                sql += "'" + users_district + "',";
                sql += "N'" + users_address + "',";
                sql += "'" + users_portalcode + "',";
                sql += "'" + users_registerdate + "',";
                sql += "'" + users_logindate + "',";
                sql += "'0',";
                sql += "'" + users_epaper + "')";//users_check

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                //EMAIL驗證信
                sentShoppingMail();

                string alert = "會員註冊驗證信已發出，請至您所填之信箱查看，完成會員註冊！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                lblAddUserMsg.Text = "*為必填欄位！";
                string alert = "發生不明錯誤，無法註冊！";
                YamaZoo.scriptAlert(alert);
            }
        }
        else
        {
            lblAddUserMsg.Text = "*為必填欄位！";
            string alert = "資料驗證不符！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void sentShoppingMail()
    {
        string sql = "select web_title from web where web_id = '00001'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        string web_title = YamaZoo.SaveString(cmd.ExecuteScalar().ToString(), false);
        conn.Close();

        string strBody = "<html><body>";
        strBody += txtName.Text + " 女士/先生 您好：<br />";
        strBody += "《" + web_title + " 》已經收到您的會員加入通知！<br />";
        strBody += "本通知函只是作為驗證會員信箱，不代表已經完成註冊。";
        strBody += "請再按以下之連結，以便完成會員註冊<br /><br /><br />";
        strBody += "---------------------------------------------------------------------<br />";
        strBody += "您須按此連結做會員驗證以便正式完成會員加入vip7-11購物商城>>&nbsp;&nbsp;<a href='http://www.vip7-11.com.tw/reg.aspx?reg=" + HttpContext.Current.Server.UrlEncode(txtUserId.Text.Trim()) + "' target=\"_blank\">會員註冊驗證</a><br /><br /><br />";
        strBody += "此訊息發自vip7-11購物商城，告知您的會員加入與通知！<br />";
        strBody += "感謝您對vip7-11購物商城的支持，<br />若有問題則請與我們聯絡，感謝您！<br /><br />";
        strBody += "---------------------------------------------------------------------<br />";
        strBody += "本訊息由系統自動寄出，請勿直接回覆此信。<br />";
        strBody += "vip7-11購物商城 - <a href=\"http://www.vip7-11.com.tw\" target=\"_blank\">www.vip7-11.com.tw</a><br />";
        strBody += "</body></html>";
        //***sentMail***
        Mei.sentMail2(txtEmail.Text.Trim(), "vip7-11購物商城 - [會員註冊通知] ", strBody, "vip7-11購物商城");
        //******

    }
}