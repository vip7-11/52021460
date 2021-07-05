using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.UI.HtmlControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    string sql;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string web_title = "";
            string web_slogan = "";
            sql = "select * from web";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                web_title = (rd["web_title"].ToString().Trim());
                web_slogan = (rd["web_slogan"].ToString().Trim());
                Page.Header.Title = string.Concat(YamaZoo.SaveString(web_title, false), " - ", YamaZoo.SaveString(web_slogan, false));
            }
            rd.Close();
            conn.Close();
        }
        catch
        {
        }

        sql = "SELECT web_keyword, web_description FROM web WHERE web_id='00001'";
        dt = Mei.GetDataTable(sql);
        if (dt.Rows.Count != 0)
        {
            KeywordsMeta.Content = dt.Rows[0][0].ToString();
            KeywordsMeta2.Content = dt.Rows[0][0].ToString();
            DescriptionMeta.Content = dt.Rows[0][1].ToString();
        }

        sql = "SELECT pic FROM banner";
        dt = somecode.GetDataTable(sql);
        banner_BK.Style.Add("background-image", "url(image/lelecoco/" + dt.Rows[0][0].ToString() + ")");

        sql = "SELECT url, pic FROM zhongdikai WHERE class ='banner'";
        dt = somecode.GetDataTable(sql);
        banner_B1.NavigateUrl = dt.Rows[0][0].ToString();
        banner_B1.ImageUrl = "image/lelecoco/" + dt.Rows[0][1].ToString();
        banner_B2.NavigateUrl = dt.Rows[1][0].ToString();
        banner_B2.ImageUrl = "image/lelecoco/" + dt.Rows[1][1].ToString();
        banner_B3.NavigateUrl = dt.Rows[2][0].ToString();
        banner_B3.ImageUrl = "image/lelecoco/" + dt.Rows[2][1].ToString();
        if (Session["u_id"] != null)
        {
            loginHL.Text = "|登出|";
            loginHL.NavigateUrl = "logout.aspx";

            regHL.Text = "|我的帳戶|";
            regHL.NavigateUrl = "myaccount.aspx";
            if (Session["u_role"].ToString() == "01")
            {
                //adHL.Visible = true;
                adHL_new.Visible = true;
            }
        }
        else if (Session["u_id"] == null)
        {
            loginHL.Text = "|登入|";
            loginHL.NavigateUrl = "login.aspx";

            regHL.Text = "|註冊|";
            regHL.NavigateUrl = "reg.aspx";

            talkboardHL.NavigateUrl = "login.aspx";
        }
        if (!IsPostBack)
        {
            //瀏覽紀錄
            rightAD();
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (System.IO.Path.GetFileName(Request.PhysicalPath).Contains("payadapter"))
        {
            if ((string)HttpContext.Current.Session["payWay"] == "WATM" || (string)HttpContext.Current.Session["payWay"] == "VISA")
            {
                form1.Method = "post";
                form1.Action = "https://ecbank.com.tw/gateway.php";
            }
            else if ((string)HttpContext.Current.Session["payWay"] == "CSPay")
            {
                //form1.Method = "get";
                //form1.Action = "https://ecbank.com.tw/gateway.php";
            }
            else
            {
                form1.Method = "post";
                form1.Action = System.IO.Path.GetFileName(Request.PhysicalPath);
            }
        }
        else
        {
            Response.Cache.SetNoStore();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }
    }
    protected void rightAD()
    {
        //瀏覽紀錄
        lt_rightAD.Text = "";
        if (HttpContext.Current.Session["pdt_list"] == null)
        {
            lt_rightAD.Text = "";
        }
        else
        {
            lt_rightAD.Text += "<tr><td class='floatFontstyle'>瀏覽紀錄</td></tr>";
            DataTable pdt_list = (DataTable)Session["pdt_list"];
            for (int i = 0; i < pdt_list.Rows.Count; i++)
            {
                lt_rightAD.Text += "<tr><td class='floatFontstyle'>";
                lt_rightAD.Text += "<a title=" + pdt_list.Rows[i]["pdt_name"].ToString() + " href='products_show.aspx?page=" + pdt_list.Rows[i]["pdt_no"].ToString() + "'><img src='image/products/" + pdt_list.Rows[i]["pdt_pic"].ToString() + "' width='60px' height='60px'></a>";
                lt_rightAD.Text += "</td></tr>";
            }
        }
    }
    protected void search_GO_Click(object sender, ImageClickEventArgs e)
    {
        Session["search_ddl_value"] = search_class.SelectedValue.ToString();
        Session["search_txt"] = search_keyword.Text.Trim();
        Response.Redirect("products_search_list.aspx");
    }
    protected void search_other_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("search_other.aspx");
    }
}