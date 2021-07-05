using System;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_orders : System.Web.UI.Page
{
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        //YamaZoo.IsAuthenticate();
        checkCartAuthenticate();

        //MembershipUser currentUser = Membership.GetUser(Page.User.Identity.Name.ToString());
        UserId.Text = "motomoto";

        if (!IsPostBack)
        {
            HttpContext.Current.Session["ordersWHERE"] = "";
            HttpContext.Current.Session["ordersDateWHERE"] = "";
            HttpContext.Current.Session["ordersORDERBY"] = " ORDER BY [order].order_datetime DESC";
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        //txt1.Text = HttpContext.Current.Session["cbx"].ToString();
        if ((string)HttpContext.Current.Session["cbx"] != "true")
        //if (HttpContext.Current.Session["cbx"].ToString() != "true")
        {
            try
            {
                ((CheckBox)ltvShopping.FindControl("CheckBoxHeader")).Checked = false;
            }
            catch { }
            //sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id  WHERE ([order].owner_id = 'motomoto') AND ([order].owner_hide != 1)  ORDER BY [order].order_datetime DESC";
            sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id  WHERE ([order].owner_id = 'motomoto') AND ([order].owner_hide != 1) " + (string)HttpContext.Current.Session["ordersWHERE"] + (string)HttpContext.Current.Session["ordersDateWHERE"] + (string)HttpContext.Current.Session["ordersORDERBY"];
            //sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway_id INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id WHERE ([order].owner_id = '" + UserId.Text + "') AND ([order].owner_hide != 1) " + (string)HttpContext.Current.Session["ordersWHERE"] + (string)HttpContext.Current.Session["ordersDateWHERE"] + (string)HttpContext.Current.Session["ordersORDERBY"];

            ltvShopping.DataBind();
        }
        else
        {
            HttpContext.Current.Session["cbx"] = "";
        }
    }
    protected void ltvShopping_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            Label userid = (Label)e.Item.FindControl("user_id");
            //Label order_id = (Label)e.Item.FindControl("order_id");
            LinkButton order_id = (LinkButton)e.Item.FindControl("order_id");
            Label shipping_state = (Label)e.Item.FindControl("shipping_state");
            Literal store = (Literal)e.Item.FindControl("UserName");
            ImageButton shipconfirm = (ImageButton)e.Item.FindControl("btnShipConfirm");
            HtmlTableRow shipConfirmTr = (HtmlTableRow)e.Item.FindControl("shipConfirmTr");
            TextBox txtShipCompany = (TextBox)e.Item.FindControl("txtShipCompany");
            TextBox txtShipSN = (TextBox)e.Item.FindControl("txtShipSN");
            TextBox txtShipDate = (TextBox)e.Item.FindControl("txtShipDate");

            //string sqlowner = "select aspnet_Users.UserName from aspnet_Users where aspnet_Users.UserId = '" + userid.Text + "'";
            //string sqlowner = "select users_name from users where users_id = '" + userid.Text + "'";
            //SqlConnection connowner = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            //SqlCommand cmdowner = new SqlCommand(sqlowner, connowner);
            //connowner.Open();
            //try
            //{
            //    store.Text = cmdowner.ExecuteScalar().ToString();
            //}
            //catch
            //{
            //    store.Text = "";
            //}
            //connowner.Close();
            store.Text = userid.Text;

            string sqlship = "select shipping_company, shipping_sn, shipping_date from [order] where order_id = " + order_id.Text;
            dt = YamaZoo.GetDataTable(sqlship);
            txtShipCompany.Text = YamaZoo.SaveString(dt.Rows[0]["shipping_company"].ToString(), false);
            txtShipSN.Text = YamaZoo.SaveString(dt.Rows[0]["shipping_sn"].ToString(), false);
            DateTime result;
            if (DateTime.TryParse(YamaZoo.SaveString(dt.Rows[0]["shipping_date"].ToString(), false), out result))
            {
                txtShipDate.Text = DateTime.Parse(YamaZoo.SaveString(dt.Rows[0]["shipping_date"].ToString(), false)).ToString("yyyy/MM/dd");
            }

            if (shipping_state.Text.Trim() == "已出貨") shipconfirm.Visible = true;

            if ((string)HttpContext.Current.Session["shipConfirm"] == Int64.Parse(order_id.Text).ToString()) shipConfirmTr.Visible = true;
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
            watmblock.Visible = false;

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
                    ShippingDate.Text = DateTime.Parse(ship_date).ToString("yyyy/MM/dd");

                shipblock.Visible = true;
            }

            //ATM匯款帳號
            if (((Label)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("payway")).Text == "ATM轉帳")
            {
                string sqlatm = "select pay_state, atm_account, atm_number, atm_price, atm_date from [order] where order_id = " + OrderId.Text;
                SqlConnection connatm = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmdatm = new SqlCommand(sqlatm, connatm);
                connatm.Open();
                SqlDataReader rdatm = cmdatm.ExecuteReader();
                while (rdatm.Read())
                {
                    if (rdatm["atm_account"].ToString() != "")
                    {
                        AccountName.Text = rdatm["atm_account"].ToString();
                        AccountNumber.Text = rdatm["atm_number"].ToString();
                        Pay.Text = rdatm["atm_price"].ToString().Replace(".0000", "");
                        try
                        {
                            PayDate.Text = DateTime.Parse(rdatm["atm_date"].ToString()).ToString("yyyy/MM/dd");
                        }
                        catch { }

                        atmblock.Visible = true;
                    }
                }
                rdatm.Close();
                connatm.Close();
            }

            //WebATM
            if (((Label)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("payway")).Text.Contains("WebATM"))
            {
                string sqlwatm = "select pay_state, atm_account, atm_number, atm_price, atm_date from [order] where order_id = " + OrderId.Text;
                SqlConnection connwatm = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmdwatm = new SqlCommand(sqlwatm, connwatm);
                connwatm.Open();
                SqlDataReader rdwatm = cmdwatm.ExecuteReader();
                while (rdwatm.Read())
                {
                    if (rdwatm["atm_account"].ToString() != "")
                    {
                        wAccountCode.Text = rdwatm["atm_account"].ToString();
                        wAccountNumber.Text = rdwatm["atm_number"].ToString();
                        try
                        {
                            wPayDate.Text = DateTime.Parse(rdwatm["atm_date"].ToString()).ToString("yyyy/MM/dd HH:mm:ss");
                        }
                        catch { }

                        watmblock.Visible = true;
                    }
                }
                rdwatm.Close();
                connwatm.Close();
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
                    if (rdcvs["cvsPayno"].ToString().Trim() != "" && rdcvs["atm_date"].ToString().Trim() != "")
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
            string sqlhide = "update [order] set owner_hide = 1 where order_id = " + e.CommandArgument.ToString().Remove(0, 3);
            SqlConnection connhide = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmdhide = new SqlCommand(sqlhide, connhide);
            connhide.Open();
            cmdhide.ExecuteNonQuery();
            connhide.Close();

            ltvShopping.DataBind();
        }

        if (e.CommandArgument.ToString().Remove(3) == "shp")
        {
            if ((string)HttpContext.Current.Session["shipConfirm"] == e.CommandArgument.ToString().Remove(0, 3))
            {
                HttpContext.Current.Session["shipConfirm"] = "";
            }
            else
            {
                HttpContext.Current.Session["shipConfirm"] = e.CommandArgument.ToString().Remove(0, 3);
            }

            ltvShopping.DataBind();
        }

        if (e.CommandArgument.ToString().Remove(3) == "sps")
        {
            string shipcompany = "";
            string shipsn = "";
            string shipdate = "";

            shipcompany = YamaZoo.SaveString(((TextBox)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("txtShipCompany")).Text, true);
            shipsn = YamaZoo.SaveString(((TextBox)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("txtShipSN")).Text, true);
            shipdate = YamaZoo.SaveString(((TextBox)ltvShopping.Items[((ListViewDataItem)e.Item).DisplayIndex].FindControl("txtShipDate")).Text, true);

            string sqlatm = "";
            DateTime result;
            if (DateTime.TryParse(shipdate, out result))
            {
                sqlatm = "update [order] set shipping_company = '" + shipcompany + "', shipping_sn = '" + shipsn + "', shipping_date = '" + shipdate + "' where order_id = " + e.CommandArgument.ToString().Remove(0, 3);
            }
            else if (shipdate.Trim() == "")
            {
                sqlatm = "update [order] set shipping_company = '" + shipcompany + "', shipping_sn = '" + shipsn + "', shipping_date = NULL where order_id = " + e.CommandArgument.ToString().Remove(0, 3);
            }
            else
            {
                sqlatm = "update [order] set shipping_company = '" + shipcompany + "', shipping_sn = '" + shipsn + "' where order_id = " + e.CommandArgument.ToString().Remove(0, 3);
            }

            YamaZoo.ExecuteNoQuery(sqlatm);

            HttpContext.Current.Session["shipConfirm"] = "";

            ltvShopping.DataBind();

            YamaZoo.scriptAlert("配送資料已變更！");
        }
    }
    protected void frvOrder_OnDataBound(object sender, EventArgs e)
    {
        Label buyer_districtLabel = (Label)Page.Master.FindControl("content").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("buyer_districtLabel");//購買者地址
        Label receiver_districtLabel = (Label)Page.Master.FindControl("content").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("receiver_districtLabel");//寄送者地址
        Label lbl_buyerbill = (Label)Page.Master.FindControl("content").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("lbl_buyerbill");//發票開立ID
        Panel pnl_bill= (Panel)Page.Master.FindControl("content").FindControl("UpdatePanel1").FindControl("orderMultiView").FindControl("detailView").FindControl("frvOrder").FindControl("pnl_bill");//發票開立ID

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
        sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id  WHERE ([order].owner_id = 'motomoto') AND ([order].owner_hide != 1)  ORDER BY [order].order_datetime DESC";
        //sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway_id INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id WHERE ([order].owner_id = '" + UserId.Text + "') AND ([order].owner_hide != 1) " + (string)HttpContext.Current.Session["ordersWHERE"] + (string)HttpContext.Current.Session["ordersDateWHERE"] + (string)HttpContext.Current.Session["ordersORDERBY"];
        ltvShopping.DataBind();
    }

    private void checkCartAuthenticate()
    {
        //檢查是否擁有購物車權限
        //MembershipUser currentUser = Membership.GetUser(Page.User.Identity.Name.ToString());
        //string sqlcart = "select shoppingcart from web where user_id = '" + currentUser.ProviderUserKey.ToString() + "'";
        //SqlConnection conncart = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        //SqlCommand cmdcart = new SqlCommand(sqlcart, conncart);
        //conncart.Open();
        //if (cmdcart.ExecuteScalar().ToString().ToLower() != "true")
        //{
        //    Response.Redirect("index.aspx");
        //}
        //conncart.Close();
    }

    public void CheckBoxHeader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkHeader = sender as CheckBox;
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            CheckBox chk = ltvShopping.Items[i].FindControl("cbxOrder") as CheckBox;
            chk.Checked = chkHeader.Checked;
        }
        HttpContext.Current.Session["cbx"] = "true";
    }
    protected void btnPaid_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
            {
                string sql = "update [order] set pay_state = 3 where order_id = " + Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
    protected void btnPayYet_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
            {
                string sql = "update [order] set pay_state = 1 where order_id = " + Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
    protected void btnProcessing_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
            {
                string sql = "update [order] set shipping_state = 1 where order_id = " + Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        //sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway_id INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id WHERE ([order].owner_id = '" + UserId.Text + "') AND ([order].owner_hide != 1) " + (string)HttpContext.Current.Session["ordersWHERE"] + (string)HttpContext.Current.Session["ordersDateWHERE"] + (string)HttpContext.Current.Session["ordersORDERBY"];
        //ltvShopping.DataBind();
    }
    protected void btnProcessed_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
            {
                string sql = "update [order] set shipping_state = 2 where order_id = " + Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
    protected void btnOutOfStock_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
            {
                string sql = "update [order] set shipping_state = 3 where order_id = " + Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
    protected void btnFinished_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
            {
                string sql = "update [order] set shipping_state = 4 where order_id = " + Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
    protected void btnDelSelected_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ltvShopping.Items.Count; i++)
        {
            if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
            {
                string sql = "update [order] set owner_hide = 1 where order_id = " + Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
    protected void payyet_Click(object sender, EventArgs e)
    {
        if (payyet.ForeColor != System.Drawing.Color.Red)
        {
            payyet.ForeColor = System.Drawing.Color.Red;
            confirm.ForeColor = System.Drawing.Color.Blue;
            paid.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            payyet.ForeColor = System.Drawing.Color.Blue;
        }

        if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("pay_state"))
        {
            if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("pay_state = 1"))
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace(" and (pay_state = 1)", "");
            }
            else
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("pay_state = 2", "pay_state = 1").Replace("pay_state = 3", "pay_state = 1");
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("pay_state = 3", "pay_state = 1");
            }
        }
        else
        {
            HttpContext.Current.Session["ordersWHERE"] += " and (pay_state = 1)";
        }
    }
    protected void confirm_Click(object sender, EventArgs e)
    {
        if (confirm.ForeColor != System.Drawing.Color.Red)
        {
            payyet.ForeColor = System.Drawing.Color.Blue;
            confirm.ForeColor = System.Drawing.Color.Red;
            paid.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            confirm.ForeColor = System.Drawing.Color.Blue;
        }

        if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("pay_state"))
        {
            if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("pay_state = 2"))
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace(" and (pay_state = 2)", "");
            }
            else
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("pay_state = 1", "pay_state = 2").Replace("pay_state = 3", "pay_state = 2");
            }
        }
        else
        {
            HttpContext.Current.Session["ordersWHERE"] += " and (pay_state = 2)";
        }
    }
    protected void paid_Click(object sender, EventArgs e)
    {
        if (paid.ForeColor != System.Drawing.Color.Red)
        {
            payyet.ForeColor = System.Drawing.Color.Blue;
            confirm.ForeColor = System.Drawing.Color.Blue;
            paid.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            paid.ForeColor = System.Drawing.Color.Blue;
        }

        if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("pay_state"))
        {
            if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("pay_state = 3"))
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace(" and (pay_state = 3)", "");
            }
            else
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("pay_state = 1", "pay_state = 3").Replace("pay_state = 2", "pay_state = 3");
            }
        }
        else
        {
            HttpContext.Current.Session["ordersWHERE"] += " and (pay_state = 3)";
        }
    }
    protected void processing_Click(object sender, EventArgs e)
    {
        if (processing.ForeColor != System.Drawing.Color.Red)
        {
            processing.ForeColor = System.Drawing.Color.Red;
            processed.ForeColor = System.Drawing.Color.Blue;
            outofstock.ForeColor = System.Drawing.Color.Blue;
            finished.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            processing.ForeColor = System.Drawing.Color.Blue;
        }

        if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state"))
        {
            if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state = 1"))
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace(" and (shipping_state = 1)", "");
            }
            else
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("shipping_state = 2", "shipping_state = 1").Replace("shipping_state = 3", "shipping_state = 1").Replace("shipping_state = 4", "shipping_state = 1");
            }
        }
        else
        {
            HttpContext.Current.Session["ordersWHERE"] += " and (shipping_state = 1)";
        }
    }
    protected void processed_Click(object sender, EventArgs e)
    {
        if (processed.ForeColor != System.Drawing.Color.Red)
        {
            processing.ForeColor = System.Drawing.Color.Blue;
            processed.ForeColor = System.Drawing.Color.Red;
            outofstock.ForeColor = System.Drawing.Color.Blue;
            finished.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            processed.ForeColor = System.Drawing.Color.Blue;
        }

        if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state"))
        {
            if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state = 2"))
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace(" and (shipping_state = 2)", "");
            }
            else
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("shipping_state = 1", "shipping_state = 2").Replace("shipping_state = 3", "shipping_state = 2").Replace("shipping_state = 4", "shipping_state = 2");
            }
        }
        else
        {
            HttpContext.Current.Session["ordersWHERE"] += " and (shipping_state = 2)";
        }
    }
    protected void outofstock_Click(object sender, EventArgs e)
    {
        if (outofstock.ForeColor != System.Drawing.Color.Red)
        {
            processing.ForeColor = System.Drawing.Color.Blue;
            processed.ForeColor = System.Drawing.Color.Blue;
            outofstock.ForeColor = System.Drawing.Color.Red;
            finished.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            outofstock.ForeColor = System.Drawing.Color.Blue;
        }

        if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state"))
        {
            if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state = 3"))
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace(" and (shipping_state = 3)", "");
            }
            else
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("shipping_state = 2", "shipping_state = 3").Replace("shipping_state = 1", "shipping_state = 3").Replace("shipping_state = 4", "shipping_state = 3");
            }
        }
        else
        {
            HttpContext.Current.Session["ordersWHERE"] += " and (shipping_state = 3)";
        }
    }
    protected void finished_Click(object sender, EventArgs e)
    {
        if (finished.ForeColor != System.Drawing.Color.Red)
        {
            processing.ForeColor = System.Drawing.Color.Blue;
            processed.ForeColor = System.Drawing.Color.Blue;
            outofstock.ForeColor = System.Drawing.Color.Blue;
            finished.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            finished.ForeColor = System.Drawing.Color.Blue;
        }

        if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state"))
        {
            if (HttpContext.Current.Session["ordersWHERE"].ToString().Contains("shipping_state = 4"))
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace(" and (shipping_state = 4)", "");
            }
            else
            {
                HttpContext.Current.Session["ordersWHERE"] = HttpContext.Current.Session["ordersWHERE"].ToString().Replace("shipping_state = 2", "shipping_state = 4").Replace("shipping_state = 3", "shipping_state = 4").Replace("shipping_state = 1", "shipping_state = 4");
            }
        }
        else
        {
            HttpContext.Current.Session["ordersWHERE"] += " and (shipping_state = 4)";
        }
    }
    protected void btnAllOrder_Click(object sender, EventArgs e)
    {
        payyet.ForeColor = System.Drawing.Color.Blue;
        confirm.ForeColor = System.Drawing.Color.Blue;
        paid.ForeColor = System.Drawing.Color.Blue;
        processing.ForeColor = System.Drawing.Color.Blue;
        processed.ForeColor = System.Drawing.Color.Blue;
        outofstock.ForeColor = System.Drawing.Color.Blue;
        finished.ForeColor = System.Drawing.Color.Blue;
        btnDateToday.ForeColor = System.Drawing.Color.Blue;
        btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
        btnDateWeek.ForeColor = System.Drawing.Color.Blue;
        btnDateMonth.ForeColor = System.Drawing.Color.Blue;
        btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;

        HttpContext.Current.Session["ordersWHERE"] = "";
        HttpContext.Current.Session["ordersDateWHERE"] = "";
        HttpContext.Current.Session["ordersORDERBY"] = " ORDER BY [order].order_datetime DESC";
    }
    protected void btnDateToday_Click(object sender, EventArgs e)
    {
        if (btnDateToday.ForeColor != System.Drawing.Color.Red)
        {
            btnDateToday.ForeColor = System.Drawing.Color.Red;
            btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
            btnDateWeek.ForeColor = System.Drawing.Color.Blue;
            btnDateMonth.ForeColor = System.Drawing.Color.Blue;
            btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            btnDateToday.ForeColor = System.Drawing.Color.Blue;
        }

        HttpContext.Current.Session["ordersDateWHERE"] = " and CONVERT(varchar(12) , [order].order_datetime, 111 ) = '" + DateTime.Now.ToString("yyyy/MM/dd") + "' ";
    }
    protected void btnDateYestoday_Click(object sender, EventArgs e)
    {
        if (btnDateYestoday.ForeColor != System.Drawing.Color.Red)
        {
            btnDateToday.ForeColor = System.Drawing.Color.Blue;
            btnDateYestoday.ForeColor = System.Drawing.Color.Red;
            btnDateWeek.ForeColor = System.Drawing.Color.Blue;
            btnDateMonth.ForeColor = System.Drawing.Color.Blue;
            btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
        }

        HttpContext.Current.Session["ordersDateWHERE"] = " and CONVERT(varchar(12) , [order].order_datetime, 111 ) = '" + DateTime.Now.AddDays(-1).ToString("yyyy/MM/dd") + "' ";
    }
    protected void btnDateWeek_Click(object sender, EventArgs e)
    {
        if (btnDateWeek.ForeColor != System.Drawing.Color.Red)
        {
            btnDateToday.ForeColor = System.Drawing.Color.Blue;
            btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
            btnDateWeek.ForeColor = System.Drawing.Color.Red;
            btnDateMonth.ForeColor = System.Drawing.Color.Blue;
            btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            btnDateWeek.ForeColor = System.Drawing.Color.Blue;
        }

        HttpContext.Current.Session["ordersDateWHERE"] = " and datename(week, dateadd(day,-1,order_datetime)) = '" + System.Globalization.CultureInfo.CurrentCulture.Calendar.GetWeekOfYear(DateTime.Now, System.Globalization.CalendarWeekRule.FirstDay, DayOfWeek.Sunday).ToString() + "' ";
    }
    protected void btnDateMonth_Click(object sender, EventArgs e)
    {
        if (btnDateMonth.ForeColor != System.Drawing.Color.Red)
        {
            btnDateToday.ForeColor = System.Drawing.Color.Blue;
            btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
            btnDateWeek.ForeColor = System.Drawing.Color.Blue;
            btnDateMonth.ForeColor = System.Drawing.Color.Red;
            btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            btnDateMonth.ForeColor = System.Drawing.Color.Blue;
        }

        HttpContext.Current.Session["ordersDateWHERE"] = " and month(order_datetime) = '" + DateTime.Now.Month + "' ";
    }
    protected void btnDateLastMonth_Click(object sender, EventArgs e)
    {
        if (btnDateLastMonth.ForeColor != System.Drawing.Color.Red)
        {
            btnDateToday.ForeColor = System.Drawing.Color.Blue;
            btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
            btnDateWeek.ForeColor = System.Drawing.Color.Blue;
            btnDateMonth.ForeColor = System.Drawing.Color.Blue;
            btnDateLastMonth.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;
        }

        HttpContext.Current.Session["ordersDateWHERE"] = " and month(order_datetime) = '" + (DateTime.Now.Month - 1).ToString() + "' ";
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        payyet.ForeColor = System.Drawing.Color.Blue;
        confirm.ForeColor = System.Drawing.Color.Blue;
        paid.ForeColor = System.Drawing.Color.Blue;
        processing.ForeColor = System.Drawing.Color.Blue;
        processed.ForeColor = System.Drawing.Color.Blue;
        outofstock.ForeColor = System.Drawing.Color.Blue;
        finished.ForeColor = System.Drawing.Color.Blue;
        btnDateToday.ForeColor = System.Drawing.Color.Blue;
        btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
        btnDateWeek.ForeColor = System.Drawing.Color.Blue;
        btnDateMonth.ForeColor = System.Drawing.Color.Blue;
        btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;

        string customer = "";

        try
        {
            string sqlcustomer = "select aspnet_Users.UserId from aspnet_Users where aspnet_Users.UserName = '" + YamaZoo.SaveString(txtKeywords.Text.Trim(), true) + "'";
            SqlConnection conncustomer = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmdcustomer = new SqlCommand(sqlcustomer, conncustomer);
            conncustomer.Open();
            customer = "OR ([order].user_id LIKE '%" + cmdcustomer.ExecuteScalar().ToString() + "%')) ";
            conncustomer.Close();
        }
        catch
        {
            customer = ")";
        }
        HttpContext.Current.Session["ordersDateWHERE"] = "";
        HttpContext.Current.Session["ordersWHERE"] = "AND (([order].order_id LIKE '%" + YamaZoo.SaveString(txtKeywords.Text.Trim(), true) + "%')" + customer;
        sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id WHERE ([order].owner_id = '" + UserId.Text + "') AND ([order].owner_hide != 1) " + (string)HttpContext.Current.Session["ordersORDERBY"];
        ltvShopping.DataBind();
    }
    protected void btnDateFilter_Click(object sender, ImageClickEventArgs e)
    {
        btnDateToday.ForeColor = System.Drawing.Color.Blue;
        btnDateYestoday.ForeColor = System.Drawing.Color.Blue;
        btnDateWeek.ForeColor = System.Drawing.Color.Blue;
        btnDateMonth.ForeColor = System.Drawing.Color.Blue;
        btnDateLastMonth.ForeColor = System.Drawing.Color.Blue;

        string timestart = "";
        string timeend = "";
        DateTime result;

        if (DateTime.TryParse(dateStartFilter.Text.Trim(), out result))
            timestart = " and datediff(day,'" + dateStartFilter.Text.Trim() + "',CONVERT(varchar(12) , order_datetime, 111 )) >= 0 ";

        if (DateTime.TryParse(dateEndFilter.Text.Trim(), out result))
            timeend = " and datediff(day,'" + dateEndFilter.Text.Trim() + "',CONVERT(varchar(12) , order_datetime, 111 )) <= 0 ";

        HttpContext.Current.Session["ordersDateWHERE"] = timestart + timeend;
        sdsShopping.SelectCommand = "SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id WHERE ([order].owner_id = '" + UserId.Text + "') AND ([order].owner_hide != 1) " + (string)HttpContext.Current.Session["ordersWHERE"] + (string)HttpContext.Current.Session["ordersDateWHERE"] + (string)HttpContext.Current.Session["ordersORDERBY"];
        ltvShopping.DataBind();
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        ArrayList aryOrderList = new ArrayList();

        if (orderMultiView.ActiveViewIndex == 0)
        {
            for (int i = 0; i < ltvShopping.Items.Count; i++)
            {
                if (((CheckBox)ltvShopping.Items[i].FindControl("cbxOrder")).Checked)
                {
                    aryOrderList.Add(Int64.Parse(((LinkButton)ltvShopping.Items[i].FindControl("order_id")).Text).ToString());
                }
            }

            HttpContext.Current.Session["printTab"] = 0;
        }
        else
        {
            aryOrderList.Add(OrderId.Text);
            HttpContext.Current.Session["printTab"] = 1;
        }

        HttpContext.Current.Session["printOrderList"] = aryOrderList;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('printorders.aspx','PrintOrders');</script>");
    }
}