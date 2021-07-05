using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class search_other : System.Web.UI.Page
{
    string sql;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void ListView1_PreRender(object sender, EventArgs e)
    {
        
    }
    protected void ListView1_Load(object sender, EventArgs e)
    {
        if (search_class.SelectedIndex == 00)
        {
            //show_productsList.SelectCommand = "SELECT id, name, pic, price, quantity, units FROM products WHERE (id LIKE '%" + Sid.Text + "%') AND (name LIKE '%" + Sname.Text + "%') AND (introduction LIKE '%" + Sintro.Text + "%') AND (price BETWEEN '" + Sprice1.Text + "' AND '" + Sprice2.Text + "' )";
            show_productsList.SelectCommand = "SELECT pdt_no, pdt_id, pdt_name, pdt_img1, pdt_price, pdt_stocks, pdt_units FROM pdt WHERE (pdt_id LIKE '%" + Sid.Text + "%') AND (pdt_name LIKE '%" + Sname.Text + "%') AND (pdt_content LIKE '%" + Sintro.Text + "%') AND ((pdt_price BETWEEN '" + Sprice1.Text + "' AND '" + Sprice2.Text + "' ) or (pdt_sell BETWEEN '" + Sprice1.Text + "' AND '" + Sprice2.Text + "' ))";
        }
        else
        {
            //show_productsList.SelectCommand = "SELECT id, name, pic, price, quantity, units FROM products WHERE (class = '" + Sclass.SelectedValue + "') AND (id LIKE '%" + Sid.Text + "%') AND (name LIKE '%" + Sname.Text + "%') AND (introduction LIKE '%" + Sintro.Text + "%') AND (price BETWEEN '" + Sprice1.Text + "' AND '" + Sprice2.Text + "' )";
            show_productsList.SelectCommand = "SELECT pdt_no, pdt_id, pdt_name, pdt_img1, pdt_price, pdt_stocks, pdt_units FROM pdt WHERE (pdt_itemA = '" + search_class.SelectedValue + "') AND (pdt_id LIKE '%" + Sid.Text + "%') AND (pdt_name LIKE '%" + Sname.Text + "%') AND (pdt_content LIKE '%" + Sintro.Text + "%') AND ((pdt_price BETWEEN '" + Sprice1.Text + "' AND '" + Sprice2.Text + "' ) or (pdt_sell BETWEEN '" + Sprice1.Text + "' AND '" + Sprice2.Text + "' ))";
        }
    }
}