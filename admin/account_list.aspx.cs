using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Security;
public partial class user_account_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectDDL1();
            SelectGV();
        }        
    }
    protected void SelectDDL1()
    {
        int index = 0;
        string roles_no = "";
        string roles_name = "";

        string sql = "select * from roles";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            index = index + 1;
            roles_no = (rd["roles_no"].ToString());
            roles_name = (rd["roles_name"].ToString());

            if (index == 1)
            {
                ddlSRole.Items.Add("全部角色");
                ddlSRole.Items[0].Value = "00";
                ddlSRole.Items.Add(roles_name);
                ddlSRole.Items[index].Value = roles_no;
            }
            else
            {
                ddlSRole.Items.Add(roles_name);
                ddlSRole.Items[index].Value = roles_no;
            }
        }
        rd.Close();
        conn.Close();
    }
    protected void usersGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            usersGv.DataSource = ViewState["ds"];
            usersGv.DataBind();
            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得帳號資料---
            string users_id = ((LinkButton)usersGv.Rows[index].Cells[1].Controls[0]).Text;
            HttpContext.Current.Session["users_id"] = users_id;
            Response.Redirect("account_update.aspx?menu=1");
        }
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void ddlUserRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void chkEdm_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void ddlOrderBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void rbl_order_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void SelectGV()
    {
        //---查詢條件---
        string SelT = ddlSelect.SelectedValue.ToString();
        string SelS = txtSelect.Text.Trim();
        //---篩選角色---
        string SRole = ddlSRole.SelectedValue.ToString();
        //---排序方式---
        string OrderByT = ddlOrderBy.SelectedValue.ToString();
        string OrderByS = rblOrderBy.SelectedValue.ToString();

        string sql = "";
        sql = "select * from users A1, roles A2 where A1.users_role = A2.roles_no ";
        if (SRole == "00" | SRole == "") { } else { sql += "and A1.users_role = '" + SRole + "' "; }
        if (SelS.Length != 0) { sql += "and " + SelT + " like '%" + SelS + "%' "; }
        sql += "order by " + OrderByT + " " + OrderByS;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();

        try
        {
            myAdapter.Fill(ds, "users");
            ViewState["ds"] = ds;
            usersGv.DataSource = ViewState["ds"];            
            usersGv.DataBind();
        }
        catch
        {
            string alert = "發生不明錯誤，無法讀取資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void usersGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        usersGv.PageIndex = e.NewPageIndex;
        SelectGV();
    }
}