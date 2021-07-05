using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Url.ToString().Replace("/Default.aspx", "") == "http://www.vip7-11.com.tw")
        {
            return;
        }
        else if (Request.Url.ToString().Replace("/Default.aspx", "") == "http://vip7-11.com.tw")
        {
            Response.Redirect("index.aspx");
        }
    }
}