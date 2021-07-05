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
using System.Data;

public partial class acc : System.Web.UI.Page
{
    string sqlWebId, sql;
    DataTable dtWebId, dt;
    string chk = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpContext.Current.Session["service_cost"] = "0";
            SelectGV();
            CarTotal();
            SelectUser();
            SelectShopping();
        }
        HttpContext.Current.Session["ownerID"] = "00001";
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {

    }

    protected void SelectShopping()
    {
        //付款方式
        sql = "select payway, pay_check from payway order by id asc";
        dt = YamaZoo.GetDataTable(sql);
        if (dt.Rows[0]["pay_check"].ToString().Trim() == "True")
        {
            rdoATM.Enabled = true;
        }
        if (dt.Rows[1]["pay_check"].ToString().Trim() == "True")
        {

            rdoRecPay.Enabled = true;
        }
        if (dt.Rows[2]["pay_check"].ToString().Trim() == "True")
        {
            rdoWATM.Enabled = true;
        }
        if (dt.Rows[3]["pay_check"].ToString().Trim() == "True")
        {
            rdoCSPay.Enabled = true;
        }
        if (dt.Rows[4]["pay_check"].ToString().Trim() == "True")
        {
            rdoVISA.Enabled = true;
        }
        if (dt.Rows[5]["pay_check"].ToString().Trim() == "True")
        {
            rdoCSPay_ibon.Enabled = true;
        }
        if (dt.Rows[6]["pay_check"].ToString().Trim() == "True")
        {
            rdoStore.Enabled = true;
        }
        sql = "select recPayCount from web";
        dt = YamaZoo.GetDataTable(sql);
        lblRecPayCount.Text = dt.Rows[0]["recPayCount"].ToString().Trim();
    }
    protected void SelectGV()
    {
        //---暫存購物車為空時---
        if (Session["car"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            carGv.DataSource = (DataTable)Session["car"];
            carGv.DataBind();
        }

    }
    protected void CarTotal()
    {
        //---商品合計---
        Int64 sum = 0;
        Int64 totaltConvey = 0;
        DataTable dt = (DataTable)Session["car"];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dt.Rows[i];
            sum = sum + Convert.ToInt64(dr["pdt_count"]) * Convert.ToInt64(dr["pdt_sell"]);
            //加總所有商品之運費為運費
            totaltConvey = totaltConvey + Convert.ToInt64(dr["pdt_convey"]);
        }
        lblSum.Text = Convert.ToString(sum);
        //運費計算方式
        string sqlFreight = "select freight, highestfreight from web where web_id='00001'";
        DataTable dtFreight = Mei.GetDataTable(sqlFreight);
        string freight = dtFreight.Rows[0][0].ToString().Trim();
        switch (freight)
        {
            case "1":
                //以消費者訂單商品中最高運費為運費
                Int64 hightestFees = 0;
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    DataRow dr = dt.Rows[j];

                    if (Convert.ToInt64(dr["pdt_convey"]) >= hightestFees)
                    {
                        hightestFees = Convert.ToInt64(dr["pdt_convey"]);
                        //lblFees.Text = hightestFees.ToString();
                    }
                    else
                    {
                        hightestFees = hightestFees + 0;
                    }
                }
                lblFees.Text = hightestFees.ToString();
                break;

            case "2":
                //加總所有商品之運費為運費
                lblFees.Text = totaltConvey.ToString();
                break;

            case "3":
                //加總所有商品之運費為運費，但不超過XX元
                if (totaltConvey >= Convert.ToInt64(dtFreight.Rows[0][1].ToString()))
                {
                    lblFees.Text = dtFreight.Rows[0][1].ToString().Trim();
                }
                else
                {
                    lblFees.Text = totaltConvey.ToString();
                }
                break;

            default:
                //Response.Redirect("~/acc.aspx");
                break;
        }

        //---運費合計---
        //if消費超過??元than商品運費免費IS_OPEN
        sql = "select totalfreight, FreeFreight_rb, FreeFreight from web where web_id='00001'";
        dt = Mei.GetDataTable(sql);
        if (dt.Rows[0][1].ToString().Trim() == "True")
        {
            //打開_消費XX免運費
            if (Convert.ToInt32(lblSum.Text) >= Convert.ToInt32(dt.Rows[0][2].ToString().Trim()))
            {
                lblFees.Text = "0";
            }
            else
            {
                //lblFees.Text = dt.Rows[0][0].ToString().Trim();
            }
        }
        else
        {
            //關閉_消費XX免運費
            //設定運費為預設運費
            //運費計算方式 1.以消費者訂單商品中最高運費為運費  2.加總所有商品之運費為運費  3.加總所有商品之運費為運費，但不超過XX元
            //lblFees.Text = dt.Rows[0][0].ToString().Trim();
        }
        ////than商品預設運費為
        //lblFees.Text = "0";
        //---總計---

        //來店取貨運費為0
        if (HttpContext.Current.Session["payWay"] != null)
        {
            if (HttpContext.Current.Session["payWay"] == "Store")
            {
                lblFees.Text = "0";
            }
        }

        lbl_service_cost.Text = Session["service_cost"].ToString();

        lblTotal.Text = Convert.ToString(sum + Convert.ToInt64(lblFees.Text.Trim()) + Convert.ToInt64(lbl_service_cost.Text.Trim()));
    }
    protected void carGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
        }
    }
    protected void carGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        carGv.PageIndex = e.NewPageIndex;
        SelectGV();
    }
    protected void SelectUser()
    {
        string users_mail = "";
        string users_name = "";
        string users_phone = "";
        string users_cellphone = "";
        string users_city = "";
        string users_district = "";
        string users_address = "";
        ddlOdistrict_num.Text = "";
        ddlRdistrict_num.Text = "";

        string sql = "select * from users where users_id = '" + Session["u_id"].ToString() + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            users_mail = (rd["users_mail"].ToString());
            users_name = (rd["users_name"].ToString());
            users_phone = (rd["users_phone"].ToString());
            users_cellphone = (rd["users_cellphone"].ToString());
            users_city = (rd["users_city"].ToString().Trim());
            users_district = (rd["users_district"].ToString());
            users_address = (rd["users_address"].ToString());
        }
        rd.Close();
        conn.Close();

        txtOemail.Text = YamaZoo.SaveString(users_mail, false);
        txtOname.Text = YamaZoo.SaveString(users_name, false);
        txtOphone.Text = YamaZoo.SaveString(users_phone, false);
        txtOcellphone.Text = YamaZoo.SaveString(users_cellphone, false);
        if (users_city.Trim() != "")
            ddlOcity.SelectedValue = users_city;
        if (users_district.Trim() != "")
        {
            ddlOcity.DataBind();
            SqlDataSource1.DataBind();
            ddlOdistrict.SelectedValue = users_district;
        }
        txtOaddress.Text = YamaZoo.SaveString(users_address, false);
        ddlOdistrict_num.Text = users_district;
    }
    protected void chkOR_CheckedChanged(object sender, EventArgs e)
    {
        txtRname.Text = txtOname.Text;
        txtRphone.Text = txtOphone.Text;
        txtRcellphone.Text = txtOcellphone.Text;
        ddlRcity.SelectedValue = ddlOcity.SelectedValue;
        txtRemail.Text = txtOemail.Text;
        if (ddlOcity.SelectedValue.Trim().ToString() != "")
        {
            ddlRcity.DataBind();
            SqlDataSource1.DataBind();
            ddlRdistrict.DataBind();
            SqlDataSource3.DataBind();
            ddlRdistrict.SelectedValue = ddlOdistrict.SelectedValue;
            txtRaddress.Text = txtOaddress.Text;
            ddlRdistrict_num.Text = ddlOdistrict.SelectedValue;
        }
    }
    protected void imgbtn_Click(object sender, EventArgs e)
    {
        //判斷付款方式
        if (rdoStore.Checked) //來店取貨
        {
            HttpContext.Current.Session["payWay"] = "Store";
            HttpContext.Current.Session["service_cost"] = "0";
        }
        else if (rdoATM.Checked) //ATM轉帳
        {
            HttpContext.Current.Session["payWay"] = "ATM";
            HttpContext.Current.Session["service_cost"] = "0";
        }
        else if (rdoRecPay.Checked) //貨到付款
        {
            HttpContext.Current.Session["payWay"] = "RecPay";
            HttpContext.Current.Session["service_cost"] = lblRecPayCount.Text;
        }
        else if (rdoWATM.Checked) //WebATM 轉帳
        {
            HttpContext.Current.Session["payWay"] = "WATM";
            HttpContext.Current.Session["service_cost"] = "0";
        }
        else if (rdoCSPay.Checked) //超商代碼繳費
        {
            HttpContext.Current.Session["payWay"] = "CSPay";
            HttpContext.Current.Session["service_cost"] = "0";
        }
        else if (rdoCSPay_ibon.Checked) //超商代碼(7/11)繳費
        {
            HttpContext.Current.Session["payWay"] = "IBON";
            HttpContext.Current.Session["service_cost"] = "0";
        }
        else if (rdoVISA.Checked) //線上刷卡
        {
            HttpContext.Current.Session["payWay"] = "VISA";
            HttpContext.Current.Session["PayType"] = "01";
            HttpContext.Current.Session["service_cost"] = "0";
        }
        else
        {
            HttpContext.Current.Session["payWay"] = "Error";
        }

        if ((string)HttpContext.Current.Session["payWay"] == "Error")
        {
            YamaZoo.scriptAlert("請選擇付款方式！");
            return;
        }
        CarTotal();
        ChkData();
        if (chk == "1")
        {
            string alert = "資料未填寫完全！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            show_order.Visible = false;
            //判斷付款方式
            string payWay = (string)HttpContext.Current.Session["payWay"];

            switch (payWay)
            {
                case "Store":
                    Response.Redirect("~/payadapter.aspx");
                    break;

                case "ATM":
                    Response.Redirect("~/payadapter.aspx");
                    break;

                case "RecPay":
                    Response.Redirect("~/payadapter.aspx");
                    break;

                case "WATM":
                    Response.Redirect("~/payadapter.aspx");
                    break;

                case "CSPay":
                    Response.Redirect("~/payadapter.aspx");
                    break;

                case "IBON":
                    Response.Redirect("~/payadapter.aspx");
                    break;

                case "VISA":
                    Response.Redirect("~/payadapter.aspx");
                    break;

                case "Error":
                    Response.Redirect("~/acc.aspx");
                    break;

                default:
                    Response.Redirect("~/car.aspx");
                    break;
            }
            Response.Redirect("payadapter.aspx");
        }
    }
    protected void ChkData()
    {
        //---訂購者資料---
        string O_name = txtOname.Text.Trim();
        string O_phone = txtOphone.Text.Trim();
        string O_cellphone = txtOcellphone.Text.Trim();
        string O_mail = txtOemail.Text.Trim();
        string O_city = ddlOcity.SelectedItem.Text.Trim();
        string O_district = ddlOdistrict.SelectedItem.Text.Trim();
        string O_address = txtOaddress.Text.Trim();
        string O_PostalCode = ddlOdistrict.SelectedValue;
        if (O_name == "" || O_phone == "" || O_cellphone == "" || O_city == "" || O_district == "" || O_address == "") { chk = "1"; }
        //---收件者資料---
        string R_name = txtRname.Text.Trim();
        string R_phone = txtRphone.Text.Trim();
        string R_cellphone = txtRcellphone.Text.Trim();
        string R_mail = txtRemail.Text.Trim();
        string R_city = ddlRcity.SelectedItem.Text.Trim();
        string R_district = ddlRdistrict.SelectedItem.Text.Trim();
        string R_address = txtRaddress.Text.Trim();
        string R_receiverPostalCode = ddlRdistrict.SelectedValue;
        if (R_name == "" || R_phone == "" || R_cellphone == "" || R_city == "" || R_district == "" || R_address == "") { chk = "1"; }

        string car_sum = lblSum.Text;
        string car_total = lblTotal.Text;
        string car_fees = lblFees.Text;
        string service_cost = HttpContext.Current.Session["service_cost"].ToString();
        string car_ps = YamaZoo.SaveString(txtcar_ps.Text.Trim(), true);

        string car_bill = rblcar_bill.SelectedValue;
        string receiver_compid = txt_cid.Text.Trim();//公司統編
        string receiver_comname = txt_comName.Text.Trim();//公司名
        string delivery_time = ddldelivery_time.SelectedValue;//收貨時間

        HttpContext.Current.Session["O_name"] = O_name;//O寄件者資料
        HttpContext.Current.Session["O_phone"] = O_phone;
        HttpContext.Current.Session["O_cellphone"] = O_cellphone;
        HttpContext.Current.Session["O_mail"] = O_mail;
        HttpContext.Current.Session["O_city"] = O_city;
        HttpContext.Current.Session["O_district"] = O_district;
        HttpContext.Current.Session["O_address"] = O_address;
        HttpContext.Current.Session["O_PostalCode"] = O_PostalCode;
        HttpContext.Current.Session["R_name"] = R_name;//R收件者資料
        HttpContext.Current.Session["R_phone"] = R_phone;
        HttpContext.Current.Session["R_cellphone"] = R_cellphone;
        HttpContext.Current.Session["R_mail"] = R_mail;
        HttpContext.Current.Session["R_city"] = R_city;
        HttpContext.Current.Session["R_district"] = R_district;
        HttpContext.Current.Session["R_address"] = R_address;
        HttpContext.Current.Session["R_receiverPostalCode"] = R_receiverPostalCode;
        
        //總金額
        switch (HttpContext.Current.Session["payWay"].ToString())
        {
            case "Store":
                HttpContext.Current.Session["totalPrice"] = car_total;
                break;

            case "ATM":
                HttpContext.Current.Session["totalPrice"] = car_total;
                break;

            case "RecPay":
                HttpContext.Current.Session["totalPrice"] = car_total;
                break;

            case "WATM":
                HttpContext.Current.Session["totalPrice"] = car_total;
                break;

            case "CSPay":
                HttpContext.Current.Session["totalPrice"] = car_total;
                break;

            case "IBON":
                HttpContext.Current.Session["totalPrice"] = car_total;
                break;

            case "VISA":
                HttpContext.Current.Session["totalPrice"] = string.Format("{0:F2}", Convert.ToInt64(car_total));
                break;

            case "Error":
                Response.Redirect("~/acc.aspx");
                break;

            default:
                Response.Redirect("~/car.aspx");
                break;
        }
        HttpContext.Current.Session["car_sum"] = car_sum;//商品合計
        HttpContext.Current.Session["service_cost"] = service_cost;//手續費
        HttpContext.Current.Session["car_fees"] = car_fees;//運費合計
        HttpContext.Current.Session["car_ps"] = car_ps;//備註
        HttpContext.Current.Session["delivery_time"] = delivery_time;//收貨時間
        HttpContext.Current.Session["orderID"] = Convert.ToInt64(DateTime.Now.ToString("yyyyMMddHHmm"));//訂單編號
        HttpContext.Current.Session["receiver_bill"] = car_bill;//發票選項
        HttpContext.Current.Session["receiver_compid"] = receiver_compid;//公司統編
        HttpContext.Current.Session["receiver_comname"] = receiver_comname;//公司名
    }
    protected void ddlOdistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlOdistrict_num.Text = ddlOdistrict.SelectedValue;
    }
    protected void ddlRdistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlRdistrict_num.Text = ddlRdistrict.SelectedValue;
    }
    protected void rblcar_bill_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblcar_bill.SelectedValue != "1")
        {
            pnl_1.Visible = true;
        }
        else
        {
            pnl_1.Visible = false;
        }
    }
    protected void ddlOdistrict_PreRender(object sender, EventArgs e)
    {
        ddlOdistrict_num.Text = ddlOdistrict.SelectedValue;
    }
    protected void ddlRdistrict_PreRender(object sender, EventArgs e)
    {
        ddlRdistrict_num.Text = ddlRdistrict.SelectedValue;
    }

    protected void carGv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string sql = "";
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataTable dt, dt2, dt3;
            Label lbl_pdt_no = (Label)e.Row.FindControl("lbl_pdt_no");
            Label obj_specific = (Label)e.Row.FindControl("obj_specific");
            Literal specific = (Literal)e.Row.FindControl("specific");
            Label lb_select = (Label)e.Row.FindControl("lb_select");
            //sql = "select pdt_specific from pdt where pdt_no='" + lbl_pdt_no.Text + "'";
            //dt3 = YamaZoo.GetDataTable(sql);
            //if (dt3.Rows.Count != 0)
            //{
            //    obj_specific.Text = dt3.Rows[0]["pdt_specific"].ToString();
            //}
            ////------------------- 規格 -----------------------------------------------------
            //string[] group = ((DataRowView)((GridViewRow)e.Row).DataItem)["pdt_specification"].ToString().Split('/');
            //try
            //{
            //    if (obj_specific.Text.Trim() != "")
            //    {
            //        int index = (e.Row as GridViewRow).DataItemIndex;
            //        string[] group_item = obj_specific.Text.Split(';');
            //        string[] item;
            //        string[] spec;
            //        string sql2;
            //        string select = "";
            //        int i;
            //        int j;
            //        lb_select.Text = group_item.Length.ToString();
            //        for (i = 0; i < group_item.Length; i++)
            //        {
            //            spec = group_item[i].Split(':');
            //            sql = "select * from specific_group where specific_group_id=" + spec[0];
            //            dt = YamaZoo.GetDataTable(sql);
            //            specific.Text += dt.Rows[0]["specific_group_name"] + "<select id=\"obj_type" + index + "_" + (i + 1) + "\" name=\"obj_type" + index + "_" + (i + 1) + "\">";
            //            item = spec[1].Split(',');
            //            for (j = 0; j < item.Length; j++)
            //            {
            //                //select = "";
            //                sql2 = "select * from specification where specific_id=" + item[j];
            //                dt2 = YamaZoo.GetDataTable(sql2);

            //                if (((DataRowView)((GridViewRow)e.Row).DataItem)["pdt_specification"].ToString() != "")
            //                {

            //                    string[] cart_spec = ((DataRowView)((GridViewRow)e.Row).DataItem)["pdt_specification"].ToString().Split('/');
            //                    string[] cart_item = cart_spec[i].Split(' ');
            //                    if (cart_item[1] == dt2.Rows[0]["specification"].ToString())
            //                    {
            //                        select = " selected ";
            //                    }
            //                    else
            //                    {
            //                        select = " ";
            //                    }
            //                }


            //                specific.Text += "<option" + select + " value =\"" + item[j] + "\">" + dt2.Rows[0]["specification"] + "</option>";

            //            }
            //            specific.Text += "</select><br />";
            //            specific.Text = obj_specific.Text;
            //        }
            //    }
            //    else
            //    {
            //        lb_select.Text = "0";
            //    }
            //}
            //catch { }
            specific.Text = obj_specific.Text;
        }
    }
}