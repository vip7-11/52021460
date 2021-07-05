using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_printview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        { Response.Redirect("../index.aspx"); }

        Control ctrl = (Control)Session["ctrl"];
        PrintHelper.PrintWebControl(ctrl);
    }
}