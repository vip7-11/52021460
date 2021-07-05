using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginer_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int indexV = Convert.ToInt32(e.CommandArgument);
        GridViewRow selectRow = GridView1.Rows[indexV];
        TableCell pID = selectRow.Cells[1];
        string sql;
        DataTable dt1, dt2;
        switch(e.CommandName)
        {
            case "orderV":
                int sum = 0, Msum = 0, p_quantity;
                sql = "SELECT products_id, quantity, price, wholesale_price FROM order_list WHERE order_id=" + Convert.ToInt32(pID.Text);
                dt1 = somecode.GetDataTable(sql);
                for (int i = 0; i < dt1.Rows.Count; i++ )
                {
                    sql = "SELECT quantity FROM products WHERE id=" + Convert.ToInt32(dt1.Rows[i][0].ToString());
                    dt2 = somecode.GetDataTable(sql);
                    p_quantity = Convert.ToInt32(dt2.Rows[0][0].ToString()) - Convert.ToInt32(dt1.Rows[i][1].ToString());
                    sql = "UPDATE products SET quantity=" + p_quantity +" WHERE id=" + Convert.ToInt32(dt1.Rows[i][0].ToString());
                    somecode.ExecuteNoQuery(sql);
                    sum += Convert.ToInt32(dt1.Rows[i][1].ToString()) * Convert.ToInt32(dt1.Rows[i][2].ToString());
                    Msum += Convert.ToInt32(dt1.Rows[i][1].ToString()) * Convert.ToInt32(dt1.Rows[i][3].ToString());
                }
                sql = "UPDATE orderer SET wholesale_price=" + Msum + ", price=" + sum + ", state='未處理' WHERE id=" + Convert.ToInt32(pID.Text);
                somecode.ExecuteNoQuery(sql);
                sql = "UPDATE order_list SET state= '已確認' WHERE order_id=" + Convert.ToInt32(pID.Text);
                somecode.ExecuteNoQuery(sql);
                Response.Redirect("order.aspx");
                break;
            case "deleteV":
                sql = "DELETE FROM order_list WHERE order_id=" + Convert.ToInt32(pID.Text);
                somecode.ExecuteNoQuery(sql);
                sql = "DELETE FROM orderer WHERE id=" + Convert.ToInt32(pID.Text);
                somecode.ExecuteNoQuery(sql);
                Response.Redirect("order.aspx");
                break;
            case "selectV":
                ViewState["SQLSQL"] = "SELECT order_list.id, order_list.order_id, order_list.products_id, order_list.quantity, order_list.price, products.name, products.pic, products.units, products.quantity AS Expr1, order_list.state, order_list.wholesale_price FROM order_list INNER JOIN products ON order_list.products_id = products.id WHERE (order_list.order_id = " + Convert.ToInt32(pID.Text) + ")";
                break;
        }
        
    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label ckL = (Label)GridView1.Rows[i].FindControl("Label2");
            if (ckL != null)
            {
                switch (ckL.Text)
                {
                    case "未確認":
                        GridView1.Rows[i].Cells[0].Enabled = true;
                        GridView1.Rows[i].Cells[8].Enabled = true;
                        GridView1.Rows[i].Cells[9].Enabled = true;
                        break;
                    case "已確認":
                    case "未處理":
                    case "已處理":
                        GridView1.Rows[i].Cells[0].Enabled = false;
                        GridView1.Rows[i].Cells[8].Enabled = false;
                        GridView1.Rows[i].Cells[9].Enabled = false;
                        break;
                }
            }
        }
    }

    protected void GridView2_PreRender(object sender, EventArgs e)
    {
        if (ViewState["SQLSQL"] != null)
        {
            SqlDataSource2.SelectCommand = ViewState["SQLSQL"].ToString();
            GridView2.DataBind();
        }
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            Label ckL = (Label)GridView2.Rows[i].FindControl("Label10");
            Button ckB1 = (Button)GridView2.Rows[i].FindControl("Button1");
            Button ckB2 = (Button)GridView2.Rows[i].FindControl("Button2");
            if (ckL != null)
            {
                switch (ckL.Text)
                {
                    case "未確認":
                        ckB1.Enabled = true;
                        ckB2.Enabled = true;
                        break;
                    case "已確認":
                        ckB1.Enabled = false;
                        ckB2.Enabled = false;
                        break;
                }
            }
        }
        //for (int i = 0; i < GridView2.Rows.Count; i++)
        //{
        //    Response.Write("1");
        //    Response.Write(GridView2.Rows[i].Cells[1].Text);
        //    switch (GridView2.Rows[i].Cells[10].Text)
        //    {
        //        case "未確認":
        //            GridView2.Rows[i].Cells[0].Enabled = true;
        //            break;
        //        case "已確認":
        //            GridView2.Rows[i].Cells[0].Enabled = false;
        //            break;
        //    }
        //}
    }
}