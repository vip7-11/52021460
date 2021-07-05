using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class cvspaid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["payment_type"] != null)
        {
            if (Request["payment_type"] == "cvs")
            {
                string mer_id = Request["mer_id"].ToString();
                string payment_type = Request["payment_type"].ToString();
                string tsr = Request["tsr"].ToString();
                string od_sob = Request["od_sob"].ToString();
                string payno = Request["payno"].ToString();
                string amt = Request["amt"].ToString();
                string succ = Request["succ"].ToString();
                string payfrom = Request["payfrom"].ToString();
                string proc_date = Request["proc_date"].ToString();
                string proc_time = Request["proc_time"].ToString();
                string tac = Request["tac"].ToString();

                string cvstore = "";
                if (payfrom == "family") cvstore = "全家便利商店";
                if (payfrom == "hilife") cvstore = "萊爾富便利商店";
                if (payfrom == "okmart") cvstore = "OK便利商店";
                if (payfrom == "ibon") cvstore = "7-Eleven";

                string date = proc_date.Substring(0, 4) + "/" + proc_date.Substring(4, 2) + "/" + proc_date.Substring(6, 2) + " " + proc_time.Substring(0, 2) + ":" + proc_time.Substring(2, 2) + ":" + proc_time.Substring(4, 2);

                if (succ == "1")
                {
                    string sql = "update [order] set pay_state = 3, atm_account = '" + cvstore + "', atm_date = '" + date + "' where tsr = '" + tsr + "' and cvsPayno = '" + payno + "'";
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("ok");
                }
            }
            if (Request["payment_type"] == "ibon")
            {
                string mer_id = Request["mer_id"].ToString();
                string payment_type = Request["payment_type"].ToString();
                string tsr = Request["tsr"].ToString();
                string od_sob = Request["od_sob"].ToString();
                string payno = Request["payno"].ToString();
                string amt = Request["amt"].ToString();
                string succ = Request["succ"].ToString();
                string payfrom = Request["payfrom"].ToString();
                string proc_date = Request["proc_date"].ToString();
                string proc_time = Request["proc_time"].ToString();
                string tac = Request["tac"].ToString();

                string cvstore = "";
                if (payfrom == "ibon") cvstore = "7-Eleven";

                string date = proc_date.Substring(0, 4) + "/" + proc_date.Substring(4, 2) + "/" + proc_date.Substring(6, 2) + " " + proc_time.Substring(0, 2) + ":" + proc_time.Substring(2, 2) + ":" + proc_time.Substring(4, 2);

                if (succ == "1")
                {
                    string sql = "update [order] set pay_state = 3, atm_account = '" + cvstore + "', atm_date = '" + date + "' where tsr = '" + tsr + "' and cvsPayno = '" + payno + "'";
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("ok");
                }
            }
        }
    }
}