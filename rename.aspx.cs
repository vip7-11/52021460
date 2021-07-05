using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class rename : System.Web.UI.Page
{
    string sql;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        sql = "SELECT name, idcard, birthday, status FROM member WHERE (id=" + Convert.ToInt32(Session["loginer_id"].ToString()) + ")";
        dt = somecode.GetDataTable(sql);
        name.Text = dt.Rows[0][0].ToString();
        idcard.Text = dt.Rows[0][1].ToString();
        birthday.Text = dt.Rows[0][2].ToString();
        status.Text = dt.Rows[0][3].ToString();
    }
    protected void repassword1_CheckedChanged(object sender, EventArgs e)
    {
        passwordL.Visible = false;
        passwordT.Visible = false;
        repasswordL.Visible = false;
        repasswordT.Visible = false;
    }
    protected void repassword2_CheckedChanged(object sender, EventArgs e)
    {
        passwordL.Visible = true;
        passwordT.Visible = true;
        repasswordL.Visible = true;
        repasswordT.Visible = true;
    }
    protected void renameOK_Click(object sender, EventArgs e)
    {
        sql = "UPDATE member SET address='"+address.Text+"', telephone='"+telephone.Text+"', mobile='"+mobile.Text+"', email='"+email.Text+"' WHERE (id=" + Convert.ToInt32(Session["loginer_id"].ToString()) + ")";
        somecode.ExecuteNoQuery(sql);
        if (repassword2.Checked)
        {
            sql = "UPDATE member SET password='" + passwordT.Text + "' WHERE (id=" + Convert.ToInt32(Session["loginer_id"].ToString()) + ")";
            somecode.ExecuteNoQuery(sql);
        }
        MultiView1.ActiveViewIndex = 0;
    }
    protected void View1_Activate(object sender, EventArgs e)
    {
        sql = "SELECT name, idcard, address, birthday, telephone, mobile, email, status FROM member WHERE (id=" + Convert.ToInt32(Session["loginer_id"].ToString()) + ")";
        dt = somecode.GetDataTable(sql);
        name0.Text = dt.Rows[0][0].ToString();
        idcard0.Text = dt.Rows[0][1].ToString();
        address0.Text = dt.Rows[0][2].ToString();
        birthday0.Text = String.Format("{0:d}", dt.Rows[0][3]);
        telephone0.Text = dt.Rows[0][4].ToString();
        mobile0.Text = dt.Rows[0][5].ToString();
        email0.Text = dt.Rows[0][6].ToString();
        status0.Text = dt.Rows[0][7].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
}