using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_msg_list : System.Web.UI.Page
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
        sql = "select * from msg ";
        if (SelS.Length != 0) { sql += "where " + SelT + " like '%" + SelS + "%' "; }
        sql += "order by " + OrderByT + " " + OrderByS;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();

        //try
        //{
            myAdapter.Fill(ds, "news");
            ViewState["ds"] = ds;
            msgGv.DataSource = ViewState["ds"];
            msgGv.DataBind();
        //}
        //catch
        //{
        //    string alert = "發生不明錯誤，無法讀取資料！";
        //    YamaZoo.scriptAlert(alert);
        //}
    }
    protected void msgGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            msgGv.DataSource = ViewState["ds"];
            msgGv.DataBind();
            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得編號資料---
            string msg_no = msgGv.Rows[index].Cells[0].Text;
            Response.Redirect("msg_update.aspx?menu=5&msg_no=" + msg_no);
        }
        if (e.CommandName == "REPLY")
        {
            msgGv.DataSource = ViewState["ds"];
            msgGv.DataBind();
            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得編號資料---
            string msg_no = msgGv.Rows[index].Cells[0].Text;
            Response.Redirect("msg_reply.aspx?menu=5&msg_no=" + msg_no);
        }
    }
    protected void msgGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
        }
    }
    protected void msgGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        msgGv.PageIndex = e.NewPageIndex;
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