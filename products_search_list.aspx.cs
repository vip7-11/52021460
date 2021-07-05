using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class products_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void ListView1_PreRender(object sender, EventArgs e)
    {

    }
    protected void ListView1_Load(object sender, EventArgs e)
    {
        if (Session["search_ddl_value"].ToString() != "" && Session["search_txt"].ToString() != "")
        {
            if (Session["search_ddl_value"].ToString() == "00")
            {
                //new
                show_productsList.SelectCommand = "SELECT pdt_no, pdt_id, pdt_name, pdt_img1, pdt_price, pdt_stocks, pdt_units FROM pdt WHERE (pdt_id LIKE '%" + Session["search_txt"].ToString() + "%') OR (pdt_name LIKE '%" + Session["search_txt"].ToString() + "%')";
                
                //show_productsList.SelectCommand = "SELECT id, name, pic, price, quantity, units FROM products WHERE (id LIKE '%" + Session["search_txt"].ToString() + "%') OR (name LIKE '%" + Session["search_txt"].ToString() + "%')";
            }
            else
            {
                //new
                show_productsList.SelectCommand = "SELECT pdt_no, pdt_id, pdt_name, pdt_img1, pdt_price, pdt_stocks, pdt_units FROM pdt WHERE (pdt_itemA = '" + Session["search_ddl_value"].ToString() + "') AND (pdt_id LIKE '%" + Session["search_txt"].ToString() + "%') OR (pdt_itemA = '" + Session["search_ddl_value"].ToString() + "') AND (pdt_name LIKE '%" + Session["search_txt"].ToString() + "%')";


                //show_productsList.SelectCommand = "SELECT id, name, pic, price, quantity, units FROM products WHERE (pdt_itemA = '" + Session["search_ddl_value"].ToString() + "') AND (pdt_id LIKE '%" + Session["search_txt"].ToString() + "%') OR (pdt_itemA = '" + Session["search_ddl_value"].ToString() + "') AND (pdt_name LIKE '%" + Session["search_txt"].ToString() + "%')";
            }
            Session["search_ddl_value"] = "";
            Session["search_txt"] = "";
        }
        else
        {
            DropDownList DDL = (DropDownList)Master.FindControl("search_class");
            TextBox TB = (TextBox)Master.FindControl("search_keyword");
            if (DDL.SelectedIndex == 0)
            {
                show_productsList.SelectCommand = "SELECT pdt_no, pdt_id, pdt_name, pdt_img1, pdt_price, pdt_stocks, pdt_units FROM pdt WHERE (pdt_id LIKE '%" + TB.Text + "%') OR (pdt_name LIKE '%" + TB.Text + "%')";
            }
            else
            {
                show_productsList.SelectCommand = "SELECT pdt_no, pdt_id, pdt_name, pdt_img1, pdt_price, pdt_stocks, pdt_units FROM pdt WHERE (pdt_itemA = '" + DDL.SelectedValue + "') AND (pdt_id LIKE '%" + TB.Text + "%') OR (pdt_itemA = '" + DDL.SelectedValue + "') AND (pdt_name LIKE '%" + TB.Text + "%')";
            }
        }        
    }
}