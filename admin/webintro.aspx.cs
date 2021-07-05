using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class user_webintro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string web_intro = "";
            string web_pay = "";
            string web_size = "";
            string web_store = "";
            string web_Secret = "";
            string web_Faq = "";


            string sql = "select * from page";
            DataTable dt = YamaZoo.GetDataTable(sql);
            if (dt.Rows.Count != 0)
            {
                web_intro = dt.Rows[0]["intor"].ToString();
                web_pay = dt.Rows[1]["intor"].ToString();
                web_size = dt.Rows[2]["intor"].ToString();
                web_store = dt.Rows[3]["intor"].ToString();
                web_Secret = dt.Rows[4]["intor"].ToString();
            }

            txtWebIntro.Value = Server.HtmlDecode(web_intro);
            txtWebcontentUs.Value = Server.HtmlDecode(web_pay);
            txtWebIntroStore.Value = Server.HtmlDecode(web_size);
            txtWebService.Value = Server.HtmlDecode(web_store);
            txtWebSecret.Value = Server.HtmlDecode(web_Secret);
            //txtWebFaq.Value = Server.HtmlDecode(web_Faq);
        }
    }
    protected void btnUpdateWebIntro_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "UPDATE page SET intor = N'" + txtWebIntro.Value.Replace("'", "''") + "' where name='關於我們'";
            Mei.connSql(sql);

            string alert = "更新資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnUpdateWebcontentUs_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "UPDATE page SET intor = N'" + txtWebcontentUs.Value.Replace("'", "''") + "' where name='聯絡我們'";
            Mei.connSql(sql);

            string alert = "更新資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnUpdateWebIntroStore_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "UPDATE page SET intor = N'" + txtWebIntroStore.Value.Replace("'", "''") + "' where name='關於VIP商城'";
            Mei.connSql(sql);

            string alert = "更新資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnUpdateWebService_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "UPDATE page SET intor = N'" + txtWebService.Value.Replace("'", "''") + "' where name='客戶權利義務'";
            Mei.connSql(sql);

            string alert = "更新資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnUpdateWebSecret_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "UPDATE page SET intor = N'" + txtWebSecret.Value.Replace("'", "''") + "' where name='個人隱私保密政策'";
            Mei.connSql(sql);
            
            string alert = "更新資料成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    //protected void btnUpdateWebFaq_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        string sql = "UPDATE web SET web_Faq = N'" + txtWebFaq.Value.Replace("'", "''") + "'";
    //        Mei.connSql(sql);

    //        string alert = "更新資料成功！";
    //        YamaZoo.scriptAlert(alert);
    //    }
    //    catch
    //    {
    //        string alert = "發生不明錯誤，無法更新資料！";
    //        YamaZoo.scriptAlert(alert);
    //    }
    //}
}