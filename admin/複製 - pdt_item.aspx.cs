using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;

public partial class user_pdt_item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnItemAAdd_Click(object sender, EventArgs e)
    {
        if (txtItemAName.Text.Trim() == "")
        {
            string alert = "品牌不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string itemA_no = "";
            string itemA_name = "";
            itemA_name = txtItemAName.Text;

            try
            {
                int index;
                string sql1 = "";

                sql1 = "SELECT Max ( itemA_no ) as B1 FROM itemA";
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader rd = cmd1.ExecuteReader();
                if (rd.Read())
                {
                    itemA_no = (rd["B1"].ToString());
                }
                rd.Close();
                conn1.Close();

                if (itemA_no.Trim().Length != 0)
                {
                    index = Convert.ToInt32(itemA_no);
                    index = index + 1;
                    itemA_no = index.ToString("000");
                }
                else
                {
                    itemA_no = "001";
                }

                string sql = "";
                sql += "INSERT INTO itemA ( itemA_no, itemA_name ) VALUES (";
                sql += "'" + itemA_no + "',";
                sql += "'" + itemA_name + "')";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblItemANo.Text = "";
                txtItemAName.Text = "";

                ddlItemB1.DataBind();
                SqlDataSource2.DataBind();
                ddlItemC1.DataBind();
                SqlDataSource4.DataBind();

                string alert = "<script language='javascript'>alert('新增資料成功！');</script>";
                if (!(Page.ClientScript.IsStartupScriptRegistered("addUserSucess")))
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserSucess", alert);
            }
            catch
            {
                string alert2 = "<script language='javascript'>alert('新增資料失敗！');</script>";
                if (!(Page.ClientScript.IsStartupScriptRegistered("addUserFaild")))
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserFaild", alert2);
            }
        } 
    }
    protected void btnItemADelete_Click(object sender, EventArgs e)
    {
        try
        {
            string ItemA_no = "";
            ItemA_no = lblItemANo.Text;

            string sql = "DELETE FROM itemA WHERE ItemA_no = '" + ItemA_no + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            string sql1 = "DELETE FROM itemB WHERE ItemA_no = '" + ItemA_no + "'";
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            cmd1.ExecuteNonQuery();
            conn1.Close();

            string sql2 = "DELETE FROM itemC WHERE ItemA_no = '" + ItemA_no + "'";
            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            cmd2.ExecuteNonQuery();
            conn2.Close();

            lblItemANo.Text = "";
            txtItemAName.Text = "";

            ddlItemB1.DataBind();
            SqlDataSource2.DataBind();
            ddlItemC1.DataBind();
            SqlDataSource4.DataBind();
        }
        catch
        {
            string alert = "<script language='javascript'>alert('刪除資料時發生錯誤！');</script>";
            if (!(Page.ClientScript.IsStartupScriptRegistered("addUserSucess")))
                Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserSucess", alert);
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            lblItemANo.Text = "";
            txtItemAName.Text = "";

            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得品項資料---
            string itemA_no = "";
            string itemA_name = "";
            itemA_no = GridView1.Rows[index].Cells[0].Text;

            string sql = "select * from itemA where itemA_no = '" + itemA_no + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                itemA_name = (rd["itemA_name"].ToString());
            }
            rd.Close();
            conn.Close();

            lblItemANo.Text = itemA_no;
            txtItemAName.Text = itemA_name;
        }
    }
    protected void btnItemBAdd_Click(object sender, EventArgs e)
    {
        if (txtItemBName.Text.Trim() == "")
        {
            string alert = "款式不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string itemB_no = "";
            string itemA_no = "";
            string itemB_name = "";

            itemA_no = ddlItemB1.SelectedValue.ToString();
            itemB_name = txtItemBName.Text;

            try
            {
                int index;
                string sql1 = "";

                sql1 = "SELECT Max ( itemB_no ) as B1 FROM itemB WHERE itemA_no = '" + itemA_no + "'";
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader rd = cmd1.ExecuteReader();
                if (rd.Read())
                {
                    itemB_no = (rd["B1"].ToString());
                }
                rd.Close();
                conn1.Close();

                if (itemB_no.Trim().Length != 0)
                {
                    index = Convert.ToInt32(itemB_no);
                    index = index + 1;
                    itemB_no = index.ToString("000");
                }
                else
                {
                    itemB_no = "001";
                }

                string sql = "";
                sql += "INSERT INTO itemB ( itemB_no, itemA_no, itemB_name ) VALUES (";
                sql += "'" + itemB_no + "',";
                sql += "'" + itemA_no + "',";
                sql += "'" + itemB_name + "')";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                txtItemBName.Text = "";
                lblItemBNo1.Text = "";
                lblItemBNo2.Text = "";

                //ddlItemB1.DataBind();
                //SqlDataSource2.DataBind();
                ddlItemC1.DataBind();
                SqlDataSource4.DataBind();
                ddlItemC2.DataBind();
                SqlDataSource5.DataBind();

                string alert = "<script language='javascript'>alert('新增資料成功！');</script>";
                if (!(Page.ClientScript.IsStartupScriptRegistered("addUserSucess")))
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserSucess", alert);
            }
            catch
            {
                string alert2 = "<script language='javascript'>alert('新增資料失敗！');</script>";
                if (!(Page.ClientScript.IsStartupScriptRegistered("addUserFaild")))
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserFaild", alert2);
            }
        }
    }
    protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Visible = false; //設欄位隱藏
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            lblItemBNo1.Text = "";
            lblItemBNo2.Text = "";
            txtItemBName.Text = "";

            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得品項資料---
            string itemB_no = "";
            string itemA_no = "";
            string itemB_name = "";
            itemA_no = GridView2.Rows[index].Cells[1].Text;
            itemB_no = GridView2.Rows[index].Cells[0].Text;

            string sql = "select * from itemB where itemB_no = '" + itemB_no + "' and itemA_no = '" + itemA_no + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                itemB_name = (rd["itemB_name"].ToString());
            }
            rd.Close();
            conn.Close();

            lblItemBNo2.Text = itemB_no;
            lblItemBNo1.Text = itemA_no;
            txtItemBName.Text = itemB_name;
        }
    }
    protected void ddlItemB1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblItemBNo1.Text = "";
        lblItemBNo2.Text = "";
        txtItemBName.Text = "";

        GridView2.DataBind();
        SqlDataSource3.DataBind();
    }
    protected void btnItemBDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string itemA_no = "";
            string itemB_no = "";
            itemA_no = lblItemBNo1.Text;
            itemB_no = lblItemBNo2.Text;

            string sql = "DELETE FROM itemB WHERE itemB_no = '" + itemB_no + "' and itemA_no = '" + itemA_no + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            string sql1 = "DELETE FROM itemC WHERE itemB_no = '" + itemB_no + "' and itemA_no = '" + itemA_no + "'";
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            cmd1.ExecuteNonQuery();
            conn1.Close();

            lblItemBNo1.Text = "";
            lblItemBNo2.Text = "";
            txtItemBName.Text = "";

            ddlItemC2.DataBind();
            SqlDataSource5.DataBind();
        }
        catch
        {
            string alert = "<script language='javascript'>alert('刪除資料時發生錯誤！');</script>";
            if (!(Page.ClientScript.IsStartupScriptRegistered("addUserSucess")))
                Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserSucess", alert);
        }
    }
    protected void btnItemCAdd_Click(object sender, EventArgs e)
    {
        if (txtItemCName.Text.Trim() == "")
        {
            string alert = "系列不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string itemC_no = "";
            string itemA_no = "";
            string itemB_no = "";
            string itemC_name = "";

            itemA_no = ddlItemC1.SelectedValue.ToString();
            itemB_no = ddlItemC2.SelectedValue.ToString();
            itemC_name = txtItemCName.Text;

            try
            {
                int index;
                string sql1 = "";

                sql1 = "SELECT Max ( itemC_no ) as B1 FROM itemC WHERE itemA_no = '" + itemA_no + "' and itemB_no = '" + itemB_no + "'";
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader rd = cmd1.ExecuteReader();
                if (rd.Read())
                {
                    itemC_no = (rd["B1"].ToString());
                }
                rd.Close();
                conn1.Close();

                if (itemC_no.Trim().Length != 0)
                {
                    index = Convert.ToInt32(itemC_no);
                    index = index + 1;
                    itemC_no = index.ToString("000");
                }
                else
                {
                    itemC_no = "001";
                }

                string sql = "";
                sql += "INSERT INTO itemC ( itemC_no, itemA_no, itemB_no, itemC_name ) VALUES (";
                sql += "'" + itemC_no + "',";
                sql += "'" + itemA_no + "',";
                sql += "'" + itemB_no + "',";
                sql += "'" + itemC_name + "')";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                txtItemCName.Text = "";
                lblItemCNo1.Text = "";
                lblItemCNo2.Text = "";
                lblItemCNo3.Text = "";

                //ddlItemB1.DataBind();
                //SqlDataSource2.DataBind();
                //ddlItemC1.DataBind();
                //SqlDataSource4.DataBind();
                //ddlItemC2.DataBind();
                //SqlDataSource5.DataBind();

                string alert = "<script language='javascript'>alert('新增資料成功！');</script>";
                if (!(Page.ClientScript.IsStartupScriptRegistered("addUserSucess")))
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserSucess", alert);
            }
            catch
            {
                string alert2 = "<script language='javascript'>alert('新增資料失敗！');</script>";
                if (!(Page.ClientScript.IsStartupScriptRegistered("addUserFaild")))
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserFaild", alert2);
            }
        }
    }
    protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Visible = false; //設欄位隱藏
            e.Row.Cells[2].Visible = false; 
        }
    }
    protected void btnItemCDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string itemA_no = "";
            string itemB_no = "";
            string itemC_no = "";
            itemA_no = lblItemCNo1.Text;
            itemB_no = lblItemCNo2.Text;
            itemC_no = lblItemCNo3.Text;

            string sql1 = "DELETE FROM itemC WHERE itemA_no = '" + itemA_no + "' and itemB_no = '" + itemB_no + "' and itemC_no = '" + itemC_no + "'";
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            cmd1.ExecuteNonQuery();
            conn1.Close();

            lblItemCNo1.Text = "";
            lblItemCNo2.Text = "";
            lblItemCNo3.Text = "";
            txtItemCName.Text = "";
        }
        catch
        {
            string alert = "<script language='javascript'>alert('刪除資料時發生錯誤！');</script>";
            if (!(Page.ClientScript.IsStartupScriptRegistered("addUserSucess")))
                Page.ClientScript.RegisterStartupScript(this.GetType(), "addUserSucess", alert);
        }
    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            lblItemCNo1.Text = "";
            lblItemCNo2.Text = "";
            lblItemCNo3.Text = "";
            txtItemCName.Text = "";

            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得品項資料---
            string itemB_no = "";
            string itemA_no = "";
            string itemC_no = "";
            string itemC_name = "";
            itemA_no = GridView3.Rows[index].Cells[1].Text;
            itemB_no = GridView3.Rows[index].Cells[2].Text;
            itemC_no = GridView3.Rows[index].Cells[0].Text;

            string sql = "select * from itemC where itemB_no = '" + itemB_no + "' and itemA_no = '" + itemA_no + "' and itemC_no = '" + itemC_no + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                itemC_name = (rd["itemC_name"].ToString());
            }
            rd.Close();
            conn.Close();

            lblItemCNo3.Text = itemC_no;
            lblItemCNo2.Text = itemB_no;
            lblItemCNo1.Text = itemA_no;
            txtItemCName.Text = itemC_name;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
    }
}