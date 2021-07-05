using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;
using System.Web.UI;

public partial class user_account_add : System.Web.UI.Page
{
    string ChkOk = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlAddUserRole.SelectedValue = "02";
        }
    }
    protected void btnAddUserSubmit_Click(object sender, EventArgs e)
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
                string users_role = ddlAddUserRole.SelectedValue.ToString();
                string users_mail = txtEmail.Text.Trim();
                string users_pid = txtAddUserPID.Text.Trim();
                string users_name = "";
                string users_nickname = "";
                string users_sex = "1";
                string users_birthday = "";
                string users_phone = "";
                string users_cellphone = "";
                string users_fax = "";
                string users_city = "";
                string users_district = "";
                string users_address = "";
                string users_portalcode = "";
                string users_date = DateTime.Today.ToString("yyyy/MM/dd");
                string users_registerdate = users_date;
                string users_logindate = users_date;
                string users_memo = YamaZoo.SaveString(txt_memo.Text.Trim(), true);

                string sql = "";
                sql += "INSERT INTO users ( users_id, users_password, users_role, users_mail, users_name, users_nickname, users_sex, users_pid, users_birthday, users_phone, users_cellphone, users_fax, users_city, users_district, users_address, users_portalcode, users_registerdate, users_logindate, users_memo,  users_check ) VALUES (";
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
                sql += "'" + users_memo + "',";
                //sql += "'" + cbEpaper.Checked + "')";
                sql += "'1')";

                Mei.connSql(sql);

                txtUserId.Text = "";
                txtPassword.Text = "";
                txtPasswordConfirm.Text = "";
                txtEmail.Text = "";
                txtAddUserPID.Text = "";
                resetCreateUserForm();

                string alert = "新增帳號成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                lblAddUserMsg.Text = "*為必填欄位！";
                string alert = "發生不明錯誤，無法新增資料！";
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
        users_chkpid = txtAddUserPID.Text.Trim();

        if (users_chkpid.Length == 0)
        {
            lblCheckID.ForeColor = System.Drawing.Color.Red;
            lblCheckID.Text = "身分證不可為空白！";
            lblAddUserMsg.Text = "請重新輸入您的身分證！";
            ChkOk = "1";
        }
        else
        {
            users_chkpid = YamaZoo.CheckCPID(txtAddUserPID.Text);
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
    protected void btnAddUserCancel_Click(object sender, EventArgs e)
    {
        //ddlAddUserRole.SelectedIndex = 0;
        txtUserId.Text = "";
        txtPassword.Text = "";
        txtPasswordConfirm.Text = "";
        txtEmail.Text = "";
        txtAddUserPID.Text = "";
        resetCreateUserForm();
    }
    private void resetCreateUserForm()
    {
        lblCheckAccount.Text = "";
        lblPassword.ForeColor = System.Drawing.Color.Red;
        lblPassword.Text = "密碼最短長度為6個字元。";
        lblCheckAccount.Text = "";
        lblCheckEmail.Text = "";
        lblAddUserMsg.Text = "*為必填欄位！";
        txtAddUserPID.Text = "";
    }
}