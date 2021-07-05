using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class dii : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            select();
        }
    }
    protected void select()
    {
        lt.Text = "";
        DataTable dt;
        if (Application["aa"] != null)
        {
            dt = (DataTable)Application["aa"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                lt.Text += "<table cellspacing='1' cellpadding='1' border='1' width='100%'>";
                lt.Text += "<tr><td style=' width:80px; text-align:right;'>NAME</td>";
                lt.Text += "<td style=' text-align:left;'>" + dt.Rows[i]["name"].ToString() + "</td>";
                lt.Text += "<td style=' width:80px; text-align:right;'>選擇餐點</td>";
                lt.Text += "<td style=' text-align:left;'>" + dt.Rows[i]["select"].ToString() + "</td>";
                lt.Text += "<td style=' width:60px; text-align:right;'>意見</td>";
                lt.Text += "<td style=' text-align:left;'>" + dt.Rows[i]["content"].ToString() + "</td>";
                lt.Text += "</tr></table>";
            }
        }
    }
    protected void btnok_Click(object sender, EventArgs e)
    {
        DataTable dt;
        if (Application["aa"] != null)
        {
            dt = (DataTable)Application["aa"];
            DataRow dr = dt.NewRow();
            dr["name"] = txtname.Text;
            dr["select"] = rb_list.SelectedItem.Text;
            dr["content"] = txtcontent.Text.Trim();
            dt.Rows.Add(dr);
            dt.AcceptChanges();
        }
        else
        {
            dt = new DataTable();
            dt.Columns.Add(new DataColumn("name", typeof(string)));
            dt.Columns.Add(new DataColumn("select", typeof(string)));
            dt.Columns.Add(new DataColumn("content", typeof(string)));
            DataRow dr = dt.NewRow();
            dr["name"] = txtname.Text;
            dr["select"] = rb_list.SelectedItem.Text;
            dr["content"] = txtcontent.Text.Trim();
            dt.Rows.Add(dr);
            dt.AcceptChanges();
        }
        Application["aa"] = dt;
        select();
        if (rb_list.SelectedValue == "1")
        {
            YamaZoo.scriptAlert("你好棒");
        }
        else
        {
            YamaZoo.scriptAlert("ㄏㄚˊ ");
        }
    }
}