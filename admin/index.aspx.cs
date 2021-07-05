using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "select * from users";
        DataTable dt = Mei.GetDataTable(sql);
        lb_member_count.Text = dt.Rows.Count.ToString();

        sql = "select web_counter from web";
        dt = Mei.GetDataTable(sql);
        lb_counter.Text = dt.Rows[0]["web_counter"].ToString();

        sql = "select pdt_stateD from pdt where pdt_stateD = '0'";
        dt = Mei.GetDataTable(sql);
        lb_pdton_num.Text = dt.Rows.Count.ToString();

        sql = "select pdt_stateD from pdt where pdt_stateD = '1'";
        dt = Mei.GetDataTable(sql);
        lb_pdtoff_num.Text = dt.Rows.Count.ToString();

        sql = "select shipping_state from [order] where shipping_state = '1' and owner_hide='False'";
        dt = Mei.GetDataTable(sql);
        lb_od_state_1.Text = dt.Rows.Count.ToString();

        sql = "select pay_state from [order] where pay_state = '1' and owner_hide='False'";
        dt = Mei.GetDataTable(sql);
        lb_od_state_2.Text = dt.Rows.Count.ToString();

        sql = "select pay_state from [order] where pay_state='2' and owner_hide='False'";
        dt = Mei.GetDataTable(sql);
        lb_atm_unchk.Text = dt.Rows.Count.ToString();

        sql = "select shipping_state from [order] where shipping_state='4' and pay_state='1' and owner_hide='False'";
        dt = Mei.GetDataTable(sql);
        lb_notpayed.Text = dt.Rows.Count.ToString();
    }
}