using System;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_printorders : System.Web.UI.Page
{
    ArrayList CreateDataSource()
    {
        return (ArrayList)HttpContext.Current.Session["printOrderList"];
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        { Response.Redirect("../index.aspx"); }

        if (!IsPostBack)
            printblock.ActiveTabIndex = (Int32)HttpContext.Current.Session["printTab"];

        ArrayList aryOrderList = (ArrayList)HttpContext.Current.Session["printOrderList"];

        dltList.DataSource = CreateDataSource();
        dltList.DataBind();

        dltDetail.DataSource = CreateDataSource();
        dltDetail.DataBind();

        dltSent.DataSource = CreateDataSource();
        dltSent.DataBind();
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        switch (printblock.ActiveTabIndex)
        {
            case 0:
                Session["ctrl"] = listZone;
                break;

            case 1:
                Session["ctrl"] = detailZone;
                break;

            case 2:
                Session["ctrl"] = sentZone;
                break;

            default:
                break;
        }

        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('printview.aspx','PrintView');</script>");
    }
    protected void dltList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Literal page_break = (Literal)e.Item.FindControl("page_break");
            Label orderid = (Label)e.Item.FindControl("orderid");
            Label order_id = (Label)e.Item.FindControl("order_id");
            Label buyer_id = (Label)e.Item.FindControl("buyer_id");
            Label buyer_name = (Label)e.Item.FindControl("buyer_name");
            Label price = (Label)e.Item.FindControl("price");
            Label payway = (Label)e.Item.FindControl("payway");
            Label state = (Label)e.Item.FindControl("state");
            Label shipping = (Label)e.Item.FindControl("shipping");
            Label date = (Label)e.Item.FindControl("date");

            string sql = "SELECT [order].order_id, users.users_name, [order].buyer_name, [order].total_price, payway.payway_name, paystate.paystate_name, shipping_state.shipping_state_name, [order].order_datetime FROM payway INNER JOIN [order] ON payway.payway = [order].payway_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id INNER JOIN users ON [order].user_id = users.users_id INNER JOIN paystate ON [order].pay_state = paystate.paystate_id where [order].order_id = " + orderid.Text;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                order_id.Text = (rd["order_id"].ToString());
                //購買者
                buyer_id.Text = rd["users_name"].ToString();
                buyer_name.Text = YamaZoo.SaveString(rd["buyer_name"].ToString(), false);
                price.Text = Convert.ToDecimal(rd["total_price"].ToString()).ToString("N0") + " 元";
                payway.Text = rd["payway_name"].ToString();
                state.Text = rd["paystate_name"].ToString();
                shipping.Text = rd["shipping_state_name"].ToString();
                date.Text = DateTime.Parse(rd["order_datetime"].ToString()).ToShortDateString() + " " + DateTime.Parse(rd["order_datetime"].ToString()).ToShortTimeString();
            }
            rd.Close();
            conn.Close();

            if (e.Item.ItemIndex % 30 == 0)
            {
                if (e.Item.ItemIndex != 0)
                {
                    page_break.Text = "<hr style=\"page-break-after: always; border-top: 0px; height: 0px; margin: 0px; color: #fff;\" />";
                }
            }
            else
            {
                page_break.Text = "";
            }
        }
    }
    protected void dltListContent_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

        }
    }
    protected void dltDetail_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Literal page_break = (Literal)e.Item.FindControl("page_break");
            Label orderid = (Label)e.Item.FindControl("orderid");
            HtmlGenericControl atmpanel = (HtmlGenericControl)e.Item.FindControl("ATMPanel");
            Label accountname = (Label)e.Item.FindControl("AccountName");
            Label accountnumber = (Label)e.Item.FindControl("AccountNumber");
            Label pay = (Label)e.Item.FindControl("Pay");
            Label paydate = (Label)e.Item.FindControl("PayDate");

            //ATM匯款帳號
            string sqlatm = "select pay_state, atm_account, atm_number, atm_price, atm_date from [order] where order_id = " + orderid.Text;
            SqlConnection connatm = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmdatm = new SqlCommand(sqlatm, connatm);
            connatm.Open();
            SqlDataReader rdatm = cmdatm.ExecuteReader();
            while (rdatm.Read())
            {
                accountname.Text = rdatm["atm_account"].ToString();
                accountnumber.Text = rdatm["atm_number"].ToString();
                pay.Text = rdatm["atm_price"].ToString().Replace(".0000", "");
                try
                {
                    paydate.Text = DateTime.Parse(rdatm["atm_date"].ToString()).ToString("yyyy/MM/dd");
                }
                catch { }

                if (rdatm["pay_state"].ToString() == "2") atmpanel.Visible = true;
            }
            connatm.Close();

            if (e.Item.ItemIndex % 2 == 0)
            {
                if (e.Item.ItemIndex != 0)
                {
                    page_break.Text = "<hr style=\"page-break-after: always; border-top: 0px; height: 0px; margin: 0px; color: #fff;\" />";
                }
            }
            else
            {
                page_break.Text = "<hr style=\" border-top: dashed 1px #aaa; height: 0px; margin-bottom:10px;\" />";
            }
        }
    }
    protected void dltDetailContent_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label buyer_districtLabel = (Label)e.Item.FindControl("buyer_districtLabel");//購買者地址
            Label receiver_districtLabel = (Label)e.Item.FindControl("receiver_districtLabel");//寄送者地址
            Label lbl_buyerbill = (Label)e.Item.FindControl("lbl_buyerbill");//發票開立ID
            Panel pnl_bill = (Panel)e.Item.FindControl("pnl_bill");//發票開立ID

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
    }
    protected void dltSent_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Literal page_break = (Literal)e.Item.FindControl("page_break");

            if (e.Item.ItemIndex % 3 == 0)
            {
                if (e.Item.ItemIndex != 0)
                {
                    page_break.Text = "<hr style=\"page-break-after: always; border-top: dotted 1px #ccc; height: 0px; margin: 0px;\" />";
                }
            }
            else
            {
                page_break.Text = "<hr style=\" border-top: dotted 1px #ccc; height: 0px; margin: 0px;\" />";
            }
        }
    }
    protected void dltSentContent_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label owner_id = (Label)e.Item.Controls[1];
            Label store_name = (Label)e.Item.Controls[7];
            Label store_address = (Label)e.Item.Controls[5];
            Label store_poatolcode = (Label)e.Item.Controls[3];

            //Guid storeid = new Guid(owner_id.Text);
            //MembershipUser store = Membership.GetUser(storeid);
            //ProfileCommon storeProfile = Profile.GetProfile(store.UserName.ToString());

            //store_name.Text = YamaZoo.SaveString(storeProfile.Company, false);
            //store_address.Text = YamaZoo.getCity(storeProfile.CompanyCity) + YamaZoo.getDistrict(storeProfile.CompanyDistrict) + YamaZoo.SaveString(storeProfile.CompanyAddress, false);
            //store_poatolcode.Text = storeProfile.CompanyPostalCode;
        }
    }
}