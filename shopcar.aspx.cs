using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class shopcar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginer_id"] == null)
        {
            Button1.Visible = false;
            no_Loginer.Visible = true;
            no_Loginer.Text = "請先登入會員，才能使用完善的購物車功能。";
        }

        DataTable shopCar;

        if (Request.QueryString.Get("d") != null)
        {
            shopCar = (DataTable) Session["shopcar"];
            for (int i = 0; i < shopCar.Rows.Count; i++ )
            {
                if (shopCar.Rows[i][0].ToString() == Request.QueryString.Get("d").ToString())
                {
                    shopCar.Rows[i].Delete();
                    break;
                }
            }
            Session["shopcar"] = shopCar;
        }
    
        if (Session["shopcar"] == null)
        {
            DataTable CshopCar = new DataTable();
            CshopCar.Columns.Add("pId", typeof(int));
            CshopCar.Columns.Add("pName", typeof(string));
            CshopCar.Columns.Add("pPrice", typeof(int));
            CshopCar.Columns.Add("pMPrice", typeof(int));
            CshopCar.Columns.Add("pQuantity", typeof(int));
            CshopCar.Columns.Add("pUnits", typeof(string));
            CshopCar.Columns.Add("pPicurl", typeof(string));
            Session["shopcar"] = CshopCar;
        }

        shopCar = (DataTable) Session["shopcar"];  

        if (Request.QueryString.Get("page") != null)
        {
            string sql;
            DataTable dt;
            int p_id = Convert.ToInt32((Request.QueryString.Get("page").ToString()));
            sql = "select id, name, price, quantity, units, pic, wholesale_price from products where id =" + p_id;
            dt = somecode.GetDataTable(sql);

            Boolean shopCarck = true;
            for (int i = 0; i < shopCar.Rows.Count; i++)
            {
                if (shopCar.Rows[i][0].ToString() == dt.Rows[0][0].ToString())
                {
                    Response.Write("<script language=JavaScript> alert('該商物已放置購物車'); </script>");
                    shopCarck = false;
                    break;
                }
            }
            if (shopCarck)
            {
                shopCar.Rows.Add(dt.Rows[0][0].ToString(), dt.Rows[0][1].ToString(), dt.Rows[0][2].ToString(), dt.Rows[0][6].ToString(), dt.Rows[0][3].ToString(), dt.Rows[0][4].ToString(), "image/products/" + dt.Rows[0][5].ToString());
                Session["shopcar"] = shopCar;
            }
        }


        Table table = new Table();                  //create one object of type Table
        table.ID = "Table_Item";
        table.Attributes.Add("border", "1px");  //自己加一個屬性
        table.Style["font-size"] = "12pt";         //設定Style
        table.Style["width"] = "100%";

        TableRow tRow1 = new TableRow();
        table.Rows.Add(tRow1);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "序號";
        tRow1.Cells.Add(tCell1);

        TableCell tCell2 = new TableCell();
        tCell2.Text = "名稱";
        tRow1.Cells.Add(tCell2);

        TableCell tCell3 = new TableCell();
        tCell3.Text = "價格";
        tRow1.Cells.Add(tCell3);

        TableCell tCell8 = new TableCell();
        tCell8.Text = "批發價";
        tRow1.Cells.Add(tCell8);
 
        TableCell tCell4 = new TableCell();
        tCell4.Text = "庫存量";
        tRow1.Cells.Add(tCell4);

        TableCell tCell5 = new TableCell();
        tCell5.Text = "單位";
        tRow1.Cells.Add(tCell5);

        TableCell tCell6 = new TableCell();
        tCell6.Text = "商品圖片";
        tRow1.Cells.Add(tCell6);

        TableCell tCell7 = new TableCell();
        tCell7.Text = "移除商品";
        tRow1.Cells.Add(tCell7);

        for(int i =0; i <shopCar.Rows.Count; i++ )
        {
            TableRow tRow = new TableRow();     //create a new object of type TableRow
            table.Rows.Add(tRow);

            for (int j = 0; j <=shopCar.Columns.Count; j++ )
            {
                switch(j)
                {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                        TableCell tCell_1 = new TableCell();
                        System.Web.UI.WebControls.Label LB = new System.Web.UI.WebControls.Label();
                        LB.Text = shopCar.Rows[i][j].ToString();
                        tCell_1.Controls.Add(LB);
                        tRow.Cells.Add(tCell_1);
                        break;
                    case 6:
                        TableCell tCell_2 = new TableCell();
                        System.Web.UI.WebControls.Image iM = new System.Web.UI.WebControls.Image();
                        iM.ImageUrl = shopCar.Rows[i][j].ToString();
                        iM.Height = 40;
                        iM.Width = 30;
                        tCell_2.Controls.Add(iM);
                        tRow.Cells.Add(tCell_2);
                        break;
                    case 7:
                        TableCell tCell_3 = new TableCell();
                        System.Web.UI.WebControls.HyperLink LiK = new System.Web.UI.WebControls.HyperLink();
                        LiK.Text = "刪除";
                        LiK.NavigateUrl = "shopcar.aspx?d=" + shopCar.Rows[i][0].ToString();
                        tCell_3.Controls.Add(LiK);
                        tRow.Cells.Add(tCell_3);
                        break;
                }

            }
        }
        Page.Controls.Add(table);  
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["loginer_id"] == null)
        {
            Button1.Visible = false;
            no_Loginer.Visible = true;
            no_Loginer.Text = "請先登入會員，才能使用完善的購物車功能。";
        }
        else
        {
            if (Session["shopcar"] == null) { }
            else
            {
                //try
                //{
                    DataTable shopCar, dt, dt2;
                    string sql1,sql2,sql3,sql4,sql5;
                    
                    shopCar = (DataTable)Session["shopcar"];
                    sql1 = "SELECT TOP(1) name FROM logistics";
                    dt2 = somecode.GetDataTable(sql1);

                    string order_id = Mei.GetMaxNo(0, "orderer", "id");
                    sql2 = "INSERT INTO orderer (id, member_id, state, price, logistics, logistics_num, wholesale_price) VALUES (" + order_id + ", " + Session["loginer_id"].ToString() + ", N'未確認', 0, '" + dt2.Rows[0][0].ToString() + "','', 0)";
                    //somecode.ExecuteNoQuery(sql2);
                    Mei.connSql(sql2);

                    //sql3 = "SELECT MAX ( id ) as A1 FROM orderer WHERE member_id = " + Session["loginer_id"].ToString();
                    //dt = somecode.GetDataTable(sql3);

                    int sum = 0, Msum = 0;
                    for (int i = 0; i < shopCar.Rows.Count; i++)
                    {
                        string order_sub_id = Mei.GetMaxNo(0, "order_list", "id");
                        sql4 = "INSERT INTO order_list (id, order_id, products_id, quantity, price, state, wholesale_price) VALUES (";
                        sql4 += order_sub_id + ", ";
                        sql4 += order_id + ", ";
                        sql4 += shopCar.Rows[i][0].ToString() + ", 1, ";
                        sql4 += shopCar.Rows[i][2].ToString() + ", N'未確認', ";
                        sql4 += shopCar.Rows[i][3].ToString() + ")";
                        //somecode.GetDataTable(sql);
                        Mei.connSql(sql4);
                        sum += Convert.ToInt32(shopCar.Rows[i][2].ToString());
                        Msum += Convert.ToInt32(shopCar.Rows[i][3].ToString());
                    }
                    sql5 = "UPDATE orderer SET price = " + sum + ", wholesale_price = " + Msum + " WHERE id = " + order_id;
                    somecode.ExecuteNoQuery(sql5);

                    Session["shopcar"] = null;
                    Response.Write("<script language=JavaScript> alert('下單成功。請至我的訂單確認商品！'); </script>");
                    Response.Write("<script language=JavaScript> window.close(); </script>");
                //}
                //catch
                //{
                //    Response.Write("<script language=JavaScript> alert('發生不明錯誤！'); </script>");
                //    Response.Write("<script language=JavaScript> window.close(); </script>");
                //} 
            }            
        }              
    }
}