using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Security;

public partial class user_account_update : System.Web.UI.Page
{
    string ChkOk = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string users_id = "";
            string users_role = "";
            string users_mail = "";
            string users_name = "";
            string users_nickname = "";
            string users_sex = "";
            string users_pid = "";
            string users_birthday = "";
            string users_phone = "";
            string users_cellphone = "";
            string users_fax = "";
            string users_city = "";
            string users_district = "";
            string users_address = "";
            string users_memo = "";
            string users_epaper = "";
            //string users_portalcode = "";
            string users_check = "";

            users_id = HttpContext.Current.Session["users_id"].ToString();
            Session["users_id"] = null;

            string sql = "select * from users where users_id = '" + users_id + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                users_role = (rd["users_role"].ToString());
                users_mail = (rd["users_mail"].ToString());
                users_name = (rd["users_name"].ToString());
                users_nickname = (rd["users_nickname"].ToString());
                users_sex = (rd["users_sex"].ToString());
                users_pid = (rd["users_pid"].ToString());
                users_birthday = (rd["users_birthday"].ToString());
                users_phone = (rd["users_phone"].ToString());
                users_cellphone = (rd["users_cellphone"].ToString());
                users_fax = (rd["users_fax"].ToString());
                users_city = (rd["users_city"].ToString().Trim());
                users_district = (rd["users_district"].ToString());
                users_address = (rd["users_address"].ToString());
                users_memo = (rd["users_memo"].ToString());
                users_epaper = (rd["users_epaper"].ToString());
                users_check = (rd["users_check"].ToString());//users_check

                //users_portalcode = (rd["users_portalcode"].ToString());
            }
            rd.Close();
            conn.Close();           

            lblUserId.Text = users_id;
            ddlUserRole.SelectedValue = YamaZoo.SaveString(users_role, false); 
            txtEmail.Text = YamaZoo.SaveString(users_mail, false); 
            txtName.Text = YamaZoo.SaveString(users_name, false); 
            txtNickname.Text = YamaZoo.SaveString(users_nickname, false); 
            if (users_sex == "1")
                rdoUserSexMale.Checked = true;
            else if (users_sex == "2")
                rdoUserSexFemale.Checked = true;
            txtUserPID.Text = YamaZoo.SaveString(users_pid, false); 
            txtBirthday.Text = YamaZoo.SaveString(users_birthday, false); 
            txtPhone.Text = YamaZoo.SaveString(users_phone, false); 
            txtCellphone.Text = YamaZoo.SaveString(users_cellphone, false); 
            txtFax.Text = YamaZoo.SaveString(users_fax, false);
            if (users_city.Trim() != "")
                ddlCity.SelectedValue = users_city;
            if (users_district.Trim() != "")
            {
                ddlCity.DataBind();
                SqlDataSource6.DataBind();
                ddlVillage.SelectedValue = users_district;
            }              
            txtAddress.Text = YamaZoo.SaveString(users_address, false);
            txt_memo.Text = YamaZoo.SaveString(users_memo, false);
            //cbEpaper.Checked = Convert.ToBoolean(users_epaper);
            if (users_sex == "0")
                lblcheck.Text = "<span style=' color:red'>尚未驗證</span>";
            else if (users_sex == "1")
                lblcheck.Text = "已驗證";
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
    protected void btnUserSubmit_Click(object sender, EventArgs e)
    {
        ChkOk = "2";
        if (ChkOk == "2") { resetCheckEmail(); }
        if (ChkOk == "2") { resetCheckPid(); }

        if (ChkOk == "2")
        {
            try
            {
                string users_id = "";
                string users_role = "";
                string users_mail = "";
                string users_name = "";
                string users_nickname = "";
                string users_sex = "1";
                string users_pid = "";
                string users_birthday = "";
                string users_phone = "";
                string users_cellphone = "";
                string users_fax = "";
                string users_city = "";
                string users_district = "";
                string users_address = "";
                string users_memo = "";
                //string users_epaper = "";
                //string users_portalcode = "";

                users_id = lblUserId.Text;
                users_role = ddlUserRole.SelectedValue.ToString();
                users_mail = YamaZoo.SaveString(txtEmail.Text, true);
                users_name = YamaZoo.SaveString(txtName.Text, true);
                users_nickname = YamaZoo.SaveString(txtNickname.Text, true);
                if (rdoUserSexMale.Checked == true) { users_sex = "1"; }
                else if (rdoUserSexFemale.Checked == true) { users_sex = "2"; }
                users_pid = YamaZoo.SaveString(txtUserPID.Text, true);
                users_birthday = YamaZoo.SaveString(txtBirthday.Text, true);
                users_phone = YamaZoo.SaveString(txtPhone.Text, true);
                users_cellphone = YamaZoo.SaveString(txtCellphone.Text, true);
                users_fax = YamaZoo.SaveString(txtFax.Text, true);
                users_city = ddlCity.SelectedValue.ToString();
                users_district = ddlVillage.SelectedValue.ToString();
                users_address = YamaZoo.SaveString(txtAddress.Text, true);
                users_memo = YamaZoo.SaveString(txt_memo.Text, true);
                //users_epaper = cbEpaper.Checked.ToString();

                string sql = "UPDATE users SET ";
                sql += "users_role = '" + users_role + "', ";
                sql += "users_mail = N'" + users_mail + "', ";
                sql += "users_name = N'" + users_name + "', ";
                sql += "users_nickname = N'" + users_nickname + "', ";
                sql += "users_sex = '" + users_sex + "', ";
                sql += "users_pid = '" + users_pid + "', ";
                sql += "users_birthday = '" + users_birthday + "', ";
                sql += "users_phone = '" + users_phone + "', ";
                sql += "users_cellphone = '" + users_cellphone + "', ";
                sql += "users_fax = '" + users_fax + "', ";
                sql += "users_city = '" + users_city + "', ";
                sql += "users_district = '" + users_district + "', ";
                sql += "users_address = N'" + users_address + "',  ";
                sql += "users_memo = N'" + users_memo + "'  ";
                //sql += "users_epaper = '" + users_epaper + "'  ";
                //sql += "users_portalcode = N'" + users_portalcode + "', ";
                sql += "WHERE users_id = '" + users_id + "'";
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
        else
        {
            string alert = "修改資料失敗！";
            YamaZoo.scriptAlert(alert);
        }        
    }
    protected void btnUserBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("account_list.aspx?menu=1");
    }
    private void resetCheckPassword()
    {
        string users_password = "";
        users_password = txtPassword.Text.Trim();

        if (users_password.Length == 0)
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "密碼不可為空白！";
            ChkOk = "1";
        }
        else if (users_password.Length < 6)
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "密碼格式錯誤！";
            ChkOk = "1";
        }
        else
        {
            lblPassword.ForeColor = System.Drawing.Color.Red;
            lblPassword.Text = "";
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
                ChkOk = "2";
            }
            else
            {
                lblCheckID.ForeColor = System.Drawing.Color.Red;
                lblCheckID.Text = users_chkpid;
                ChkOk = "1";
            }
        }
    }
    protected void btnUserDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "DELETE FROM users WHERE users_id = '" + lblUserId.Text.Trim() + "'";
            Mei.connSql(sql);
            Response.Redirect("account_list.aspx?menu=1");
        }
        catch
        {
            string alert = "發生不明錯誤，無法刪除資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
}