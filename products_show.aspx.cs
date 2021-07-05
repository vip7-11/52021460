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

public partial class products_show : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pdt_no = "";
        if (!IsPostBack)
        {
            if (Request.QueryString.Get("page") != null)
            {
                pdt_no = Request.QueryString.Get("page").ToString();
                selectpdt(pdt_no);
            }
        }
        //************************************
        //瀏覽紀錄
        DataTable dt;
        if (HttpContext.Current.Session["pdt_list"] == null)
        {
            dt = new DataTable();
            dt.Columns.Add(new DataColumn("pdt_no", typeof(string)));
            dt.Columns.Add(new DataColumn("pdt_name", typeof(string)));
            dt.Columns.Add(new DataColumn("pdt_pic", typeof(string)));
        }
        else
        {
            dt = (DataTable)Session["pdt_list"];
        }
        string pdt_name = "";
        string pdt_pic = "";
        try
        {
            string sql = "select * from pdt where pdt_no='" + Request.QueryString.Get("page").ToString() + "'";
            DataTable dt2 = Mei.GetDataTable(sql);
            //---取得系統編號、商品編號、名稱、尺寸、優惠價、數量---
            pdt_name = dt2.Rows[0]["pdt_name"].ToString();
            pdt_pic = dt2.Rows[0]["pdt_img1"].ToString();
        }
        catch
        {
            Response.Redirect("index.aspx");
        }
        //---判斷本商品是否已加入瀏覽紀錄---
        string chkno = "0";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dt.Rows[i];
            if ((dr["pdt_no"].ToString() == pdt_no))
            {
                chkno = "1";
            }
        }
        if (chkno == "1")
        {

        }
        else
        {
            DataRow dr;
            //瀏覽紀錄筆數
            if (dt.Rows.Count > 7)
            {
                //如果有大魚3筆，則刪除第一筆
                dr = dt.Rows[0];
                dr.Delete();
                dt.AcceptChanges();
                Session["pdt_list"] = dt;
            }
            //---存入暫存瀏覽紀錄---
            dr = dt.NewRow();
            dr["pdt_no"] = pdt_no;
            dr["pdt_name"] = pdt_name;
            dr["pdt_pic"] = pdt_pic;
            dt.Rows.Add(dr);
            dt.AcceptChanges();

            HttpContext.Current.Session["pdt_list"] = dt;
        }
    }
    protected void selectpdt(string pdt_no)
    {
        try
        {
            string sql = "select * from pdt where pdt_no='" + pdt_no + "'";
            DataTable dt = YamaZoo.GetDataTable(sql);
            if (dt.Rows.Count != 0)
            {
                string pdt_id = dt.Rows[0]["pdt_id"].ToString();
                string pdt_name = dt.Rows[0]["pdt_name"].ToString();
                string pdt_price = dt.Rows[0]["pdt_price"].ToString();
                string pdt_sell = dt.Rows[0]["pdt_sell"].ToString();
                string pdt_itemA = dt.Rows[0]["pdt_itemA"].ToString();
                string pdt_content = dt.Rows[0]["pdt_content"].ToString();
                string pdt_stocks = dt.Rows[0]["pdt_stocks"].ToString();
                string pdt_units = dt.Rows[0]["pdt_units"].ToString();
                string pdt_updatetime = dt.Rows[0]["pdt_updatetime"].ToString();
                string pdt_img1 = dt.Rows[0]["pdt_img1"].ToString();
                string pdt_convey = dt.Rows[0]["pdt_convey"].ToString();
                string pdt_specific = dt.Rows[0]["pdt_specific"].ToString();

                lblpdt_no.Text = pdt_no;
                lblpdt_id.Text = pdt_id;
                lblpdt_name.Text = pdt_name;
                lblpdt_price.Text = pdt_price;
                lblpdt_sell.Text = pdt_sell;
                lblpdt_stocks.Text = pdt_stocks;
                lblpdt_convey.Text = pdt_convey;
                ltpdt_content.Text = HttpContext.Current.Server.HtmlDecode(pdt_content);
                Image1.ImageUrl = "image/products/" + pdt_img1;
                Image1.Width = 210;
                lblpdt_updatetime.Text = Convert.ToDateTime(pdt_updatetime).ToString("yyyy/MM/dd");

                ////商品規格
                DataTable dt2;
                ViewState["select_count"] = "";
                lt_objtype.Text = "";
                if (pdt_specific != "")
                {
                    string[] specific = pdt_specific.Split(';');
                    string[] spec2;
                    string[] spec;
                    string sql2;
                    int i;
                    int j;
                    ViewState["select_count"] = specific.Length;
                    try
                    {
                        for (i = 0; i < specific.Length; i++)
                        {
                            spec = specific[i].Split(':');
                            sql = "select * from specific_group where specific_group_id=" + spec[0];
                            dt = YamaZoo.GetDataTable(sql);
                            lt_objtype.Text += dt.Rows[0]["specific_group_name"] + "：<select id=\"obj_type" + (i + 1) + "\" name=\"obj_type" + (i + 1) + "\" runat =\"server\">";
                            spec2 = spec[1].Split(',');
                            try
                            {
                                for (j = 0; j < spec2.Length; j++)
                                {
                                    sql2 = "select * from specification where specific_id=" + spec2[j];
                                    dt2 = YamaZoo.GetDataTable(sql2);
                                    lt_objtype.Text += "<option value =\"" + spec2[j] + "\">" + dt2.Rows[0]["specification"] + "</option>";
                                }
                            }
                            catch { }
                            lt_objtype.Text += "</select><br/>";
                        }
                    }
                    catch { }
                }
            }
        }
        catch
        {
            YamaZoo.scriptAlert("發生不明錯誤，請洽系統管理員！");
        }
    }
    protected void imgbtn01_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        if (Convert.ToInt32(lblnum.Text) > Convert.ToInt32(lblpdt_stocks.Text.Trim()))
        {
            YamaZoo.scriptAlert("您已經到達此商品購買數量上限！");
        }
        else
        {
            lblnum.Text = Convert.ToString(Convert.ToInt32(lblnum.Text) + 1);
        }
    }
    protected void imgbtn02_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        lblnum.Text = Convert.ToString(Convert.ToInt32(lblnum.Text) - 1);
        if (Convert.ToInt32(lblnum.Text) < 1)
        {
            lblnum.Text = "1";
        }
    }
    protected void btn_car_Click(object sender, EventArgs e)
    {
        string alert="";
        //判斷有無登入
        if (Session["u_id"] == null)
        {
            alert = "您尚未登入會員!";
            YamaZoo.scriptAlert(alert);
            return;
        }

        DataTable dt;
        if (Session["car"] == null)
        {
            dt = new DataTable();
            dt.Columns.Add(new DataColumn("pdt_no", typeof(string)));
            dt.Columns.Add(new DataColumn("pdt_id", typeof(string)));
            dt.Columns.Add(new DataColumn("pdt_name", typeof(string)));
            dt.Columns.Add(new DataColumn("pdt_stocks", typeof(string)));
            dt.Columns.Add(new DataColumn("pdt_sell", typeof(int)));
            dt.Columns.Add(new DataColumn("pdt_count", typeof(int)));
            dt.Columns.Add(new DataColumn("pdt_sum", typeof(int)));
            dt.Columns.Add(new DataColumn("pdt_convey", typeof(string)));
            dt.Columns.Add(new DataColumn("pdt_specification", typeof(string)));
        }
        else
        {
            dt = (DataTable)Session["car"];
        }

        //---取得系統編號、商品編號、名稱、尺寸、優惠價、數量---
        string pdt_no = lblpdt_no.Text;
        string pdt_id = lblpdt_id.Text;
        string pdt_name = YamaZoo.SaveString(lblpdt_name.Text, false);
        string pdt_sell = lblpdt_sell.Text;
        string pdt_count = lblnum.Text;
        string pdt_convey = lblpdt_convey.Text;
        string pdt_stocks = lblpdt_stocks.Text;
        int pdt_sum = Convert.ToInt32(pdt_sell) * Convert.ToInt32(pdt_count);

        //規格
        DataTable dt2;
        string sql = "";
        string name;
        string spec = "";
        if (ViewState["select_count"].ToString() != "")
        {
            
            for (int i = 0; i < int.Parse(ViewState["select_count"].ToString()); i++)
            {
                name = "obj_type" + (i + 1);
                sql = "select specification.*, specific_group.specific_group_name from specification inner join specific_group on specification.specific_group_id= specific_group.specific_group_id where specification.specific_id=" + Request.Form[name];
                dt2 = YamaZoo.GetDataTable(sql);
                spec += dt2.Rows[0]["specific_group_name"].ToString() + " " + dt2.Rows[0]["specification"].ToString();
                if (i != int.Parse(ViewState["select_count"].ToString()) - 1)
                {
                    spec += "/";
                }
            }
        }

        //---判斷本商品尺寸庫存是否高於購買量---
        if (Convert.ToInt32(pdt_count) > Convert.ToInt32(pdt_stocks))
        {
            alert = "不好意思，您的購買數量已大於此商品庫存";
            YamaZoo.scriptAlert(alert);
            return;
        }
        //---判斷本商品是否已加入購物車---
        string chkno = "0";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dt.Rows[i];
            if (dr["pdt_no"].ToString() == pdt_no)
            {
                chkno = "1";
            }
        }

        if (chkno == "1")
        {
            alert = "此商品已經重複加入購物車！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            //---存入暫存購物車---
            DataRow dr = dt.NewRow();
            dr["pdt_no"] = pdt_no;//no
            dr["pdt_id"] = pdt_id;//id
            dr["pdt_name"] = pdt_name;//商品名
            dr["pdt_stocks"] = pdt_stocks;//庫存量
            dr["pdt_sell"] = pdt_sell;//
            dr["pdt_count"] = pdt_count;//數量
            dr["pdt_sum"] = pdt_sum;//總價
            dr["pdt_convey"] = pdt_convey;//運費
            dr["pdt_specification"] = spec;//規格

            dt.Rows.Add(dr);
            dt.AcceptChanges();

            Session["car"] = dt;
            alert = "商品加入購物車完成！";
            YamaZoo.scriptAlert(alert);
        }
    }
}