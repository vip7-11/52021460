using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class msg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["u_id"] == null)
            {
                pnmsg1.Visible = true;
                pnmsg2.Visible = false;
            }
            else
            {
                pnmsg1.Visible = false;
                pnmsg2.Visible = true;
            }
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
        sql += "order by " + OrderByT + " " + OrderByS + ", msg_time " + OrderByS;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();

        try
        {
            myAdapter.Fill(ds, "news");
            ViewState["ds"] = ds;
            msgGv.DataSource = ViewState["ds"];
            msgGv.DataBind();
        }
        catch
        {
            string alert = "發生不明錯誤，無法讀取資料！";
            YamaZoo.scriptAlert(alert);
        }
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
            Response.Redirect("msgsub.aspx?no=" + msg_no);
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text.Trim() == "" || txtContent.Value.Trim() == "")
        {
            string alert = "標題及內容不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string msg_no = Mei.GetMaxNo(6, "msg", "msg_no");
            string msg_title = YamaZoo.SaveString(txtTitle.Text, true);
            string msg_content = txtContent.Value.Replace("'", "''");
            string msg_date = DateTime.Now.ToString("yyyy/MM/dd");
            string msg_time = DateTime.Now.ToString("HH:mm:ss");
            string msg_author = Session["u_id"].ToString();

            try
            {
                string sql = "";
                sql += "INSERT INTO msg ( msg_no, msg_title, msg_content, msg_date, msg_time, msg_author ) VALUES (";
                sql += "'" + msg_no + "',";
                sql += "N'" + msg_title + "',";
                sql += "N'" + msg_content + "',";
                sql += "'" + msg_date + "',";
                sql += "'" + msg_time + "',";
                sql += "'" + msg_author + "')";
                Mei.connSql(sql);

                txtTitle.Text = "";
                txtContent.Value = "";

                SelectGV();

                string alert = "意見發表成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，資料新增失敗！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
}