using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class shoppinghistory : System.Web.UI.Page
{
    DataTable dt, dtShopping, dtowner;
    string sqlShopping;
    protected void Page_Load(object sender, EventArgs e)
    {
        //YamaZoo.IsAuthenticate();

        //MembershipUser currentUser = Membership.GetUser(Page.User.Identity.Name.ToString());
        //UserId.Text = currentUser.ProviderUserKey.ToString();
        if (Session["u_id"] == null)
        {
            Response.Write("<script language='javascript'>alert('提醒您!請先登入會員喔');location.href='index.aspx';</script>");
            return;
        }
        UserId.Text = Session["u_id"].ToString();

        string sqlatmcount = "select count(order_id) from [order] where user_id = '" + UserId.Text + "' and pay_state = 1 and payway_id = 'ATM' and user_hide != 1";
        SqlConnection connatmcount = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdatmcount = new SqlCommand(sqlatmcount, connatmcount);
        connatmcount.Open();
        AtmConfirm.Text = "ATM匯款確認(" + cmdatmcount.ExecuteScalar().ToString() + ")";
        connatmcount.Close();
    }

    protected void ltvShopping_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            Label ownerid = (Label)e.Item.FindControl("owner_id");
            LinkButton order_id = (LinkButton)e.Item.FindControl("order_id");
            //Label order_id = (Label)e.Item.FindControl("order_id");
            Label payway = (Label)e.Item.FindControl("payway");
            Label paystate = (Label)e.Item.FindControl("paystate");
            Literal store = (Literal)e.Item.FindControl("Store");
            ImageButton amtconfirm = (ImageButton)e.Item.FindControl("btnAtmConfirm");
            HtmlTableRow atmConfirmTr = (HtmlTableRow)e.Item.FindControl("atmConfirmTr");

            //string sqlowner = "select web.web_title, aspnet_Users.UserName from aspnet_Users inner join Web on aspnet_Users.UserId = web.user_id where aspnet_Users.UserId = '" + ownerid.Text + "'";
            string sqlowner = "select web_title from Web where web_id = '00001'";
            dtowner = Mei.GetDataTable(sqlowner);
            store.Text = dtowner.Rows[0][0].ToString().Trim();
            //SqlConnection connowner = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            //SqlCommand cmdowner = new SqlCommand(sqlowner, connowner);
            //connowner.Open();
            //SqlDataReader rdowner = cmdowner.ExecuteReader();
            //while (rdowner.Read())
            //{
            //    //store.Text = "<a href=\"/web/" + YamaZoo.getWebName(rdowner["web_title"].ToString()) + "\" target=\"_blank\">" + rdowner["web_title"].ToString() + "</a>";
            //    store.Text = dt.Rows[0][0].ToString().Trim();
            //}
            //connowner.Close();

            if (payway.Text == "ATM轉帳" && paystate.Text == "未付款") amtconfirm.Visible = true;

            if ((string)HttpContext.Current.Session["atmConfirm"] == Int64.Parse(order_id.Text).ToString()) atmConfirmTr.Visible = true;
        }
    }

    protected void ltvShopping_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandArgument.ToString().Remove(3) == "dtl")
        {
            OrderId.Text = e.CommandArgument.ToString().Remove(0, 3);

            shipblock.Visible = false;
            cvsblock.Visible = false;
            atmblock.Visible = false;

            //string sqlowner = "select owner_id from [order] where order_id = " + OrderId.Text;
            //SqlConnection connowner = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            //SqlCommand cmdowner = new SqlCommand(sqlowner, connowner);
            //connowner.Open();
            ////Guid ownerid = new Guid(cmdowner.ExecuteScalar().ToString());
            //connowner.Close();

            //MembershipUser currentUser = Membership.GetUser(ownerid);
            //ProfileCommon currentUserProfile = Profile.GetProfile(currentUser.UserName.ToString());

            //配送資訊 

            string sqlshp = "select shipping_company, shipping_sn, shipping_date from [order] where order_id = " + OrderId.Text;
            dt = YamaZoo.GetDataTable(sqlshp);
            string ship_company = dt.Rows[0]["shipping_company"].ToString();
            string ship_sn = dt.Rows[0]["shipping_sn"].ToString();
            string ship_date = dt.Rows[0]["shipping_date"].ToString();
            if (ship_company.Trim() != "" || ship_sn.Trim() != "")
            {
                ShippingCompany.Text = YamaZoo.SaveString(ship_company, false);
                ShippingSN.Text = YamaZoo.SaveString(ship_sn, false);

                DateTime result;
                if (DateTime.TryParse(YamaZoo.SaveString(ship_date, false), out result))
                    ShippingDate.Text = DateTime.Parse(ship_date).ToShortDateString();

                shipblock.Visible = true;
            }

            //ATM匯款帳號
            if (((Label)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("payway")).Text == "ATM轉帳")
            {
                atmblock.Visible = true;
                //******顯示帳戶資料
                sqlShopping = "select BankName, BankCode, AccountName, AccountNumber, gwStoreCode, gwStoreCheck from web where web_id='00001'";
                dtShopping = Mei.GetDataTable(sqlShopping);

                BankName.Text = dtShopping.Rows[0][0].ToString().Trim();
                BankCode.Text = dtShopping.Rows[0][1].ToString().Trim();
                AccountName.Text = dtShopping.Rows[0][2].ToString().Trim();
                AccountNumber.Text = dtShopping.Rows[0][3].ToString().Trim();
            }

            //超商代碼
            if (((Label)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("payway")).Text.Contains("超商代碼"))
            {
                string sqlcvs = "select atm_date, cvsPayno from [order] where order_id = " + OrderId.Text;
                SqlConnection conncvs = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmdcvs = new SqlCommand(sqlcvs, conncvs);
                conncvs.Open();
                SqlDataReader rdcvs = cmdcvs.ExecuteReader();
                while (rdcvs.Read())
                {
                    if (rdcvs["cvsPayno"].ToString().Trim() != "" && rdcvs["atm_date"].ToString() != "")
                    {
                        payno.Text = rdcvs["cvsPayno"].ToString();
                        expiredate.Text = DateTime.Parse(rdcvs["atm_date"].ToString()).ToString("yyyy/MM/dd HH:mm");
                        cvsblock.Visible = true;
                    }
                }
                rdcvs.Close();
                conncvs.Close();
            }

            orderMultiView.ActiveViewIndex = 1;
        }

        if (e.CommandArgument.ToString().Remove(3) == "del")
        {
            string sqlhide = "update [order] set user_hide = 1 where order_id = " + e.CommandArgument.ToString().Remove(0, 3);
            SqlConnection connhide = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmdhide = new SqlCommand(sqlhide, connhide);
            connhide.Open();
            cmdhide.ExecuteNonQuery();
            connhide.Close();

            ltvShopping.DataBind();
        }

        if (e.CommandArgument.ToString().Remove(3) == "atm")
        {
            if ((string)HttpContext.Current.Session["atmConfirm"] == e.CommandArgument.ToString().Remove(0, 3))
            {
                HttpContext.Current.Session["atmConfirm"] = "";
            }
            else
            {
                HttpContext.Current.Session["atmConfirm"] = e.CommandArgument.ToString().Remove(0, 3);
            }

            ltvShopping.DataBind();
        }

        if (e.CommandArgument.ToString().Remove(3) == "acm")
        {
            Label total_price = (Label)e.Item.FindControl("total_price");
            string account = "";
            string number = "";
            string price = "";
            string date = "";

            account = YamaZoo.SaveString(((TextBox)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("accountName")).Text, true);
            number = YamaZoo.SaveString(((TextBox)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("accountNum")).Text, true);
            price = ((TextBox)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("payCount")).Text;
            date = ((TextBox)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("payDate")).Text;

            if (account != "" && number != "" && price != "" && date != "")
            {
                string sqlatm = "update [order] set pay_state = 2 , atm_account = '" + account + "', atm_number = '" + number + "', atm_price = " + price + ", atm_date = '" + date + "' where order_id = " + e.CommandArgument.ToString().Remove(0, 3);
                YamaZoo.ExecuteNoQuery(sqlatm);

                string sqlowner = "select owner_id from [order] where order_id = " + e.CommandArgument.ToString().Remove(0, 3);
                SqlConnection connowner = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmdowner = new SqlCommand(sqlowner, connowner);
                connowner.Open();
                string ownerid = cmdowner.ExecuteScalar().ToString();
                connowner.Close();

                //MembershipUser store = Membership.GetUser(YamaZoo.userIDToName(ownerid));
                //ProfileCommon storeProfile = Profile.GetProfile(store.UserName);

                //string sql = "select web_title from web where user_id = '" + store.ProviderUserKey.ToString() + "'";
                string sql = "select web_title from web where web_id = '00001'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                string web_title = YamaZoo.SaveString(cmd.ExecuteScalar().ToString(), false);
                conn.Close();

                //店家MOTOMOTO
                string sql_user = "select web_mail from web";
                DataTable dt = Mei.GetDataTable(sql_user);


                //MailAddress from = new MailAddress(ConfigurationManager.AppSettings["mailService"], "魔多購物網", Encoding.UTF8);
                //MailMessage msgMail = new MailMessage(from, new MailAddress(store.Email.ToString()));
                //msgMail.Subject = "魔多購物網 - 匯款通知 [" + Int64.Parse(e.CommandArgument.ToString().Remove(0, 3)).ToString("D8") + "]";
                //msgMail.SubjectEncoding = Encoding.UTF8;

                string strBody = "<html><body>";
                strBody += "親愛的店家 《" + web_title + "》您好：<br />";
                strBody += "本通知函是通知您收到ATM匯款訊息，下為本次的匯款資訊：<br />";
                strBody += "---------------------------------------------------------------------<br />";
                strBody += "訂單編號：" + Int64.Parse(e.CommandArgument.ToString().Remove(0, 3)).ToString("D8") + "<br />";
                strBody += "訂購日期：" + DateTime.Now.ToString("yyyy/MM/dd HH:mm") + "<br />";
                strBody += "訂購金額：" + total_price.Text + " 元<br /><br />";
                strBody += "匯款帳戶名稱：" + account + "<br />";
                strBody += "帳號末五碼：" + number + "<br />";
                strBody += "匯款金額" + price + "<br />";
                strBody += "匯款日期" + date + "<br /><br />";
                strBody += "您可至 <a href=\"http://www.vip7-11.com.tw/shoppinghistory.aspx\" target=\"_blank\">訂單管理</a> 查詢訂單紀錄。<br /><br />";
                strBody += "---------------------------------------------------------------------<br />";
                strBody += "本訊息由系統自動寄出，請勿直接回覆此信。<br />";
                strBody += "VIP商城購物網 - <a href=\"http://www.vip7-11.com.tw\" target=\"_blank\">www.vip7-11.com.tw</a><br />";
                strBody += "連絡電話： (03)439-8588 <br />";
                strBody += "傳真號碼： (03)439-8588<br />";
                strBody += "</body></html>";

                //msgMail.Body = strBody;
                //msgMail.BodyEncoding = Encoding.UTF8;
                //msgMail.IsBodyHtml = true;

                //SmtpClient smtp = new SmtpClient(ConfigurationManager.AppSettings["mailSMTP"], Int64.Parse(ConfigurationManager.AppSettings["mailSMTPort"]));
                //smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["mail104look"], ConfigurationManager.AppSettings["mailPassword"]);
                //smtp.EnableSsl = true;

                //smtp.Send(msgMail);
                Mei.sentMail2(ConfigurationManager.AppSettings["mailService"], "VIP商城購物網 - 匯款通知 [" + Int64.Parse(e.CommandArgument.ToString().Remove(0, 3)).ToString("D8") + "]", strBody, "me");
                HttpContext.Current.Session["atmConfirm"] = "";

                string sqlatmcount = "select count(order_id) from [order] where user_id = '" + UserId.Text + "' and pay_state = 1 and payway_id = 'ATM' and user_hide != 1";
                SqlConnection connatmcount = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmdatmcount = new SqlCommand(sqlatmcount, connatmcount);
                connatmcount.Open();
                AtmConfirm.Text = "尚未回覆之ATM匯款紀錄(" + cmdatmcount.ExecuteScalar().ToString() + ")";
                connatmcount.Close();

                ltvShopping.DataBind();
                YamaZoo.scriptAlert("已將您的匯款資訊提交至VIP-商城，若還有任何疑問請 EMAIL或 電洽 VIP-商城購物網 客服中心　謝謝您！");
            }
        }
    }
    protected void frvOrder_OnDataBound(object sender, EventArgs e)
    {
        Label buyer_districtLabel = (Label)Page.Master.FindControl("main").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("buyer_districtLabel");//購買者地址
        Label receiver_districtLabel = (Label)Page.Master.FindControl("main").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("receiver_districtLabel");//寄送者地址
        Label lbl_buyerbill = (Label)Page.Master.FindControl("main").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("lbl_buyerbill");//發票開立ID
        Panel pnl_bill = (Panel)Page.Master.FindControl("main").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("pnl_bill");//發票開立ID

        switch (lbl_buyerbill.Text)
        {
            case "1":
                lbl_buyerbill.Text = "否";
                pnl_bill.Visible = false;
                break;
            case "2":
                lbl_buyerbill.Text = "二聯式";
                pnl_bill.Visible = true;
                break;
            case "3":
                lbl_buyerbill.Text = "三聯式";
                pnl_bill.Visible = true;
                break;
        }
        buyer_districtLabel.Text = buyer_districtLabel.Text.Replace("　", "");
        receiver_districtLabel.Text = receiver_districtLabel.Text.Replace("　", "");
    }
    protected void btnGoback_Click(object sender, EventArgs e)
    {
        orderMultiView.ActiveViewIndex = 0;
    }
    protected void AtmConfirm_Click(object sender, EventArgs e)
    {
        sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id  WHERE ([order].user_id = '" + UserId.Text + "') AND ([order].user_hide != 1) AND ([order].payway_id = 'ATM') AND ([order].pay_state = 1) ORDER BY [order].order_datetime DESC";
        ltvShopping.DataBind();
    }
    protected void btnAllOrder_Click(object sender, EventArgs e)
    {
        sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id  WHERE ([order].user_id = '" + UserId.Text + "') AND ([order].user_hide != 1) ORDER BY [order].order_datetime DESC";
        ltvShopping.DataBind();
    }
}