using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;
using System.Data;

public partial class admin_shoppingcfg : System.Web.UI.Page
{
    string sqlShopping, sqlPaycheck, sqlRecPayCount, sqlFreight, sqlgw;
    DataTable dtShopping, dtPaycheck, dtRecPayCount, dtFreight, dtgw;
    int StrRecPaycCount;
    int StrdefaultFreight;
    bool StrSetfreeFreight;//商品預設運費
    int StrFreeFreight;//超過XX免運費
    int StrHighestFreight;//最高運費
    int StrFreight;//運費計算方式
    int StrLowStock;//
    bool ZeroStock;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //******顯示付款方式
            sqlPaycheck = "select pay_check from payway";
            dtPaycheck = Mei.GetDataTable(sqlPaycheck);

            cbxATM.Checked = Convert.ToBoolean(dtPaycheck.Rows[0][0].ToString().Trim());
            cbxRecPay.Checked = Convert.ToBoolean(dtPaycheck.Rows[1][0].ToString().Trim());
            cbxWATM.Checked = Convert.ToBoolean(dtPaycheck.Rows[2][0].ToString().Trim());
            cbxCSPay.Checked = Convert.ToBoolean(dtPaycheck.Rows[3][0].ToString().Trim());
            cbxVISA.Checked = Convert.ToBoolean(dtPaycheck.Rows[4][0].ToString().Trim());
            cbxibon.Checked = Convert.ToBoolean(dtPaycheck.Rows[5][0].ToString().Trim());

            //******顯示貨到付款手續費
            sqlRecPayCount = "select recPayCount from web where web_id='00001'";
            dtRecPayCount = Mei.GetDataTable(sqlRecPayCount);
            recPayCount.Text = dtRecPayCount.Rows[0][0].ToString().Trim();

            //******顯示帳戶資料
            sqlShopping = "select BankName, BankCode, AccountName, AccountNumber, gwStoreCode, gwStoreCheck from web where web_id='00001'";
            dtShopping = Mei.GetDataTable(sqlShopping);

            BankName.Text = dtShopping.Rows[0][0].ToString().Trim();
            BankCode.Text = dtShopping.Rows[0][1].ToString().Trim();
            AccountName.Text = dtShopping.Rows[0][2].ToString().Trim();
            AccountNumber.Text = dtShopping.Rows[0][3].ToString().Trim();
            gwStoreCode.Text = dtShopping.Rows[0][4].ToString().Trim();
            gwStoreCheck.Text = dtShopping.Rows[0][5].ToString().Trim();

            if (BankName.Text.Trim() != "" && BankCode.Text.Trim() != "" && AccountName.Text.Trim() != "" && AccountNumber.Text.Trim() != "")
            {
                cbxATM.Enabled = true;
            }

            if (gwStoreCode.Text.Trim() != "" && gwStoreCheck.Text.Trim() != "")
            {
                cbxWATM.Enabled = true;
                cbxCSPay.Enabled = true;
                cbxVISA.Enabled = true;
            }

            //*****預設運費
            sqlFreight = "select totalfreight, FreeFreight_rb, FreeFreight, highestFreight, Freight, LowStock, ZeroStock from web where web_id='00001'";
            dtFreight = Mei.GetDataTable(sqlFreight);

            defaultFreight.Text = dtFreight.Rows[0][0].ToString().Trim();
            cbxFreeFreight.Checked = Convert.ToBoolean(dtFreight.Rows[0][1].ToString().Trim());
            txtFreeFreight.Text = dtFreight.Rows[0][2].ToString().Trim();
            overFreight.Text = dtFreight.Rows[0][3].ToString().Trim();
            switch (Convert.ToInt16(dtFreight.Rows[0][4].ToString().Trim()))
            {
                case 1:
                    rdoHighestFreight.Checked = true;
                    break;

                case 2:
                    rdoSumFreight.Checked = true;
                    break;

                case 3:
                    rdoLimitFreight.Checked = true;
                    break;
            }
            //***庫存量警示
            //txtLowStock.Text = dtFreight.Rows[0][5].ToString().Trim();
            //cbxZeroStock.Checked = Convert.ToBoolean(dtFreight.Rows[0][6].ToString().Trim());

            string sqlnote = "select shoppingnote from web where web_id = '00001'";
            SqlConnection connnote = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmdnote = new SqlCommand(sqlnote, connnote);
            connnote.Open();
            //shoppingnote.Value = YamaZoo.SaveString(cmdnote.ExecuteScalar().ToString(), false);
            connnote.Close();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //MembershipUser currentUser = Membership.GetUser(Page.User.Identity.Name.ToString());
        //ProfileCommon currentUserProfile = Profile.GetProfile(Page.User.Identity.Name.ToString());


        int result;

        sqlgw = "update payway set pay_check='" + cbxRecPay.Checked + "' where payway='RecPay'";
        Mei.GetDataTable(sqlgw);
        sqlgw = "update payway set pay_check='" + cbxATM.Checked + "' where payway='ATM'";
        Mei.GetDataTable(sqlgw);
        sqlgw = "update payway set pay_check='" + cbxWATM.Checked + "' where payway='WATM'";
        Mei.GetDataTable(sqlgw);
        sqlgw = "update payway set pay_check='" + cbxCSPay.Checked + "' where payway='CSPay'";
        Mei.GetDataTable(sqlgw);
        sqlgw = "update payway set pay_check='" + cbxVISA.Checked + "' where payway='VISA'";
        Mei.GetDataTable(sqlgw);
        sqlgw = "update payway set pay_check='" + cbxibon.Checked + "' where payway='IBON'";
        Mei.GetDataTable(sqlgw);



