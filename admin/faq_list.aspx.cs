using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_faq_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectGV();
        }
    }
    protected void SelectGV()
    {
        //---查詢條件---
        string SelT = ddlSelect.SelectedValue.ToString();
        string SelS = txtSelect.Text.Trim();
        //---排序方式---
        string OrderByT = ddlOrderBy.SelectedValue.ToString();
        string OrderByS = rblOrderBy.SelectedValue.ToString();

        string sql = "";
        sql = "select * from faq ";
        if (SelS.Length != 0) { sql += "where " + SelT + " like '%" + SelS + "%' "; }
        sql += "order by " + OrderByT + " " + OrderByS;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();

        try
        {
            myAdapter.Fill(ds, "news");
            ViewState["ds"] = ds;
            faqGv.DataSource = ViewState["ds"];
            faqGv.DataBind();
        }
        catch
        {
            string alert = "發生不明錯誤，無法讀取資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void faqGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            faqGv.DataSource = ViewState["ds"];
            faqGv.DataBind();
            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得編號資料---
            string msg_no = faqGv.Rows[index].Cells[0].Text;
            Response.Redirect("faq_update.aspx?menu=6&faq_no=" + msg_no);
        }
        //if (e.CommandName == "REPLY")
        //{
        //    faqGv.DataSource = ViewState["ds"];
        //    faqGv.DataBind();
        //    //---取得某Row的索引---
        //    int index = Convert.ToInt32(e.CommandArgument);
        //    //---取得編號資料---
        //    string msg_no = faqGv.Rows[index].Cells[0].Text;
        //    Response.Redirect("msg_reply.aspx?menu=6&msg_no=" + msg_no);
        //}
    }
    protected void faqGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
        }
    }
    protected void faqGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        faqGv.PageIndex = e.NewPageIndex;
        SelectGV();
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
}