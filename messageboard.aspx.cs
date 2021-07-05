using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class messageboard : System.Web.UI.Page
{
    string sql;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void newMessageB_Click(object sender, EventArgs e)
    {
        sql = "INSERT INTO messageboard (id, introduction, remessageID) VALUES (" + Convert.ToInt32(Session["loginer_id"].ToString()) + ", '" + newMessage.Value + "', " + Convert.ToInt32(Session["loginer_id"].ToString()) + ")";
        somecode.ExecuteNoQuery(sql);
        Response.Redirect("messageboard.aspx");
    }
}