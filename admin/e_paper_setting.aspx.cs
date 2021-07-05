using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_e_paper_setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "select * from e_paper order by pm_editdate desc";
        DataTable dt = Mei.GetDataTable(sql);
        lt_list.Text = "";
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                lt_list.Text += "<tr>";
                lt_list.Text += "<td style='height:25px'>" + Convert.ToDateTime(dt.Rows[i]["pm_date"].ToString()).ToString("yyyy/MM/dd") + "</td>";
                lt_list.Text += "<td>" + dt.Rows[i]["pm_title"].ToString() + "</td>";
                lt_list.Text += "<td><a href='e_paper_edit.aspx?menu=7&act=edit&sn=" + dt.Rows[i]["sn"].ToString() + "'>修改</a></td>";
                lt_list.Text += "<td><a href='e_paper_edit.aspx?menu=7&act=del&sn=" + dt.Rows[i]["sn"].ToString() + "'>刪除</a></td>";
                lt_list.Text += "</tr>";
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("e_paper_add.aspx?menu=7");
    }
}