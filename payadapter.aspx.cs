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

public partial class payadapter : System.Web.UI.Page
{
    string sqlWebId, sql;
    DataTable dtWebId, dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectGV();
            CarTotal();
            payWay();
        }
        pay_response();  //結帳回應
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {

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
        lblSum.Text = HttpContext.Current.Session["car_sum"].ToString();//商品合計
        lblFees.Text = HttpContext.Current.Session["car_fees"].ToString();//運費合計
        lblTotal.Text = HttpContext.Current.Session["totalPrice"].ToString();//總金額
        lbl_service_cost.Text = HttpContext.Current.Session["service_cost"].ToString();//手續費
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
    protected void payWay()
    {
        //判斷付款方式
        string payWay = (string)HttpContext.Current.Session["payWay"];

        switch (payWay)
        {
            case "Store":
                storePanel.Visible = true;
                payForm.Visible = true;
                break;

            case "ATM":
                atmPanel.Visible = true;
                payForm.Visible = true;
                break;

            case "RecPay":
                recpayPanel.Visible = true;
                payForm.Visible = true;
                break;

            case "WATM":
                watmPanel.Visible = true;
                break;

            case "CSPay":
                cvsPanel.Visible = true;
                break;

            case "IBON":
                cvs_ibonPanel.Visible = true;
                break;

            case "VISA":
                visaPanel.Visible = true;
                break;

            case "Error":
                Response.Redirect("~/acc.aspx");
                break;

            default:
                Response.Redirect("~/car.aspx");
                break;
        }
        CarTotal();
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        pay();
        Response.Redirect("~/fini.aspx");
    }
    protected void pay()
    {
        writeOrder();
        sentOrderMail();
        sentShoppingMail();
    }

    protected void writeOrder()
    {
        //MembershipUser currentUser = Membership.GetUser(Page.User.Identity.Name.ToString());
        string userid = Session["u_id"].ToString();
        string ownerid = "motomoto";

        string order_id = HttpContext.Current.Session["orderID"].ToString();//訂單編號
        string totalfreight = HttpContext.Current.Session["car_fees"].ToString();//運費合計
        string totalprice = HttpContext.Current.Session["totalPrice"].ToString();//總金額
        string memo = YamaZoo.SaveString(HttpContext.Current.Session["car_ps"].ToString(), true);//備註
        string payway = (string)HttpContext.Current.Session["payWay"].ToString();//付款方式
        string buyername = HttpContext.Current.Session["O_name"].ToString();//O寄件者資料
        string buyerphone = HttpContext.Current.Session["O_phone"].ToString();
        string buyercellphone = HttpContext.Current.Session["O_cellphone"].ToString();
        string buyercity = HttpContext.Current.Session["O_city"].ToString();
        string buyerdistrict = HttpContext.Current.Session["O_district"].ToString();
        string buyerpostalcode = HttpContext.Current.Session["O_PostalCode"].ToString();
        string buyeraddress = HttpContext.Current.Session["O_address"].ToString();
        string receivername = HttpContext.Current.Session["R_name"].ToString();//R收件者資料
        string receiverphone = HttpContext.Current.Session["R_phone"].ToString();
        string receivercellphone = HttpContext.Current.Session["R_cellphone"].ToString();
        string receivercity = HttpContext.Current.Session["R_city"].ToString();
        string receiverdistrict = HttpContext.Current.Session["R_district"].ToString();
        string receiverpostalcode = HttpContext.Current.Session["R_receiverPostalCode"].ToString();
        string receiveraddress = HttpContext.Current.Session["R_address"].ToString();
        string delivery_time = HttpContext.Current.Session["delivery_time"].ToString();//收貨時間
        string service_cost = HttpContext.Current.Session["service_cost"].ToString();//手續費

        string receiver_bill = HttpContext.Current.Session["receiver_bill"].ToString();//發票選項
        string receiver_compid = HttpContext.Current.Session["receiver_compid"].ToString();//公司統編
        string receiver_comname = HttpContext.Current.Session["receiver_comname"].ToString();//公司名

        //寫入訂單資料
        string sqlorder = "insert into [order] (order_id, user_id, owner_id, shipping_cost, total_price, order_memo, payway_id, buyer_name, buyer_phone, buyer_cellphone, buyer_city, buyer_district, buyer_postalcode, buyer_address, receiver_name, receiver_phone, receiver_cellphone, receiver_city, receiver_district, receiver_postalcode, receiver_address, delivery_no, ip, service_cost, receiver_bill, receiver_compid, receiver_comname) ";
        sqlorder += "values(" + order_id + ",'" + userid + "','" + ownerid + "'," + totalfreight + "," + totalprice + ",N'" + memo.Replace("'", "''") + "','" + payway + "',N'" + buyername.Replace("'", "''") + "',N'" + buyerphone.Replace("'", "''") + "',N'" + buyercellphone.Replace("'", "''") + "',N'" + buyercity.Replace("'", "''") + "',N'" + buyerdistrict.Replace("'", "''") + "'," + buyerpostalcode.Replace("'", "''") + ",N'" + buyeraddress.Replace("'", "''") + "',N'" + receivername.Replace("'", "''") + "',N'" + receiverphone.Replace("'", "''") + "',N'" + receivercellphone.Replace("'", "''") + "',N'" + receivercity.Replace("'", "''") + "',N'" + receiverdistrict.Replace("'", "''") + "'," + receiverpostalcode.Replace("'", "''") + ",N'" + receiveraddress.Replace("'", "''") + "', '" + delivery_time + "', N'" + YamaZoo.getIP() + "','" + service_cost + "','" + receiver_bill + "','" + receiver_compid + "','" + receiver_comname + "')";
        Mei.GetDataTable(sqlorder);

        //寫入訂單明細
        //---清單---
        DataTable dt = (DataTable)Session["car"];
        string pdt_no = "";
        string pdt_id = "";
        string pdt_name = "";
        Int32 db_stocks = 0;
        string pdt_sell = "";
        string pdt_count = "";
        Int32 pdt_stocks = 0;
        string sqlStockCheck = "";
        string pdt_specification = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr = dt.Rows[i];
            pdt_no = dr["pdt_no"].ToString();
            pdt_id = dr["pdt_id"].ToString();
            pdt_name = dr["pdt_name"].ToString();
            pdt_stocks = Convert.ToInt32(dr["pdt_stocks"].ToString());
            pdt_sell = dr["pdt_sell"].ToString();
            pdt_count = dr["pdt_count"].ToString();
            pdt_specification = dr["pdt_specification"].ToString();

            //讀取庫存量
            sqlStockCheck = "select pdt_stocks from pdt where pdt_no='" + pdt_no + "'";
            DataTable dtStockCheck = Mei.GetDataTable(sqlStockCheck);
            db_stocks = Convert.ToInt32(dtStockCheck.Rows[0][0].ToString());

            //減少庫存量
            pdt_stocks = (Convert.ToInt32(db_stocks) - Convert.ToInt32(pdt_count));

            //比對庫存，並取代為現有庫存量

            string sqlstocupdatek = "";
            sqlstocupdatek = "update pdt set pdt_stocks = '" + pdt_stocks + "' where pdt_id = '" + pdt_id + "'";
            Mei.GetDataTable(sqlstocupdatek);

            //寫入訂單
            string sqladd = "";
            sqladd += "insert into order_detail (order_id, obj_id, obj_name, specification, price, count, totalprice) values(";
            sqladd += "'" + HttpContext.Current.Session["orderID"].ToString() + "',";
            sqladd += "'" + pdt_id + "',";
            sqladd += "'" + pdt_name + "',";
            sqladd += "'" + pdt_specification + "',";
            sqladd += "'" + pdt_sell + "',";
            sqladd += "'" + pdt_count + "',";
            sqladd += "'" + Convert.ToInt64(pdt_sell) * Convert.ToInt64(pdt_count) + "')";
            Mei.connSql(sqladd);
        }

        //刪除購物車資料
        Session["car"] = null;
    }

    protected void sentOrderMail()
    {
        //店家MOTOMOTO
        string sql_user = " select web_mail from web where web_id='00001'";
        DataTable dt = Mei.GetDataTable(sql_user);
        string sql = "select web_title from web where web_id = '00001'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        string web_title = YamaZoo.SaveString(cmd.ExecuteScalar().ToString(), false);
        conn.Close();

        string strBody = "<html><body>";
        strBody += "親愛的 《" + web_title + "》您好：<br />";
        strBody += "本通知函是通知您系統收到訂購訊息，下為本次的訂單資訊：<br />";
        strBody += "---------------------------------------------------------------------<br />";
        strBody += "訂單編號：" + HttpContext.Current.Session["orderID"].ToString() + "<br />";
        strBody += "訂購日期：" + DateTime.Now.ToString("yyyy/MM/dd HH:mm") + "<br />";
        strBody += "訂購金額：<span style='color:red'>" + HttpContext.Current.Session["totalPrice"].ToString() + "</span> 元<br /><br />";
        strBody += "<strong>訂單明細：</strong><br />";

        string mailbody = "";
        string sqlorder = "select obj_id, obj_name, specification, color, size, price, count, totalprice from order_detail where order_id = " + HttpContext.Current.Session["orderID"].ToString();
        SqlConnection connorder = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdorder = new SqlCommand(sqlorder, connorder);
        connorder.Open();
        SqlDataReader rdorder = cmdorder.ExecuteReader();
        while (rdorder.Read())
        {
            //寫入信件中明細資料
            mailbody += "<tr>";
            mailbody += "<td>" + rdorder["obj_id"].ToString() + "</td>";
            mailbody += "<td>" + rdorder["obj_name"].ToString() + "</td>";
            mailbody += "<td>" + rdorder["count"].ToString() + "</td>";
            mailbody += "<td>" + rdorder["totalprice"].ToString() + "元</td>";
            mailbody += "<tr>";
        }
        strBody += "<table border='1' width='650px'>";
        strBody += "<tr style='background-color:#e8e8e8'><td>商品編號</td><td>商品名稱</td><td>數量</td><td>小計</td></tr>";
        strBody += mailbody;
        strBody += "</table><br />";
        connorder.Close();

        strBody += "運費：" + HttpContext.Current.Session["car_fees"].ToString() + " 元<br/>";
        strBody += "<br/>";
        strBody += "<strong>備註</strong><br />";
        strBody += (string)HttpContext.Current.Session["car_ps"].ToString() + "<br />";
        strBody += "<strong>購買人資料</strong><br />";
        strBody += "購買人：" + (string)HttpContext.Current.Session["O_name"] + "<br />";
        strBody += "電　話：" + (string)HttpContext.Current.Session["O_cellphone"] + "<br />";
        strBody += "地　址：" + (string)HttpContext.Current.Session["O_city"] + (string)HttpContext.Current.Session["O_district"] + (string)HttpContext.Current.Session["O_address"] + "&nbsp;" + (string)HttpContext.Current.Session["O_PostalCode"] + "<br /><br />";
        strBody += "<strong>收貨人資料</strong><br />";
        strBody += "收貨人：" + (string)HttpContext.Current.Session["R_name"] + "<br />";
        strBody += "電　話：" + (string)HttpContext.Current.Session["R_cellphone"] + "<br />";
        strBody += "地　址：" + (string)HttpContext.Current.Session["R_city"] + (string)HttpContext.Current.Session["R_district"] + (string)HttpContext.Current.Session["R_address"] + "&nbsp;" + (string)HttpContext.Current.Session["R_receiverPostalCode"] + "<br /><br /><br />";
        strBody += "此訊息發自VIP商城購物網，告知有人向您訂購商品！<br />";
        strBody += "感謝您對VIP商城購物網的支持，以上是您此次的訂單資訊！<br /><br />";
        strBody += "您可至 <a href=\"http://www.vip7-11.com.tw/shoppinghistory.aspx\" target=\"_blank\">訂單管理</a> 查詢訂單紀錄。<br /><br />";
        strBody += "---------------------------------------------------------------------<br />";
        strBody += "本訊息由系統自動寄出，請勿直接回覆此信。<br />";
        strBody += "VIP商城購物網 - <a href=\"http://www.vip7-11.com.tw\" target=\"_blank\">www.vip7-11.com.tw</a><br />";
        strBody += "</body></html>";

        // -------------------- SentMail -------------------- //
        Mei.sentMail2(System.Configuration.ConfigurationManager.AppSettings["mailService"], "VIP商城購物網 - 訂單通知 [" + HttpContext.Current.Session["orderID"].ToString() + "]", strBody, "me");
    }

    protected void sentShoppingMail()
    {
        string sql_user = " select users_mail from users where users_id='" + Session["u_id"] + "'";
        DataTable dt = Mei.GetDataTable(sql_user);

        string sql = "select web_title from web where web_id = '00001'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        string web_title = YamaZoo.SaveString(cmd.ExecuteScalar().ToString(), false);
        conn.Close();

        string strBody = "<html><body>";
        strBody += HttpContext.Current.Session["O_name"].ToString() + " 女士/先生 您好：<br />";
        strBody += "《" + web_title + " 》已經收到您的訂單，感謝您訂購本店商品！<br />";
        strBody += "本通知函只是通知您本系統已經收到您的訂購訊息、並供您再次自行核對之用，不代表交易已經完成。";
        strBody += "您的訂單資訊如下，請核對是否正確：<br />";
        strBody += "---------------------------------------------------------------------<br />";
        strBody += "會員帳號：" + Session["u_id"].ToString() + "<br />";
        strBody += "訂單編號：" + HttpContext.Current.Session["orderID"].ToString() + "<br />";
        strBody += "訂購日期：" + DateTime.Now.ToString("yyyy/MM/dd HH:mm") + "<br />";
        strBody += "訂購金額：<span style='color:red'>" + HttpContext.Current.Session["totalPrice"].ToString() + "</span> 元<br /><br />";
        strBody += "<strong>訂單明細：</strong><br />";

        string mailbody = "";
        string sqlorder = "select obj_id, obj_name, specification, color, size, price, count, totalprice from order_detail where order_id = " + HttpContext.Current.Session["orderID"].ToString();
        SqlConnection connorder = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdorder = new SqlCommand(sqlorder, connorder);
        connorder.Open();
        SqlDataReader rdorder = cmdorder.ExecuteReader();
        while (rdorder.Read())
        {
            //寫入信件中明細資料
            mailbody += "<tr>";
            mailbody += "<td>" + rdorder["obj_id"].ToString() + "</td>";
            mailbody += "<td>" + rdorder["obj_name"].ToString() + "</td>";
            mailbody += "<td>" + rdorder["specification"].ToString() + "</td>";
            mailbody += "<td>" + rdorder["count"].ToString() + "</td>";
            mailbody += "<td>" + rdorder["totalprice"].ToString() + "元</td>";
            mailbody += "<tr>";
        }
        /**/
        strBody += "<table border='1' width='650px'>";
        strBody += "<tr style='background-color:#e8e8e8'><td>商品編號</td><td>商品名稱</td><td>商品規格</td><td>數量</td><td>小計</td></tr>";
        strBody += mailbody;
        strBody += "</table><br />";
        /**/
        connorder.Close();

        strBody += "運費：" + HttpContext.Current.Session["car_fees"] + " 元<br/>";
        strBody += "<br/>";

        if ((string)HttpContext.Current.Session["payWay"] == "ATM")
        {
            strBody += "<strong>ATM轉帳資訊</strong><br />";

            string sqlBank = "select BankName, BankCode, AccountName, AccountNumber from web where web_id='00001'";
            dt = Mei.GetDataTable(sqlBank);
            strBody += "銀行：" + dt.Rows[0][0].ToString().Trim() + "<br />";
            strBody += "代號：" + dt.Rows[0][1].ToString().Trim() + "<br />";
            strBody += "戶名：" + dt.Rows[0][2].ToString().Trim() + "<br />";
            strBody += "帳號：" + dt.Rows[0][3].ToString().Trim() + "<br />";
        }
        strBody += "<br/>";
        strBody += "<strong>購買人資料</strong><br />";
        strBody += "購買人：" + (string)HttpContext.Current.Session["O_name"] + "<br />";
        strBody += "電　話：" + (string)HttpContext.Current.Session["O_cellphone"] + "<br />";
        strBody += "地　址：" + (string)HttpContext.Current.Session["O_city"] + (string)HttpContext.Current.Session["O_district"] + (string)HttpContext.Current.Session["O_address"] + "&nbsp;" + (string)HttpContext.Current.Session["buyerPostalCode"] + "<br /><br />";
        strBody += "<strong>收貨人資料</strong><br />";
        strBody += "收貨人：" + (string)HttpContext.Current.Session["R_name"] + "<br />";
        strBody += "電　話：" + (string)HttpContext.Current.Session["R_cellphone"] + "<br />";
        strBody += "地　址：" + (string)HttpContext.Current.Session["R_city"] + (string)HttpContext.Current.Session["R_district"] + (string)HttpContext.Current.Session["R_address"] + "&nbsp;" + (string)HttpContext.Current.Session["receiverPostalCode"] + "<br /><br /><br />";
        strBody += "此訊息發自VIP商城購物網，告知您此次的訂購已經完成！<br />";
        strBody += "感謝您對VIP商城購物網的支持並承蒙訂購，以上是您此次的訂單資訊，<br />若有問題則請依訂單編號向我們查詢，感謝您！<br /><br />";
        strBody += "您可至 <a href=\"http://www.vip7-11.com.tw/shoppinghistory.aspx\" target=\"_blank\">購物清單</a> 查詢訂單紀錄。<br /><br />";
        strBody += "---------------------------------------------------------------------<br />";
        strBody += "本訊息由系統自動寄出，請勿直接回覆此信。<br />";
        strBody += "VIP商城購物網 - <a href=\"http://www.vip7-11.com.tw\" target=\"_blank\">www.vip7-11.com.tw</a><br />";
        strBody += "</body></html>";

        // -------------------- SentMail -------------------- //
        Mei.sentMail2(HttpContext.Current.Session["O_mail"].ToString(), "VIP商城購物網 - " + HttpContext.Current.Session["O_name"].ToString() + "的訂單通知 [" + HttpContext.Current.Session["orderID"].ToString() + "]", strBody, "motomoto");
    }
    protected void btnCsPay_Click(object sender, EventArgs e)
    {
        string prd_desc = "";

        //賣家自訂交易編號
        HttpContext.Current.Session["orderID"] = DateTime.Now.ToString("yyyyMMddHHmm");
        string od_sob = HttpContext.Current.Session["orderID"].ToString();

        prd_desc = "00001";//web_id
        string pdt_desc = "VIP商城購物網-網購付款";
        string cvsUrl = "https://ecbank.com.tw/gateway.php?mer_id=" + YamaZoo.getECBankCode(prd_desc) + "&payment_type=cvs&enc_key=" + YamaZoo.getECBankEnc(prd_desc) + "&amt=" + HttpContext.Current.Session["totalPrice"] + "&prd_desc=" + YamaZoo.subString(Server.UrlEncode(pdt_desc), 19) + "&od_sob=" + Server.UrlEncode(od_sob) + "&ok_url=http://www.vip7-11.com.tw/cvspaid.aspx";
        Response.Redirect(System.IO.Path.GetFileName(Request.PhysicalPath) + "?" + YamaZoo.file_get_contents(cvsUrl));
    }

    protected void pay_response()
    {
        if (Request.QueryString["mer_id"] != null)
        {
            if (Request.QueryString["error"] == "0")
            {
                pay();

                //string expire_date = Request.QueryString["expire_date"].ToString().Substring(0, 4) + "/" + Request.QueryString["expire_date"].ToString().Substring(4, 2) + "/" + Request.QueryString["expire_date"].ToString().Substring(6, 2) + " " + Request.QueryString["expire_time"].ToString().Substring(0, 2) + ":" + Request.QueryString["expire_time"].ToString().Substring(2, 2) + ":" + Request.QueryString["expire_time"].ToString().Substring(4, 2);
                string expire_date = Request.QueryString["expire_date"].ToString().Substring(0, 4) + "/" + Request.QueryString["expire_date"].ToString().Substring(4, 2) + "/" + Request.QueryString["expire_date"].ToString().Substring(6, 2) + " " + Request.QueryString["expire_time"].ToString().Substring(0, 2) + ":" + Request.QueryString["expire_time"].ToString().Substring(2, 2);

                try
                {
                    string sqlpayno = "update [order] set pay_state = 1, atm_date = '" + expire_date + "', cvsPayno = '" + Request.QueryString["payno"].ToString() + "', tsr = '" + Request.QueryString["tsr"].ToString() + "' where order_id = " + HttpContext.Current.Session["orderID"].ToString();
                    SqlConnection connpayno = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                    SqlCommand cmdpayno = new SqlCommand(sqlpayno, connpayno);
                    connpayno.Open();
                    cmdpayno.ExecuteNonQuery();
                    connpayno.Close();
                }
                catch { }

                HttpContext.Current.Session["payno"] = Request.QueryString["payno"].ToString();
                HttpContext.Current.Session["expire_date"] = expire_date;

                Response.Redirect("fini.aspx");
            }
            else
            {
                ((HtmlControl)cvsPanel.FindControl("cvsError")).Visible = true;
            }
        }

        if (Request.Form["payment_type"] != null)
        {
            if (Request.Form["payment_type"] == "web_atm")  //Web ATM
            {
                if (Request.Form["succ"].ToString() == "1")
                {
                    pay();

                    try
                    {
                        string date = Request.Form["proc_date"].ToString().Substring(0, 4) + "/" + Request.Form["proc_date"].ToString().Substring(4, 2) + "/" + Request.Form["proc_date"].ToString().Substring(6, 2);
                        string time = Request.Form["proc_time"].ToString().Substring(0, 2) + ":" + Request.Form["proc_time"].ToString().Substring(2, 2) + ":" + Request.Form["proc_time"].ToString().Substring(4, 2);

                        string sqltsr = "update [order] set pay_state = 3, tsr = '" + Request.Form["tsr"].ToString() + "',  atm_account = '" + Request.Form["payer_bank"].ToString() + "', atm_number = '" + Request.Form["payer_acc"].ToString() + "', atm_price = " + Request.Form["amt"].ToString() + ", atm_date = '" + date + " " + time + "'  where order_id = " + HttpContext.Current.Session["orderID"].ToString();
                        SqlConnection conntsr = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                        SqlCommand cmdtsr = new SqlCommand(sqltsr, conntsr);
                        conntsr.Open();
                        cmdtsr.ExecuteNonQuery();
                        conntsr.Close();

                        HttpContext.Current.Session["payer_bank"] = Request.Form["payer_bank"].ToString();
                        HttpContext.Current.Session["payer_acc"] = Request.Form["payer_acc"].ToString();
                        HttpContext.Current.Session["payer_amt"] = Request.Form["amt"].ToString();
                        HttpContext.Current.Session["proc_datetime"] = date + " " + time;
                    }
                    catch { }

                    Response.Redirect("fini.aspx");
                }
                else if (Request.Form["succ"].ToString() == "0")
                {
                    ((HtmlControl)watmPanel.FindControl("watmError")).Visible = true;
                }
            }

            if (Request.Form["payment_type"] == "paypal")  //PayPal
            {
                if (Request.Form["succ"].ToString() == "1")
                {
                    pay();

                    try
                    {
                        string sqltsr = "update [order] set pay_state = 3, tsr = " + Request.Form["tsr"].ToString() + " where order_id = " + HttpContext.Current.Session["orderID"].ToString();
                        SqlConnection conntsr = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                        SqlCommand cmdtsr = new SqlCommand(sqltsr, conntsr);
                        conntsr.Open();
                        cmdtsr.ExecuteNonQuery();
                        conntsr.Close();
                    }
                    catch { }

                    Response.Redirect("fini.aspx");
                }
                else if (Request.Form["succ"].ToString() == "0")
                {
                    ((HtmlControl)visaPanel.FindControl("visaError")).Visible = true;
                }
                else if (Request.Form["succ"].ToString() == "2")
                {
                    ((HtmlControl)visaPanel.FindControl("visaWarning")).Visible = true;
                }
            }
        }
    }
    protected void btnCs_ibonPay_Click(object sender, EventArgs e)
    {
        //iBON
        string prd_desc = "";
        prd_desc = "00001";//web_id
        string pdt_desc = "VIP商城購物網-網購付款";

        //賣家自訂交易編號
        HttpContext.Current.Session["orderID"] = DateTime.Now.ToString("yyyyMMddHHmm");
        string od_sob = HttpContext.Current.Session["orderID"].ToString();

        string cvsUrl = "https://ecbank.com.tw/gateway.php?mer_id=" + YamaZoo.getECBankCode(prd_desc) + "&payment_type=ibon&enc_key=" + YamaZoo.getECBankEnc(prd_desc) + "&amt=" + HttpContext.Current.Session["totalPrice"] + "&prd_desc=" + YamaZoo.subString(Server.UrlEncode(pdt_desc), 19) + "&prd_desc=" + YamaZoo.subString(Server.UrlEncode(pdt_desc), 19) + "&od_sob=" + Server.UrlEncode(od_sob) + "&ok_url=http://www.vip7-11.com.tw/cvspaid.aspx";
        Response.Redirect(System.IO.Path.GetFileName(Request.PhysicalPath) + "?" + YamaZoo.file_get_contents(cvsUrl));
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