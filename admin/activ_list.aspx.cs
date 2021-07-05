using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;

public partial class user_activ_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectGV();
        }
    }
    protected void activGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            activGv.DataSource = ViewState["ds"];
            activGv.DataBind();
            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得編號資料---
            string activ_id = activGv.Rows[index].Cells[0].Text;
            Response.Redirect("activ_update.aspx?menu=5&activ_id=" + activ_id);
        }
    }
    protected void btnSelect_Click(object sender, EventArgs e)
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
        //---顯示&隱藏---
        string chkA = "";
        string chkB = "";
        if (chkactiv_stateA.Checked == false) { chkA = "01"; }
        if (chkactiv_stateB.Checked == false) { chkB = "02"; }
        //---排序方式---
        string OrderByT = ddlOrderBy.SelectedValue.ToString();
        string OrderByS = rblOrderBy.SelectedValue.ToString();

        string sql = "";
        sql = "select * from activ A1, activstate A2 where A1.activ_state = A2.activstate_no ";
        if (chkA == "1") { sql += "and A1.activ_state <> '" + chkA + "'"; }
        if (chkB == "1") { sql += "and A1.activ_state <> '" + chkB + "'"; }
        if (SelS.Length != 0) { sql += "and " + SelT + " like '%" + SelS + "%' "; }
        sql += "order by " + OrderByT + " " + OrderByS;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();

        try
        {
            myAdapter.Fill(ds, "activ");
            ViewState["ds"] = ds;
            activGv.DataSource = ViewState["ds"];
            activGv.DataBind();
        }
        catch
        {
            string alert = "發生不明錯誤，無法讀取資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void activGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
        }
    }
    protected void activGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        activGv.PageIndex = e.NewPageIndex;
        SelectGV();
    }
    protected void chkpdt_stateA_CheckedChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void chkactiv_stateB_CheckedChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
}