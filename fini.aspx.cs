using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class fini : System.Web.UI.Page
{
    string gwStoreCode = "", gwStoreCheck = "", sqlgw;
    DataTable dtShopping;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("car");

        string orderid = "";
        string ownerid = "";
        string orderdatetime = "";

        string sqlorders = "select order_id, owner_id, order_datetime from [order] where order_id = " + HttpContext.Current.Session["orderID"].ToString();
        SqlConnection connorders = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdorders = new SqlCommand(sqlorders, connorders);
        connorders.Open();
        SqlDataReader rdorders = cmdorders.ExecuteReader();
        while (rdorders.Read())
        {
            orderid = rdorders["order_id"].ToString();
            ownerid = rdorders["owner_id"].ToString();
            orderdatetime = rdorders["order_datetime"].ToString();
        }
        rdorders.Close();
        connorders.Close();

        //訂單資訊
        OrderId.Text = orderid;
        //ltlOrderID.Text = orderid.ToString();
        ltlOrderID.Text = orderid.ToString();
        ltlDateTime.Text = Convert.ToDateTime(orderdatetime).ToString("yyyy/MM/dd HH:mm");

        //MembershipUser currentUser = Membership.GetUser(YamaZoo.userIDToName(ownerid));
        //ProfileCommon currentUserProfile = Profile.GetProfile(currentUser.UserName.ToString());
        //MembershipUser store = Membership.GetUser(YamaZoo.userIDToName((string)HttpContext.Current.Session["ownerID"]));
        //ProfileCommon storeProfile = Profile.GetProfile(store.UserName);
        //MembershipUser buyer = Membership.GetUser(Page.User.Identity.Name);

        storeName.Text = YamaZoo.getStoreName((string)HttpContext.Current.Session["ownerID"]);

        gwStoreCode = "";
        gwStoreCheck = "";
        sqlgw = "select BankName, BankCode, AccountName, AccountNumber, gwStoreCode, gwStoreCheck from web where web_id='00001'";
        dtShopping = Mei.GetDataTable(sqlgw);


        gwStoreCode = dtShopping.Rows[0][4].ToString().Trim();
        gwStoreCheck = dtShopping.Rows[0][5].ToString().Trim();
        //SqlConnection conngw = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        //SqlCommand cmdgw = new SqlCommand(sqlgw, conngw);
        //conngw.Open();
        //SqlDataReader rdGW = cmdgw.ExecuteReader();
        //while (rdGW.Read())
        //{
        //    gwStoreCode = rdGW["gwStoreCode"].ToString();
        //    gwStoreCheck = rdGW["gwStoreCheck"].ToString();
        //}
        //rdGW.Close();
        //conngw.Close();

        string payWay = (string)HttpContext.Current.Session["payWay"];
        switch (payWay)
        {
            case "Store":
                StorePanel.Visible = true;
                ltlPayWay.Text = "來店取貨";
                break;

            case "ATM":
                //ATM匯款帳號
                BankName.Text = dtShopping.Rows[0][0].ToString().Trim();
                BankCode.Text = dtShopping.Rows[0][1].ToString().Trim();
                AccountName.Text = dtShopping.Rows[0][2].ToString().Trim();
                AccountNumber.Text = dtShopping.Rows[0][3].ToString().Trim();


                ATMPanel.Visible = true;
                ltlPayWay.Text = "ATM轉帳";
                break;

            case "RecPay":
                RecPayPanel.Visible = true;
                ltlPayWay.Text = "貨到付款";
                break;

            case "WATM":
                payer_bank.Text = HttpContext.Current.Session["payer_bank"].ToString();
                payer_acc.Text = HttpContext.Current.Session["payer_acc"].ToString();
                payer_amt.Text = HttpContext.Current.Session["payer_amt"].ToString();
                proc_datetime.Text = HttpContext.Current.Session["proc_datetime"].ToString();

                string pay_sob = "";
                string sqlorder = "select obj_name, specification, price, count, totalprice from order_detail where order_id = " + HttpContext.Current.Session["orderID"];
                SqlConnection connorder = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmdorder = new SqlCommand(sqlorder, connorder);
                connorder.Open();
                SqlDataReader rdorder = cmdorder.ExecuteReader();
                while (rdorder.Read())
                {
                    pay_sob += (rdorder["obj_name"].ToString() + ", ");
                }
                connorder.Close();

                WATMPanel.Visible = true;
                ltlPayWay.Text = "WebATM轉帳";
                break;

            case "CSPay":
                cvsCode.Text = "<span style=\"color: #f00; font-weight: bold\">" + HttpContext.Current.Session["payno"].ToString() + "</span>";
                cvsExpireDate.Text = HttpContext.Current.Session["expire_date"].ToString();

                CSPayPanel.Visible = true;
                ltlPayWay.Text = "超商代碼繳費";
                break;

            case "VISA":
                VISAPanel.Visible = true;
                ltlPayWay.Text = "線上刷卡";
                break;

            case "IBON":
                cvsCode.Text = "<span style=\"color: #f00; font-weight: bold\">" + HttpContext.Current.Session["payno"].ToString() + "</span>";
                cvsExpireDate.Text = HttpContext.Current.Session["expire_date"].ToString();

                CSPayPanel.Visible = true;
                ltlPayWay.Text = "超商代碼繳費";
                break;

            case "Error":

                break;

            default:

                break;
        }
    }
    protected void ltvOrder_OnItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            Label receiver_districtLabel = (Label)e.Item.FindControl("receiver_districtLabel");
            receiver_districtLabel.Text = receiver_districtLabel.Text.Replace("　", "");
        }
    }
}