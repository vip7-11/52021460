using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_pdt_specific : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //YamaZoo.IsAuthenticate();

        //MembershipUser currentUser = Membership.GetUser(Page.User.Identity.Name.ToString());
        //string sql = "select web_id from web where user_id = '" + currentUser.ProviderUserKey.ToString() + "'";
        //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        //SqlCommand cmd = new SqlCommand(sql, conn);
        //conn.Open();
        //lblWebId.Text = cmd.ExecuteScalar().ToString();
        //conn.Close();
        lblWebId.Text = "00001";
    }

    protected void btnAddSpecificGroup_Click(object sender, EventArgs e)
    {
        try
        {
            string sqlcount = "select count(web_id) from specific_group where web_id = " + lblWebId.Text;
            SqlConnection conncount = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmdcount = new SqlCommand(sqlcount, conncount);
            conncount.Open();
            int count = Int32.Parse(cmdcount.ExecuteScalar().ToString());
            conncount.Close();

            if (count < 5)
            {
                if (txtSpecificGroupName.Text.Trim() != "")
                {
                    string sql = "insert into specific_group(specific_group_name, web_id) values('" + filter(txtSpecificGroupName.Text, true) + "'," + lblWebId.Text + ")";
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    txtSpecificGroupName.Text = "";

                    ddlSpecificGroup.DataBind();
                    dltSpecific.DataBind();
                }
            }
            else
            {
                txtSpecificGroupName.Text = "";

                string alert = "已至新增群組上限！";
                YamaZoo.scriptAlert(alert);
            }
        }
        catch { }

        dltSpecific.DataBind();
        ddlSpecificGroup.DataBind();
    }

    protected void btnAddSpecification_Click(object sender, EventArgs e)
    {
        if (txtSpecification.Text.Trim() != "")
        {
            try
            {
                string sql = "insert into specification(specific_group_id, specification) values(" + ddlSpecificGroup.SelectedValue + ",'" + filter(txtSpecification.Text, true) + "')";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch
            { }
        }

        txtSpecification.Text = "";
        dltSpecific.DataBind();
    }

    protected void dltSpecific_ItemCommand(object source, DataListCommandEventArgs e)
    {
        string sqlspecification = "delete from specification where specific_group_id = " + e.CommandArgument.ToString();
        SqlConnection connspecification = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdspecification = new SqlCommand(sqlspecification, connspecification);
        connspecification.Open();
        cmdspecification.ExecuteNonQuery();
        connspecification.Close();

        string sqlspecific = "delete from specific_group where specific_group_id = " + e.CommandArgument.ToString();
        SqlConnection connspecific = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdspecific = new SqlCommand(sqlspecific, connspecific);
        connspecific.Open();
        cmdspecific.ExecuteNonQuery();
        connspecific.Close();

        ddlSpecificGroup.DataBind();
        dltSpecific.DataBind();
    }

    protected void dltSpecification_ItemCommand(object source, DataListCommandEventArgs e)
    {
        string sqlspecification = "delete from specification where specific_id = " + e.CommandArgument.ToString();
        SqlConnection connspecification = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        SqlCommand cmdspecification = new SqlCommand(sqlspecification, connspecification);
        connspecification.Open();
        cmdspecification.ExecuteNonQuery();
        connspecification.Close();

        dltSpecific.DataBind();
    }

    private string filter(string str, Boolean b)
    {
        switch (b)
        {
            case true:
                str = Regex.Replace(str, @"</script>", "script}", RegexOptions.IgnoreCase);
                str = Regex.Replace(str, @"<script (?<x>[^\>]*)>", "{script", RegexOptions.IgnoreCase);
                str = Regex.Replace(str, @"{script(?<x>[^\>]*)script}", "", RegexOptions.IgnoreCase);
                str = Server.HtmlEncode(str.Trim()).Replace("'", "&#39;").Replace("--", "&#8211;&#8211;").Replace(" ", "&nbsp;");
                break;

            case false:
                str = Server.HtmlDecode(str.Replace("&#39;", "'").Replace("&#8211;&#8211;", "--").Replace("&nbsp;", " "));
                break;
        }
        return (str);
    }
}