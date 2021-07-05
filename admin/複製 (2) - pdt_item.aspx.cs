using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;

public partial class user_pdt_item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

/////////////////////////////
        HttpContext.Current.Session["O_PostalCode"] = "";
        HttpContext.Current.Session["R_receiverPostalCode"]="";

        HttpContext.Current.Session["car_total"] = car_total;
        HttpContext.Current.Session["O_name"] = O_name;
        HttpContext.Current.Session["car_fees"] = car_fees;
        HttpContext.Current.Session["car_pay"] = car_pay;
        HttpContext.Current.Session["car_ps"] = car_ps;
        HttpContext.Current.Session["car_pdate"] = car_pdate;
        HttpContext.Current.Session["car_gdate"] = car_gdate;
        HttpContext.Current.Session["car_fdate"] = car_fdate;
        HttpContext.Current.Session["car_bill"] = car_bill;
        HttpContext.Current.Session["O_mail"] = O_mail;
        HttpContext.Current.Session["R_mail"] = R_mail;

        string car_no = Mei.GetMaxNo(10, "car", "car_no");
        string car_date = DateTime.Now.ToString("yyyy/MM/dd");
        string car_time = DateTime.Now.ToString("HH:mm:ss");
        string car_usersid = Session["u_id"].ToString();
        string O_name = HttpContext.Current.Session["O_name"].ToString();
        string O_phone = HttpContext.Current.Session["O_phone"].ToString();
        string O_cellphone = HttpContext.Current.Session["O_cellphone"].ToString();
        string O_city = HttpContext.Current.Session["O_city"].ToString();
        string O_district = HttpContext.Current.Session["O_district"].ToString();
        string O_address = HttpContext.Current.Session["O_address"].ToString();
        string R_name = HttpContext.Current.Session["R_name"].ToString();
        string R_phone = HttpContext.Current.Session["R_phone"].ToString();
        string R_cellphone = HttpContext.Current.Session["R_cellphone"].ToString();
        string R_city = HttpContext.Current.Session["R_city"].ToString();
        string R_district = HttpContext.Current.Session["R_district"].ToString();
        string R_address = HttpContext.Current.Session["R_address"].ToString();
        string car_total = HttpContext.Current.Session["car_total"].ToString();
        string car_fees = HttpContext.Current.Session["car_fees"].ToString();
        string car_pay = HttpContext.Current.Session["car_pay"].ToString();
        string car_ps = YamaZoo.SaveString(HttpContext.Current.Session["car_ps"].ToString(), true);
        string car_pdate = HttpContext.Current.Session["car_pdate"].ToString();
        string car_gdate = HttpContext.Current.Session["car_gdate"].ToString();
        string car_fdate = HttpContext.Current.Session["car_fdate"].ToString();
        string car_bill = HttpContext.Current.Session["car_bill"].ToString();




        string car_total = lblSum.Text;
        string car_fees = lblFees.Text;
        string car_pay = rblcar_pay.SelectedValue;
        string car_ps = YamaZoo.SaveString(txtcar_ps.Text.Trim(), true);
        string car_pdate = "";
        string car_gdate = "";
        string car_fdate = "";
        string car_bill = rblcar_bill.SelectedValue;
        HttpContext.Current.Session["delivery_time"] = delivery_time;
        //
        string delivery_time = ddldelivery_time.SelectedValue;//收貨時間
        HttpContext.Current.Session["delivery_time"].ToString();
        string totalfreight = lblFees.Text; string car_fees = HttpContext.Current.Session["car_fees"].ToString();
        string totalprice = lblSum.Text; HttpContext.Current.Session["car_total"].ToString();
        string memo = YamaZoo.SaveString(txtcar_ps.Text.Trim(), true); YamaZoo.SaveString(HttpContext.Current.Session["car_ps"].ToString(), true);
        string payway = rblcar_pay.SelectedValue; HttpContext.Current.Session["car_pay"].ToString();

























    }
}