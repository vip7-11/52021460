using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_user : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        //Session["url"] = Request.RawUrl;
        if (Session["u_id"] == null)
        {
            Response.Redirect("../index.aspx");
        }
        else
        {
            if (Session["u_role"].ToString() != "01")
            {
                Response.Redirect("../index.aspx");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!(Menu.Panes["CartPane"].Visible) && (Int32.Parse(Request.QueryString["menu"].ToString()) > 3))
            {
                Menu.SelectedIndex = Int32.Parse(Request.QueryString["menu"].ToString()) - 1;
            }
            else
            {
                Menu.SelectedIndex = Int32.Parse(Request.QueryString["menu"].ToString());
            }
        }
        catch { }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Remove("u_id");
        Session.Remove("u_name");
        Response.Redirect("../index.aspx");
    }
}