        if (Int32.TryParse(recPayCount.Text.Trim(), out result))
            //currentUserProfile.Cart.RecPaycCount = Int32.Parse(recPayCount.Text.Trim());
            StrRecPaycCount = Int32.Parse(recPayCount.Text.Trim());

        if (defaultFreight.Text.Trim() == "")
        {
            //currentUserProfile.Cart.defaultFreight = 0;
            StrdefaultFreight = 0;
        }
        else
        {
            //currentUserProfile.Cart.defaultFreight = Int32.Parse(defaultFreight.Text);
            StrdefaultFreight = Int32.Parse(defaultFreight.Text);
        }

        StrSetfreeFreight = cbxFreeFreight.Checked;//
        StrFreeFreight = Int32.Parse(txtFreeFreight.Text);//
        StrHighestFreight = Int32.Parse(overFreight.Text);//
        if (rdoHighestFreight.Checked) { StrFreight = 1; }
        if (rdoSumFreight.Checked) { StrFreight = 2; }
        if (rdoLimitFreight.Checked) { StrFreight = 3; }

        //if (Int32.TryParse(txtLowStock.Text.Trim(), out result))
        //{
        //    StrLowStock = Int32.Parse(txtLowStock.Text.Trim());
        //}
        //else
        //{
        //    StrLowStock = 0;
        //}
        //ZeroStock = cbxZeroStock.Checked;

        sqlgw = "update web set totalfreight='" + StrdefaultFreight + "',";
        sqlgw += " recPayCount='" + StrRecPaycCount + "',";
        sqlgw += " FreeFreight='" + StrFreeFreight + "',";
        sqlgw += " FreeFreight_rb='" + StrSetfreeFreight + "',";
        sqlgw += " highestFreight='" + StrHighestFreight + "',";
        sqlgw += " Freight='" + StrFreight.ToString() + "',";
        sqlgw += " LowStock='" + StrLowStock + "',";
        sqlgw += " ZeroStock='" + ZeroStock + "'";
        sqlgw += " where web_id='00001'";
        Mei.GetDataTable(sqlgw);

        //string sqlnote = "update web set shoppingnote = N'" + shoppingnote.Value + "' where web_id = '00001'";
        //Mei.GetDataTable(sqlnote);

        //SqlConnection connnote = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        //SqlCommand cmdnote = new SqlCommand(sqlnote, connnote);
        //connnote.Open();
        //cmdnote.ExecuteNonQuery();
        //connnote.Close();

        string alert = "資料修改成功！";
        YamaZoo.scriptAlert(alert);
    }

    private void checkCartAuthenticate()
    {
        ////檢查是否擁有購物車權限
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

    protected void btnOpenEZPay_Click(object sender, EventArgs e)
    {
        int result;
        if (Int32.TryParse(gwStoreCode.Text.Trim(), out result) && gwStoreCheck.Text.Trim().Length == 24)
        {
            //MembershipUser currentUser = Membership.GetUser(Page.User.Identity.Name.ToString());

            sqlgw = "update web set gwStoreCode = '" + gwStoreCode.Text.Trim() + "', gwStoreCheck = '" + gwStoreCheck.Text.Trim() + "' where web_id = '00001'";
            Mei.GetDataTable(sqlgw);
            
            //SqlConnection conngw = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            //SqlCommand cmdgw = new SqlCommand(sqlgw, conngw);
            //conngw.Open();
            //cmdgw.ExecuteNonQuery();
            //conngw.Close();

            cbxWATM.Enabled = true;
            cbxCSPay.Enabled = true;
            cbxVISA.Enabled = true;
        }
        else
        {
            cbxWATM.Enabled = false;
            cbxCSPay.Enabled = false;
            cbxVISA.Enabled = false;

            string alert = "資料有誤！";
            YamaZoo.scriptAlert(alert);
        }
    }

    protected void btnOpenATM_Click(object sender, EventArgs e)
    {
        //ProfileCommon currentUserProfile = Profile.GetProfile(Page.User.Identity.Name.ToString());

        if (BankName.Text.Trim() != "" || BankCode.Text.Trim() != "" || AccountName.Text.Trim() != "" || AccountNumber.Text.Trim() != "")
        {
            String DbBankName = YamaZoo.SaveString(BankName.Text, true);
            String DbBankCode = YamaZoo.SaveString(BankCode.Text, true);
            String DbAccountName = YamaZoo.SaveString(AccountName.Text, true);
            String DbAccountNumber = YamaZoo.SaveString(AccountNumber.Text, true);

            sqlgw = "update web set BankName='" + DbBankName + "',BankCode='" + DbBankCode + "',AccountName='" + DbAccountName + "',AccountNumber='" + DbAccountNumber + "' where web_id = '00001'";
            Mei.GetDataTable(sqlgw);

            cbxATM.Enabled = true;
        }
        else
        {
            string alert = "資料有誤！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnPreview_Click(object sender, EventArgs e)
    {
        //Session["Preview"] = shoppingnote.Value.Replace("'", "''");

        //YamaZoo.scriptRegister("window.open ('preview.aspx?p=main', 'newwindow', 'toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no');");
    }
}