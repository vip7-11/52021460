using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web;

public partial class user_edit : System.Web.UI.Page
{
    string ChkOk = "";
    string ChkPasswd = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlUser = "";
        string user_id = "";
        DataTable dt;
        if (!IsPostBack)
        {
            if (Session["u_id"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                user_id = Session["u_id"].ToString();
            }

            sqlUser = "select * from users where users_id='" + user_id + "'";
            dt = Mei.GetDataTable(sqlUser);
            lblUserId.Text = dt.Rows[0]["users_id"].ToString().Trim();
            HttpContext.Current.Session["users_password"] = dt.Rows[0]["users_password"].ToString().Trim();
            txtEmail.Text = dt.Rows[0]["users_mail"].ToString().Trim();
            txtUserPID.Text = "******" + dt.Rows[0]["users_pid"].ToString().Trim().Substring(6, 4);
            txtName.Text = dt.Rows[0]["users_name"].ToString().Trim();
            txtNickname.Text = dt.Rows[0]["users_nickname"].ToString().Trim();
            string users_sex = dt.Rows[0]["users_sex"].ToString().Trim();
            if (users_sex == "1")
            { rdoUserSexMale.Checked = true; }
            else if (users_sex == "2")
            { rdoUserSexFemale.Checked = true; }
            txtBirthday.Text = dt.Rows[0]["users_birthday"].ToString().Trim();
            txtPhone.Text = dt.Rows[0]["users_phone"].ToString().Trim();
            txtCellphone.Text = dt.Rows[0]["users_cellphone"].ToString().Trim();
            //txtFax.Text = dt.Rows[0]["users_fax"].ToString().Trim();
            ddlCity.SelectedValue = dt.Rows[0]["users_city"].ToString().Trim();
            ddlVillage.SelectedValue = dt.Rows[0]["users_district"].ToString().Trim();
            txtAddress.Text = dt.Rows[0]["users_address"].ToString().Trim();
            //cbEpaper.Checked = Convert.ToBoolean(dt.Rows[0]["users_epaper"].ToString().Trim());


        }
    }
    protected void btnCheckAccount_Click(object sender, EventArgs e)
    {
        //resetCheckAccount();
    }
    private void resetCheckPassword()
    {
        string users_password = "";
        string users_passwordRe = "";
        users_password = txtPassword.Text.Trim();
        users_passwordRe = txtPasswordRe.Text.Trim();

        if (users_password.Length == 0)
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "密碼不可為空白！";
            ChkOk = "1";
        }
        else if (users_password.Length < 6)
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "密碼格式錯誤！(請輸入大於6位數之英數數字)";
            ChkOk = "1";
        }
        else
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "";
            HttpContext.Current.Session["users_password"] = txtPassword.Text.Trim();
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
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        ChkOk = "2";
        if (ChkOk == "2") { resetCheckPassword(); }
        if (ChkOk == "2")
        {
            string users_id = "";
            string users_password = "";

            users_id = lblUserId.Text;
            users_password = YamaZoo.SaveString(txtPassword.Text, true);

            string sql = "UPDATE users SET users_password = N'" + users_password + "' WHERE users_id = '" + users_id + "'";
            Mei.connSql(sql);

            string alert = "修改密碼成功！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string alert = "修改密碼失敗！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        ChkOk = "2";
        //if (ChkOk == "2") { /*resetCheckAccount();*/ }
        if (txtPassword.Text.Length == 0 && txtPasswordRe.Text.Length == 0)
        { }
        else
        {
            if (ChkOk == "2") { resetCheckPassword(); }
        }

        if (ChkOk == "2") { resetCheckEmail(); }
        //if (ChkOk == "2") { resetCheckPid(); }

        if (ChkOk == "2")
        {
            try
            {
                string users_id = lblUserId.Text.Trim();
                string users_password = HttpContext.Current.Session["users_password"].ToString();
                //string users_role = "02"; //01管理者; 02使用者
                string users_mail = txtEmail.Text.Trim();
                //string users_pid = txtUserPID.Text.Trim();
                string users_name = txtName.Text.Trim();
                string users_nickname = txtNickname.Text.Trim();
                string users_sex = "";
                if (rdoUserSexMale.Checked == true) { users_sex = "1"; }
                else if (rdoUserSexFemale.Checked == true) { users_sex = "2"; }
                string users_birthday = txtBirthday.Text.Trim();
                string users_phone = txtPhone.Text.Trim();
                string users_cellphone = txtCellphone.Text.Trim();
                //string users_fax = txtFax.Text.Trim();
                string users_city = ddlCity.SelectedValue.ToString();
                string users_district = ddlVillage.SelectedValue.ToString();
                string users_address = txtAddress.Text.Trim();
                string users_portalcode = ddlVillage.SelectedValue.ToString();
                string users_date = DateTime.Today.ToString("yyyy/MM/dd");
                string users_registerdate = users_date;
                string users_logindate = users_date;
                //string users_epaper = cbEpaper.Checked.ToString();

                string sql = "";
                sql += "update users set ";
                //sql += "INSERT INTO users ( users_id, users_role, users_mail, users_name, users_nickname, users_sex, users_pid, users_birthday, users_phone, users_cellphone, users_fax, users_city, users_district, users_address, users_portalcode, users_registerdate, users_logindate, users_epaper ) VALUES (";
                sql += "users_id= '" + users_id + "',";
                sql += "users_password= N'" + users_password + "',";
                //sql += "'" + users_role + "',";
                sql += "users_mail= '" + users_mail + "',";
                sql += "users_name= N'" + users_name + "',";
                sql += "users_nickname= N'" + users_nickname + "',";
                sql += "users_sex= '" + users_sex + "',";
                //sql += "users_pid= '" + users_pid + "',";
                sql += "users_birthday= '" + users_birthday + "',";
                sql += "users_phone= '" + users_phone + "',";
                sql += "users_cellphone= '" + users_cellphone + "',";
                //sql += "users_fax= '" + users_fax + "',";
                sql += "users_city= '" + users_city + "',";
                sql += "users_district= '" + users_district + "',";
                sql += "users_address= N'" + users_address + "',";
                sql += "users_portalcode= '" + users_portalcode + "' ";
                //sql += "users_epaper= '" + users_epaper + "'";
                sql += " where users_id= '" + Session["u_id"].ToString() + "'";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                HttpContext.Current.Session["users_password"] = null;
                string alert = "會員資料修改成功！";
                YamaZoo.scriptAlert(alert);


                //if (Request.QueryString.Get("th") == "1")
                //{
                //    string sql2 = "select * from users where users_id = '" + users_id + "' and users_password = '" + users_password + "'";
                //    SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                //    SqlCommand cmd2 = new SqlCommand(sql2, conn2);
                //    conn2.Open();
                //    SqlDataReader rd2 = cmd2.ExecuteReader();
                //    if (rd2.Read())
                //    {
                //        Session["u_id"] = (rd2["users_id"].ToString());
                //        Session["u_role"] = (rd2["users_role"].ToString().Trim());
                //        Response.Redirect("acc.aspx");
                //    }
                //}
                //else
                //{
                //    Response.Redirect("regmsg.aspx");
                //}
            }
            catch
            {
                lblAddUserMsg.Text = "*為必填欄位！";
                string alert = "發生不明錯誤，無法修改！";
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}