using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class user_pdt_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectDDL1();
            //SelectDDL2();
            //SelectDDL3();
            SelectGV();
        }
    }
    protected void SelectDDL1()
    {
        int index = 0;
        string itemA_no = "";
        string itemA_name = "";

        string sql = "select * from itemA";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            index = index + 1;
            itemA_no = (rd["itemA_no"].ToString());
            itemA_name = (rd["itemA_name"].ToString());

            if (index == 1)
            {
                ddlSitemA.Items.Add("全部品牌");
                ddlSitemA.Items[0].Value = "00";
                ddlSitemA.Items.Add(itemA_name);
                ddlSitemA.Items[index].Value = itemA_no;
            }
            else
            {
                ddlSitemA.Items.Add(itemA_name);
                ddlSitemA.Items[index].Value = itemA_no;
            }
        }
        rd.Close();
        conn.Close();
    }
    //protected void SelectDDL2()
    //{
    //    int index = 0;
    //    string itemB_no = "";
    //    string itemB_name = "";

    //    string sql = "select * from itemB";
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand(sql, conn);
    //    conn.Open();
    //    SqlDataReader rd = cmd.ExecuteReader();
    //    while (rd.Read())
    //    {
    //        index = index + 1;
    //        itemB_no = (rd["itemB_no"].ToString());
    //        itemB_name = (rd["itemB_name"].ToString());

    //        if (index == 1)
    //        {
    //            ddlSitemB.Items.Add("全部款式");
    //            ddlSitemB.Items[0].Value = "00";
    //            ddlSitemB.Items.Add(itemB_name);
    //            ddlSitemB.Items[index].Value = itemB_no;
    //        }
    //        else
    //        {
    //            ddlSitemB.Items.Add(itemB_name);
    //            ddlSitemB.Items[index].Value = itemB_no;
    //        }
    //    }

    //    if (ddlSitemB.Items.Count == 0)
    //    {
    //        ddlSitemB.Items.Add("全部款式");
    //        ddlSitemB.Items[0].Value = "00";
    //    }
    //    rd.Close();
    //    conn.Close();
    //}
    //protected void SelectDDL3()
    //{
    //    int index = 0;
    //    string itemC_no = "";
    //    string itemC_name = "";

    //    ddlSitemC.Items.Clear();

    //    string sql = "select * from itemC where itemB_no='" + ddlSitemB.SelectedValue + "'";
    //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand(sql, conn);
    //    conn.Open();
    //    SqlDataReader rd = cmd.ExecuteReader();
    //    while (rd.Read())
    //    {
    //        index = index + 1;
    //        itemC_no = (rd["itemC_no"].ToString());
    //        itemC_name = (rd["itemC_name"].ToString());

    //        if (index == 1)
    //        {
    //            ddlSitemC.Items.Add("全部系列");
    //            ddlSitemC.Items[0].Value = "00";
    //            ddlSitemC.Items.Add(itemC_name);
    //            ddlSitemC.Items[index].Value = itemC_no;
    //        }
    //        else
    //        {
    //            ddlSitemC.Items.Add(itemC_name);
    //            ddlSitemC.Items[index].Value = itemC_no;
    //        }
    //    }

    //    if (ddlSitemC.Items.Count == 0)
    //    {
    //        ddlSitemC.Items.Add("全部系列");
    //        ddlSitemC.Items[0].Value = "00";
    //    }
    //    rd.Close();
    //    conn.Close();
    //}
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void ddlUserRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        //SelectDDL3();
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
        //---篩選品牌&款式&系列---
        string SitemA = ddlSitemA.SelectedValue.ToString();
        //string SItemB = ddlSitemB.SelectedValue.ToString();
        //string SitemC = ddlSitemC.SelectedValue.ToString();
        //---新品&限量&暢銷&隱藏---
        string chkA = "";
        string chkB = "";
        string chkC = "";
        string chkD = "";
        //if (chkpdt_stateA.Checked == false) { chkA = "1"; }
        //if (chkpdt_stateB.Checked == false) { chkB = "1"; }
        //if (chkpdt_stateC.Checked == false) { chkC = "1"; }
        if (chkpdt_stateD.Checked == true) { chkD = "1"; }
        //---排序方式---
        string OrderByT = ddlOrderBy.SelectedValue.ToString();
        string OrderByS = rblOrderBy.SelectedValue.ToString();

        string sql = "";
        sql = "select * from pdt A1, itemA A2 where A1.pdt_itemA = A2.itemA_no ";
        if (SitemA == "00" | SitemA == "") { } else { sql += "and A1.pdt_itemA = '" + SitemA + "' "; }
        //if (SItemB == "00" | SItemB == "") { } else { sql += "and A1.pdt_itemB = '" + SItemB + "' "; }
        //if (SitemC == "00" | SitemC == "") { } else { sql += "and A1.pdt_itemC = '" + SitemC + "' "; }
        if (chkA == "1") { sql += "and A1.pdt_stateA <> '" + chkA + "'"; }
        if (chkB == "1") { sql += "and A1.pdt_stateB <> '" + chkB + "'"; }
        if (chkC == "1") { sql += "and A1.pdt_stateC <> '" + chkC + "'"; }
        if (chkD == "1") { sql += "and A1.pdt_stateD = '" + chkD + "'"; }
        if (SelS.Length != 0) { sql += "and " + SelT + " like '%" + SelS + "%' "; }
        sql += " order by " + OrderByT + " " + OrderByS;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();

        try
        {
            myAdapter.Fill(ds, "pdt");
            ViewState["ds"] = ds;
            pdtGv.DataSource = ViewState["ds"];
            pdtGv.DataBind();
        }
        catch
        {
            string alert = "發生不明錯誤，無法讀取資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void pdtGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
        }
    }
    protected void pdtGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        pdtGv.PageIndex = e.NewPageIndex;
        SelectGV();
    }
    protected void chkpdt_stateA_CheckedChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void chkpdt_stateB_CheckedChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void chkpdt_stateC_CheckedChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
    protected void pdtGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            pdtGv.DataSource = ViewState["ds"];
            pdtGv.DataBind();
            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得編號資料---
            string pdt_no = pdtGv.Rows[index].Cells[0].Text;
            Response.Redirect("pdt_update.aspx?menu=4&pdt_no=" + pdt_no);
        }
    }
    protected void ddlUserRole_C_SelectedIndexChanged(object sender, EventArgs e)
    {
        SelectGV();
    }
}