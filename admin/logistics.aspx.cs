using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_logistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void select_logistics(string id)
    {
        try
        {
            string sql = "SELECT id, name, url FROM [logistics] where id=" + id;
            DataTable dt = YamaZoo.GetDataTable(sql);
            if (dt.Rows.Count != 0)
            {
                txt_link.Text = dt.Rows[0]["url"].ToString();
                txtCon_name.Value = dt.Rows[0]["name"].ToString();
                lbl_id.Text = id;
            }
        }
        catch
        {
            YamaZoo.scriptAlert("發生不明錯誤，請洽管理員！");
        }
    }
    protected void btn_ok_Click(object sender, EventArgs e)
    {
        //修改
        try
        {
            string id = lbl_id.Text;
            string name = txtCon_name.Value;
            string url = txt_link.Text.Trim();
            string sql = "update logistics set name='" + name.Replace("'", "''") + "', url='" + url + "' where id=" + id;
            Mei.connSql(sql);
            YamaZoo.scriptAlert("修改成功");
            GV_logistics.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }
        catch
        {
            YamaZoo.scriptAlert("發生不明錯誤，請洽管理員！");
        }

    }
    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void GV_logistics_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            //usersGv.DataSource = ViewState["ds"];
            //usersGv.DataBind();
            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得帳號資料---
            string id = ((LinkButton)GV_logistics.Rows[index].Cells[0].Controls[0]).Text;
            select_logistics(id);
            MultiView1.ActiveViewIndex = 1;
        }
    }
}